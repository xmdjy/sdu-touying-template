<div align="center">

# SDU Touying Template

**为山东大学学术汇报打造的 Typst 幻灯片模板**

山大红视觉 · 中文排版友好 · 数学公式清晰 · 开箱即用

[![Typst](https://img.shields.io/badge/Typst-powered-239DAD?style=for-the-badge&logo=typst&logoColor=white)](https://typst.app/)
[![Touying](https://img.shields.io/badge/Touying-0.6.1-C91F25?style=for-the-badge)](https://github.com/touying-typ/touying)
[![License](https://img.shields.io/badge/License-MIT-8C1D1D?style=for-the-badge)](./typst.toml)
[![GitHub stars](https://img.shields.io/github/stars/xmdjy/sdu-touying-template?style=for-the-badge&logo=github&color=C91F25)](https://github.com/xmdjy/sdu-touying-template/stargazers)

</div>

![SDU Touying Template 封面效果](./image/readme-cover.png)

> 用接近 Markdown 的语法专注内容，把标题、目录、页眉页脚、分页和学校视觉交给模板。适合课程展示、组会汇报、论文分享与答辩演示。

## 为什么选择它

| 能力 | 体验 |
| --- | --- |
| 🎓 山东大学视觉 | 山大红主色、校徽、校园线稿背景，以及统一的封面、目录和结束页 |
| ✍️ 轻量写作 | 使用 `=` / `==` 组织章节，正文语法接近 Markdown，无需维护复杂的 Beamer 命令 |
| 🧮 学术排版 | 支持 Typst 数学公式、矩阵、长公式缩放与多页公式排版 |
| 🧭 自动组织 | 自动生成目录、页标题与页码，并根据二级标题组织幻灯片 |
| 💻 代码友好 | 集成 Codly 代码块；行内代码带浅灰背景，链接自动显示为蓝色 |
| 📋 列表稳定 | 同一二级标题下的有序列表即使被段落、公式或图片隔开，也会连续编号 |

## 效果预览

<table>
  <tr>
    <td width="50%" align="center">
      <img src="./image/readme-outline.png" alt="自动目录页">
      <br><sub>自动目录与章节页码</sub>
    </td>
    <td width="50%" align="center">
      <img src="./image/readme-content.png" alt="正文、链接与行内代码样式">
      <br><sub>正文、链接与行内代码</sub>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <img src="./image/readme-math.png" alt="复杂数学公式与矩阵排版">
      <br><sub>复杂公式、矩阵与自动续页</sub>
    </td>
  </tr>
</table>

以上页面均由仓库 `workspace/` 中的真实演示稿直接编译生成，并非设计稿。

## 3 分钟开始使用

### 1. 克隆仓库

```bash
git clone https://github.com/xmdjy/sdu-touying-template.git
cd sdu-touying-template
```

建议安装 VS Code 的 [Tinymist](https://github.com/Myriad-Dreamin/tinymist) 插件，以获得实时预览、语法提示和一键导出。

### 2. 新建演示稿

在项目根目录创建 `slides.typ`：

```typst
#import "@preview/touying:0.6.1": *
#import "lib.typ": *

#show: sdu-theme.with(config-info(
  title: [演示文稿标题],
  subtitle: [副标题],
  author: [你的名字],
  institution: [学院 / 实验室],
  date: datetime.today(),
))

#title-slide()
#outline-slide()

= 第一章

== 第一页内容

- 无序列表使用 `-`
- 数学公式直接写作 $ y = W x + b $

+ 有序列表使用 `+`
+ 编号会自动连续

== 致谢 <touying:unoutlined>

#end-slide()
```

正文写在 `#outline-slide()` 与“致谢”之间。一级标题 `=` 表示章节，二级标题 `==` 会生成一组新的幻灯片。

### 3. 编译 PDF

```bash
typst compile slides.typ
```

也可以直接修改并编译仓库自带的示例：

```bash
typst compile --root . template/exp.typ
```

## 常用写法

| 需求 | Typst 写法 |
| --- | --- |
| 一级章节 | `= 章节标题` |
| 幻灯片标题 | `== 页面标题` |
| 加粗 / 斜体 | `*加粗*` / `_斜体_` |
| 行内代码 | `` `code` `` |
| 超链接 | `#link("https://example.com")[显示文字]` |
| 行内公式 | `$ E = m c^2 $` |
| 矩阵 | `$ mat(1, 2; 3, 4) $` |
| 无序 / 有序列表 | `- 条目` / `+ 条目` |
| 插入图片 | `#image("image/figure.png", width: 70%)` |

项目图片建议统一放入 `image/` 目录，便于移动、分享和编译。

## 自定义主题

可以在主题入口覆盖比例、主色和页脚：

```typst
#show: sdu-theme.with(
  config-info(
    title: [标题],
    author: [作者],
    date: datetime.today(),
  ),
  aspect-ratio: "16-9",
  primary: rgb("#8C1D1D"),
  footer-right: [山东大学 · 学术汇报],
)
```

更深度的页面样式可以直接在 [`lib.typ`](./lib.typ) 中修改。

## 项目结构

```text
.
├── lib.typ          # 主题实现
├── template/
│   └── exp.typ      # 最小可运行示例
├── image/           # 校徽、背景与用户图片
├── vi/              # 早期效果预览
└── typst.toml       # 包与模板元数据
```

## 使用提示

- 模板目前尚未发布到 Typst Universe，请通过克隆仓库使用。
- 本仓库已使用 Typst 0.14.2 验证；建议使用较新的 Typst 与 Tinymist 版本。
- 若本机缺少部分中文字体，Typst 会按 `lib.typ` 中的候选字体顺序回退。可以传入自己的字体列表覆盖默认设置。
- 这是社区维护的非官方模板，与山东大学官方无隶属关系。

## 致谢

本项目基于 [Touying](https://github.com/touying-typ/touying) 构建，视觉和实现参考了 [touying-sjtu](https://github.com/sjtug/touying-sjtu)，并延续了 [exp-report-template](https://github.com/xmdjy/exp-report-template) 的设计经验。

Bug、建议和新的页面设计也欢迎通过 [Issues](https://github.com/xmdjy/sdu-touying-template/issues) 提交，感谢您的使用和建议
