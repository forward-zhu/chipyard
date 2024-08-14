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

module VMerge(
  input          clock,
                 reset,
                 io_in_mergeInfo_valid,
                 io_in_mergeInfo_bits_scalarRegWriteEn,
                 io_in_mergeInfo_bits_floatRegWriteEn,
                 io_in_mergeInfo_bits_rfWriteEn,
  input  [4:0]   io_in_mergeInfo_bits_ldest,
  input          io_in_mergeInfo_bits_muopEnd,
  input  [3:0]   io_in_mergeInfo_bits_permExpdLen,
  input  [4:0]   io_in_mergeInfo_bits_regDstIdx,
  input  [2:0]   io_in_mergeInfo_bits_regBackWidth,
  input  [3:0]   io_in_mergeInfo_bits_regWriteMuopIdx,
  input          io_in_aluIn_valid,
  input  [127:0] io_in_aluIn_bits_vd,
  input          io_in_aluIn_bits_vxsat,
  input  [4:0]   io_in_aluIn_bits_fflags,
  input          io_in_lsuIn_valid,
  input  [127:0] io_in_lsuIn_bits_data,
  input          io_in_lsuIn_bits_rfWriteEn,
  input  [15:0]  io_in_lsuIn_bits_rfWriteMask,
  input  [4:0]   io_in_lsuIn_bits_rfWriteIdx,
  input          io_in_lsuIn_bits_muopEnd,
                 io_in_lsuIn_bits_isSegLoad,
  input  [4:0]   io_in_lsuIn_bits_regStartIdx,
  input  [3:0]   io_in_lsuIn_bits_regCount,
  input          io_in_lsuIn_bits_xcpt_exception_vld,
                 io_in_lsuIn_bits_xcpt_update_vl,
                 io_in_permIn_wb_vld,
  input  [127:0] io_in_permIn_wb_data,
  output         io_out_toRegFileWrite_rfWriteEn,
  output [15:0]  io_out_toRegFileWrite_rfWriteMask,
  output [4:0]   io_out_toRegFileWrite_rfWriteIdx,
  output [127:0] io_out_toRegFileWrite_rfWriteData,
  output         io_out_commitInfo_valid,
                 io_out_commitInfo_bits_scalarRegWriteEn,
                 io_out_commitInfo_bits_floatRegWriteEn,
  output [4:0]   io_out_commitInfo_bits_ldest,
                 io_out_commitInfo_bits_fflags,
  output [63:0]  io_out_commitInfo_bits_data,
  output         io_out_commitInfo_bits_vxsat,
                 io_scoreBoardCleanIO_clearEn,
  output [4:0]   io_scoreBoardCleanIO_clearAddr,
  output         io_scoreBoardCleanIO_clearMultiEn,
  output [5:0]   io_scoreBoardCleanIO_clearNum,
  output         io_scoreBoardCleanIO_clearAll
);

  reg  [127:0] regDataBuffer;	// @[VMerge.scala:31:32]
  reg          vxsatBuffer;	// @[VMerge.scala:32:32]
  reg  [4:0]   fflagsBuffer;	// @[VMerge.scala:34:33]
  reg          rfWriteEn;	// @[Reg.scala:19:16]
  reg  [4:0]   rfWriteIdx;	// @[Reg.scala:19:16]
  reg  [2:0]   regBackWidth;	// @[Reg.scala:19:16]
  reg  [3:0]   regWriteMuopIdx;	// @[Reg.scala:19:16]
  reg          scalarRegWriteEn;	// @[Reg.scala:19:16]
  reg          floatRegWriteEn;	// @[Reg.scala:19:16]
  reg  [4:0]   scalarRegWriteIdx;	// @[Reg.scala:19:16]
  reg          muopEnd;	// @[Reg.scala:19:16]
  reg  [3:0]   permExpdLen;	// @[Reg.scala:19:16]
  reg  [4:0]   regDstIdx;	// @[Reg.scala:19:16]
  wire         _T = io_in_aluIn_valid & rfWriteEn;	// @[Reg.scala:19:16, VMerge.scala:48:28]
  wire         _T_2 = regBackWidth == 3'h3;	// @[Reg.scala:19:16, VMerge.scala:54:33]
  wire         _T_3 = regWriteMuopIdx == 4'h0;	// @[Reg.scala:19:16, VMerge.scala:55:34, :120:31]
  wire         _GEN = (&regBackWidth) | _T_2 & (~_T_3 | muopEnd);	// @[Reg.scala:19:16, VMerge.scala:49:{27,40}, :50:47, :54:{33,45}, :55:{34,42}, :56:30, :67:50, :74:35]
  wire         _T_4 = io_in_lsuIn_valid & io_in_lsuIn_bits_rfWriteEn;	// @[VMerge.scala:76:34]
  wire         vxsatBufferIn = io_in_aluIn_valid & io_in_aluIn_bits_vxsat | vxsatBuffer;	// @[VMerge.scala:32:32, :86:28, :87:24, :90:23]
  wire [4:0]   fflagsBufferIn = {5{io_in_aluIn_valid}} & io_in_aluIn_bits_fflags | fflagsBuffer;	// @[VMerge.scala:34:33, :86:28, :88:24, :91:24]
  wire         _T_5 = io_in_aluIn_valid & muopEnd;	// @[Reg.scala:19:16, VMerge.scala:96:28]
  wire         _T_6 = io_in_lsuIn_valid & io_in_lsuIn_bits_muopEnd;	// @[VMerge.scala:106:34]
  reg  [3:0]   permWriteNum;	// @[VMerge.scala:120:31]
  wire         _io_out_toRegFileWrite_rfWriteEn_output = io_in_permIn_wb_vld | (_T ? _GEN : _T_4);	// @[VMerge.scala:48:{28,41}, :49:40, :50:47, :54:45, :76:34, :77:5, :121:30, :122:43]
  wire [4:0]   _io_out_toRegFileWrite_rfWriteIdx_output = io_in_permIn_wb_vld ? regDstIdx + {1'h0, permWriteNum} : _T ? (_GEN ? rfWriteIdx : 5'h0) : _T_4 ? io_in_lsuIn_bits_rfWriteIdx : 5'h0;	// @[Reg.scala:19:16, VMerge.scala:32:32, :34:33, :48:{28,41}, :49:40, :50:47, :52:47, :54:45, :76:34, :77:5, :80:43, :83:31, :120:31, :121:30, :124:{43,56}]
  wire         _T_10 = io_in_permIn_wb_vld & permWriteNum + 4'h1 == permExpdLen;	// @[Reg.scala:19:16, VMerge.scala:120:31, :126:38, :128:{30,47,53}]
  wire         _GEN_0 = _T_10 | _T_5;	// @[VMerge.scala:96:{28,39}, :97:33, :106:62, :128:{30,70}, :130:33]
  wire         sboardClearMulti = io_in_lsuIn_valid & io_in_lsuIn_bits_muopEnd & io_in_lsuIn_bits_isSegLoad;	// @[VMerge.scala:141:74]
  always @(posedge clock) begin
    if (reset) begin
      regDataBuffer <= 128'h0;	// @[VMerge.scala:31:32]
      vxsatBuffer <= 1'h0;	// @[VMerge.scala:32:32]
      fflagsBuffer <= 5'h0;	// @[VMerge.scala:34:33]
      permWriteNum <= 4'h0;	// @[VMerge.scala:120:31]
    end
    else begin
      if (~_T | (&regBackWidth) | ~(_T_2 & _T_3) | muopEnd) begin	// @[Reg.scala:19:16, VMerge.scala:31:32, :48:{28,41}, :49:{27,40}, :54:{33,45}, :55:{34,42}, :56:30]
      end
      else	// @[VMerge.scala:31:32, :48:41, :49:40]
        regDataBuffer <= io_in_aluIn_bits_vd;	// @[VMerge.scala:31:32]
      vxsatBuffer <= ~_T_5 & vxsatBufferIn;	// @[VMerge.scala:32:32, :86:28, :87:24, :90:23, :93:19, :96:{28,39}, :103:49]
      if (_T_5)	// @[VMerge.scala:96:28]
        fflagsBuffer <= 5'h0;	// @[VMerge.scala:34:33]
      else	// @[VMerge.scala:96:28]
        fflagsBuffer <= fflagsBufferIn;	// @[VMerge.scala:34:33, :86:28, :88:24, :91:24]
      if (_T_10)	// @[VMerge.scala:128:30]
        permWriteNum <= 4'h0;	// @[VMerge.scala:120:31]
      else if (io_in_permIn_wb_vld)
        permWriteNum <= permWriteNum + 4'h1;	// @[VMerge.scala:120:31, :126:38]
    end
    if (io_in_mergeInfo_valid) begin
      rfWriteEn <= io_in_mergeInfo_bits_rfWriteEn;	// @[Reg.scala:19:16]
      rfWriteIdx <= io_in_mergeInfo_bits_ldest;	// @[Reg.scala:19:16]
      regBackWidth <= io_in_mergeInfo_bits_regBackWidth;	// @[Reg.scala:19:16]
      regWriteMuopIdx <= io_in_mergeInfo_bits_regWriteMuopIdx;	// @[Reg.scala:19:16]
      scalarRegWriteEn <= io_in_mergeInfo_bits_scalarRegWriteEn;	// @[Reg.scala:19:16]
      floatRegWriteEn <= io_in_mergeInfo_bits_floatRegWriteEn;	// @[Reg.scala:19:16]
      scalarRegWriteIdx <= io_in_mergeInfo_bits_ldest;	// @[Reg.scala:19:16]
      muopEnd <= io_in_mergeInfo_bits_muopEnd;	// @[Reg.scala:19:16]
      permExpdLen <= io_in_mergeInfo_bits_permExpdLen;	// @[Reg.scala:19:16]
      regDstIdx <= io_in_mergeInfo_bits_regDstIdx;	// @[Reg.scala:19:16]
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
        regDataBuffer = {_RANDOM_0, _RANDOM_1, _RANDOM_2, _RANDOM_3};	// @[VMerge.scala:31:32]
        vxsatBuffer = _RANDOM_4[0];	// @[VMerge.scala:32:32]
        fflagsBuffer = _RANDOM_4[5:1];	// @[VMerge.scala:32:32, :34:33]
        rfWriteEn = _RANDOM_4[6];	// @[Reg.scala:19:16, VMerge.scala:32:32]
        rfWriteIdx = _RANDOM_4[11:7];	// @[Reg.scala:19:16, VMerge.scala:32:32]
        regBackWidth = _RANDOM_4[14:12];	// @[Reg.scala:19:16, VMerge.scala:32:32]
        regWriteMuopIdx = _RANDOM_4[18:15];	// @[Reg.scala:19:16, VMerge.scala:32:32]
        scalarRegWriteEn = _RANDOM_4[19];	// @[Reg.scala:19:16, VMerge.scala:32:32]
        floatRegWriteEn = _RANDOM_4[20];	// @[Reg.scala:19:16, VMerge.scala:32:32]
        scalarRegWriteIdx = _RANDOM_4[25:21];	// @[Reg.scala:19:16, VMerge.scala:32:32]
        muopEnd = _RANDOM_4[26];	// @[Reg.scala:19:16, VMerge.scala:32:32]
        permExpdLen = _RANDOM_4[30:27];	// @[Reg.scala:19:16, VMerge.scala:32:32]
        regDstIdx = {_RANDOM_4[31], _RANDOM_5[3:0]};	// @[Reg.scala:19:16, VMerge.scala:32:32]
        permWriteNum = _RANDOM_5[7:4];	// @[Reg.scala:19:16, VMerge.scala:120:31]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_out_toRegFileWrite_rfWriteEn = _io_out_toRegFileWrite_rfWriteEn_output;	// @[VMerge.scala:48:41, :121:30, :122:43]
  assign io_out_toRegFileWrite_rfWriteMask = io_in_permIn_wb_vld | _T | ~_T_4 ? 16'h0 : io_in_lsuIn_bits_rfWriteMask;	// @[Bitwise.scala:77:12, VMerge.scala:48:{28,41}, :49:40, :76:34, :77:5, :121:30, :123:43]
  assign io_out_toRegFileWrite_rfWriteIdx = _io_out_toRegFileWrite_rfWriteIdx_output;	// @[VMerge.scala:48:41, :121:30, :124:43]
  assign io_out_toRegFileWrite_rfWriteData = io_in_permIn_wb_vld ? io_in_permIn_wb_data : _T ? ((&regBackWidth) ? io_in_aluIn_bits_vd : _T_2 ? (_T_3 ? (muopEnd ? io_in_aluIn_bits_vd : 128'h0) : {io_in_aluIn_bits_vd[127:64], regDataBuffer[63:0]}) : 128'h0) : _T_4 ? io_in_lsuIn_bits_data : 128'h0;	// @[Cat.scala:33:92, Reg.scala:19:16, VMerge.scala:31:32, :48:{28,41}, :49:{27,40}, :53:47, :54:{33,45}, :55:{34,42}, :56:30, :60:55, :64:43, :70:51, :71:{44,67}, :74:35, :76:34, :77:5, :81:43, :83:31, :121:30, :125:43]
  assign io_out_commitInfo_valid = _GEN_0 | _T_6;	// @[VMerge.scala:96:39, :97:33, :106:{34,62}, :128:70, :130:33]
  assign io_out_commitInfo_bits_scalarRegWriteEn = _GEN_0 & scalarRegWriteEn;	// @[Reg.scala:19:16, VMerge.scala:96:39, :97:33, :98:49, :106:62, :128:70, :130:33, :131:49]
  assign io_out_commitInfo_bits_floatRegWriteEn = _GEN_0 & floatRegWriteEn;	// @[Reg.scala:19:16, VMerge.scala:96:39, :97:33, :99:49, :106:62, :128:70, :130:33, :132:49]
  assign io_out_commitInfo_bits_ldest = _GEN_0 ? scalarRegWriteIdx : 5'h0;	// @[Reg.scala:19:16, VMerge.scala:34:33, :96:39, :97:33, :100:49, :106:62, :128:70, :130:33, :133:49]
  assign io_out_commitInfo_bits_fflags = _T_5 ? fflagsBufferIn : 5'h0;	// @[VMerge.scala:34:33, :86:28, :88:24, :91:24, :96:{28,39}, :104:49, :106:62]
  assign io_out_commitInfo_bits_data = _T_10 ? io_in_permIn_wb_data[63:0] : _T_5 ? io_in_aluIn_bits_vd[63:0] : _T_6 ? io_in_lsuIn_bits_data[63:0] : 64'h0;	// @[VMerge.scala:96:{28,39}, :101:49, :106:{34,62}, :111:49, :116:{32,47}, :128:{30,70}, :134:49]
  assign io_out_commitInfo_bits_vxsat = _T_5 & vxsatBufferIn;	// @[VMerge.scala:86:28, :87:24, :90:23, :96:{28,39}, :102:49, :106:62]
  assign io_scoreBoardCleanIO_clearEn = _io_out_toRegFileWrite_rfWriteEn_output & ~(io_in_lsuIn_valid & io_in_lsuIn_bits_isSegLoad);	// @[VMerge.scala:48:41, :121:30, :122:43, :144:{76,79,99}]
  assign io_scoreBoardCleanIO_clearAddr = sboardClearMulti ? io_in_lsuIn_bits_regStartIdx : _io_out_toRegFileWrite_rfWriteIdx_output;	// @[VMerge.scala:48:41, :121:30, :124:43, :141:74, :145:47]
  assign io_scoreBoardCleanIO_clearMultiEn = sboardClearMulti;	// @[VMerge.scala:141:74]
  assign io_scoreBoardCleanIO_clearNum = {2'h0, io_in_lsuIn_bits_regCount};	// @[VMerge.scala:124:56, :148:41]
  assign io_scoreBoardCleanIO_clearAll = io_in_lsuIn_valid & (io_in_lsuIn_bits_xcpt_exception_vld | io_in_lsuIn_bits_xcpt_update_vl);	// @[VMerge.scala:138:57, :142:44]
endmodule
