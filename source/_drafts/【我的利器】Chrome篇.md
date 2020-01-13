---
title: 【我的利器】Chrome篇
tags:
  - Chrome
  - Markdown
categories:
  - [利器]
date: 2016-08-30 07:13:00
---

![我的利器](https://image.uglyboy.cn/我的利器.png)

> 本文会结合个人使用情况不定期更新，仅作为个人的工具备忘录。

<!-- more -->

*   [Enpass extension](https://chrome.google.com/webstore/detail/enpass-extension-requires/kmcfomidfpdkfieipokbalgegidffkal)

> 密码管理软件 Enpass 的浏览器扩展。以前用的是 1Password，但是这货一直没有 Linux 版的客户端，而且动不动就收费。几经折腾，包括中间使用过一段时间 LastPass （密码是存在 LastPass 的服务器中，担心这种模式容易出问题），最终遇到了 Enpass，已经两三年不再折腾了。
>
> Enpass 跟 iOS 配合得也很好～而且可以检测密码泄露等等。总得来说吧，这几个软件功能都大同小异，没有什么特定的需求，哪个顺手用哪个就好了。 

*   [AdGuard 广告拦截器](https://chrome.google.com/webstore/detail/adguard-adblocker/bgnkhhnnamicmpeenaelnjfhikgbkllg)

> 以前用 adb，但 adb 默认的规则略少，尤其是手机端过滤效果一般，所以后来手机端换成了 AdGuard，然后浏览器中也就跟着换了。和前面密码管理一样，用着顺手就没必要折腾，都差不多。

*   [Proxy SwitchyOmega](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif)

> 这货是神器！配合V2ray，可以顺利的自适应科学上网。
>
> 配置方面重点就是配置一个自动切换的情景模式，可以根据规则自动决定是否调用代理。规则列表的地址这里备份一下：
```
https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
```

*   [Stylish](//chrome.google.com/webstore/detail/stylish/fjnbnpbmkenffdnngjfgmeleoegfcffe)

> 自定义不同网站的css，定制化自己的浏览体验。尤其是微博、百度、网易、cnBeta这类大的站点，都可以直接从Stylish网站上找到对应的美化文件，并不需要自己真的写css或者懂css。
>
> 哪怕并不想大幅度更改界面，也可以通过自己的简单设置，去掉一些网站上自己不喜欢的模块。我就对自己经常逛的几个网络小说的网站进行了优化，界面上只剩下小说主题，没有了侧边栏、导航栏之类的干扰。
>
> 特别需要提醒的是，Stylish上的主题还可以美化Stylish自己的插件控制面板！当然还有Chrome的各种页面，甚至其他浏览器的界面、LibreOffice之类的。

*   [Tampermonkey](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo)

> Violent monkey 不能用了，只好换回 Tampermonkey。定制化js脚本的，主要用于优化搜索引擎或者给特定的网站添加功能之类的。分享几个我自己常用的脚本：
> 
> *   [super-preloaderplus-one](//greasyfork.org/zh-CN/scripts/293-super-preloaderplus-one)?论坛、新闻或者搜索结果页自动翻页；
> *   [百度网盘助手](//greasyfork.org/zh-CN/scripts/17083-%E7%99%BE%E5%BA%A6%E7%BD%91%E7%9B%98%E5%8A%A9%E6%89%8B-%E6%94%B9)?显示百度网盘文件的直接链接,突破大文件需要使用电脑管家的限制；
> *   [知乎真实链接地址重定向](//hzy.pw/p/2056)?rt，不再需要知乎的提醒页面；

*   [Markdown Here](//chrome.google.com/webstore/detail/markdown-here/elifhakcjgalahccnjkneoccemfahfoa)

> 将你所能见到的各种富文本编辑器变成支持Markdown的编辑器进行编辑。一直很憧憬这个功能，但实际上还没怎么用上这个插件。

*   [Marmoset](//chrome.google.com/webstore/detail/marmoset/npkfpddkpefnmkflhhligbkofhnafieba)

> 这个插件很特别——将一段代码变成一个立体动感的图片。功能比较单一，但是确实是生成装逼图的利器~！

*   [Instapaper](//chrome.google.com/webstore/detail/instapaper/ldjkgaaoikpmhmkelcgkgacicjfbofhh)

> Instapaper插件，稍后阅读工具。iPad上Reeder有时抓取知乎的文章失败（需要登录），就需要用浏览器来抓取。