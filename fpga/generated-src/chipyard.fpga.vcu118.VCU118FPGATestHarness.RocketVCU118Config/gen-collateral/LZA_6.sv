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

module LZA_6(
  input  [63:0] io_b,
  output [63:0] io_f
);

  assign io_f = {io_b[63] ^ io_b[62], io_b[62] ^ io_b[61], io_b[61] ^ io_b[60], io_b[60] ^ io_b[59], io_b[59] ^ io_b[58], io_b[58] ^ io_b[57], io_b[57] ^ io_b[56], io_b[56] ^ io_b[55], io_b[55] ^ io_b[54], io_b[54] ^ io_b[53], io_b[53] ^ io_b[52], io_b[52] ^ io_b[51], io_b[51] ^ io_b[50], io_b[50] ^ io_b[49], io_b[49] ^ io_b[48], io_b[48] ^ io_b[47], io_b[47] ^ io_b[46], io_b[46] ^ io_b[45], io_b[45] ^ io_b[44], io_b[44] ^ io_b[43], io_b[43] ^ io_b[42], io_b[42] ^ io_b[41], io_b[41] ^ io_b[40], io_b[40] ^ io_b[39], io_b[39] ^ io_b[38], io_b[38] ^ io_b[37], io_b[37] ^ io_b[36], io_b[36] ^ io_b[35], io_b[35] ^ io_b[34], io_b[34] ^ io_b[33], io_b[33] ^ io_b[32], io_b[32] ^ io_b[31], io_b[31] ^ io_b[30], io_b[30] ^ io_b[29], io_b[29] ^ io_b[28], io_b[28] ^ io_b[27], io_b[27] ^ io_b[26], io_b[26] ^ io_b[25], io_b[25] ^ io_b[24], io_b[24] ^ io_b[23], io_b[23] ^ io_b[22], io_b[22] ^ io_b[21], io_b[21] ^ io_b[20], io_b[20] ^ io_b[19], io_b[19] ^ io_b[18], io_b[18] ^ io_b[17], io_b[17] ^ io_b[16], io_b[16] ^ io_b[15], io_b[15] ^ io_b[14], io_b[14] ^ io_b[13], io_b[13] ^ io_b[12], io_b[12] ^ io_b[11], io_b[11] ^ io_b[10], io_b[10] ^ io_b[9], io_b[9] ^ io_b[8], io_b[8] ^ io_b[7], io_b[7] ^ io_b[6], io_b[6] ^ io_b[5], io_b[5] ^ io_b[4], io_b[4] ^ io_b[3], io_b[3] ^ io_b[2], io_b[2] ^ io_b[1], io_b[1] ^ io_b[0], 1'h0};	// @[Cat.scala:33:92, LZA.scala:19:{14,21}, :24:20]
endmodule
