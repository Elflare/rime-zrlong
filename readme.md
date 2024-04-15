<h1 style="text-align: center;"> 自然龙 Rime 输入方案 </h1>

---

## 目录

- [目录](#目录)
- [简介](#简介)
- [安装](#安装)
  - [使用 `git` 安装](#使用-git-安装)
- [注意](#注意)
  - [手动安装](#手动安装)
- [用法](#用法)
  - [编码方式](#编码方式)
  - [实用功能](#实用功能)
    - [反查](#反查)
- [性能测评](#性能测评)
- [鸣谢](#鸣谢)
- [在此表示感谢！](#在此表示感谢)
## 简介
**自然龙** 是一种在传统双拼基础上进行创新的输入法，它**统一了声调和韵母**，采用**四码定长**的方式进行输入。

- **声调和韵母的统一**：传统的双拼输入法中，常常不区分声调，导致编码信息利用率低下，离散弱，重码多。而自然龙将声调和韵母统一，高效利用编码空间，单字和词组能力都大幅提高。
- **四码定长**：单字和词组最大码长为 4，打 2 字词**声韵声韵**有节奏感，输入过程更加舒适。
- **双拼加形**：结合了双拼的高效率和形码的高准确性，形码部分采用自然码的辅助码，形码部分首码义部优先，次码取大，更加直观自然。

> 本仓库基于 Rime 平台
## 安装

### 使用 `git` 安装

1. **打开命令行工具**：

   - 打开 Windows PowerShell 或 Git Bash。

2. **切换到目标目录**：

   - 在命令行中，输入以下命令以切换到目标目录：
     ```bash
     cd "Rime 的安装目录"
     ```

3. **克隆仓库**：
   - 使用 `git clone` 命令克隆仓库。如果您已经安装了 Git，可以直接执行以下命令：
     ```bash
     git clone https://github.com/Elflare/zrlong.git
     ```

## 注意

- 如果您还没有安装 Git，需要先下载并安装 Git。

### 手动安装

1. **下载仓库**：
    - 在仓库页面上，找到并点击“Clone or download”按钮。
    - 在下拉菜单中选择“Download ZIP”。
    - 等待仓库内容下载为一个 ZIP 文件。

2. **解压下载的文件**：
    - 在您下载文件夹中找到下载的 ZIP 文件。
    - 右键点击该文件，选择“解压到当前文件夹”。
    - 解压后，您将得到一个包含仓库内容的文件夹。

3. **移动文件到目标目录**：
    - 打开文件资源管理器。
    - 进入解压后的文件夹所在位置。
    - 找到并选中解压出来的文件夹（通常以仓库的名称命名），打开文件夹，将里面的所有文件夹拖放到 `您的 Rime` 目录。

## 用法
### 编码方式
| 单字编码                              | 演示                                 |备注|
|-----------------|---------------------|---|
| 声 | d |![tst](https://github.com/Elflare/images-repo/blob/main/zrlong/sample/d.jpg?raw=true) |
| 声韵 | di | |
| 声韵辅 | usu | |
| 声韵辅辅 | ytdy | |
### 实用功能
#### 反查
自然龙具有五种反查方式：

通配符反查：用自然码双拼反查辅助码
虎码反查：用 \` 引导
笔画反查：用 obh 引导
两分反查：用 olf 引导

| 反查方式                              | 演示                                 |备注|
|-----------------|---------------------|---|
| 通配符反查 | d | |
| 虎码反查 | di | |
| 笔画反查 | usu | |
| 两分反查 | ytdy | |
## 性能测评
TODO

## 鸣谢
作者: 晡时之光

- [℞ 魔然](https://github.com/ksqsf/rime-moran)
- [℞ 地球拼音](https://github.com/rime/rime-terra-pinyin)
- [虎码](https://tiger-code.com/)
- Rime 项目所发布的高品质输入法程序和词库
本方案的制作还得到了许多人的大力协助：
在此表示感谢！
---
协议：方案主体依 [CC-BY 4.0](http://creativecommons.org/licenses/by/4.0/) 协议，除非对应文件中另有说明。
