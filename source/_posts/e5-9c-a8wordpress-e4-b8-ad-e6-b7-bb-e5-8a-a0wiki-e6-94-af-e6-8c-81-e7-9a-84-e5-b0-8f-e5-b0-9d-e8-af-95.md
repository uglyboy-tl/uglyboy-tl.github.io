---
title: 在WordPress中添加Wiki支持的小尝试
tags:
  - WordPress
url: 274.html
id: 274
categories:
  - 技术心得
date: 2016-09-04 11:13:29
---

昨天在学习Git使用的过程中，发现了廖雪峰的[Git教程](//www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)?，是嵌入在正常的博客里面的，于是就有了想法：是不是也可以在我的WordPress里嵌入这样的Wiki类的模块，更加结构化的组织一些成熟的知识。 于是就开始了各种尝试，记录如下：

#### WordPress插件支持

*   wiki

> 优点：内容是以树状进行组织的，每一层级都可以编辑详情，适合做内容导航 缺点：页面形式还有待美化，而且是英文的。尝试了一下修改po文件，但是鉴于自己对mo、po的了解有限，还没能完成整体汉化工作，这个是我下一阶段要尝试研究明白的东东。 这个是我现在正在用的插件。

*   Yada Wiki

> 支持分类，标签。但主要问题是它的层级结构是和文章脱离的，也就是说，分类目录上面是无法写文字的，只有树状结构的叶子节点是可以挂wiki的。 虽然它还增加了标签功能，但是这样的组织方式还是不能让我满意。说到底，它更像是换了各个模块名称的WordPress，而不像一个Wiki

#### 第三方Wiki

*   DokuWiki

> 在网上搜索相关的文章，大家还是对DokuWiki非常推崇的，尤其是DokuWiki的百科上面也官方介绍说可以和WordPress相结合。 尝试了一下，因为是文本的，所以不需要sql支持，不会造成数据库污染。但是网上提到的各种和WordPress整合的方法都已经失效了，主要是WordPress的插件，已经有8年没有更新了，而且据说在某一版开始就不能继续用了。 如果不想着彻底整合，只是变成单点登录，网上还是有合适的说明的：[DokuWiki与WordPress的用户整合](//www.uedsc.com/dokuwiki-wordpress-integration.html)

> _2016.9.更新：_ 注：单点登录方面，上面这篇文章的尝试失败了。。。不过后来发现了一个办法可以实现：[wp-dokuwiki-sso](//github.com/ohitz/wp-dokuwiki-sso)，这是两个插件，合起来就可以实现单点登录（当然还需要修改一下dokuwiki的配置）。 需要注意的是，这个插件默认要求用户是必须登录的。如果自己没有这种要求，请修改源代码，将最后一段中
> 
> $this->redirectLogin();
> 
> 注释掉。但还有一个问题没有解决，现在点击登录，并不会跳到WordPress的登录界面。

*   MediaWiki

> 一个庞大的Wiki系统。。。安装文件解压后都 130m?了。 功能肯定没的说，但是和WordPress的整合？似乎也只停留在用户共享层面。 另外这东东没有一个管理后台，所有工作都是靠编辑配置文件生效的，对于工作效率还是有影响的。

#### 二级域名

为了配合Wiki，打造了一个二级域名：[http://wiki.uglyboy.site](//wiki.uglyboy.site)，流程还是比较复杂的：

1.  需要在阿里云的域名管理中增加对 wiki.uglyboy.site 这个子域名的解析；
2.  主页的目录下面要修改 .htaccess 文件，重新定义二级域名的指向：

\# 二级域名
RewriteCond %{HTTP_HOST} ^wiki.uglyboy.site$
RewriteCond %{REQUEST_URI} !^/wiki/
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ /wiki/$1
RewriteCond %{HTTP_HOST} ^wiki.uglyboy.site$
RewriteRule ^(/)?$ wiki/index.php \[L\]

#### 备注

另外，还是发现了一个实现了Wiki和Blog配合的网站，使用的是DokuWiki：[知行近思](//www.annhe.net/)，回头好好研究一下。