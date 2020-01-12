---
title: 【我的利器】Linux篇
tags:
  - Linux
categories:
  - 利器
date: 2016-08-28 11:35:00
---

> 本文会结合个人使用情况不定期更新，仅作为个人的工具备忘录。

[![我的利器](//img.uglyboy.cn/2016/09/我的利器.png)](//img.uglyboy.cn/2016/09/我的利器.png)

<!-- more -->

### 系统美化

*   [Papirus图标主题](//github.com/PapirusDevelopmentTeam/papirus-icon-theme-gtk/)

> 一款非常美丽的扁平化icon主题，支持GTK，Plasma5，和一些常用软件。
```bash
sudo add-apt-repository ppa:varlesh-l/papirus-pack
sudo apt-get update
sudo apt-get install papirus-gtk-icon-theme?libreoffice-style-papirus
```
*   [Flatabulous Arc Theme](//github.com/andreisergiu98/arc-flatabulous-theme)

> 很赞的扁平化GTK主题，尤其是导航按钮是防Mac OS的。我现在一直在用的主题。
>
> 这个主题需要git下来之后自己编译：
```bash
git clone https://github.com/andreisergiu98/arc-flatabulous-theme && cd arc-flatabulous-theme
./autogen.sh --prefix=/usr
sudo make install
```
> 编译需要的支持工具：autoconf automake pkg-config libgtk-3-dev 为了支持其完整效果，还需要额外安装：
```bash
sudo apt-get install gtk2-engines-pixbuf?gtk2-engines-murrine
```