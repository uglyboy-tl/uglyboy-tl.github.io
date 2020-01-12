---
title: WordPress主题开发
tags:
  - WordPress
categories:
  - 技术心得
date: 2016-09-07 20:45:06
---

> 这两天主要忙着进行WordPress的主题开发，现在这个站点的主题已经换成了我自己开发的版本。
![](//image.uglyboy.cn/uglyboy.site.png)

> 当然，css部分参照了 amadeus和hemingway这两个主题，并且还没有集成js。速度方面到是还OK，不过适配iPad等相关设备方面，体现了我在前端方面经验的缺失，找不到合适的工具来较好的完成各种测试、调整工作，只能人工的一遍一遍尝试。。。
>
>部分要点记录一下：

<!-- more -->

##### WordPress主题代码结构
*   WordPress的主题，依据页面的不同，分别会调用：
    1.  index.php：主页模板；
    2.  archive.php：Archive/Category模板，用来显示各种分类下的文章目录；
    3.  single.php：内容页（Post）模板；
    4.  page.php：内容页（Page）模板；
    5.  404.php：Not Found 错误页模板
    6.  style.css：全局通用的样式表，主题声明也记在这个样式表里。
*   其中内置的接口支持将如下部分抽象出来：
    1.  header.php：Header模板，可以包含 标签的内容和网站头部的标题、Banner、菜单等
    2.  footer.php：Footer模板。
    3.  sidebar.php：侧边栏模板。
    4.  content.php：文章内容模板。
    5.  comments.php：文章评论模板。
*   另外，菜单、小工具等还需要一些函数注册，相关内容会读取：
    *   functions.php：模板函数，存放主题用到的函数模块。例如自定义的菜单栏、小工具、背景等一系列可设置项，都是在这个文件中定义的。

##### 部分常用函数
*   _`<?php bloginfo(‘html_type’); ?>`_ ： 网页Html类型
*   _`<?php bloginfo(‘charset’); ?>`_ ： 网页编码
*   _`<?php bloginfo(‘name’); ?>`_? ： 博客名称（Title）
*   _`<?php bloginfo(‘url’); ?>`_ ： 博客 Url
*   _`<?php bloginfo(‘description’); ?>`_ ： 博客描述
*   _`<?php bloginfo(‘stylesheet_url’); ?>`_? ： CSS文件路径
*   _`<?php bloginfo(‘template_url’); ?>`_ ： 模板文件路径
*   _`<?php wp_head(); ?>`_ ： 头部挂钩（hook），非常重要的函数，基本上每一个主题都要用到，因为它是用来让其他插件或功能函数在网站头部输出css、js等文件的，如果主题没有这个函数，可能会造成很多插件无法正常使用，一般添加在 header.php 文件中
*   _`<?php wp_footer(); ?>`_ ： 底部挂钩（hook），和 wp_head() 一样重要，功能也基本一样，一般添加在 footer.php 文件中
*   _`<?php wp_nav_menu(); ?>`_ : 调用导航菜单（WP 3.0+），一般需要在 functions.php 添加注册菜单函数 register\_nav\_menus() 一起使用
*   _`<?php get_header(); ?>`_ ： 调用Header模板
*   _`<?php get_sidebar(); ?>`_ ： 调用Sidebar模板
*   _`<?php get_footer(); ?>`_ ： 调用Footer模板
*   _`<?php include(TEMPLATEPATH . ‘/xxx/xxxx.php’); ?>`_ ： 嵌入其他文件，可为定制的模板或其他类型php文件，很常用
*   _`<?php echo get_avatar( get_the_author_email(), ’48’ ); ?>`_ ：根据作者邮箱输出作者的头像
*   _`<?php wp_list_categories(); ?>`_ ： 显示Categories列表
*   _`<?php get_calendar(); ?>`_? ： 日历
*   _`<?php wp_get_archives() ?>`_? ： 显示内容存档
*   _`<?php _e(‘Message’); ?>`_ ： 输出相应信息
*   _`<?php the_title(); ?>`_ ： 内容页（Post/Page）标题
*   _`<?php the_permalink() ?>`_ ： 内容页（Post/Page） Url
*   _`<?php the_category(‘, ‘) ?>`_ ： 特定内容页（Post/Page）所属Category
*   _`<?php the_author(); ?>`_ ： 作者（只显示作者名字，没有链接）
*   _`<?php the_author_posts_link(); ?>`_ ：作者（显示作者，并且包含链接到作者文章目录的链接）
*   _`<?php the_time(‘Y-m-d’) ?>`_ ：显示时间，时间格式由“字符串”参数决定，具体参考PHP手册
*   _`<?php echo get_post_meta(); ?>`_ : 获取保存在 post_meta 这个表中的数据，比如输出某个 自定义字段 的内容
*   _`<?php the_ID(); ?>`_ ： 特定内容页（Post/Page） ID
*   _`<?php the_tags(‘关键字: ‘, ‘, ‘, ”); ?>`_ ：显示文章的关键字tag
*   _`<?php the_excerpt(); ?>`_ ：Post/Page 的摘要，输入文章发布页面中的摘要面板的内容
*   _`<?php the_content(‘more’); ?>`_ ：Post/Page 的摘要，配合 _<!–more–>_ 来使用
*   _`<?php the_content(); ?>`_? ： 显示内容（Post/Page） 全文
*   _`<?php wp_list_pages(); ?>`_ ： 显示Page列表，常用于显示单篇文章的分页，配合 _<!–next page->_ 来使用
*   _`<?php edit_post_link(); ?>`_ ： 如果用户已登录并具有权限，显示编辑链接
*   _`<?php posts_nav_link(); ?>`_ ： 显示上一页/下一页的链接，通常用在索引页、分类页和文章存档页
*   _`<?php previous_post_link(‘%link’, ‘上篇’, TRUE); ?>`_ ： 下一篇文章链接，通常用在单篇文章 single.php 中
*   _`<?php next_post_link(‘%link’, ‘下篇’, TRUE); ?>`_ ： 上一篇文章链接，通常用在单篇文章 single.php 中
*   _`<?php comments_popup_link(‘暂无评论’, ‘评论数 1’, ‘评论数 %’); ?>`_? ： 正文中的留言链接。如果使用 comments\_popup\_script()，则留言会在新窗口中打开，反之，则在当前窗口打开
*   _`<?php comments_template( ”, true ); ?>`_ ：显示评论模块
*   _`<?php if(have_posts()) : ?>`_ ： 检查是否存在Post/Page
*   _`<?php while(have_posts()) : the_post(); ?>`_ ： 如果存在Post/Page则显示
*   _`<?php endwhile; ?>`_ ： While 结束
*   _`<?php else :? ?>`_ ：如果 if 条件中不存在Post/Page ，就输出其他内容
*   _`<?php endif; ?>`_ ： If 结束
*   _`<?php query_posts(); ?>`：_ 限定Loop循环条件，更灵活地调用需要的文章
*   _`<?php wp_reset_query(); ?>`：_重置查询数据，它必须使用在loop（循环）中，如果你使用了什么的 `<?php query_posts(); ?>` 函数获取内容，那最好在获取内容的最后添加这个函数，一般这两个都是成对使用。

##### functions.php中涉及的一些配置项
*   add\_action( 'wp\_enqueue\_scripts', 'uglyboy\_scripts' )：增加用户自己的js文件或者css文件引用；
*   add\_action( 'wp\_head', 'uglyboy\_html5shiv' )：增加 wp\_head() 的功能；
*   add\_action( 'after\_setup\_theme', 'uglyboy\_setup' )：一些初始化的工作；
*   add\_theme\_support( 'custom-logo' )：支持添加logo；
*   add\_theme\_support( 'automatic-feed-links' )：支持生成rss feed；
*   register\_nav\_menu( 'primary', 'Primary Menu' )：增加菜单选项；
*   add\_action( 'widgets\_init', 'uglyboy\_sidebar\_reg' )：增加小工具选项；

> 这种前端页面开发，用的是Sublime Text3，而且最新的Sublime Text3已经支持官方汉化，确实是当前最便捷的编辑器，尤其是Linux下启动速度也杠杠的，内存占用还少。要是能进行java开发就好了。。。IDEA内存占用实在太大了（相对于我的Linux上网本来说的）。等再研究研究，写一篇Sublime Text3的介绍~