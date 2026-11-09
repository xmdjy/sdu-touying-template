# Typst Universe 提交前检查

检查日期：2026-11-07。展示名称：sdu-smpl-slides。
候选包：`@preview/sdu-smpl-slides:0.1.0`。

## 已验证

- `typst.toml` 入口、模板目录、版本、分类、MIT 许可文件和仓库链接。
- 模板使用包导入，不再使用 `../lib.typ`；保留用户更名后的 `main.typ`。
- 在临时包目录运行 `typst init`，初始化仅生成 `main.typ` 和 `references.bib`。
- 初始化后的独立项目使用 Typst 0.15.0 编译成功；运行图片路径正确。
- 默认及示例使用原学校背景和校徽。
- `.qoder/`、`.qorder/` 已由 Git 和包清单忽略，未删除本地会话。
- 五张预览从本次文稿重新生成，并按标题查询页码，避免页面增删导致错配。
- 缩略图尺寸 1684×947；素材调整后已重新生成，并使用 `oxipng` 默认参数无损压缩。
- 预览图和 PDF 统一放入 `assets/` 并从下载包排除；`template/` 中不再包含编译产物。README 和 LICENSE 保留。
- README 本地链接及源码差异空白检查通过。

提交候选目录：`dist/packages/preview/sdu-smpl-slides/0.1.0`。
预览图已从 `vi/` 移到 `assets/`，旧目录已删除；SVG 已更名为 `image/sdu_logo.svg`。
本次按新名称重新执行 `typst init` 和独立编译，通过；README 本地链接和图片路径检查通过。

## 最新依赖兼容性检查

本地任务分支 `chore/upgrade-typst-dependencies`：Touying 0.8.0、Codly 2.0.0、codly-languages 0.1.10、gentle-clues 1.3.1、Lovelace 0.3.1。

- Codly 2 改用模块导入、`new` 和组件配置规则，保留浅灰底、语言标识与隐藏行号。
- Touying 树操作调用改为 `utils.tree`；背景迁入 `config-page`，修复升级后每页多出一张空白页的问题。
- 初始化模板后使用 Typst 0.15.0 独立编译成功，完整示例保持 19 页；检查封面、目录、表格、公式、代码、引用与致谢页。
- 补充验证跨段落列表连续编号（含标签）、多行公式、提示框、暂停动画、自定义页脚和自定义结束页。
- 最低编译器版本同步提高到 0.15.0。当前系统默认 CLI 仍为 0.14.2；本次使用官方 0.15.0 临时二进制验证，未替换系统安装。
- 本轮升级通过项目 PR 交付，并更新现有官方发布 PR #6329；具体状态以 GitHub 为准。

## 仍需解决

1. **名称审核**：官方维护者要求更换具有独特性、不会暗示官方背书的名称，且移除或替换 `-template` 后缀；当前包名已按项目作者要求改为 `sdu-smpl-slides`，是否满足独特性要求仍待官方审核。
2. 本机缺少 XCharter、FandolSong、Maple Mono，会回退字体并发出警告；字体依赖和替换方式已写入 README，未随包捆绑字体。
3. 未运行官方 `typst-package-check`（环境未安装该工具、Cargo、Nix 或 Docker），官方 PR #6329 的自动检查状态以最新提交为准；未声称官方审核通过。

本报告记录提交前的技术验证，不代表 Typst 官方已接受该包。

## 重现

按照 README 的本地包注册命令编译。原 `scripts/` 已由维护者删除，不再依赖这些脚本。
可在注册本地包后另行执行：

```sh
typst init --package-path .typst/packages @preview/sdu-smpl-slides:0.1.0 /tmp/sdu-check-project
typst compile --package-path .typst/packages /tmp/sdu-check-project/main.typ /tmp/sdu-check-project/example.pdf
```

初始化目标目录应为尚不存在的新目录。当前候选目录已同步新包名、图片路径和生成文件。

## 官方依据

- https://github.com/typst/packages/blob/main/docs/README.md
- https://github.com/typst/packages/blob/main/docs/manifest.md
- https://github.com/typst/packages/blob/main/docs/tips.md
- https://github.com/typst/packages/blob/main/docs/licensing.md

## 2026-11-10：处理 PR #6329 的素材反馈

- 按项目作者要求保留原学校背景和校徽作为默认及示例素材。
- 主题支持 `logo`、`background` 内容参数，可由用户传入替代素材或 `none` 隐藏。
- 示例 PDF、五张预览和缩略图已使用原学校校徽和背景重新生成。
- 对全部七张 PNG（含学校背景）运行默认参数 `oxipng`，2547587 字节降至 1927118 字节（减少 24.36%）。
- 此记录为本地修改；未提交、推送或更新官方 PR。

### 官方素材使用规定核查（2026-11-10）

检索并核对山东大学校长办公室公布的《山东大学校名校誉管理办法（试行）》：
https://www.dbxb.sdu.edu.cn/info/1039/1984.htm

第十七条列有师生如实标明单位、校内非商业活动等免审批情形，但未明确授予本项目将学校素材随开源模板向所有人再分发的许可。README 保留项目作者提供的素材来源声明和官方管理办法链接。当前按项目作者要求保留学校素材；官方 PR 对再分发授权的反馈尚未解决，使用规定说明不等同于再分发许可。

## 2026-11-10：包名统一为 sdu-smpl-slides

- 包清单、模板导入、示例标题、README 命令及本文包标识统一改为 `sdu-smpl-slides`，版本保持 `0.1.0`。
- 现有 GitHub 仓库地址仍为 `xmdjy/sdu-touying-template`，链接保持真实地址；`sdu-theme` 函数名保持兼容。
- 新包名通过 `typst init` 初始化及独立编译；示例保持 19 页，PDF 文本中不再包含旧包名。
- 示例 PDF、五张预览及缩略图已重新生成；六张预览 PNG 以默认参数 `oxipng` 从 2416276 字节压缩至 1844802 字节（减少 23.65%）。学校背景沿用此前压缩结果。
- 本地仍有缺失字体的原有警告；尚未提交、推送或更新官方 PR，名称尚待官方维护者接受。
