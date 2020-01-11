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

### 构建arm平台的镜像

### 生成跨平台镜像