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
### GitHub 的 Page 服务
### Travis CLI 自动部署
### iPad 进行博客创作