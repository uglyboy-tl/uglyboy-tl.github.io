---
title: 自动构建跨平台 Docker 镜像
date: 2020-01-03 11:04:24
tags: [Docker, github] 
categories: 技术经验
---

> 使用 Docker 时，往往需要自己定制很多开发运行环境，而定制 Image 就必须要自己写 Dockerfile ，但每次修改完 Dockerfile，都需要一连串的操作推送和拉取镜像。
>
> 本文将介绍利用 Github 自动构建 Docker Image，简化修改 Dockerfile 后的各类操作。配合 watchtower 则可以实现自动升级镜像。
>
> 另一方面，因为 Github 构建镜像只能使用 amd64 环境，而笔者常用设备之一是树莓派，所以本文也包含了如何跨平台构建 Docker 镜像，以及合并镜像为多平台镜像的内容

### Github 自动构建镜像
#### 创建镜像 Dockerfile 对应的 repo
Dockerfile文件的内容这里就不涉及了
#### 连接服务
首先需要绑定一个仓库服务（Github）：
1. 登录 Docker Hub；
2. 选择右上角你的用户名 > Account Settings > Linked Accounts；
3. 选择需要连接的仓库服务（目前只支持 Github 和 BitBucket）；
4. 这时候需要授权，点击授权就可以了。

#### 创建自动构建
1. 选择 Repositories
2. 点击 Create Repository
3. 基本设置完成后，在 Build Settings 中选择 Github；
4. 接下来会列出 User/Organizations 的所有项目，从中选择你需要的构建的项目（包含 Dockerfile）；
5. 在 BUILD RULES 中点击添加，然后修改调整成合适自己的配置；
6. 最后点击创建就可以了。

### 构建 arm 平台的镜像
Docker Hub 的构建环境时 x86_64 平台的，所以生成的镜像也是 x86_64 环境的，一般会被记为 amd64。但是这种镜像时无法在树莓派上运行的，树莓派的芯片时arm系统，32位的一般时 armv7，64位的一般是 armv8。
所以利用自动构建平台原本是构建不了其他框架下的镜像的。

值得庆幸的是在 Linux 上我们可以用 QEMU 来做虚拟机 执行其他平台的命令，进而进行跨平台的镜像构建。
#### 利用 Docker 运行跨平台的镜像
``` bash
docker run --rm --privileged multiarch/qemu-user-static:register --reset
```
运行了 qemu 虚拟机后，即可运行其他平台的镜像。

为了能在自动构建时提供虚s拟机的支持，我们需要在 Dockerfile 所在的文件夹下：
- 新建 hooks 目录
- 目录下添加 pre_build 文件，并在文件中添加上面的命令

>hooks 目录是一个钩子目录，为自动构建提供不同阶段的脚本命令，以定制化一些特殊的效果。

#### 添加 qemu-user-static
但如果是要构建镜像，Docker 镜像内必须也含有对应的 qemu-user-static 虚拟机。Docker Hub 上已经有了添加 qemu-user-static 的系统镜像，可以在 https://hub.docker.com/u/multiarch/ 获取：

因为这些系统镜像未必符合我们的要求，所以笔者的做法是从 https://github.com/multiarch/qemu-user-static/releases 下载了对应版本的 qemu-user-static

#### 修改 Dockerfile 文件
为了生成跨平台镜像，我们这里复制出一个 Dockerfile.armhf 的文件来，需要做如下的调整：
- 来源镜像修改为armv7版本的基础镜像
- 将 qemu-user-static 拷贝到镜像中
- 将所有的 RUN 命令调整为 
``` 
RUN /usr/bin/qemu-arm-static /bin/sh -c '原始命令'
```

#### 调整自动构建的配置
- 将自动构建的源文件修改为 Dockerfile.armhf 
- 将生成镜像的标签也修改为 armhf。

为了统一起见，可以将原本的 Dockerfile 也改名为 Dockerfile.amd64，将镜像的标签修改为 amd64。这也是为后面生成跨平台镜像做准备。

### 生成多平台镜像
> Docker 官方的很多镜像会自动根据使用者的平台适配的下载合适的镜像，并不需要使用者指定平台。这种特性也是本文的自动构建所需要的，至少我们已经生成了 amd64 和 armhf 两个平台的镜像，而且利用相同的方法，还可以生成类似的各种平台的镜像。

#### buildx
官方提供的构建多平台镜像的工具是 buildx，是 Docker build 命令的下一代替代品，可以通过修改 Docker 配置文件的方式开启。

但是由于我们利用的是默认的自动构建平台提供的工具，很遗憾并不支持 buildx 工具，只能另辟蹊径。

#### manifest-tool
manifest-tool 是另一个支持构建多平台镜像的工具，虽然自动构建平台上也没有提供相关的命令，但是我们可以利用 Docker 镜像来运行该程序。
``` bash
docker run -v $PWD/multiarch.yaml:/multiarch.yaml -v $PWD/config.json:/config.json --rm mplatform/manifest-tool --docker-cfg / push from-spec /multiarch.yaml
```
##### config.json
config.json 是 manifest-tool 的配置文件，主要是用来生成 authcode 来实现免登推送 Docker Hub 镜像的。文件形式如下：
```
{
    "auths": {
        "https://index.docker.io/v1/": {
            "auth": "你的 authcode"
        }
    },
    "HttpHeaders": {
        "User-Agent": "Docker-Client/19.03.5 (linux)"
    }
}
```
其中 authcode 的获取，可以通过 账号 > Security > Access Tokens > 点击 New Access Tokens 获取。

##### multiarch.yaml
multiarch.yaml 是用来将不同平台的 Docker 镜像合并成多平台镜像的配置文件，文件形式如下：
```
image: guixi/php:latest
manifests:
  -
    image: guixi/php:armhf
    platform:
      architecture: arm
      variant: v7
      os: linux
  -
    image: guixi/php:amd64
    platform:
      architecture: amd64
      os: linux
```
将配置中镜像换成实际需要的不同平台的镜像文件
##### 自动构建时自动生成多平台镜像
在 hooks 目录下添加 post_push 文件，并在文件中执行 manifest-tool 命令。

post_push 中的命令会在构建推送完成后执行。