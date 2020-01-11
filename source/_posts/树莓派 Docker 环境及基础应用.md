---
title: 树莓派 Docker 环境及基础应用
date: 2019-12- 27 09:15:36
tags: [树莓派, Docker] 
categories: 技术经验
---

> 将家中的树莓派从 3B+ 升级为 4 后，发现原有部署的各类服务（包括本地网盘、aria2下载、LNMP、airplay、自动备份、邮箱等）迁移成本非常高，需要花大量的时间重新配置。
>
> 恰好最近在研究 Docker 技术，于是决定用 Docker 来部署各类服务，这样再次升级更换设备时，就可以非常快速的恢复相关应用。
>
> 本篇先介绍树莓派上Docker相关的基本环境配置，以及一个通用的Docker环境下的容器监控管理平台配置。
### Docker 基本环境
#### Docker CE
##### 安装
``` bash
sudo curl -sSL https://get.docker.com | sh
```
##### 测试
``` bash
sudo docker run hello-world
```
##### 免 sudo 运行 Docker
1. 创建用户组：

``` bash
sudo groupadd docker
```
2. 添加当前用户到用户组：

``` bash
sudo gpasswd -a ${USER} docker
```
3. 重启 docker 服务并重新登陆

##### 基本配置和常用命令
``` bash
#查看 Docker 版本
docker -v
sudo docker pull 仓库/镜像:版本（留空的话默认为 latest）
sudo docker run 加参数，用来创建容器
#查看运行容器
sudo docker ps
#查看所有下载的镜像
sudo docker images
#进入容器终端
sudo docker exec -i -t ha /bin/bash
#实时查看10行的 ha 日志
sudo docker logs -f -t --tail 10 ha
#设置 Docker 开机启动
sudo systemctl enable docker
#开启 Docker 服务
sudo systemctl start docker
```
#### docker-compose
##### 下载二进制文件
下载 Docker-Compose：
``` bash
sudo curl -L https://github.com/docker/compose/releases/download/1.25.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
```
安装 Docker-Compose：
``` bash
sudo chmod +x /usr/local/bin/docker-compose
```
查看版本：
``` bash
docker-compose version
```

可惜官方的二进制文件中不包含 32 位系统，也不包含 arm 框架，这种方法无法在树莓派上实现。
##### 基于 pip 安装
树莓派默认已经安装了 Python3 和对应的 pip3，可以直接安装
``` bash
sudo pip3 install docker-compose
```
##### 基于 compose 的 Docker 镜像生成二进制文件
> pip安装某种意义上会污染本机的 Python 环境，对于有洁癖的同学而言，肯定是不如二进制文件的方法。这里也提供一个略复杂的生成二进制文件的方法：

从 git 上获取源码：
``` bash
git clone https://github.com/docker/compose.git
```
构建 docker-compose 的镜像：
``` bash
docker build -t docker-compose -f Dockerfile .
```
执行源码中的工具：
``` bash
./script/build/linux
```
将生成的二进制文件授权：
``` bash
cp dist/docker-compose-Linux-armv7l /usr/local/bin/docker-compose
chown root:root /usr/local/bin/docker-compose
chmod 755 /usr/local/bin/docker-compose
```

### Docker 通用监控环境
> 部分通用的 Docker 工具：
> * portainer：对 Docker 环境进行监控；
> * watchtower：自动检查镜像更新，并重启容器；
> * ctop：Docker 资源监控的命令行工具。

#### Docker 基础应用配置
使用如下的 docker-compose.yml 配置启动相关服务：

```
version: '2'

services :
  portainer:
    image: portainer/portainer
    container_name: portainer
    restart: unless-stopped
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - portainer_data:/data
    expose:
      - "9000"

  watchtower:
    image: containrrr/watchtower
    container_name: watchtower
    restart: unless-stopped
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      - REPO_USER=$USERNAME
      - REPO_PASS=$USERPASS

  server:
    image: nginx:alpine
    container_name: server
    restart: unless-stopped
    hostname: Uglyboy
    ports:
      - 9000:9000
    volumes:
      - $CONFIG:/etc/nginx/conf.d/
      - $SSL:/etc/nginx/cert/

volumes:
  portainer_data:
```
其中 nginx 服务是为了给 protainer 添加 ssl 加密做的反向代理。要注意的一点是反向代理的配置：
```
location / {
  proxy_pass http://portainer:9000/;
  proxy_set_header Host $host;
  proxy_set_header Upgrade $http_upgrade;
  proxy_set_header Connection upgrade;
  proxy_set_header Accept-Encoding gzip;
  proxy_set_header X-Real-IP $remote_addr;
  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
}
```
如果没有 upgrade 的相关配置，会导致 portainer 中命令行功能失效。

#### 安装 ctop
``` bash
wget https://github.com/bcicen/ctop/releases/download/v0.5/ctop-0.7.3-linux-arm -O ctop
sudo mv ctop /usr/local/bin/
sudo chmod +x /usr/local/bin/ctop
```