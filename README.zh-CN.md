# PaperPulse Academic

[English](README.md) | **简体中文**

PaperPulse Academic 是一款完整的 Obsidian 主题，面向专注阅读、学术研究与长篇写作。它将 PaperPulse macOS 的视觉语言转化为安静克制的学术工作空间：深色模式采用午夜海军蓝与深紫红，浅色模式使用温暖的纸张质感表面，并以低调的红—洋红—紫色作为强调色。

浅色模式经过独立设计，并非简单反转深色配色。两套方案均遵循 Obsidian 的语义变量，并支持用户自定义的强调色（Accent Color）。

> 当前版本：**[1.0.0](https://github.com/GabrielMu2006/paperpulse-academic-theme/releases/tag/1.0.0)**<br>
> 最低 Obsidian 版本：**1.13.6**<br>
> 主要验证环境：**macOS 上的 Obsidian 桌面版**

## 主要特性

- 为 Obsidian 外壳与阅读界面提供完整的浅色和深色方案。
- 编辑器与阅读区域采用温暖、低饱和度的表面，适合长时间工作。
- 覆盖侧边栏、标签页、功能区、菜单、命令面板、模态框、通知、设置、表单、属性、Bases、Canvas 和关系图谱。
- 链接、焦点、选区和主要控件支持用户设置的强调色。
- 提供可选的 Style Settings 控制项，但不将 Style Settings 设为依赖。
- 为独立的 Academic Dashboard 插件提供有文档说明的视觉变量契约。
- 支持减少动态效果、减少透明度、增强对比度、强制颜色以及打印回退。
- 仅包含 CSS：没有 JavaScript、遥测、网络请求、远程字体、远程图片、运行时依赖或自动 Vault 修改。

## 安装

### 从 GitHub Release 安装

Release 发布后，下载发布压缩包，或者从同一个 Release 下载 `manifest.json` 和 `theme.css`。

在 Vault 中创建以下文件夹，并将这两个文件放入其中：

```text
<Vault>/.obsidian/themes/PaperPulse Academic/
├── manifest.json
└── theme.css
```

打开 **设置 → 外观 → 主题**，然后选择 **PaperPulse Academic**。本主题不会自行选择或启用。

### 从源码安装

克隆或下载本仓库，然后将仓库根目录中的 `manifest.json` 和 `theme.css` 复制到上述文件夹。请只使用同一个提交中的文件；不支持混用不同版本的文件。

### 更新

使用同一个新 Release 中的 `manifest.json` 和 `theme.css` 替换已安装文件，然后重新加载 Obsidian。强调色和可选的 Style Settings 选项仍由 Obsidian 管理，不会存储在本仓库中。

### 移除

先在 **设置 → 外观** 中选择其他主题，再删除 `<Vault>/.obsidian/themes/PaperPulse Academic/`。移除主题不会更改笔记或其他 Obsidian 设置。

## 设计语言

### 深色方案

深色模式使用近黑色的研究工作区外壳，并以海军蓝和深紫红营造层次。高饱和度脉冲色仅用于标识、选区、焦点、进度和小范围交互强调，不会作为长篇文本的背景。

### 浅色方案

浅色模式使用温暖的灰白色与羊皮纸色表面，搭配酒红与梅紫色文字。其层级针对纸张般的阅读体验单独调校，并非镜像或反转深色模式。

### 可选的 Style Settings

CSS 中包含 Style Settings 社区插件所需的元数据。安装该插件后，可以调整：

- 玻璃质感强度；
- 纸张色温；
- 强调色强度；
- 圆角半径；
- 阴影深度；
- 界面密度。

Style Settings 是可选项。默认令牌集本身就是完整支持的主题；重置全部控件即可恢复这些默认值。

## Academic Dashboard 集成

PaperPulse Academic 可以通过公开的 `--academic-dashboard-*` 自定义属性为独立的 Academic Dashboard 插件提供样式。该集成仅作用于 `.academic-dashboard-view`，不依赖 Dashboard 的组件类名、DOM 顺序、数据属性或 GridStack 内部实现。

Academic Dashboard 不是必需依赖。未安装时，主题仍可完整使用；启用其他主题时，Dashboard 会回退到 Obsidian 的语义变量。

## 兼容性与无障碍

验收矩阵覆盖 Obsidian 桌面版 1.13.6–1.13.7、默认浅色和深色行为、强调色、100–200% 缩放、键盘焦点、减少动态效果、减少透明度、增强对比度、强制颜色以及打印。其他桌面操作系统可能也能正常工作，但目前尚未纳入已验证的验收平台。

主题确保交互状态不仅依赖颜色加以区分；在透明度被降低或不可用时恢复不透明材质；在强制颜色模式下使用系统颜色。当前测试范围请参阅[兼容性矩阵](docs/compatibility-matrix.md)。

## 隐私与安全

公开运行时仅由 `manifest.json` 和 `theme.css` 组成。本主题：

- 无法读取或写入笔记；
- 无法访问凭据或插件数据；
- 不会发起网络请求；
- 不会加载远程字体或图片；
- 不会收集分析数据或遥测信息；
- 不会修改 `.obsidian` 配置或自行启用。

如果 Vault 中包含敏感数据，建议在安装前审阅源码。

## 仓库结构

```text
paperpulse-academic-theme/
├── README.md
├── README.zh-CN.md              # 简体中文说明
├── manifest.json                 # Obsidian 主题元数据
├── theme.css                     # 完整的浅色/深色主题
├── CHANGELOG.md
├── LICENSE
├── docs/
│   ├── compatibility-matrix.md
│   ├── design-system.md
│   ├── github-publication-plan.md
│   ├── release.md
│   └── verification-report.md
└── scripts/
    ├── check-theme.sh            # 静态策略与契约检查
    ├── contrast-audit.py         # 固定调色板对比度审计
    └── package-theme.sh          # 确定性 Release 压缩包
```

生成的压缩包和本地 QA 证据会被有意排除在 Git 之外。

## 开发与验证

无需包管理器或构建步骤。POSIX shell 和 Python 3 即可运行仓库检查：

```sh
./scripts/check-theme.sh
./scripts/contrast-audit.py
./scripts/package-theme.sh
```

发布前还应在真实 Obsidian Vault 中验证完整兼容性矩阵。连续运行两次打包脚本并比较 SHA-256 输出，以确认压缩包具有确定性。

Release 压缩包仅包含：

```text
PaperPulse Academic/
├── manifest.json
├── theme.css
├── LICENSE
├── README.md
├── README.zh-CN.md
└── CHANGELOG.md
```

## 文档

- [设计系统](docs/design-system.md)
- [兼容性矩阵](docs/compatibility-matrix.md)
- [发布流程](docs/release.md)
- [GitHub 发布计划](docs/github-publication-plan.md)
- [更新日志](CHANGELOG.md)

## 贡献

欢迎提交 Issue 和范围明确的 Pull Request。请提供 Obsidian 版本、操作系统、配色方案、强调色、缩放比例、受影响界面，以及使用合成内容制作的截图。请勿附加私人 Vault、插件设置、凭据或会暴露个人笔记的图片。

所有修改都应同时保留两套配色方案、无障碍回退、公开的 Academic Dashboard 契约，以及主题的无网络、无 JavaScript 边界。

## 许可证

PaperPulse Academic 采用 [MIT 许可证](LICENSE)发布。
