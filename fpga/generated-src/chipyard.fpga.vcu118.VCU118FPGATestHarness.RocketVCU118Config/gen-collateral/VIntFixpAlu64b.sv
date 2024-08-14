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

module VIntFixpAlu64b(
  input         clock,
                io_valid,
  input  [5:0]  io_funct6,
  input  [2:0]  io_funct3,
  input         io_vi,
                io_vm,
  input  [4:0]  io_vs1_imm,
  input         io_ma,
                io_widen,
                io_widen2,
                io_narrow,
                io_narrow_to_1,
  input  [3:0]  io_sew_oneHot,
                io_eewVd_oneHot,
  input  [2:0]  io_uopIdx,
  input  [63:0] io_vs1,
                io_vs2_adder,
                io_vs2_misc,
  input  [7:0]  io_oldVd,
                io_vmask,
  input  [1:0]  io_vxrm,
  input         io_isFixp,
                io_isMisc,
                io_isSub,
  input  [63:0] io_fs1,
  output [63:0] io_vd,
  output [31:0] io_narrowVd,
  output [7:0]  io_cmpOut,
                io_vxsat,
  output        io_rd_valid,
  output [63:0] io_rd_bits
);

  wire [63:0] _vFixPoint64b_io_vd;	// @[VAlu.scala:122:28]
  wire [31:0] _vFixPoint64b_io_narrowVd;	// @[VAlu.scala:122:28]
  wire [63:0] _vIntMisc64b_io_vd;	// @[VAlu.scala:101:27]
  wire [31:0] _vIntMisc64b_io_narrowVd;	// @[VAlu.scala:101:27]
  wire [63:0] _vIntMisc64b_io_toFixP_shiftOut;	// @[VAlu.scala:101:27]
  wire [7:0]  _vIntMisc64b_io_toFixP_rnd_high;	// @[VAlu.scala:101:27]
  wire [7:0]  _vIntMisc64b_io_toFixP_rnd_tail;	// @[VAlu.scala:101:27]
  wire        _vIntMisc64b_io_rd_valid;	// @[VAlu.scala:101:27]
  wire [63:0] _vIntMisc64b_io_rd_bits;	// @[VAlu.scala:101:27]
  wire [63:0] _vIntAdder64b_io_vd;	// @[VAlu.scala:85:28]
  wire [7:0]  _vIntAdder64b_io_cmpOut;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_cout_0;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_cout_1;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_cout_2;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_cout_3;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_cout_4;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_cout_5;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_cout_6;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_cout_7;	// @[VAlu.scala:85:28]
  wire [7:0]  _vIntAdder64b_io_toFixP_vd_0;	// @[VAlu.scala:85:28]
  wire [7:0]  _vIntAdder64b_io_toFixP_vd_1;	// @[VAlu.scala:85:28]
  wire [7:0]  _vIntAdder64b_io_toFixP_vd_2;	// @[VAlu.scala:85:28]
  wire [7:0]  _vIntAdder64b_io_toFixP_vd_3;	// @[VAlu.scala:85:28]
  wire [7:0]  _vIntAdder64b_io_toFixP_vd_4;	// @[VAlu.scala:85:28]
  wire [7:0]  _vIntAdder64b_io_toFixP_vd_5;	// @[VAlu.scala:85:28]
  wire [7:0]  _vIntAdder64b_io_toFixP_vd_6;	// @[VAlu.scala:85:28]
  wire [7:0]  _vIntAdder64b_io_toFixP_vd_7;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_vs2H_0;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_vs2H_1;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_vs2H_2;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_vs2H_3;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_vs2H_4;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_vs2H_5;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_vs2H_6;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_vs2H_7;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_vs1H_0;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_vs1H_1;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_vs1H_2;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_vs1H_3;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_vs1H_4;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_vs1H_5;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_vs1H_6;	// @[VAlu.scala:85:28]
  wire        _vIntAdder64b_io_toFixP_vs1H_7;	// @[VAlu.scala:85:28]
  reg  [63:0] vdAdderS1;	// @[Reg.scala:19:16]
  reg  [63:0] vdMiscS1;	// @[Reg.scala:19:16]
  reg         isMiscS1;	// @[Reg.scala:19:16]
  reg  [31:0] narrowVdMiscS1;	// @[Reg.scala:19:16]
  reg  [7:0]  cmpOutS1;	// @[Reg.scala:19:16]
  reg         isFixpS1;	// @[Reg.scala:19:16]
  reg  [5:0]  vFixPoint64b_io_funct6_r;	// @[Reg.scala:19:16]
  reg  [3:0]  vFixPoint64b_io_sew_r_oneHot;	// @[Reg.scala:19:16]
  reg  [1:0]  vFixPoint64b_io_vxrm_r;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_isFixp_r;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_isSub_r;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_cout_0;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_cout_1;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_cout_2;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_cout_3;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_cout_4;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_cout_5;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_cout_6;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_cout_7;	// @[Reg.scala:19:16]
  reg  [7:0]  vFixPoint64b_io_fromAdder_r_vd_0;	// @[Reg.scala:19:16]
  reg  [7:0]  vFixPoint64b_io_fromAdder_r_vd_1;	// @[Reg.scala:19:16]
  reg  [7:0]  vFixPoint64b_io_fromAdder_r_vd_2;	// @[Reg.scala:19:16]
  reg  [7:0]  vFixPoint64b_io_fromAdder_r_vd_3;	// @[Reg.scala:19:16]
  reg  [7:0]  vFixPoint64b_io_fromAdder_r_vd_4;	// @[Reg.scala:19:16]
  reg  [7:0]  vFixPoint64b_io_fromAdder_r_vd_5;	// @[Reg.scala:19:16]
  reg  [7:0]  vFixPoint64b_io_fromAdder_r_vd_6;	// @[Reg.scala:19:16]
  reg  [7:0]  vFixPoint64b_io_fromAdder_r_vd_7;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_vs2H_0;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_vs2H_1;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_vs2H_2;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_vs2H_3;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_vs2H_4;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_vs2H_5;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_vs2H_6;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_vs2H_7;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_vs1H_0;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_vs1H_1;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_vs1H_2;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_vs1H_3;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_vs1H_4;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_vs1H_5;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_vs1H_6;	// @[Reg.scala:19:16]
  reg         vFixPoint64b_io_fromAdder_r_vs1H_7;	// @[Reg.scala:19:16]
  reg  [63:0] vFixPoint64b_io_fromMisc_r_shiftOut;	// @[Reg.scala:19:16]
  reg  [7:0]  vFixPoint64b_io_fromMisc_r_rnd_high;	// @[Reg.scala:19:16]
  reg  [7:0]  vFixPoint64b_io_fromMisc_r_rnd_tail;	// @[Reg.scala:19:16]
  reg         io_rd_r_valid;	// @[Reg.scala:19:16]
  reg  [63:0] io_rd_r_bits;	// @[Reg.scala:19:16]
  always @(posedge clock) begin
    if (io_valid) begin
      vdAdderS1 <= _vIntAdder64b_io_vd;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vdMiscS1 <= _vIntMisc64b_io_vd;	// @[Reg.scala:19:16, VAlu.scala:101:27]
      isMiscS1 <= io_isMisc;	// @[Reg.scala:19:16]
      narrowVdMiscS1 <= _vIntMisc64b_io_narrowVd;	// @[Reg.scala:19:16, VAlu.scala:101:27]
      cmpOutS1 <= _vIntAdder64b_io_cmpOut;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      isFixpS1 <= io_isFixp;	// @[Reg.scala:19:16]
      vFixPoint64b_io_funct6_r <= io_funct6;	// @[Reg.scala:19:16]
      vFixPoint64b_io_sew_r_oneHot <= io_sew_oneHot;	// @[Reg.scala:19:16]
      vFixPoint64b_io_vxrm_r <= io_vxrm;	// @[Reg.scala:19:16]
      vFixPoint64b_io_isFixp_r <= io_isFixp;	// @[Reg.scala:19:16]
      vFixPoint64b_io_isSub_r <= io_isSub;	// @[Reg.scala:19:16]
      vFixPoint64b_io_fromAdder_r_cout_0 <= _vIntAdder64b_io_toFixP_cout_0;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_cout_1 <= _vIntAdder64b_io_toFixP_cout_1;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_cout_2 <= _vIntAdder64b_io_toFixP_cout_2;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_cout_3 <= _vIntAdder64b_io_toFixP_cout_3;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_cout_4 <= _vIntAdder64b_io_toFixP_cout_4;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_cout_5 <= _vIntAdder64b_io_toFixP_cout_5;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_cout_6 <= _vIntAdder64b_io_toFixP_cout_6;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_cout_7 <= _vIntAdder64b_io_toFixP_cout_7;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vd_0 <= _vIntAdder64b_io_toFixP_vd_0;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vd_1 <= _vIntAdder64b_io_toFixP_vd_1;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vd_2 <= _vIntAdder64b_io_toFixP_vd_2;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vd_3 <= _vIntAdder64b_io_toFixP_vd_3;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vd_4 <= _vIntAdder64b_io_toFixP_vd_4;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vd_5 <= _vIntAdder64b_io_toFixP_vd_5;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vd_6 <= _vIntAdder64b_io_toFixP_vd_6;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vd_7 <= _vIntAdder64b_io_toFixP_vd_7;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vs2H_0 <= _vIntAdder64b_io_toFixP_vs2H_0;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vs2H_1 <= _vIntAdder64b_io_toFixP_vs2H_1;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vs2H_2 <= _vIntAdder64b_io_toFixP_vs2H_2;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vs2H_3 <= _vIntAdder64b_io_toFixP_vs2H_3;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vs2H_4 <= _vIntAdder64b_io_toFixP_vs2H_4;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vs2H_5 <= _vIntAdder64b_io_toFixP_vs2H_5;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vs2H_6 <= _vIntAdder64b_io_toFixP_vs2H_6;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vs2H_7 <= _vIntAdder64b_io_toFixP_vs2H_7;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vs1H_0 <= _vIntAdder64b_io_toFixP_vs1H_0;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vs1H_1 <= _vIntAdder64b_io_toFixP_vs1H_1;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vs1H_2 <= _vIntAdder64b_io_toFixP_vs1H_2;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vs1H_3 <= _vIntAdder64b_io_toFixP_vs1H_3;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vs1H_4 <= _vIntAdder64b_io_toFixP_vs1H_4;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vs1H_5 <= _vIntAdder64b_io_toFixP_vs1H_5;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vs1H_6 <= _vIntAdder64b_io_toFixP_vs1H_6;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromAdder_r_vs1H_7 <= _vIntAdder64b_io_toFixP_vs1H_7;	// @[Reg.scala:19:16, VAlu.scala:85:28]
      vFixPoint64b_io_fromMisc_r_shiftOut <= _vIntMisc64b_io_toFixP_shiftOut;	// @[Reg.scala:19:16, VAlu.scala:101:27]
      vFixPoint64b_io_fromMisc_r_rnd_high <= _vIntMisc64b_io_toFixP_rnd_high;	// @[Reg.scala:19:16, VAlu.scala:101:27]
      vFixPoint64b_io_fromMisc_r_rnd_tail <= _vIntMisc64b_io_toFixP_rnd_tail;	// @[Reg.scala:19:16, VAlu.scala:101:27]
      io_rd_r_valid <= _vIntMisc64b_io_rd_valid;	// @[Reg.scala:19:16, VAlu.scala:101:27]
      io_rd_r_bits <= _vIntMisc64b_io_rd_bits;	// @[Reg.scala:19:16, VAlu.scala:101:27]
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    logic [31:0] _RANDOM_1;
    logic [31:0] _RANDOM_2;
    logic [31:0] _RANDOM_3;
    logic [31:0] _RANDOM_4;
    logic [31:0] _RANDOM_5;
    logic [31:0] _RANDOM_6;
    logic [31:0] _RANDOM_7;
    logic [31:0] _RANDOM_8;
    logic [31:0] _RANDOM_9;
    logic [31:0] _RANDOM_10;
    logic [31:0] _RANDOM_11;
    logic [31:0] _RANDOM_12;
    logic [31:0] _RANDOM_13;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        _RANDOM_1 = `RANDOM;
        _RANDOM_2 = `RANDOM;
        _RANDOM_3 = `RANDOM;
        _RANDOM_4 = `RANDOM;
        _RANDOM_5 = `RANDOM;
        _RANDOM_6 = `RANDOM;
        _RANDOM_7 = `RANDOM;
        _RANDOM_8 = `RANDOM;
        _RANDOM_9 = `RANDOM;
        _RANDOM_10 = `RANDOM;
        _RANDOM_11 = `RANDOM;
        _RANDOM_12 = `RANDOM;
        _RANDOM_13 = `RANDOM;
        vdAdderS1 = {_RANDOM_0, _RANDOM_1};	// @[Reg.scala:19:16]
        vdMiscS1 = {_RANDOM_2, _RANDOM_3};	// @[Reg.scala:19:16]
        isMiscS1 = _RANDOM_4[0];	// @[Reg.scala:19:16]
        narrowVdMiscS1 = {_RANDOM_4[31:1], _RANDOM_5[0]};	// @[Reg.scala:19:16]
        cmpOutS1 = _RANDOM_5[8:1];	// @[Reg.scala:19:16]
        isFixpS1 = _RANDOM_5[9];	// @[Reg.scala:19:16]
        vFixPoint64b_io_funct6_r = _RANDOM_5[15:10];	// @[Reg.scala:19:16]
        vFixPoint64b_io_sew_r_oneHot = _RANDOM_5[19:16];	// @[Reg.scala:19:16]
        vFixPoint64b_io_vxrm_r = _RANDOM_5[21:20];	// @[Reg.scala:19:16]
        vFixPoint64b_io_isFixp_r = _RANDOM_5[22];	// @[Reg.scala:19:16]
        vFixPoint64b_io_isSub_r = _RANDOM_5[23];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_cout_0 = _RANDOM_5[24];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_cout_1 = _RANDOM_5[25];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_cout_2 = _RANDOM_5[26];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_cout_3 = _RANDOM_5[27];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_cout_4 = _RANDOM_5[28];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_cout_5 = _RANDOM_5[29];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_cout_6 = _RANDOM_5[30];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_cout_7 = _RANDOM_5[31];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vd_0 = _RANDOM_6[7:0];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vd_1 = _RANDOM_6[15:8];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vd_2 = _RANDOM_6[23:16];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vd_3 = _RANDOM_6[31:24];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vd_4 = _RANDOM_7[7:0];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vd_5 = _RANDOM_7[15:8];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vd_6 = _RANDOM_7[23:16];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vd_7 = _RANDOM_7[31:24];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vs2H_0 = _RANDOM_8[0];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vs2H_1 = _RANDOM_8[1];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vs2H_2 = _RANDOM_8[2];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vs2H_3 = _RANDOM_8[3];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vs2H_4 = _RANDOM_8[4];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vs2H_5 = _RANDOM_8[5];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vs2H_6 = _RANDOM_8[6];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vs2H_7 = _RANDOM_8[7];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vs1H_0 = _RANDOM_8[8];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vs1H_1 = _RANDOM_8[9];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vs1H_2 = _RANDOM_8[10];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vs1H_3 = _RANDOM_8[11];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vs1H_4 = _RANDOM_8[12];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vs1H_5 = _RANDOM_8[13];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vs1H_6 = _RANDOM_8[14];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromAdder_r_vs1H_7 = _RANDOM_8[15];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromMisc_r_shiftOut = {_RANDOM_8[31:16], _RANDOM_9, _RANDOM_10[15:0]};	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromMisc_r_rnd_high = _RANDOM_10[23:16];	// @[Reg.scala:19:16]
        vFixPoint64b_io_fromMisc_r_rnd_tail = _RANDOM_10[31:24];	// @[Reg.scala:19:16]
        io_rd_r_valid = _RANDOM_11[0];	// @[Reg.scala:19:16]
        io_rd_r_bits = {_RANDOM_11[31:1], _RANDOM_12, _RANDOM_13[0]};	// @[Reg.scala:19:16]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  VIntAdder64b vIntAdder64b (	// @[VAlu.scala:85:28]
    .io_funct6        (io_funct6),
    .io_vm            (io_vm),
    .io_ma            (io_ma),
    .io_sew_oneHot    (io_sew_oneHot),
    .io_eewVd_oneHot  (io_eewVd_oneHot),
    .io_uopIdx        (io_uopIdx),
    .io_vs1           (io_vs1),
    .io_vs2           (io_vs2_adder),
    .io_oldVd         (io_oldVd),
    .io_vmask         (io_vmask),
    .io_isSub         (io_isSub),
    .io_widen         (io_widen),
    .io_widen2        (io_widen2),
    .io_narrow_to_1   (io_narrow_to_1),
    .io_vd            (_vIntAdder64b_io_vd),
    .io_cmpOut        (_vIntAdder64b_io_cmpOut),
    .io_toFixP_cout_0 (_vIntAdder64b_io_toFixP_cout_0),
    .io_toFixP_cout_1 (_vIntAdder64b_io_toFixP_cout_1),
    .io_toFixP_cout_2 (_vIntAdder64b_io_toFixP_cout_2),
    .io_toFixP_cout_3 (_vIntAdder64b_io_toFixP_cout_3),
    .io_toFixP_cout_4 (_vIntAdder64b_io_toFixP_cout_4),
    .io_toFixP_cout_5 (_vIntAdder64b_io_toFixP_cout_5),
    .io_toFixP_cout_6 (_vIntAdder64b_io_toFixP_cout_6),
    .io_toFixP_cout_7 (_vIntAdder64b_io_toFixP_cout_7),
    .io_toFixP_vd_0   (_vIntAdder64b_io_toFixP_vd_0),
    .io_toFixP_vd_1   (_vIntAdder64b_io_toFixP_vd_1),
    .io_toFixP_vd_2   (_vIntAdder64b_io_toFixP_vd_2),
    .io_toFixP_vd_3   (_vIntAdder64b_io_toFixP_vd_3),
    .io_toFixP_vd_4   (_vIntAdder64b_io_toFixP_vd_4),
    .io_toFixP_vd_5   (_vIntAdder64b_io_toFixP_vd_5),
    .io_toFixP_vd_6   (_vIntAdder64b_io_toFixP_vd_6),
    .io_toFixP_vd_7   (_vIntAdder64b_io_toFixP_vd_7),
    .io_toFixP_vs2H_0 (_vIntAdder64b_io_toFixP_vs2H_0),
    .io_toFixP_vs2H_1 (_vIntAdder64b_io_toFixP_vs2H_1),
    .io_toFixP_vs2H_2 (_vIntAdder64b_io_toFixP_vs2H_2),
    .io_toFixP_vs2H_3 (_vIntAdder64b_io_toFixP_vs2H_3),
    .io_toFixP_vs2H_4 (_vIntAdder64b_io_toFixP_vs2H_4),
    .io_toFixP_vs2H_5 (_vIntAdder64b_io_toFixP_vs2H_5),
    .io_toFixP_vs2H_6 (_vIntAdder64b_io_toFixP_vs2H_6),
    .io_toFixP_vs2H_7 (_vIntAdder64b_io_toFixP_vs2H_7),
    .io_toFixP_vs1H_0 (_vIntAdder64b_io_toFixP_vs1H_0),
    .io_toFixP_vs1H_1 (_vIntAdder64b_io_toFixP_vs1H_1),
    .io_toFixP_vs1H_2 (_vIntAdder64b_io_toFixP_vs1H_2),
    .io_toFixP_vs1H_3 (_vIntAdder64b_io_toFixP_vs1H_3),
    .io_toFixP_vs1H_4 (_vIntAdder64b_io_toFixP_vs1H_4),
    .io_toFixP_vs1H_5 (_vIntAdder64b_io_toFixP_vs1H_5),
    .io_toFixP_vs1H_6 (_vIntAdder64b_io_toFixP_vs1H_6),
    .io_toFixP_vs1H_7 (_vIntAdder64b_io_toFixP_vs1H_7)
  );
  VIntMisc64b vIntMisc64b (	// @[VAlu.scala:101:27]
    .io_funct6          (io_funct6),
    .io_funct3          (io_funct3),
    .io_vi              (io_vi),
    .io_vm              (io_vm),
    .io_vs1_imm         (io_vs1_imm),
    .io_narrow          (io_narrow),
    .io_sew_oneHot      (io_sew_oneHot),
    .io_uopIdx          (io_uopIdx),
    .io_vs1             (io_vs1),
    .io_vs2             (io_vs2_misc),
    .io_vmask           (io_vmask),
    .io_fs1             (io_fs1),
    .io_vd              (_vIntMisc64b_io_vd),
    .io_narrowVd        (_vIntMisc64b_io_narrowVd),
    .io_toFixP_shiftOut (_vIntMisc64b_io_toFixP_shiftOut),
    .io_toFixP_rnd_high (_vIntMisc64b_io_toFixP_rnd_high),
    .io_toFixP_rnd_tail (_vIntMisc64b_io_toFixP_rnd_tail),
    .io_rd_valid        (_vIntMisc64b_io_rd_valid),
    .io_rd_bits         (_vIntMisc64b_io_rd_bits)
  );
  VFixPoint64b vFixPoint64b (	// @[VAlu.scala:122:28]
    .io_funct6            (vFixPoint64b_io_funct6_r),	// @[Reg.scala:19:16]
    .io_sew_oneHot        (vFixPoint64b_io_sew_r_oneHot),	// @[Reg.scala:19:16]
    .io_vxrm              (vFixPoint64b_io_vxrm_r),	// @[Reg.scala:19:16]
    .io_isFixp            (vFixPoint64b_io_isFixp_r),	// @[Reg.scala:19:16]
    .io_isSub             (vFixPoint64b_io_isSub_r),	// @[Reg.scala:19:16]
    .io_fromAdder_cout_0  (vFixPoint64b_io_fromAdder_r_cout_0),	// @[Reg.scala:19:16]
    .io_fromAdder_cout_1  (vFixPoint64b_io_fromAdder_r_cout_1),	// @[Reg.scala:19:16]
    .io_fromAdder_cout_2  (vFixPoint64b_io_fromAdder_r_cout_2),	// @[Reg.scala:19:16]
    .io_fromAdder_cout_3  (vFixPoint64b_io_fromAdder_r_cout_3),	// @[Reg.scala:19:16]
    .io_fromAdder_cout_4  (vFixPoint64b_io_fromAdder_r_cout_4),	// @[Reg.scala:19:16]
    .io_fromAdder_cout_5  (vFixPoint64b_io_fromAdder_r_cout_5),	// @[Reg.scala:19:16]
    .io_fromAdder_cout_6  (vFixPoint64b_io_fromAdder_r_cout_6),	// @[Reg.scala:19:16]
    .io_fromAdder_cout_7  (vFixPoint64b_io_fromAdder_r_cout_7),	// @[Reg.scala:19:16]
    .io_fromAdder_vd_0    (vFixPoint64b_io_fromAdder_r_vd_0),	// @[Reg.scala:19:16]
    .io_fromAdder_vd_1    (vFixPoint64b_io_fromAdder_r_vd_1),	// @[Reg.scala:19:16]
    .io_fromAdder_vd_2    (vFixPoint64b_io_fromAdder_r_vd_2),	// @[Reg.scala:19:16]
    .io_fromAdder_vd_3    (vFixPoint64b_io_fromAdder_r_vd_3),	// @[Reg.scala:19:16]
    .io_fromAdder_vd_4    (vFixPoint64b_io_fromAdder_r_vd_4),	// @[Reg.scala:19:16]
    .io_fromAdder_vd_5    (vFixPoint64b_io_fromAdder_r_vd_5),	// @[Reg.scala:19:16]
    .io_fromAdder_vd_6    (vFixPoint64b_io_fromAdder_r_vd_6),	// @[Reg.scala:19:16]
    .io_fromAdder_vd_7    (vFixPoint64b_io_fromAdder_r_vd_7),	// @[Reg.scala:19:16]
    .io_fromAdder_vs2H_0  (vFixPoint64b_io_fromAdder_r_vs2H_0),	// @[Reg.scala:19:16]
    .io_fromAdder_vs2H_1  (vFixPoint64b_io_fromAdder_r_vs2H_1),	// @[Reg.scala:19:16]
    .io_fromAdder_vs2H_2  (vFixPoint64b_io_fromAdder_r_vs2H_2),	// @[Reg.scala:19:16]
    .io_fromAdder_vs2H_3  (vFixPoint64b_io_fromAdder_r_vs2H_3),	// @[Reg.scala:19:16]
    .io_fromAdder_vs2H_4  (vFixPoint64b_io_fromAdder_r_vs2H_4),	// @[Reg.scala:19:16]
    .io_fromAdder_vs2H_5  (vFixPoint64b_io_fromAdder_r_vs2H_5),	// @[Reg.scala:19:16]
    .io_fromAdder_vs2H_6  (vFixPoint64b_io_fromAdder_r_vs2H_6),	// @[Reg.scala:19:16]
    .io_fromAdder_vs2H_7  (vFixPoint64b_io_fromAdder_r_vs2H_7),	// @[Reg.scala:19:16]
    .io_fromAdder_vs1H_0  (vFixPoint64b_io_fromAdder_r_vs1H_0),	// @[Reg.scala:19:16]
    .io_fromAdder_vs1H_1  (vFixPoint64b_io_fromAdder_r_vs1H_1),	// @[Reg.scala:19:16]
    .io_fromAdder_vs1H_2  (vFixPoint64b_io_fromAdder_r_vs1H_2),	// @[Reg.scala:19:16]
    .io_fromAdder_vs1H_3  (vFixPoint64b_io_fromAdder_r_vs1H_3),	// @[Reg.scala:19:16]
    .io_fromAdder_vs1H_4  (vFixPoint64b_io_fromAdder_r_vs1H_4),	// @[Reg.scala:19:16]
    .io_fromAdder_vs1H_5  (vFixPoint64b_io_fromAdder_r_vs1H_5),	// @[Reg.scala:19:16]
    .io_fromAdder_vs1H_6  (vFixPoint64b_io_fromAdder_r_vs1H_6),	// @[Reg.scala:19:16]
    .io_fromAdder_vs1H_7  (vFixPoint64b_io_fromAdder_r_vs1H_7),	// @[Reg.scala:19:16]
    .io_fromMisc_shiftOut (vFixPoint64b_io_fromMisc_r_shiftOut),	// @[Reg.scala:19:16]
    .io_fromMisc_rnd_high (vFixPoint64b_io_fromMisc_r_rnd_high),	// @[Reg.scala:19:16]
    .io_fromMisc_rnd_tail (vFixPoint64b_io_fromMisc_r_rnd_tail),	// @[Reg.scala:19:16]
    .io_vd                (_vFixPoint64b_io_vd),
    .io_narrowVd          (_vFixPoint64b_io_narrowVd),
    .io_vxsat             (io_vxsat)
  );
  assign io_vd = isFixpS1 ? _vFixPoint64b_io_vd : isMiscS1 ? vdMiscS1 : vdAdderS1;	// @[Reg.scala:19:16, VAlu.scala:122:28, :131:{15,49}]
  assign io_narrowVd = isFixpS1 ? _vFixPoint64b_io_narrowVd : narrowVdMiscS1;	// @[Reg.scala:19:16, VAlu.scala:122:28, :132:21]
  assign io_cmpOut = cmpOutS1;	// @[Reg.scala:19:16]
  assign io_rd_valid = io_rd_r_valid;	// @[Reg.scala:19:16]
  assign io_rd_bits = io_rd_r_bits;	// @[Reg.scala:19:16]
endmodule
