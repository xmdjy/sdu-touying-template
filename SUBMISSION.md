# Typst Universe 提交前检查

检查日期：2026-11-07。展示名称：sdu-touying-template。
候选包：`@preview/sdu-touying-template:0.1.0`。

## 已验证

- `typst.toml` 入口、模板目录、版本、分类、MIT 许可文件和仓库链接。
- 模板使用包导入，不再使用 `../lib.typ`；保留用户更名后的 `example.typ`。
- 在临时包目录运行 `typst init`，初始化仅生成 `example.typ` 和 `references.bib`。
- 初始化后的独立项目使用 Typst 0.15.0 编译成功；运行图片路径正确。
- 运行时仅保留两张素材；校徽 SVG 减少坐标精度，页眉封面共用。
- `.qoder/`、`.qorder/` 已由 Git 和包清单忽略，未删除本地会话。
- 五张预览从本次文稿重新生成，并按标题查询页码，避免页面增删导致错配。
- 缩略图 1684×947、418625 字节，小于官方 3 MiB 上限。
- 预览图和 PDF 统一放入 `assets/` 并从下载包排除；`template/` 中不再包含编译产物。README 和 LICENSE 保留。
- README 本地链接及源码差异空白检查通过。

提交候选目录：`dist/packages/preview/sdu-touying-template/0.1.0`。
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

1. **名称审核**：维护者已统一名称为 `sdu-touying-template`，符合小写形式；名称的独特性仍由官方维护者审核。
2. 本机缺少 XCharter、FandolSong、Maple Mono，会回退字体并发出警告；字体依赖和替换方式已写入 README，未随包捆绑字体。
3. 未运行官方 `typst-package-check`（环境未安装该工具、Cargo、Nix 或 Docker），官方 PR #6329 的自动检查状态以最新提交为准；未声称官方审核通过。

本报告记录提交前的技术验证，不代表 Typst 官方已接受该包。

## 重现

按照 README 的本地包注册命令编译。原 `scripts/` 已由维护者删除，不再依赖这些脚本。
可在注册本地包后另行执行：

```sh
typst init --package-path .typst/packages @preview/sdu-touying-template:0.1.0 /tmp/sdu-check-project
typst compile --package-path .typst/packages /tmp/sdu-check-project/example.typ /tmp/sdu-check-project/example.pdf
```

初始化目标目录应为尚不存在的新目录。当前候选目录已同步新包名、图片路径和生成文件。

## 官方依据

- https://github.com/typst/packages/blob/main/docs/README.md
- https://github.com/typst/packages/blob/main/docs/manifest.md
- https://github.com/typst/packages/blob/main/docs/tips.md
- https://github.com/typst/packages/blob/main/docs/licensing.md
