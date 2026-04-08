# touying-sdu

_A Shandong University themed slide template for Typst + Touying._  
一个基于 Typst 与 Touying 的山东大学风格幻灯片模板。
(以下内容均为AI生成，后续会更新)

---

- 该模板面向课程汇报、组会展示、答辩演示等场景，提供封面页、目录页、分节页、结束页等常用版式。
- 模板默认适配山东大学视觉元素，也支持你在 `lib.typ` 与 `image/` 中进一步替换为其他学校或机构的素材。
- 已集成 `codly`、`gentle-clues`、`pinit` 等常见增强包，适合代码展示、提示框、演示标注等场景。
- 已接入中文假粗体与假斜体修复，中文加粗/斜体在常见系统字体下表现会更稳定。

---

## Preview

当前仓库内提供了示例文件与导出结果：

- 示例源文件：[template/exp.typ](/F:/SDUCS/typst/touying-sdu/template/exp.typ)
- 示例 PDF：[template/exp.pdf](/F:/SDUCS/typst/touying-sdu/template/exp.pdf)

---

## Features

- 基于 `touying` 的演示文稿主题封装
- 山东大学风格封面、目录页、章节页、结束页
- 左侧红色目录色带与校徽 SVG 叠加设计
- 支持 Typst 原生数学公式
- 支持 `codly` 代码块高亮与语言图标
- 支持 `gentle-clues` 提示框
- 支持 `pinit` 演示标注能力
- 支持中文假粗体、假斜体修复

---

## Project Structure

```text
touying-sdu/
├── lib.typ        # 主题主文件
├── typst.toml     # 包信息与模板入口
├── README.md
├── image/         # 主题图片资源
│   ├── sdu_bg.png
│   ├── sdu_around_logo.jpg
│   ├── sdu_ud_logo.png
│   └── sdu_slide_logo_trans.svg
└── template/
    ├── exp.typ    # 示例演示文稿
    └── exp.pdf    # 示例导出结果
```

---

## Requirements

### Typst

建议安装较新的 Typst 版本，并配合 VS Code + Tinymist 使用。

- Typst
- VS Code
- [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist)

### Fonts

建议系统中至少具备以下字体，以获得较稳定的显示效果：

- 宋体
- 黑体
- 楷体
- JetBrains Mono

如果你使用其他中文字体，模板也能运行，但视觉效果可能与当前示例略有差异。

---

## Quick Start

### 方式一：直接在仓库中本地编译

```bash
git clone https://github.com/your-name/touying-sdu
cd touying-sdu
typst compile template/exp.typ
```

编译后会得到示例 PDF，可直接预览模板效果。

### 方式二：作为本地模板修改

最简单的做法是直接复制 [template/exp.typ](/F:/SDUCS/typst/touying-sdu/template/exp.typ)，然后修改其中的题目、作者、单位和正文内容。

示例入口写法如下：

```typst
#import "@preview/touying:0.6.1": *
#import "../lib.typ": *

#show: sdu-theme.with(config-info(
  title: [你的标题],
  subtitle: [你的副标题],
  author: [你的名字],
  institution: [你的单位],
  date: datetime.today(),
))

#title-slide()
#outline-slide()

= 第一部分
== 小节标题
正文内容

#end-slide()
```

### 方式三：作为 Typst package 使用

如果后续发布到 Universe 或本地 package 仓库，也可以通过 `#import` 的方式直接使用。当前仓库中的 `typst.toml` 已配置好包信息。

---

## Usage Notes

### 1. 目录页

目录页由 `#outline-slide()` 生成，当前已经采用：

- 左侧整块亮红色区域
- 覆盖全页上下边界
- 放置透明底白化校徽 SVG

如果你想继续微调目录视觉，主要修改 [lib.typ](/F:/SDUCS/typst/touying-sdu/lib.typ) 中 `outline-slide` 相关参数即可。

### 2. 代码高亮

模板已内置：

- `codly`
- `codly-languages`
- `lovelace`

并在主题初始化时启用了 `codly-init` 与语言配置，因此你只需要直接写 fenced code block：

````typst
```python
def hello():
    print("Hello, world!")
```
````

### 3. 提示框

模板已引入 `gentle-clues`，可用于 `info`、`warning` 等提示样式。

### 4. 中文样式修复

模板已引入 `cuti` 并启用：

- `show-cn-fakebold`
- `show-cn-fakeitalic`

用于修复中文粗体与中文斜体显示问题。

### 5. 数学公式

模板支持 Typst 原生数学公式，例如：

```typst
$z_k = sum_(i=1)^n W_"ij" x_i$
$A = pi r^2$
$cal(F)(omega) = integral_(-infinity)^(infinity) f(t) e^(-i omega t) d t$
```

---

## Customization

### 修改主题信息

在 `#show: sdu-theme.with(config-info(...))` 中修改：

- `title`
- `subtitle`
- `author`
- `institution`
- `date`

### 修改配色与主题行为

在 [lib.typ](/F:/SDUCS/typst/touying-sdu/lib.typ) 中可以进一步调整：

- `sdu-theme(...)`
- `title-slide(...)`
- `outline-slide(...)`
- `new-section-slide(...)`
- `end-slide(...)`

### 修改图片资源

当前主题资源位于 [image/](/F:/SDUCS/typst/touying-sdu/image)：

- `sdu_bg.png`：背景图
- `sdu_around_logo.jpg`：右上角环形校徽
- `sdu_ud_logo.png`：结束页图像
- `sdu_slide_logo_trans.svg`：目录页左侧透明底白化校徽

如果你要替换为其他学校或机构主题，通常只需要替换图片资源并微调尺寸、颜色和留白。

---

## Package Imports

当前模板在 [lib.typ](/F:/SDUCS/typst/touying-sdu/lib.typ#L1) 中引入了这些包：

- `touying`
- `codly`
- `codly-languages`
- `gentle-clues`
- `lovelace`
- `pinit`
- `cuti`

其中：

- `codly` 用于代码块增强
- `gentle-clues` 用于提示框
- `pinit` 用于演示中的局部标注
- `cuti` 用于中文假粗体/假斜体修复

---

## Update History

- `0.1.0` 初始版本
- 后续已补充目录页左侧 SVG 方案、代码块增强包、中文样式修复与主题文档说明

---

## Reference

- [Typst 官网](https://typst.app)
- [Typst 中文教程](https://typst-doc-cn.github.io)
- [Touying](https://typst.app/universe/package/touying)
- [Codly](https://typst.app/universe/package/codly)
- [Pinit](https://typst.app/universe/package/pinit)
- 参考模板 README: [xmdjy/exp-report-template](https://github.com/xmdjy/exp-report-template)

感谢以上项目与资料对模板开发和整理的帮助。

---

## License

MIT
