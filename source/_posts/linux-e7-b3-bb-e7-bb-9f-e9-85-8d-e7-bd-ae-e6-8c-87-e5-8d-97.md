---
title: Linux 系统配置指南
tags:
  - Linux
url: 445.html
id: 445
categories:
  - 应用技巧
  - 技术心得
date: 2016-12-23 17:04:22
---

### 引言

我最早接触Linux系统是在 Windows Me 时代，而以Linux作为工作的主系统已经有8年左右的时间了。 最早的Linux系统，仅仅只能称为操作系统罢了，无论是桌面的易用性，美观性，还是必备的功能都是很不完备的。套用当年一直喜欢的一本杂志的宣传语——用电脑就是用软件（《软件指南》），Linux当年十分不完备的生态，决定了它真的不适合作为主系统。 受益于 MacOS 的崛起，以及Chrome的流程，WebApp成为主流，ChromeOS甚至都可以作为操作系统，此后Linux下的生态才间接受益的丰富起来，以其作为主系统，尤其是工作用主系统成为了可能。 个人使用Linux的历程如下：

*   **RedHat** 最早开始使用的Linux系统，因为当年没有高速网络，所以还是买的正版的系统，但似乎对个人桌面而言，这还不是一个好的时代。
*   **Ubuntu** ubuntu的出现，致使个人的Linux开始流行。我也是通过它开始了解包管理，apt-get。但是作为一个学生，并没有很强的工作需求，Linux能提供的便利还体会不到，不足倒是可以找出一堆（最关键的就是不能玩游戏）。
*   **Archlinux** 读研的几年，是这个系统伴我走过的科研之路。通过鼓捣 Archlinux，让我对命令行、对Linux桌面的架构都有了更深的了解。并且这个时期也是Linux桌面高速发展的时期，我则一直紧随着Gnome的升级当着第一批的小白鼠。从系统的科技感来说，秒杀了Win7。加上科研常用的 OpenCV，Latex，g++，Qt4等等，都只有在Linux下才能最大的发挥自己的能力。
*   **Ubuntu** 工作后，给公司电脑装的也是Arch，但一次滚动升级后挂掉了。。。为了稳定，不再在主工作电脑上搞 Arch 了。当然，习惯了Arch后，还是不太能忍ubuntu 的定制，每次装完之后还都需要鼓捣好半天才能满意。这篇文章也是记录一套完整的鼓捣流程的。

### 安装系统

#### 准备工作

*   在Win下面下载ubuntu的安装光盘，用UltraISO写入硬盘的方式，制作U盘安装盘。
*   在Linux下面也类似，只不过制作安装盘的方式改成了用dd命令。

#### 安装流程

1.  没啥可多说的，插上U盘，重启系统，狂按 Esc 或者 F2，通过U盘引导，然后就进入安装界面了。
2.  因为大部分时间我都涉及到重装系统，所以保存资料这件事很重要，分区选择的时候一半都是自定义，然后把 /boot 和 /home 单独分区，设置一个swap分区，也就差不多了。
3.  按系统默认的各种配置下一步，安装。中间注意的是，一半都不会在安装阶段选择更新，因为系统需要定制，安装阶段的很多更新并没有什么用，还会拖慢系统安装的过程。
4.  安装完毕，就重启进入配置阶段了。
    
    > 这里额外提一下，最近一直在用bugdie-desktop桌面环境，所以安装的镜像是budgie-remix。
    

### 配置系统

#### 准备工具

1.  首先联网，配置软件源（我一般用aliyun的，支持自己公司嘛）。
2.  安装gdebi,vim,zsh,git,xfce4-terminal,thunar,xfce4-screenshooter,xfce4-taskmanager,leafpad
3.  设置终端 chsh -s /bin/zsh，（安装 oh my zsh）重启终端
4.  安装顺手的浏览器，我最近主要用Opera
5.  安装Opera需要的主题依赖 libcanberra-gtk-module

#### 卸载无用应用

1.  sudo apt-get autoremove firefox libreoffice-common gnome-terminal transmission rhythmbox totem gthumb nano gedit eog gnome-calculator gnome-photos gnome-disk-utility gnome-screenshot gnome-mahjongg gnome-online-accounts gnome-orca gnome-sudoku gnome-sushi gnome-user-guide yelp evince simple-scan cups image magic–6.q16 gnome-power-manager gnome-software-common gnome-mines aisleriot budgie-welcome gnome-calendar ibus gnome-user-share menulibre gnome-screensaver nautilus arc-theme fans-icon-theme vertex-theme humanity-icon-theme update-manager
2.  sudo apt-get autoremove firefox-locale-*

#### 更新系统

*   sudo apt-get update
*   sudo apt-get upgrade

#### 开启数字小键盘

*   sudo apt-get install numlockx

#### 补充部分依赖关系

1.  阿里郎：libqtwebkit4 libgail-common

#### 补充系统中文字体和输入法

*   cd /usr/share/fonts
*   sudo mkdir NotoSans
*   sudo cp * ./NotoSans
*   sudo apt-get install language-pack-gnome-zh-hans
*   sudo apt-get install language-pack-zh-hans

安装搜狗拼音输入法

#### 一些问题

*   如果遇到 Gtk-Message: Failed to load module “ark-bridge”，安装 libatk-adaptor
*   flash支持 sudo apt-get install pepperflashplugin-nonfree