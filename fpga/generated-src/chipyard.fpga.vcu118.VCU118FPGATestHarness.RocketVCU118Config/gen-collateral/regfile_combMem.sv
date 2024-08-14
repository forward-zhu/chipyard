// Generated by CIRCT unknown git version
// Standard header to adapt well known macros to our needs.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

// VCS coverage exclude_file
module regfile_combMem(	// @[FPU.scala:806:20]
  input  [4:0]  R0_addr,
  input         R0_en,
                R0_clk,
  input  [4:0]  R1_addr,
  input         R1_en,
                R1_clk,
  input  [4:0]  R2_addr,
  input         R2_en,
                R2_clk,
  input  [4:0]  R3_addr,
  input         R3_en,
                R3_clk,
  input  [4:0]  R4_addr,
  input         R4_en,
                R4_clk,
  input  [4:0]  R5_addr,
  input         R5_en,
                R5_clk,
  input  [4:0]  R6_addr,
  input         R6_en,
                R6_clk,
  input  [4:0]  R7_addr,
  input         R7_en,
                R7_clk,
  input  [4:0]  R8_addr,
  input         R8_en,
                R8_clk,
  input  [4:0]  R9_addr,
  input         R9_en,
                R9_clk,
  input  [4:0]  R10_addr,
  input         R10_en,
                R10_clk,
  input  [4:0]  R11_addr,
  input         R11_en,
                R11_clk,
  input  [4:0]  R12_addr,
  input         R12_en,
                R12_clk,
  input  [4:0]  R13_addr,
  input         R13_en,
                R13_clk,
  input  [4:0]  R14_addr,
  input         R14_en,
                R14_clk,
  input  [4:0]  R15_addr,
  input         R15_en,
                R15_clk,
  input  [4:0]  R16_addr,
  input         R16_en,
                R16_clk,
  input  [4:0]  R17_addr,
  input         R17_en,
                R17_clk,
  input  [4:0]  R18_addr,
  input         R18_en,
                R18_clk,
  input  [4:0]  R19_addr,
  input         R19_en,
                R19_clk,
  input  [4:0]  R20_addr,
  input         R20_en,
                R20_clk,
  input  [4:0]  R21_addr,
  input         R21_en,
                R21_clk,
  input  [4:0]  R22_addr,
  input         R22_en,
                R22_clk,
  input  [4:0]  R23_addr,
  input         R23_en,
                R23_clk,
  input  [4:0]  R24_addr,
  input         R24_en,
                R24_clk,
  input  [4:0]  R25_addr,
  input         R25_en,
                R25_clk,
  input  [4:0]  R26_addr,
  input         R26_en,
                R26_clk,
  input  [4:0]  R27_addr,
  input         R27_en,
                R27_clk,
  input  [4:0]  R28_addr,
  input         R28_en,
                R28_clk,
  input  [4:0]  R29_addr,
  input         R29_en,
                R29_clk,
  input  [4:0]  R30_addr,
  input         R30_en,
                R30_clk,
  input  [4:0]  R31_addr,
  input         R31_en,
                R31_clk,
  input  [4:0]  R32_addr,
  input         R32_en,
                R32_clk,
  input  [4:0]  R33_addr,
  input         R33_en,
                R33_clk,
  input  [4:0]  R34_addr,
  input         R34_en,
                R34_clk,
  input  [4:0]  W0_addr,
  input         W0_en,
                W0_clk,
  input  [64:0] W0_data,
  input  [4:0]  W1_addr,
  input         W1_en,
                W1_clk,
  input  [64:0] W1_data,
  output [64:0] R0_data,
                R1_data,
                R2_data,
                R3_data,
                R4_data,
                R5_data,
                R6_data,
                R7_data,
                R8_data,
                R9_data,
                R10_data,
                R11_data,
                R12_data,
                R13_data,
                R14_data,
                R15_data,
                R16_data,
                R17_data,
                R18_data,
                R19_data,
                R20_data,
                R21_data,
                R22_data,
                R23_data,
                R24_data,
                R25_data,
                R26_data,
                R27_data,
                R28_data,
                R29_data,
                R30_data,
                R31_data,
                R32_data,
                R33_data,
                R34_data
);

  reg [64:0] Memory[0:31];	// @[FPU.scala:806:20]
  always @(posedge W0_clk) begin	// @[FPU.scala:806:20]
    if (W0_en)	// @[FPU.scala:806:20]
      Memory[W0_addr] <= W0_data;	// @[FPU.scala:806:20]
    if (W1_en)	// @[FPU.scala:806:20]
      Memory[W1_addr] <= W1_data;	// @[FPU.scala:806:20]
  end // always @(posedge)
  `ifndef SYNTHESIS	// @[FPU.scala:806:20]
    `ifdef RANDOMIZE_MEM_INIT	// @[FPU.scala:806:20]
      integer initvar;	// @[FPU.scala:806:20]
      reg [95:0] _RANDOM_MEM;	// @[FPU.scala:806:20]
    `endif // RANDOMIZE_MEM_INIT
    initial begin	// @[FPU.scala:806:20]
      `INIT_RANDOM_PROLOG_	// @[FPU.scala:806:20]
      `ifdef RANDOMIZE_MEM_INIT	// @[FPU.scala:806:20]
        for (initvar = 0; initvar < 32; initvar = initvar + 1) begin
          _RANDOM_MEM = {{`RANDOM}, {`RANDOM}, {`RANDOM}};
          Memory[initvar] = _RANDOM_MEM[64:0];
        end	// @[FPU.scala:806:20]
      `endif // RANDOMIZE_MEM_INIT
    end // initial
  `endif // not def SYNTHESIS
  assign R0_data = R0_en ? Memory[R0_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R1_data = R1_en ? Memory[R1_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R2_data = R2_en ? Memory[R2_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R3_data = R3_en ? Memory[R3_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R4_data = R4_en ? Memory[R4_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R5_data = R5_en ? Memory[R5_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R6_data = R6_en ? Memory[R6_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R7_data = R7_en ? Memory[R7_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R8_data = R8_en ? Memory[R8_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R9_data = R9_en ? Memory[R9_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R10_data = R10_en ? Memory[R10_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R11_data = R11_en ? Memory[R11_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R12_data = R12_en ? Memory[R12_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R13_data = R13_en ? Memory[R13_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R14_data = R14_en ? Memory[R14_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R15_data = R15_en ? Memory[R15_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R16_data = R16_en ? Memory[R16_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R17_data = R17_en ? Memory[R17_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R18_data = R18_en ? Memory[R18_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R19_data = R19_en ? Memory[R19_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R20_data = R20_en ? Memory[R20_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R21_data = R21_en ? Memory[R21_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R22_data = R22_en ? Memory[R22_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R23_data = R23_en ? Memory[R23_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R24_data = R24_en ? Memory[R24_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R25_data = R25_en ? Memory[R25_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R26_data = R26_en ? Memory[R26_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R27_data = R27_en ? Memory[R27_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R28_data = R28_en ? Memory[R28_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R29_data = R29_en ? Memory[R29_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R30_data = R30_en ? Memory[R30_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R31_data = R31_en ? Memory[R31_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R32_data = R32_en ? Memory[R32_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R33_data = R33_en ? Memory[R33_addr] : 65'bx;	// @[FPU.scala:806:20]
  assign R34_data = R34_en ? Memory[R34_addr] : 65'bx;	// @[FPU.scala:806:20]
endmodule
