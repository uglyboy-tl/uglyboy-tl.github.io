---
title: Hexo+Github+Travis CLI 搭建免费博客
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
3. 在 **Custom domain** 下面, 填写你的自定义域名，并点击保存. 这个动作将会在你的仓库根目录中创建一个 CNAME 文件记录你的域名，并提交发布。
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
### Travis CLI 自动部署
### iPad 进行博客创作