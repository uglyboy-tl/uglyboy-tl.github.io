---
title: 树莓派 Docker 环境及基础应用
date: 2019-12- 27 09:15:36
tags: [树莓派, Docker] 
categories: 技术经验
---
将家中的树莓派从 3B+ 升级为 4 后，发现原有部署的各类服务（包括本地网盘、aria2下载、LNMP、airplay、自动备份、邮箱等）迁移成本非常高，需要花大量的时间重新配置。

恰好最近在研究 Docker 技术，于是决定用 Docker 来部署各类服务，这样再次升级更换设备时，就可以非常快速的恢复相关应用。

本篇先介绍树莓派上Docker相关的基本环境配置，以及一个通用的Docker环境下的容器监控管理平台配置。
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
##### 安装
