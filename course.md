- ### 第一讲 概述

  已附加文件:

  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) embedpr00_overview_v24.ppt](https://course.pku.edu.cn/bbcswebdav/pid-1149012-dt-content-rid-7621931_1/xid-7621931_1) (2.233 MB)
  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) embedpr01_introduction_v24.ppt](https://course.pku.edu.cn/bbcswebdav/pid-1149012-dt-content-rid-7621932_1/xid-7621932_1) (1.878 MB)

  主要内容：

  \1. 课程大纲

  \2. 程序开发

  \3. 微处理器概念

  \4. 微处理器发展

- 

  ### [练习1：hello world！](https://course.pku.edu.cn/webapps/assignment/uploadAssignment?content_id=_1149018_1&course_id=_65003_1&group_id=&mode=view)

  \1. 请在keil，或segger 模拟器上调试并运行一个数值计算程序(或你以前所写的C（或C++）程序。

  （1）列出编译和调试过程中遇到的问题及解决措施。

  （2）提交程序源码。

- 

  ### [分组作业](https://course.pku.edu.cn/webapps/assignment/uploadAssignment?content_id=_1166887_1&course_id=_65003_1&group_id=&mode=view)

  请调研一款处理器（建议调研AI处理器）并提交调研报告。

  报告内容包括：

  1.应用领域

  2.市场状况

  3.主要特点

  4.体系结构

  5.软件开发工具和环境

  6.产品线

  7.展望

- 

  ### 第二讲 ARM处理器

  已附加文件:

  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) embedpr02_ARM_v24.ppt](https://course.pku.edu.cn/bbcswebdav/pid-1166889-dt-content-rid-7704051_1/xid-7704051_1) (2.221 MB)
  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) aplusb.rar](https://course.pku.edu.cn/bbcswebdav/pid-1166889-dt-content-rid-7719347_1/xid-7719347_1) (17.238 KB)

  主要内容：

  （1）ARM9内核

  （2）异常模式

  （3）存储系统

  （4）调试与跟踪

  （5）ARM历程

  （6）S3C2410A

- 

  ### [练习2：ARM处理器](https://course.pku.edu.cn/webapps/assignment/uploadAssignment?content_id=_1166906_1&course_id=_65003_1&group_id=&mode=view)

  已附加文件:

  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) H-Converter.rar](https://course.pku.edu.cn/bbcswebdav/pid-1166906-dt-content-rid-7704089_1/xid-7704089_1) (106.669 KB)
  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) keildhry.rar](https://course.pku.edu.cn/bbcswebdav/pid-1166906-dt-content-rid-7704090_1/xid-7704090_1) (33.36 KB)
  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) S3C2410A.pdf](https://course.pku.edu.cn/bbcswebdav/pid-1166906-dt-content-rid-7786632_1/xid-7786632_1) (3.203 MB)

  下列二题中选择一道：

   \1. 导入一幅128X128的8bit灰度图像，请在ARM 处理器上编程，使图像顺时针旋转45度，并导出图像；

   \2. 在ARM处理器上（模拟器或实际开发板），编译并调试性能测试程序dhrystone；

- 

  ### 第三讲 ARM汇编

  已附加文件:

  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) embedpr03_asm1_v24.ppt](https://course.pku.edu.cn/bbcswebdav/pid-1171637-dt-content-rid-7786620_1/xid-7786620_1) (869.5 KB)
  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) armv5_architecture.pdf](https://course.pku.edu.cn/bbcswebdav/pid-1171637-dt-content-rid-7786621_1/xid-7786621_1) (12.726 MB)

  主要内容：

  1.汇编语法

  \2. 变量和常数

  3.运算

  \4. 跳转

- 

  ### [练习3：ARM汇编](https://course.pku.edu.cn/webapps/assignment/uploadAssignment?content_id=_1171638_1&course_id=_65003_1&group_id=&mode=view)

  二选一

  \1. 用ARM汇编设计程序，验证ARM处理器的ARM指令和Thumb指令下执行任意两个8位无符号数相乘结果的一致性。

  \2. A是 6X6 矩阵， B是3X3 矩阵，计算卷积 C = A * B

- 

  ### 第四讲 ARM汇编(续)

  已附加文件:

  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) embedpr04_asm2_v24.ppt](https://course.pku.edu.cn/bbcswebdav/pid-1175953-dt-content-rid-7928805_1/xid-7928805_1) (1.221 MB)

  主要内容：

  \1. 存储分配

  \2. 存储访问

  \3. 预计算

  \4. 宏定义

  \5. 指令集

  \6. 示例

- 

  ### [练习4：宏定义](https://course.pku.edu.cn/webapps/assignment/uploadAssignment?content_id=_1175955_1&course_id=_65003_1&group_id=&mode=view)

     为了节省内存，避免内存中出现空洞，常采用不对齐的方式分配内存。然而，不对齐的数据，无法用指令“LDR”和“STR”正确从内存装载和写入内存。

    （1）请编写两条宏定义指令“LDRUA”和“STRUA”，能够将32位数据正确从内存装载和写入内容，而不论数据是否对齐。

    （2）请用编写程序，用实际数据验证两条自定义指令。

- 

  ### 第五讲 ARM应用程序

  已附加文件:

  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) embedpr05_ap1_v24.ppt](https://course.pku.edu.cn/bbcswebdav/pid-1177971-dt-content-rid-7981185_1/xid-7981185_1) (703 KB)

  主要内容：

  \1. 函数调用

  \2. 异常处理

  \3. SWI

- 

  ### [练习5：软中断](https://course.pku.edu.cn/webapps/assignment/uploadAssignment?content_id=_1177972_1&course_id=_65003_1&group_id=&mode=view)

   编写下列函数,然后编写程序通过软中断方式调用，计算出结果：

   （1）64位带进位的加法运算（asm）；

   （2）两个32位数相乘，结果为64位的乘法运算（C 或 asm）

- 

  ### 第六讲 ARM程序分析

  已附加文件:

  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) embedpr06_ap2_v24.ppt](https://course.pku.edu.cn/bbcswebdav/pid-1181612-dt-content-rid-8118465_1/xid-8118465_1) (1.015 MB)

  主要内容：

  \1. 启动程序分析

  \2. Linker 分析

  \3. FreeRTOS 移植

- 

  ### [练习6：程序分析](https://course.pku.edu.cn/webapps/assignment/uploadAssignment?content_id=_1181613_1&course_id=_65003_1&group_id=&mode=view)

  已附加文件:

  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) FreeRTOS_Keil.rar](https://course.pku.edu.cn/bbcswebdav/pid-1181613-dt-content-rid-8118475_1/xid-8118475_1) (5.787 MB)
  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) u-boot-2015.10.tar](https://course.pku.edu.cn/bbcswebdav/pid-1181613-dt-content-rid-8118478_1/xid-8118478_1) (66.348 MB)

  \1. 选在一个嵌入式操作系统，实现不少于2个任务的应用演示。

  \2. 阅读 u-boot-2015.10\arch\arm\cpu目录下某处理器相关的start.s文件，或者其他boot文件，请说明：如果在不同处理器间移植u-boot，需要修改 start.s中的哪些语句？请在文件中标注出来。

- 

  ### 第七讲 程序优化

  已附加文件:

  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) embedpr07_optimize_v24.ppt](https://course.pku.edu.cn/bbcswebdav/pid-1183311-dt-content-rid-8168158_1/xid-8168158_1) (1.47 MB)

  主要内容：

  \1. 优化？

  \2. 速度优化

  \3. 资源优化

  \4. 功耗优化

- 

  ### [练习7：程序优化](https://course.pku.edu.cn/webapps/assignment/uploadAssignment?content_id=_1183313_1&course_id=_65003_1&group_id=&mode=view)

  在ARM处理器上, 自己选程序：

  （1）分别选择o0, o1, o2, o3 优化选项，比较所生成程序的大小和执行速度。

  （2）选择其中一个函数，尝试分析o0和o3选项所生成的程序指令数差别。

- 

  ### 第八讲 RISC-V处理器（上）

  已附加文件:

  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) GD32VF103lib.rar](https://course.pku.edu.cn/bbcswebdav/pid-1185224-dt-content-rid-8237622_1/xid-8237622_1) (165.387 KB)
  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) gpio_led.rar](https://course.pku.edu.cn/bbcswebdav/pid-1185224-dt-content-rid-8237623_1/xid-8237623_1) (708.052 KB)
  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) OpenOcd.rar](https://course.pku.edu.cn/bbcswebdav/pid-1185224-dt-content-rid-8237624_1/xid-8237624_1) (3.122 MB)
  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) embedpr08_riscv1_v24.ppt](https://course.pku.edu.cn/bbcswebdav/pid-1185224-dt-content-rid-8237635_1/xid-8237635_1) (9.022 MB)

  主要内容：

  \1. RISC-V

  \2. RV32I

  \3. GD32VF103

  \4. GPIO与LED

- 

  ### [练习8：GPIO](https://course.pku.edu.cn/webapps/assignment/uploadAssignment?content_id=_1185226_1&course_id=_65003_1&group_id=&mode=view)

  参考例程，用不同的按键和LED显示方式实现键盘控制LED：

  （1）在仿真器上成功调试程序；

  （2）将程序烧入板上，实现上电后自动执行。

- 

  ### 第九讲 RISC-V处理器（下）

  已附加文件:

  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) embedpr09_riscv2_v24.ppt](https://course.pku.edu.cn/bbcswebdav/pid-1186971-dt-content-rid-8290656_1/xid-8290656_1) (2.11 MB)
  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) exmc_tp.rar](https://course.pku.edu.cn/bbcswebdav/pid-1186971-dt-content-rid-8290657_1/xid-8290657_1) (977.686 KB)

  主要内容

  \1. 异常与中断

  \2. ECLIC

  \3. EXTI

  \4. 触摸屏中断

- 

  ### [练习9：触摸屏中断](https://course.pku.edu.cn/webapps/assignment/uploadAssignment?content_id=_1186972_1&course_id=_65003_1&group_id=&mode=view)

  二选一：

  1.用中断方式实现键盘控制 LED， 分别用 A、B、C 和 D 四个按键控制 LED1、LED2、LED3 和LED4 的状态。要求：按下键后，点亮该键对应的 LED, 同时关闭其他 三个 LED。

  2.用中断方式实现触摸屏控制 LED, 分别用 button1、button2、button3 和 button4 四个按键控制 LED1、LED2、LED3 和 LED4 的状态

- 

  ### 第十讲 多核处理器于OpenMP

  已附加文件:

  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) embedpr10_MP_v24.ppt](https://course.pku.edu.cn/bbcswebdav/pid-1190405-dt-content-rid-8348818_1/xid-8348818_1) (1.798 MB)
  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) myopenMP.cpp](https://course.pku.edu.cn/bbcswebdav/pid-1190405-dt-content-rid-8349084_1/xid-8349084_1) (4.848 KB)

  主要内容：

  1.并行计算

  2.OpenMP

  3.循环并行

  4.变量处理

  5.线程分析  

- 

  ### [练习10：openMP](https://course.pku.edu.cn/webapps/assignment/uploadAssignment?content_id=_1190406_1&course_id=_65003_1&group_id=&mode=view)

  \1. Sobel 常用于图像的边缘检测:

   （1）请用OpenMP加速方法计算边缘检测（边缘强度），评估采用OpenMP带来的加速比。

   （2）自选图像，要求图像像素数大于2，000，000。

- 

  ### 第十一讲 GPU&CUDA

  已附加文件:

  - [![文件](https://course.pku.edu.cn/images/ci/ng/cal_year_event.gif) embedpr11_GPU_v24.ppt](https://course.pku.edu.cn/bbcswebdav/pid-1192450-dt-content-rid-8417223_1/xid-8417223_1) (2.692 MB)

  主要内容：

  \1. GPU

  \2. CUDA

  \3. CUDA 编程

- 

  ### [练习11：CUDA](https://course.pku.edu.cn/webapps/assignment/uploadAssignment?content_id=_1192451_1&course_id=_65003_1&group_id=&mode=view)

  \1. 用 GPU 实现 Sobel 算子，并用于提取图像边缘，并与OpenMP比较计算时间。