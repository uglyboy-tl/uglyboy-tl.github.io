---
title: Visual Studio Code 配置
tags:
  - Python
  - VSCode
categories:
  - 应用技巧
date: 2017-02-05 08:41:52
---

> 自从某年开始接触Linux，接触Vim，编程方面就喜欢文本编辑器大过IDE。后来工作需要，Java实在是不用 IDEA 不成，似乎又有了些重回IDE的冲动。之后也入过 Sublime Text 3 的坑，直到遇到了 VSCode，将整合和定制平衡的恰到好处，经过一年多的发展，插件环境也有了相当的提升。

<!-- more -->

#### 安装VSCode

因为我是跨平台使用者，所以需要在Win，Ubuntu，Archlinux 三个环境下使用VSCode，所以后面的说明部分也会分平台来解释：

*   Win 下下载安装包安装即可
*   Ubuntu 下也类似，有deb的安装文件
*   Archlinux 稍麻烦些，不过还好 VSCode 入了 archlinuxcn 的源，和官方相比，也就是晚一天更新而已。

#### 配置Git

Win 下下载了 微软最新的 gvfs git 的 便携版，Ubuntu和Archlinux都直接安装官方源。其中Win下因为使用的是便携版，所以需要在用户配置中指定git的路径。
```
"git.path":"your_path\\cmd\\git.exe"
```

另外需要额外说明一个经验，GIT 请用 HTTPS 方式链接，因为用 SSH 连接的话，每次都要询问密码，而包括 subl，vscode 在内的各种编辑器，都是后台自动同步，就会时不时弹出密码询问窗口。HTTPS 也会弹出窗口，对 git 配置：
```bash
git config --global credential.helper store
```

#### 插件

这部分还没有更深入的研究，暂时我这里主要使用 Python 环境，插件列表：

*   Material Icon Theme
*   Python

其中，第一个图标主题可以让你更轻松的分辨文件类型。第二个Python插件继承了跟Python相关的大部分内容。例如语法高亮、自动补全、语法检查、自动格式化等等。

#### Python开发环境配置

1.  配置 Virtualenv 工作环境：
    ```bash
    python -m virtualenv -p python3 Py3Env
    ```
    
2.  进入新的工作环境，并安装 pylint，autopep8：
    ```bash
    sources bin/activate
    pip install -U pylint autopep8
    ```
3.  git 同步工程，用 vsc 打开，并配置工作区设置
    ```
    "python.formatting.provider": "autopep8",
    "python.formatting.formatOnSave": true,
    "python.linting.pylintEnabled": true,
    "python.pythonPath": "${workspaceRoot}/../bin/python"
    ```
    
4.  为保证上面的工作路径生效，可能win下还需要手动将 **Scripts** 重命名为 **bin**
5.  使用 Ctrl + Shift + B 唤起执行操作，会提示生成 tasks.json 配置文件，将command 配置成上文中的 python 工作路径即可，另外修改：
    ```
    "args": ["${file}"],
    ```
    
6.  在Win下，执行操作的输出结果中的中文有可能乱码，是因为环境编码导致的。如果全局都使用的 UTF-8 编码，可增加如下配置，解决乱码问题：
    ```
    "options":{
        "env":{
            "PYTHONIOENCODING": "UTF-8"
        }
    }
    ```
    

#### 调试

VSCode 的调试功能很牛掰，但是个人比较懒，大部分时候调试都用 print 代劳了。以后有机会再研究调试功能。