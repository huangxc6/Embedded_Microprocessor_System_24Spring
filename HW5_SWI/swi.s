
// Author: Getsum
// 2024.4.11


//程序头
.section .text
.code 32


// 定义 swi_handler
// 是中断的关键
.global swi_handler
swi_handler:

    PUSH {R4-R12,LR}   // 将入口点压入栈

    LDR R7, [LR, #-4]       //获取 SWI 指令
    BIC R7, R7, #0xFF000000
    
    LDR R8, =#0x140701
    CMP R7, R8     
    BNE null_mul
    BL Adder_64

null_mul:    
    LDR R8, =#0x140710
    CMP R7, R8   
    BNE null
    BL Mul_32
    
null:
    POP {R4-R12,PC}   


// ARM汇编默认 R0-R3作为传递参数的寄存器，如果超出4的参数，需要存入内存
// R4-R11存储临时变量

.global Adder_64
// [R0, R1] (第一个加数的低位，高位）
// [R2, R3] (第二个加数的低位，高位）
// 返回值存入  [R0, R1]
Adder_64:
    PUSH {R4-R12}       // 保存寄存器状态
    
    // ADDS会将进位存入标志寄存器 (Carry Flag, C)
    ADDS R0, R0, R2     // 将第一个 32 位数的低 32 位加到结果中
    ADC R1, R1, R3      // 将第一个 32 位数的高 32 位加到结果中，包括进位

    POP {R4-R12}        // 恢复寄存器状态
    BX LR               // 返回，LR 中保存了返回地址


.global Mul_32
// R0, R1 被乘数和乘数
// 返回值存入  R2, R3 （低位，高位）
Mul_32:
    PUSH {R4-R12}       // 保存寄存器状态
    
    UMULL R3, R2, R0, R1

    POP {R4-R12}        // 恢复寄存器状态
    BX LR               // 返回，LR 中保存了返回地址


.global main 

main:
    //
    // ===========  test adder64 =============
    //

    // 第一个加数  0x1111_2222_AAAA_BBBB
    LDR R0, =#0xAAAABBBB
    LDR R1, =#0x11112222

    // 第二个加数  0x5555_6666_CCCC_DDDD
    LDR R2, =#0xCCCCDDDD
    LDR R3, =#0x55556666
    
    SWI 0x140701    // 调用64位加法     
    NOP


    //
    // ===========  test mul32 =============
    //
    // 第一个乘数  0x1234_5678
    LDR R0, =#0x12345678
    
    // 第二个乘数  0x8765_4321
    LDR R1, =#0x87654321

    SWI 0x140710    // 调用32乘法
    NOP
          
          