<h1 align="center"> 自然龙 Rime 输入方案 </h1>

## 目录

- [简介](#简介)
- [安装](#安装)
  - [使用 `git` 安装](#使用-git-安装)
  - [手动安装](#手动安装)
- [用法](#用法)
  - [键位图](#键位图)
  - [辅助码字根图](#辅助码字根图)
  - [编码方式](#编码方式)
  - [实用功能](#实用功能)
    - [自定义短语](#自定义短语)
    - [反查](#反查)
    - [工具](#工具)
  - [飞键](#飞键)
- [性能测评](#性能测评)
- [鸣谢](#鸣谢)
## 简介
**自然龙** 是一种在传统双拼基础上进行创新的输入法，它**统一了声调和韵母**，采用**四码定长**的方式进行输入。

- **声调和韵母的统一**：传统的双拼输入法往往不区分声调，导致编码信息利用率低下，离散弱，重码多。而自然龙将声调和韵母统一，高效利用编码空间，单字和词组能力都大幅提高。
- **四码定长**：单字和词组最大码长为 4，打 2 字词**声韵声韵**有节奏感，输入过程更加舒适。
- **双拼加形**：结合了双拼的高效率和形码的高准确性，形码部分采用自然码的辅助码，形码部分首码**义部优先**，**次码取大**，更加直观自然。
- **手感优化**: 韵母分布利用程序算法+人工设计，**重码率**和**手感**皆超过传统音形、形码输入法。

> 本仓库基于 Rime 平台
## 安装

**注意**：

- 首先确保已经装了 [Rime](https://rime.im/)
- 若已有 Rime 的配置文件，请先备份

**可选**:
- 本配置所使用的字体为[霞鹜文楷](https://github.com/lxgw/LxgwWenKai)
- 若想更换其他字体，可在 `weasel.custom.yaml` 中进行配置
### 使用 `git` 安装
> 如果您还没有安装 Git，需要先下载并安装 [Git](https://git-scm.com/)，或使用[手动安装](#手动安装)。

1. **打开命令行工具**


2. **克隆仓库**：
   - 使用 `git clone` 命令克隆仓库。如果您已经安装了 Git，可以直接执行以下命令：
     ```bash
     git clone https://github.com/Elflare/zrlong.git
     ```
3. **移动到目录**：

    - 使用命令将其移动到 Rime 的用户目录：
        ```bash
        robocopy zrlong "您的 Rime 用户目录" /E /MOVE
        ```
    - 或：
        ```bash
        xcopy zrlong "您的 Rime 用户目录" /E /I /Y
        ```


### 手动安装

1. **下载仓库**：
    - 在仓库页面上，找到并点击右侧绿色 “Code” 按钮。
    - 在下拉菜单中选择 “Download ZIP”。
    - 等待仓库内容下载为一个 ZIP 文件。

2. **解压下载的文件**：
    - 在您下载文件夹中找到下载的 ZIP 文件。
    - 将该文件，解压到能找到的位置。
    - 解压后，您将得到一个名为 `zrlong` 的文件夹。

3. **移动文件到目标目录**：
    - 打开文件资源管理器。
    - 进入解压后的文件夹所在位置。
    - 打开 `zrlong` 文件夹，将**里面的所有文件，包含文件夹**拖放到`您的 Rime 用户目录`（若不知道，可右键电脑状态栏右下角的 Rime 图标，选择 `用户文件夹`）。

## 用法
### 键位图
![键位图片](https://github.com/Elflare/images-repo/blob/main/zrlong/sample/jianwei.jpg)

### 辅助码字根图
![辅助码字根](https://github.com/Elflare/images-repo/blob/main/zrlong/sample/zigen.jpg)

> This picture is from [℞ 魔然](https://github.com/ksqsf/rime-moran/wiki/%E6%95%99%E7%A8%8B#其二曰自然碼輔助碼)

### 编码方式
| 单字编码 | 演示编码 | 演示图片                                                                             |
| -------- | -------- | ------------------------------------------------------------------------------------ |
| 声       | d        | ![示例图片](https://github.com/Elflare/images-repo/blob/main/zrlong/sample/d.jpg)    |
| 声韵     | di       | ![示例图片](https://github.com/Elflare/images-repo/blob/main/zrlong/sample/di.jpg)   |
| 声韵辅   | usu      | ![示例图片](https://github.com/Elflare/images-repo/blob/main/zrlong/sample/usu.jpg)  |
| 声韵辅辅 | ytdy     | ![示例图片](https://github.com/Elflare/images-repo/blob/main/zrlong/sample/ytdy.jpg) |
### 实用功能

#### 自定义短语
在 `zrlong_custom_phrases.txt` 中配置，具体请参考该文件中的说明。

#### 反查
自然龙具有四种反查方式：

- 通配符反查：用自然码双拼反查，其中 `SYF` 分别代表：声母、韵母和第一个辅码
- 虎码反查：用 \` 引导，`X` 代表任意字符
- 笔画反查：用 `obh` 引导
- 两分反查：用 `olf` 引导
> 在反查时，上述前缀会被隐藏，以避免干扰。
>
| 反查方式   | 规则    | 演示                                                                                    |
| ---------- | ------- | --------------------------------------------------------------------------------------- |
| 通配符反查 | SY`     | ![示例图片](https://github.com/Elflare/images-repo/blob/main/zrlong/sample/kj%60.jpg)   |
| 通配符反查 | SYF`    | ![示例图片](https://github.com/Elflare/images-repo/blob/main/zrlong/sample/iik%60.jpg)  |
| 虎码反查   | `X      | ![示例图片](https://github.com/Elflare/images-repo/blob/main/zrlong/sample/%60j.jpg)    |
| 笔画反查   | obhhs   | ![示例图片](https://github.com/Elflare/images-repo/blob/main/zrlong/sample/obhhs.jpg)   |
| 两分反查   | olfhoho | ![示例图片](https://github.com/Elflare/images-repo/blob/main/zrlong/sample/olfhoho.jpg) |
#### 工具

- **时间**：直接打 `sj`
- **日期**：`orq`
- **时间和日期**：`ors`
- **中文数字小写转大写**：`S` 开头，后面接数字，如 `S123`，则变为：一百二十三
- **英文输入**：
    - 默认没开启空码自动清屏，所以空码时可直接输入英文
    - 首字母大写，用回车上屏自动转为小写：如 `Zrlong`，按回车后变为`zrlong`
    - 首字母大写，用空格上屏则不变：如 `Zrlong`，按空格则为 `Zrlong`
### 飞键
- 仅将声母 y 飞到了 e，原因是 e 的英文发音和 y 的拼音很像。韵母不受影响。
- 飞键的权重更低，不影响正常编码。
## 性能测评
- **单字**：自然龙单字 2 码 1500 常用字覆盖近 500 个（双拼是 300 ），2 码一共约 600 个键位。单字前 3000 零重（颂用了特取码）。
- **词组**：龙码词重 11000 多个（五笔词重 13000 左右，传统双拼 18000 左右）

**单字测评**：

![字测评](https://github.com/Elflare/images-repo/blob/main/zrlong/bench/zi.jpg)

**词组测评**：

![词测评](https://github.com/Elflare/images-repo/blob/main/zrlong/bench/ci.jpg)


## 鸣谢
作者: [晡时之光](https://hanxinma.gitee.io/longma/zrl)

- Rime 项目所发布的高品质输入法程序和词库
- [℞ 魔然](https://github.com/ksqsf/rime-moran)
- [℞ 地球拼音](https://github.com/rime/rime-terra-pinyin)
- [虎码](https://tiger-code.com/)
- [测评工具](https://yb6b.github.io/#/)
---
协议：方案主体依 [CC-BY 4.0](http://creativecommons.org/licenses/by/4.0/) 协议，除非对应文件中另有说明。
