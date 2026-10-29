# fpgachina2026_47877
# 🚦 智能交通信号灯协同控制系统 (PYNQ-Z2)

## 📌 项目简介
本项目是一个基于 **PYNQ-Z2** 开发板的软硬件协同（Hardware-Software Co-design）智能交通信号灯系统。
与传统的纯硬件状态机不同，本项目利用 Zynq-7000 架构的优势，通过 Vivado 搭建底层硬件外设（PL端），并使用 Jupyter Notebook 中的 Python 代码（PS端）直接控制 GPIO，实现了真实红绿灯状态的动态循环、紧急车辆优先以及夜间黄闪模式的实时切换。

## 🏷️ 核心关键词
*   **交通信号灯**（智能控制、状态机）
*   **PYNQ-Z2**（Zynq-7000 软硬件协同平台）
*   **Overlay / 非阻塞轮询**（Python 直接控制底层硬件引脚）

## ✨ 功能特性
1.  **正常交通循环**：绿灯 20 秒 -> 黄灯 3 秒 -> 红灯 20 秒 -> 循环。
2.  **紧急模式（BTN0）**：按下后立刻锁定全红状态，保障紧急车辆通行；再次按下恢复正常循环。
3.  **夜间模式（BTN1）**：按下后进入黄灯闪烁模式，提示夜间慢行；再次按下退出。
4.  **高响应按键检测**：采用“非阻塞分片轮询”算法，即使在长达 20 秒的红绿灯等待期间，按下按键也能在 0.1 秒内瞬间响应，绝不卡顿。

## 🔌 硬件接线指南
使用 4 根母对公杜邦线，将外部的 RGB LED 模块连接到 PYNQ-Z2 的 **Arduino J4 扩展口**：

| RGB 模块引脚 | 功能 | 连接到 PYNQ-Z2 (J4 接口) | FPGA 引脚 |
| :--- | :--- | :--- | :--- |
| **`-`** | 公共地 (GND) | 板载 **GND** | - |
| **`R`** | 红色控制 | **AR0** | T14 |
| **`G`** | 绿色控制 | **AR1** | U12 |
| **`B`** | 蓝色控制 | **AR2** (备用，本项目未使用) | U13 |

*注：板载按键 BTN0 和 BTN1 分别对应 FPGA 的 `D19` 和 `D20` 引脚。*

## 💻 软硬件架构
*   **硬件层 (Vivado)**：通过纯 Tcl 脚本自动生成 Block Design。包含 Zynq PS、一个 3 位的 AXI GPIO（用于控制 RGB 灯，纯输出）和一个 2 位的 AXI GPIO（用于读取板载按键，纯输入）。引脚约束文件为 `pins.xdc`。
*   **软件层 (Jupyter)**：加载 `.bit` 和 `.hwh` 生成 `Overlay` 对象。调用 `pynq.lib.AxiGPIO` 库，直接读写 GPIO 寄存器。

## 🚀 如何运行本项目
1.  **准备硬件**：按照上述接线表接好 RGB 模块，连接开发板电源与网线。
2.  **启动 Jupyter**：登录 PYNQ 的 Jupyter Notebook 环境。
3.  **上传文件**：将本仓库中的 `traffic_light.bit`、`traffic_light.hwh` 以及 `traffic_light.ipynb` 上传到同一个文件夹下。
4.  **运行程序**：打开 `traffic_light.ipynb`，点击 `Kernel -> Restart & Run All` 即可看到交通灯亮起。

## 📂 目录结构
*   `/hardware`：包含 Vivado 的 Tcl 构建脚本、引脚约束文件 (`.xdc`) 以及导出的硬件描述文件 (`.xsa`)。
*   `/bitstream`：包含可直接下载到开发板的 `.bit` 和 `.hwh` 文件。
*   `/software`：包含控制交通灯逻辑的 Jupyter Notebook 源文件 (`.ipynb`)。

---
*Created as part of the PYNQ-Z2 Hardware-Software Co-design Project.*
