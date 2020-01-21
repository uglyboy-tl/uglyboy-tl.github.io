---
title: 网盘利器：h5ai 和 Syncthing
date: 2020-01-21 0‏‎9:39:22
tags: [PHP, 利器] 
categories: 技术心得
---

通常搭建私有网盘选用的方案往往是 [NextCloud](https://nextcloud.com/)、[OwnCloud](https://owncloud.org/) 或 [Seafile](https://www.seafile.com/home/)。但这类网盘在兼顾安全性和稳定性的同时，丧失了便捷性和速度（也有人会用 [可道云](https://kodcloud.com/) 这种轻量级的网盘，但稳定性和安全性方面确实比前者有差距）。

这里介绍两款非常好用的网盘辅助工具：[h5ai](https://larsjung.de/h5ai/) 和 [Syncthing](https://syncthing.net/)，可以作为上面存储网盘的补充工具，方便网盘的使用。

<!-- more -->

#### H5ai
h5ai 是一款基于 php 文件目录列表程序，不需要数据库，支持在线预览文本、图片、音频、视频等。
![大胖专属 - Home   大胖专属](https://image.uglyboy.cn/2020121/大胖专属%20-%20Home%20%20%20大胖专属.png)

##### 一般安装
1. 将 _h5ai 文件夹拷贝到你的网站的根目录: DOC_ROOT/_h5ai
```
DOC_ROOT
 ├─ _h5ai
 ├─ your files
 └─ and folders
```
2. 访问 http://YOUR-DOMAIN.TLD/_h5ai/public/index.php， 检查 h5ai 是否可用。 这个页面还将显示一些 h5ai 的功能是否被服务器所支持的信息。
3. 将 /_h5ai/public/index.php  添加到 index-file 列表中。这样 根目录中的文件将被 h5ai 所管理和展示。

##### 子文件夹的通用配置
一般对于 Nginx 服务器来说，如果想添加一个 h5ai 展示的子文件夹，可以采用类似如下的配置：
```
location /Home/ {
    alias /var/www/html/Home/;
    index /Home/_h5ai/public/index.php;
}
```
#### Syncthing
和网盘的解决方案不同，Syncthing 是一个同步盘的解决方案，一般可单独针对文档文件夹设置。
##### 下载和安装
在 [这里](https://syncthing.net/downloads/) 下载 Syncthing 的客户端，Windows 和 Mac 都有专属的客户端。另外还需要再主要的备份服务器上安装服务端（其实 Syncthing 不区分服务端和客户端），笔者是利用 Docker 在 树莓派上安装的 Syncthing 服务。

##### 使用
Syncthing 的界面其实都是 Web 界面，所谓的客户端也仅仅是对 Web 操作界面包了一层壳。基本的操作界面如下：
![Syncthing](https://image.uglyboy.cn/2020121/Syncthing.png)

流程上来说，就是添加远程设备 -> 添加文件夹 -> 共享同步，这么几个步骤。

需要注意的是，每次添加设备或文件夹，需要在远程设备上做确认动作。另外，只有在远程设备上才能建立文件的版本管理体系。