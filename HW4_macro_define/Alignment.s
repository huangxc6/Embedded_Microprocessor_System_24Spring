

data:
    .space 100  

.section .text
.code 32
.global main 


// ARM为小端模式，本程序设计为小端


// 确保Rtemp寄存器中无关键数据
// 设计不会破坏原始寄存的数值
// STRUA后  Rsrc, Rdest中存储的地址不会变化
.macro STRUA Rsrc, Rdest, Rtemp

    // 提取第1个字节
    AND \Rtemp, \Rsrc, #0x000000FF    // 使用与形式提取第一个字节
    STRB \Rtemp, [\Rdest]             // 以1字节存入内存
    ADD \Rdest, \Rdest, #1            // 存入后，指针累加

    // 提取第2个字节
    AND \Rtemp, \Rsrc, #0x0000FF00  
    LSR \Rtemp, \Rtemp, #8
    STRB \Rtemp, [\Rdest]
    ADD \Rdest, \Rdest, #1

    // 提取第3个字节
    AND \Rtemp, \Rsrc, #0x00FF0000 
    LSR \Rtemp, \Rtemp, #16  
    STRB \Rtemp, [\Rdest]
    ADD \Rdest, \Rdest, #1     

    // 提取第4个字节
    AND \Rtemp, \Rsrc, #0xFF000000   
    LSR \Rtemp, \Rtemp, #24  
    STRB \Rtemp, [\Rdest]
    ADD \Rdest, \Rdest, #1   

    SUB \Rdest, \Rdest, #4         // 指针复原
.endm



// 确保Rtemp寄存器中无关键数据
// LDRUA  Rsrc中存储的地址不会变化
.macro LDRUA Rdest, Rsrc, Rtemp
    
    LDR \Rdest, =#0x00000000         // 清空目标寄存器
    
    LDRB \Rtemp, [\Rsrc]
    ADD \Rsrc, \Rsrc, #1 
    ORR \Rdest, \Rdest, \Rtemp 
    
    LDRB \Rtemp, [\Rsrc]
    ADD \Rsrc, \Rsrc, #1 
    LSL \Rtemp, \Rtemp, #8
    ORR \Rdest, \Rdest, \Rtemp 

    LDRB \Rtemp, [\Rsrc]
    ADD \Rsrc, \Rsrc, #1 
    LSL \Rtemp, \Rtemp, #16
    ORR \Rdest, \Rdest, \Rtemp 

    LDRB \Rtemp, [\Rsrc]
    ADD \Rsrc, \Rsrc, #1 
    LSL \Rtemp, \Rtemp, #24
    ORR \Rdest, \Rdest, \Rtemp 

    SUB \Rsrc, \Rsrc, #4

   
.endm

main:
           
    
    //
    // ==============STRUA测试===============
    //
    LDR R1, =data               
    ADD R1, R1, #1              // 使地址不对齐
    LDR R0, =#0x44332211
    // R0: 数据  
    // R1: 目标地址（可不对齐）  
    // R2: 缓冲寄存器 
    STRUA R0, R1, R2            // 从内存装载不对齐数据  
    
    ADD R1, R1, #4
    LDR R0, =#0x88776655     
    STRUA R0, R1, R2

    ADD R1, R1, #4
    LDR R0, =#0xCCBBAA99    
    STRUA R0, R1, R2
    NOP         // 空指令，便于调试 

    //
    // ==============STRUA测试===============
    //
    LDR R1, =data       
    ADD R1, R1, #3              // 得到数据期望为 0x66554433
    // R0: 目标寄存器  
    // R1: 被读地址（可不对齐）  
    // R2: 缓冲寄存器 
    LDRUA R0, R1, R2
    NOP         
    ADD R3, R2, #0
    
    LDR R1, =data       
    ADD R1, R1, #8              // 得到数据期望为 0xBBAA9988
    LDRUA R0, R1, R2
    NOP

    LDR R1, =data       
    ADD R1, R1, #1              // 得到数据期望为 0x44332211
    LDRUA R0, R1, R2
    NOP
    

    MOV r7, #1                  
    MOV r0, #0               
    SVC 0      
    
          