##将图片批量转换为webp格式

###introduction

近3年来拍的照片多达 10GB，而我 mac 的闪存空间有限，经常提示我空间不足！最近做直播用到了 Webp 图片格式，可以节省空间，所以想把我的图片转为 Webp 格式，以此来节省宝贵的空间，convert 脚本就诞生了...

###useage

进入到脚本所在目录

- cd pic2web

执行转换脚本，将把pics文件夹里的图片转为webp格式；

- sh convert.sh

执行转换脚本，将把 inputpath 文件（夹里的图片）转为webp格式；

- sh convert.sh inputpath

控制台将会输出转换失败的图片路径。。。

###feture

- 支持单个文件转换
- 支持批量转换，只需放入一个文件内即可
- 支持文件夹递归
- 支持保留原图片的创建和修改时间

###preview

`如何在 mac 上预览？`

众所周知，mac 上的空格键被称之为万能键，几乎所有文档都可以快速预览，很遗憾苹果还没支持 Webp，所有我就找了一个 quicklook 的插件来解决，我的仓库里已经包含了我编译好的插件，可以直接拿来用，也可以去下载 [Dmitry Chestnykh](https://github.com/dchest/webp-quicklook) 的源代码自行编译生成 **WebP.qlgenerator** 文件，将她拖到 **~/Library/QuickLook** 文件夹里就好了；

使用该插件预览时图片偏白，日后我会优化下；

极客也可以使用 vwebp 预览哦，使用 OPGL 绘制的，我还没看懂o(╯□╰)o

###todo

- webp 转为 PNG；也许你觉得webp不是主流，预览、修改不方便，想转回来；
- 开发一款 mac App 能够双击预览而不是使用 Chrome 浏览器打开；
- 优化 quicklook 插件；

#####欢迎给我提建议！
