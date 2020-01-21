---
title: Hexo + Github + Travis CLI 搭建免费博客系统
date: 2020-01-10 07:23:26
tags: [Hexo, GitHub, NodeJS] 
categories: 技术心得
---
对于极客而言，没什么比拥有个人主页展示自己别致的想法和探索的精神更令人向往了。
相比于购买VPS搭LAMP环境架设个人主页的昂贵和复杂，其实利用好 GitHub 的 page 功能搭建免费主页基本可以满足大部分个人用户的需求。

本文将详细介绍一下如何利用 GitHub 和 Travis CLI 搭建一个可自动部署的 Hexo 博客系统。

<!-- more -->
### Hexo
#### Hexo是什么？
Hexo 是一个快速、简洁且高效的博客框架。Hexo 使用 Markdown（或其他渲染引擎）解析文章，在几秒内，即可利用靓丽的主题生成静态网页。
#### 安装
##### 安装前提
安装 Hexo 相当简单，只需要先安装下列应用程序即可：
* [Node.js](https://nodejs.org/) (Node.js 版本需不低于 8.10，建议使用 Node.js 10.0 及以上版本)
* [Git](https://git-scm.com)

##### 安装Hexo
```bash
npm install -g hexo
```
#### 建站
安装 Hexo 完成后，请执行下列命令，Hexo 将会在指定文件夹中新建所需要的文件。
```bash
hexo init <folder>
cd <folder>
npm install
```
新建完成后，指定文件夹的目录如下：
```
.
├── _config.yml
├── package.json
├── scaffolds
├── source
|   ├── _drafts
|   └── _posts
└── themes
```
##### _config.yml
网站的 [配置](https://hexo.io/zh-cn/docs/configuration) 信息，您可以在此配置大部分的参数。
##### package.json
应用程序的信息。EJS, Stylus 和 Markdown renderer 已默认安装，
##### scaffolds
[模版](https://hexo.io/zh-cn/docs/writing) 文件夹。当您新建文章时，Hexo 会根据 scaffold 来建立文件。

Hexo的模板是指在新建的文章文件中默认填充的内容。例如，如果您修改scaffold/post.md中的Front-matter内容，那么每次新建一篇文章时都会包含这个修改。
##### source
资源文件夹是存放用户资源的地方。除 _posts 文件夹之外，开头命名为 _ (下划线)的文件 / 文件夹和隐藏的文件将会被忽略。Markdown 和 HTML 文件会被解析并放到 public 文件夹，而其他文件会被拷贝过去。
##### themes
主题 文件夹。Hexo 会根据主题来生成静态页面。
#### 常用命令
```bash
# 新建一个网站
hexo init [folder]
# 新建一篇文章
hexo new [layout] <title>
# 生成静态文件
hexo generate
# 启动服务器
hexo server
# 部署网站
hexo deploy
# 清除缓存文件 (db.json) 和已生成的静态文件 (public)。
hexo clean
```
### GitHub 的 Pages 服务
[GitHub Pages](https://pages.github.com/) 是 GitHub 提供的免费静态网页服务，支持静态脚本，可以绑定域名并支持 ssl 也就是 https ，并且 **不限流量**。
#### 开始你的 Pages 之旅
> 注：个人帐号只能搭建一个个人网站
##### 创建一个 repository
创建的 repository 需要以 username.github.io 命名。这里的 username 是你的 github 帐号名。
##### 创建本地代码仓
```bash
git clone https://github.com/username/username.github.io
```
##### 创建 Hello World
```bash
cd username.github.io
echo "Hello World" > index.html
```
##### 推送到远程代码仓（github）
```bash
git add --all
git commit -m "Initial commit"
git push -u origin master
```
##### 预览效果
打开一个浏览器并浏览 https://*username*.github.io

#### 绑定自己的域名并开启 https
github 支持的 自定义域名只包括顶级域名和二级域名：

| 支持的子定语域名类型 | Example |
|:-----|:-----|
| ```www``` 二级域名 | ```www.example.com``` |
| 自定义二级域名 | ```blog.example.com``` |
| 顶级域名 | ```example.com``` |

##### 绑定二级域名
1. 在 GitHub 中，跳转到你的网站的仓库中。
2. 在你的仓库名字下方，点击<i class="fa fa-setting"></i> **Settings**
![repo-actions-settings](https://image.uglyboy.cn/2020114/repo-actions-settings.png)
3. 在 **Custom domain** 下面, 填写你的自定义域名，并点击保存。 这个动作将会在你的仓库根目录中创建一个 CNAME 文件记录你的域名，并提交发布。
![save-custom-domain](https://image.uglyboy.cn/2020114/save-custom-domain.png)
4. 到你的 DNS 解析服务器中设置一个 CNAME 将你的域名 www.example.com 指向  \<user\>.github.io

##### 开启 https
这个相对比较简单，当你的域名配置好了，勾选下面的 **Enforce HTTPS** 就可以了，剩下的就是等待证书验证，这个会在24小时内完成。
![enforce-https-custom-domains](https://image.uglyboy.cn/2020114/enforce-https-custom-domains.png)
#### Hexo 自动部署到 GitHub 的 Pages 服务
##### 安装 hexo-deployer-git 插件
```bash
npm install hexo-deployer-git --save
```
##### 修改 Hexo 的 _config.yml
调整自动部署相关的配置：
```
deploy:
  type: git 
  repo: https://github.com/username/username.github.io.git
  branch: master
```
注意：这里的 *username* 记得换成你自己的 github 用户名。
##### 免密自动部署
使用ssh-keygen生成私钥和公钥
```bash
ssh-keygen -t rsa
```
登录Github，点击头像下的settings，添加ssh,新建一个new ssh key，将id_rsa.pub文件里的内容复制上去。

输入ssh -T git@github.com，测试添加ssh是否成功。如果看到Hi后面是你的用户名，就说明成功了
```bash
ssh -T git@github.com
```
### Travis CLI 自动部署 Hexo
> 本节首先介绍一下多终端管理 Hexo 的解决方案。但是这样的解决方案也仅解决了多地的代码问题，不同的终端下依然需要搭建 Hexo 的生成环境，并且在提交源码后，还需要执行生成命令。

> Travis CLI 可以利用 github 的提交动作触发自动部署，在云端自动生成相关的 Hexo 代码环境，并执行部署的命令。
#### 多终端管理 Hexo
hexo 正常发布动作是同步 public 文件夹 到 github 的站点远程仓库的，而原始文件则是在项目的根文件夹下。所以如果想多终端都可以编辑发布 hexo，需要将根目录纳入到远程管理中。
> 为了项目更容易管理，笔者将源文件依然放在 github 的站点远程仓库中管理。这件事不是必须的，读者可以按照自己的喜好安排版本管理方式。

##### 初始化仓库及提交
```bash
# 初始化本地仓库
git init
# 添加本地所有文件到仓库
git add .
# 添加commit
git commit -m "Blog Source Hexo"
# 添加本地仓库分支hexo
git branch hexo 
# 切换到hexo分支上
git checkout hexo  
# 添加远程仓库 <server> 是在线仓库的地址 origin是本地分支,remote add操作会将本地仓库映射到云端
git remote add origin https://github.com/username/username.github.io.git 
# 将本地仓库的源文件推送到远程仓库hexo分支
git push origin hexo 
```
##### 其他终端的工作流程
```bash
# 安装 Hexo
npm install -g hexo
# 将Github中hexo分支clone到本地
git clone -b hexo git@github.com:username/username.github.io.git  
cd username.github.io
# 安装必要的所需组件
npm install
# 创建一篇新博客
hexo new post "new blog name"
git add source
git commit -m "XX"
# git push origin hexo
git push
# 发布
hexo d -g
```
#### Travis CLI 配置
##### Travis CLI 网站基础设置
1. 使用 github 帐号登陆 [Travis CLI](https://travis-ci.org)
2. 登录后在主界面点击 My Repositories 旁边的"+"号:
![Travis CI](https://image.uglyboy.cn/2020121/Travis%20CI.png)
3. 选择你在Github的放博客源码的仓库，打开右侧的开关
4. 然后点旁边的 Setting 按钮，进入设置的界面。

##### 项目设置 .travis.yml
在项目的根目录添加 .travis.yml 文件如下：
```
language: node_js
node_js:
  - "10"

cache:
  directories:
    - node_modules

branches:
  only:
    - hexo

before_install:
  - npm install -g hexo

before_script:
  - git config --global user.name 'username'
  - git config --global user.email 'useremail' # 改成你的邮箱
  - git config --global url."https://username:${passwd}@github.com/".insteadOf "https://github.com/"
  - git clone --branch master https://github.com/Longxr/Longxr.github.io.git public

install:
  - npm install

script:
  - hexo g -d

```
其中 ${passwd} 是设置在 Travis CLI 项目环境变量里的参数，是 github 的密码。

也有人推荐用 Github 的 Access Token 方案，似乎更安全一些，但是笔者尝试时一直遇到*帐号密码错误*的问题。

##### 新的终端工作流
终端只需要支持 git 即可。
```bash
# 将Github中hexo分支clone到本地
git clone -b hexo git@github.com:username/username.github.io.git  
cd username.github.io
# 创建一篇新博客
hexo new post "new blog name"
git add source
git commit -m "new blog"
# git push origin hexo
git push
```
具体的构建过程都可以在 [Travis CLI](https://travis-ci.org) 中看到，包括调试时所需查看的错误信息。
### iPad 进行博客创作
#### Working Copy
iOS 下的 git 管理工具，最重要的是不仅可以查看，还可以 push！！（虽然需要内购，现在价格是128人民币）
Working Copy 提供了文件管理功能，可以任由别的应用管理同步的代码仓库的内容，这样在 iPad 上就可以使用更加专业的 Markdown 编辑软件来写文章，再由 Working Copy 发布。
Working Copy 还支持捷径，进行 iOS 上的一键发布。
![](https://image.uglyboy.cn/2020/01/14/15790009056243.jpg)
#### MWeb
iOS 下优秀的 Markdown 应用很多，笔者并没有一一比对，但更早使用 WordPress 起，就一直在用 MWeb 进行博客写作。
MWeb 支持从 Working Copy 的文件路径中直接读取文档，支持七牛云本地图片上传，尤其对国内的各类图床服务都有很好的支持，硬件方面也支持 Latex 的数学公式，从各个角度来说，都是一款不错的博客应用。
Mweb 还有 Mac 版，这也是它的加分项之一。

> 至此，一个仅用 iPad 即可进行博客管理的博客体系已经搭建完全。剩下的诸如主体的美化，性能优化等便有待各位极客朋友们自行探索了。


