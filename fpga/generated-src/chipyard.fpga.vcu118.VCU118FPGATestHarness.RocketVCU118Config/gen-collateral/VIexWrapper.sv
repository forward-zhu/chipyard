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

module VIexWrapper(
  input          clock,
                 reset,
                 io_in_valid,
  input  [5:0]   io_in_bits_uop_ctrl_funct6,
  input  [2:0]   io_in_bits_uop_ctrl_funct3,
  input          io_in_bits_uop_ctrl_vm,
  input  [4:0]   io_in_bits_uop_ctrl_vs1_imm,
  input          io_in_bits_uop_ctrl_widen,
                 io_in_bits_uop_ctrl_widen2,
                 io_in_bits_uop_ctrl_narrow,
                 io_in_bits_uop_ctrl_narrow_to_1,
                 io_in_bits_uop_ctrl_load,
                 io_in_bits_uop_ctrl_store,
                 io_in_bits_uop_ctrl_alu,
                 io_in_bits_uop_ctrl_mul,
                 io_in_bits_uop_ctrl_fp,
                 io_in_bits_uop_ctrl_div,
                 io_in_bits_uop_ctrl_redu,
                 io_in_bits_uop_ctrl_mask,
                 io_in_bits_uop_ctrl_perm,
                 io_in_bits_uop_ctrl_floatRed,
                 io_in_bits_uop_ctrl_vGatherEi16EEW8,
                 io_in_bits_uop_ctrl_vGatherEi16EEW32,
                 io_in_bits_uop_ctrl_vGatherEi16EEW64,
  input  [4:0]   io_in_bits_uop_ctrl_lsrc_0,
                 io_in_bits_uop_ctrl_lsrc_1,
                 io_in_bits_uop_ctrl_ldest,
  input          io_in_bits_uop_info_ma,
                 io_in_bits_uop_info_ta,
  input  [2:0]   io_in_bits_uop_info_vsew,
                 io_in_bits_uop_info_vlmul,
  input  [7:0]   io_in_bits_uop_info_vl,
  input  [6:0]   io_in_bits_uop_info_vstart,
  input  [1:0]   io_in_bits_uop_info_vxrm,
  input  [2:0]   io_in_bits_uop_info_frm,
  input  [6:0]   io_in_bits_uop_uopIdx,
  input          io_in_bits_uop_uopEnd,
  input  [63:0]  io_in_bits_scalar_opnd_1,
  input  [127:0] io_in_bits_uopRegInfo_vs1,
                 io_in_bits_uopRegInfo_vs2,
                 io_in_bits_uopRegInfo_mask,
                 io_in_bits_uopRegInfo_old_vd,
                 io_permRegIn_rdata,
  input          io_permRegIn_rvalid,
  output         io_out_valid,
  output [127:0] io_out_bits_vd,
  output         io_out_bits_vxsat,
  output [4:0]   io_out_bits_fflags,
  output         io_permOut_rd_en,
  output [7:0]   io_permOut_rd_preg_idx,
  output         io_permOut_wb_vld,
  output [127:0] io_permOut_wb_data,
  output         io_iexNeedStall
);

  wire         _SVFpu_io_in_ready;	// @[VIexWrapper.scala:43:23]
  wire         _SVFpu_io_out_valid;	// @[VIexWrapper.scala:43:23]
  wire [127:0] _SVFpu_io_out_bits_vd;	// @[VIexWrapper.scala:43:23]
  wire [4:0]   _SVFpu_io_out_bits_fflags;	// @[VIexWrapper.scala:43:23]
  wire [2:0]   _SVPerm_io_out_uop_info_vlmul;	// @[VIexWrapper.scala:42:23]
  wire         _SVPerm_io_out_wb_vld;	// @[VIexWrapper.scala:42:23]
  wire         _SVDiv_io_out_valid;	// @[VIexWrapper.scala:41:23]
  wire [127:0] _SVDiv_io_out_bits_vd;	// @[VIexWrapper.scala:41:23]
  wire [4:0]   _SVDiv_io_out_bits_fflags;	// @[VIexWrapper.scala:41:23]
  wire         _SVReduc_io_out_valid;	// @[VIexWrapper.scala:40:23]
  wire [127:0] _SVReduc_io_out_bits_vd;	// @[VIexWrapper.scala:40:23]
  wire         _SVMask_io_out_valid;	// @[VIexWrapper.scala:39:23]
  wire [127:0] _SVMask_io_out_bits_vd;	// @[VIexWrapper.scala:39:23]
  wire         _SVMac_io_out_valid;	// @[VIexWrapper.scala:38:23]
  wire [127:0] _SVMac_io_out_bits_vd;	// @[VIexWrapper.scala:38:23]
  wire         _SVMac_io_out_bits_vxsat;	// @[VIexWrapper.scala:38:23]
  wire         _SValu_io_out_valid;	// @[VIexWrapper.scala:37:23]
  wire [127:0] _SValu_io_out_bits_vd;	// @[VIexWrapper.scala:37:23]
  wire         _SValu_io_out_bits_vxsat;	// @[VIexWrapper.scala:37:23]
  reg          currentState;	// @[VIexWrapper.scala:46:29]
  wire         _T_8 = io_in_bits_uop_ctrl_load | io_in_bits_uop_ctrl_store;	// @[Vsplit.scala:74:21]
  wire         mUopValid = io_in_valid & ~_T_8;	// @[VIexWrapper.scala:51:{31,34}, Vsplit.scala:74:21]
  wire         _fixCycleValid_T = _SValu_io_out_valid | _SVMac_io_out_valid;	// @[VIexWrapper.scala:37:23, :38:23, :58:37]
  reg  [3:0]   permWriteNum;	// @[VIexWrapper.scala:62:29]
  reg          twoCycleReg;	// @[Reg.scala:19:16]
  wire         fixCycleValid = _fixCycleValid_T | _SVMask_io_out_valid | _SVReduc_io_out_valid;	// @[VIexWrapper.scala:39:23, :40:23, :58:37, :179:87]
  wire         permDone = _SVPerm_io_out_wb_vld & permWriteNum + 4'h1 == {~(_SVPerm_io_out_uop_info_vlmul[2]) & _SVPerm_io_out_uop_info_vlmul[1] & _SVPerm_io_out_uop_info_vlmul[0], ~(_SVPerm_io_out_uop_info_vlmul[2]) & _SVPerm_io_out_uop_info_vlmul[1] & ~(_SVPerm_io_out_uop_info_vlmul[0]), ~(_SVPerm_io_out_uop_info_vlmul[2]) & ~(_SVPerm_io_out_uop_info_vlmul[1]) & _SVPerm_io_out_uop_info_vlmul[0], ~(_SVPerm_io_out_uop_info_vlmul[1]) & ~(_SVPerm_io_out_uop_info_vlmul[0]) | _SVPerm_io_out_uop_info_vlmul[2]};	// @[Cat.scala:33:92, VIexWrapper.scala:42:23, :62:29, :64:36, :67:{29,46,52}, VecUtil.scala:26:{14,20,24,27,33,37,45}, :27:{14,27,37}, :28:{14,36,39}, :29:{14,36}]
  always @(posedge clock) begin
    if (reset) begin
      currentState <= 1'h0;	// @[VIexWrapper.scala:46:29]
      permWriteNum <= 4'h0;	// @[VIexWrapper.scala:62:29]
    end
    else begin
      if (currentState)	// @[VIexWrapper.scala:46:29]
        currentState <= currentState & ~(twoCycleReg | _SVDiv_io_out_valid | permDone | _SVFpu_io_out_valid | io_in_bits_uop_ctrl_floatRed & _SVFpu_io_in_ready & (|io_in_bits_uop_uopIdx));	// @[Reg.scala:19:16, VIexWrapper.scala:41:23, :43:23, :46:29, :47:37, :67:29, :80:23, :91:{38,86,107,117}, :92:28, :94:28]
      else	// @[VIexWrapper.scala:46:29]
        currentState <= mUopValid & ~io_in_bits_uop_ctrl_alu & ~_T_8 & ~io_in_bits_uop_ctrl_mask & ~(io_in_bits_uop_ctrl_narrow_to_1 & ~io_in_bits_uop_uopEnd);	// @[VIexWrapper.scala:46:29, :51:31, :82:{25,47,72,92,95,123,126}, Vsplit.scala:74:21]
      if (permDone)	// @[VIexWrapper.scala:67:29]
        permWriteNum <= 4'h0;	// @[VIexWrapper.scala:62:29]
      else if (_SVPerm_io_out_wb_vld)	// @[VIexWrapper.scala:42:23]
        permWriteNum <= permWriteNum + 4'h1;	// @[VIexWrapper.scala:62:29, :64:36]
    end
    if (mUopValid)	// @[VIexWrapper.scala:51:31]
      twoCycleReg <= mUopValid & (io_in_bits_uop_ctrl_mul | io_in_bits_uop_ctrl_redu);	// @[Reg.scala:19:16, VIexWrapper.scala:51:31, :75:{33,54}]
  end // always @(posedge)
  `ifndef SYNTHESIS
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        currentState = _RANDOM_0[0];	// @[VIexWrapper.scala:46:29]
        permWriteNum = _RANDOM_0[4:1];	// @[VIexWrapper.scala:46:29, :62:29]
        twoCycleReg = _RANDOM_0[5];	// @[Reg.scala:19:16, VIexWrapper.scala:46:29]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  VAluWrapper SValu (	// @[VIexWrapper.scala:37:23]
    .clock                           (clock),
    .reset                           (reset),
    .io_in_valid                     (mUopValid & io_in_bits_uop_ctrl_alu),	// @[VIexWrapper.scala:51:31, :133:36]
    .io_in_bits_uop_ctrl_funct6      (io_in_bits_uop_ctrl_funct6),
    .io_in_bits_uop_ctrl_funct3      (io_in_bits_uop_ctrl_funct3),
    .io_in_bits_uop_ctrl_vm          (io_in_bits_uop_ctrl_vm),
    .io_in_bits_uop_ctrl_vs1_imm     (io_in_bits_uop_ctrl_vs1_imm),
    .io_in_bits_uop_ctrl_widen       (io_in_bits_uop_ctrl_widen),
    .io_in_bits_uop_ctrl_widen2      (io_in_bits_uop_ctrl_widen2),
    .io_in_bits_uop_ctrl_narrow      (io_in_bits_uop_ctrl_narrow),
    .io_in_bits_uop_ctrl_narrow_to_1 (io_in_bits_uop_ctrl_narrow_to_1),
    .io_in_bits_uop_info_ma          (io_in_bits_uop_info_ma),
    .io_in_bits_uop_info_ta          (io_in_bits_uop_info_ta),
    .io_in_bits_uop_info_vsew        (io_in_bits_uop_info_vsew),
    .io_in_bits_uop_info_vl          (io_in_bits_uop_info_vl),
    .io_in_bits_uop_info_vstart      (io_in_bits_uop_info_vstart),
    .io_in_bits_uop_info_vxrm        (io_in_bits_uop_info_vxrm),
    .io_in_bits_uop_uopIdx           (io_in_bits_uop_uopIdx[2:0]),	// @[VIexWrapper.scala:142:15]
    .io_in_bits_uop_uopEnd           (io_in_bits_uop_uopEnd),
    .io_in_bits_vs1                  (io_in_bits_uopRegInfo_vs1),
    .io_in_bits_vs2                  (io_in_bits_uopRegInfo_vs2),
    .io_in_bits_rs1                  (io_in_bits_scalar_opnd_1),
    .io_in_bits_oldVd                (io_in_bits_uopRegInfo_old_vd),
    .io_in_bits_mask                 (io_in_bits_uopRegInfo_mask),
    .io_out_valid                    (_SValu_io_out_valid),
    .io_out_bits_vd                  (_SValu_io_out_bits_vd),
    .io_out_bits_vxsat               (_SValu_io_out_bits_vxsat)
  );
  VMacWrapper SVMac (	// @[VIexWrapper.scala:38:23]
    .clock                       (clock),
    .io_in_valid                 (mUopValid & io_in_bits_uop_ctrl_mul),	// @[VIexWrapper.scala:51:31, :134:36]
    .io_in_bits_uop_ctrl_funct6  (io_in_bits_uop_ctrl_funct6),
    .io_in_bits_uop_ctrl_funct3  (io_in_bits_uop_ctrl_funct3),
    .io_in_bits_uop_ctrl_vm      (io_in_bits_uop_ctrl_vm),
    .io_in_bits_uop_ctrl_vs1_imm (io_in_bits_uop_ctrl_vs1_imm),
    .io_in_bits_uop_ctrl_widen   (io_in_bits_uop_ctrl_widen),
    .io_in_bits_uop_info_ma      (io_in_bits_uop_info_ma),
    .io_in_bits_uop_info_ta      (io_in_bits_uop_info_ta),
    .io_in_bits_uop_info_vsew    (io_in_bits_uop_info_vsew),
    .io_in_bits_uop_info_vl      (io_in_bits_uop_info_vl),
    .io_in_bits_uop_info_vstart  (io_in_bits_uop_info_vstart),
    .io_in_bits_uop_info_vxrm    (io_in_bits_uop_info_vxrm),
    .io_in_bits_uop_uopIdx       (io_in_bits_uop_uopIdx[2:0]),	// @[VIexWrapper.scala:142:15]
    .io_in_bits_vs1              (io_in_bits_uopRegInfo_vs1),
    .io_in_bits_vs2              (io_in_bits_uopRegInfo_vs2),
    .io_in_bits_rs1              (io_in_bits_scalar_opnd_1),
    .io_in_bits_oldVd            (io_in_bits_uopRegInfo_old_vd),
    .io_in_bits_mask             (io_in_bits_uopRegInfo_mask),
    .io_out_valid                (_SVMac_io_out_valid),
    .io_out_bits_vd              (_SVMac_io_out_bits_vd),
    .io_out_bits_vxsat           (_SVMac_io_out_bits_vxsat)
  );
  VMaskWrapper SVMask (	// @[VIexWrapper.scala:39:23]
    .clock                       (clock),
    .reset                       (reset),
    .io_in_valid                 (mUopValid & io_in_bits_uop_ctrl_mask),	// @[VIexWrapper.scala:51:31, :135:36]
    .io_in_bits_uop_ctrl_funct6  (io_in_bits_uop_ctrl_funct6),
    .io_in_bits_uop_ctrl_funct3  (io_in_bits_uop_ctrl_funct3),
    .io_in_bits_uop_ctrl_vm      (io_in_bits_uop_ctrl_vm),
    .io_in_bits_uop_ctrl_vs1_imm (io_in_bits_uop_ctrl_vs1_imm),
    .io_in_bits_uop_info_ma      (io_in_bits_uop_info_ma),
    .io_in_bits_uop_info_ta      (io_in_bits_uop_info_ta),
    .io_in_bits_uop_info_vsew    (io_in_bits_uop_info_vsew),
    .io_in_bits_uop_info_vl      (io_in_bits_uop_info_vl),
    .io_in_bits_uop_info_vstart  (io_in_bits_uop_info_vstart),
    .io_in_bits_uop_uopIdx       (io_in_bits_uop_uopIdx[2:0]),	// @[VIexWrapper.scala:142:15]
    .io_in_bits_uop_uopEnd       (io_in_bits_uop_uopEnd),
    .io_in_bits_vs1              (io_in_bits_uopRegInfo_vs1),
    .io_in_bits_vs2              (io_in_bits_uopRegInfo_vs2),
    .io_in_bits_oldVd            (io_in_bits_uopRegInfo_old_vd),
    .io_in_bits_mask             (io_in_bits_uopRegInfo_mask),
    .io_out_valid                (_SVMask_io_out_valid),
    .io_out_bits_vd              (_SVMask_io_out_bits_vd)
  );
  VReducWrapper SVReduc (	// @[VIexWrapper.scala:40:23]
    .clock                      (clock),
    .reset                      (reset),
    .io_in_valid                (mUopValid & io_in_bits_uop_ctrl_redu),	// @[VIexWrapper.scala:51:31, :136:36]
    .io_in_bits_uop_ctrl_funct6 (io_in_bits_uop_ctrl_funct6),
    .io_in_bits_uop_ctrl_funct3 (io_in_bits_uop_ctrl_funct3),
    .io_in_bits_uop_ctrl_vm     (io_in_bits_uop_ctrl_vm),
    .io_in_bits_uop_info_ta     (io_in_bits_uop_info_ta),
    .io_in_bits_uop_info_vsew   (io_in_bits_uop_info_vsew),
    .io_in_bits_uop_info_vl     (io_in_bits_uop_info_vl),
    .io_in_bits_uop_uopIdx      (io_in_bits_uop_uopIdx[2:0]),	// @[VIexWrapper.scala:142:15]
    .io_in_bits_uop_uopEnd      (io_in_bits_uop_uopEnd),
    .io_in_bits_vs1             (io_in_bits_uopRegInfo_vs1),
    .io_in_bits_vs2             (io_in_bits_uopRegInfo_vs2),
    .io_in_bits_oldVd           (io_in_bits_uopRegInfo_old_vd),
    .io_in_bits_mask            (io_in_bits_uopRegInfo_mask),
    .io_out_valid               (_SVReduc_io_out_valid),
    .io_out_bits_vd             (_SVReduc_io_out_bits_vd)
  );
  VDivWrapper SVDiv (	// @[VIexWrapper.scala:41:23]
    .clock                           (clock),
    .reset                           (reset),
    .io_in_valid                     (mUopValid & io_in_bits_uop_ctrl_div),	// @[VIexWrapper.scala:51:31, :137:36]
    .io_in_bits_uop_ctrl_funct6      (io_in_bits_uop_ctrl_funct6),
    .io_in_bits_uop_ctrl_funct3      (io_in_bits_uop_ctrl_funct3),
    .io_in_bits_uop_ctrl_vm          (io_in_bits_uop_ctrl_vm),
    .io_in_bits_uop_ctrl_vs1_imm     (io_in_bits_uop_ctrl_vs1_imm),
    .io_in_bits_uop_ctrl_widen       (io_in_bits_uop_ctrl_widen),
    .io_in_bits_uop_ctrl_widen2      (io_in_bits_uop_ctrl_widen2),
    .io_in_bits_uop_ctrl_narrow      (io_in_bits_uop_ctrl_narrow),
    .io_in_bits_uop_ctrl_narrow_to_1 (io_in_bits_uop_ctrl_narrow_to_1),
    .io_in_bits_uop_info_ma          (io_in_bits_uop_info_ma),
    .io_in_bits_uop_info_ta          (io_in_bits_uop_info_ta),
    .io_in_bits_uop_info_vsew        (io_in_bits_uop_info_vsew),
    .io_in_bits_uop_info_vlmul       (io_in_bits_uop_info_vlmul),
    .io_in_bits_uop_info_vl          (io_in_bits_uop_info_vl),
    .io_in_bits_uop_info_vstart      (io_in_bits_uop_info_vstart),
    .io_in_bits_uop_info_vxrm        (io_in_bits_uop_info_vxrm),
    .io_in_bits_uop_info_frm         (io_in_bits_uop_info_frm),
    .io_in_bits_uop_uopIdx           (io_in_bits_uop_uopIdx[2:0]),	// @[VIexWrapper.scala:142:15]
    .io_in_bits_vs1                  (io_in_bits_uopRegInfo_vs1),
    .io_in_bits_vs2                  (io_in_bits_uopRegInfo_vs2),
    .io_in_bits_rs1                  (io_in_bits_scalar_opnd_1),
    .io_in_bits_oldVd                (io_in_bits_uopRegInfo_old_vd),
    .io_in_bits_mask                 (io_in_bits_uopRegInfo_mask),
    .io_out_valid                    (_SVDiv_io_out_valid),
    .io_out_bits_vd                  (_SVDiv_io_out_bits_vd),
    .io_out_bits_fflags              (_SVDiv_io_out_bits_fflags)
  );
  VPermWrapper SVPerm (	// @[VIexWrapper.scala:42:23]
    .clock                   (clock),
    .reset                   (reset),
    .io_in_uop_ctrl_funct6   (io_in_bits_uop_ctrl_funct6),
    .io_in_uop_ctrl_funct3   (io_in_bits_uop_ctrl_funct3),
    .io_in_uop_ctrl_vm       (io_in_bits_uop_ctrl_vm),
    .io_in_uop_ctrl_vs1_imm  (io_in_bits_uop_ctrl_vs1_imm),
    .io_in_uop_info_ma       (io_in_bits_uop_info_ma),
    .io_in_uop_info_ta       (io_in_bits_uop_info_ta),
    .io_in_uop_info_vsew     (io_in_bits_uop_info_vsew),
    .io_in_uop_info_vlmul    (io_in_bits_uop_info_vlmul),
    .io_in_uop_info_vl       (io_in_bits_uop_info_vl),
    .io_in_uop_info_vstart   (io_in_bits_uop_info_vstart),
    .io_in_rs1               (io_in_bits_scalar_opnd_1),
    .io_in_vs1_preg_idx_0    ({3'h0, io_in_bits_uop_ctrl_lsrc_0}),	// @[VIexWrapper.scala:154:{32,86}]
    .io_in_vs1_preg_idx_1    ({3'h0, io_in_bits_uop_ctrl_lsrc_0 + {4'h0, ~(io_in_bits_uop_ctrl_vGatherEi16EEW32 | io_in_bits_uop_ctrl_vGatherEi16EEW64)}}),	// @[VIexWrapper.scala:62:29, :154:{32,86}, :155:38, :156:38]
    .io_in_vs1_preg_idx_2    ({3'h0, io_in_bits_uop_ctrl_lsrc_0 + {3'h0, io_in_bits_uop_ctrl_vGatherEi16EEW32 ? 2'h1 : {~io_in_bits_uop_ctrl_vGatherEi16EEW64, 1'h0}}}),	// @[VIexWrapper.scala:154:{32,86}, :155:38, :156:38]
    .io_in_vs1_preg_idx_3    ({3'h0, io_in_bits_uop_ctrl_lsrc_0 + {3'h0, io_in_bits_uop_ctrl_vGatherEi16EEW32 ? 2'h1 : io_in_bits_uop_ctrl_vGatherEi16EEW64 ? 2'h0 : 2'h3}}),	// @[VIexWrapper.scala:154:{32,86}, :155:{38,81}, :156:38]
    .io_in_vs1_preg_idx_4    ({3'h0, io_in_bits_uop_ctrl_lsrc_0 + {2'h0, io_in_bits_uop_ctrl_vGatherEi16EEW32 ? 3'h2 : io_in_bits_uop_ctrl_vGatherEi16EEW64 ? 3'h1 : 3'h4}}),	// @[VIexWrapper.scala:154:{32,86}, :155:{38,81}, :156:38]
    .io_in_vs1_preg_idx_5    ({3'h0, io_in_bits_uop_ctrl_lsrc_0 + {2'h0, io_in_bits_uop_ctrl_vGatherEi16EEW32 ? 3'h2 : {~io_in_bits_uop_ctrl_vGatherEi16EEW64, 2'h1}}}),	// @[VIexWrapper.scala:154:{32,86}, :155:38, :156:38]
    .io_in_vs1_preg_idx_6    ({3'h0, io_in_bits_uop_ctrl_lsrc_0 + {2'h0, io_in_bits_uop_ctrl_vGatherEi16EEW32 ? 3'h3 : io_in_bits_uop_ctrl_vGatherEi16EEW64 ? 3'h1 : 3'h6}}),	// @[VIexWrapper.scala:154:{32,86}, :155:{38,81}, :156:38]
    .io_in_vs1_preg_idx_7    ({3'h0, io_in_bits_uop_ctrl_lsrc_0 + {2'h0, io_in_bits_uop_ctrl_vGatherEi16EEW32 ? 3'h3 : io_in_bits_uop_ctrl_vGatherEi16EEW64 ? 3'h1 : 3'h7}}),	// @[VIexWrapper.scala:154:{32,86}, :155:{38,81}, :156:38]
    .io_in_vs2_preg_idx_0    ({3'h0, io_in_bits_uop_ctrl_lsrc_1}),	// @[VIexWrapper.scala:154:86, :157:32]
    .io_in_vs2_preg_idx_1    ({3'h0, io_in_bits_uop_ctrl_lsrc_1 + 5'h1}),	// @[VIexWrapper.scala:154:86, :157:{32,86}]
    .io_in_vs2_preg_idx_2    ({3'h0, io_in_bits_uop_ctrl_lsrc_1 + 5'h2}),	// @[VIexWrapper.scala:154:86, :157:{32,86}]
    .io_in_vs2_preg_idx_3    ({3'h0, io_in_bits_uop_ctrl_lsrc_1 + 5'h3}),	// @[VIexWrapper.scala:154:86, :157:{32,86}]
    .io_in_vs2_preg_idx_4    ({3'h0, io_in_bits_uop_ctrl_lsrc_1 + 5'h4}),	// @[VIexWrapper.scala:154:86, :157:{32,86}]
    .io_in_vs2_preg_idx_5    ({3'h0, io_in_bits_uop_ctrl_lsrc_1 + 5'h5}),	// @[VIexWrapper.scala:154:86, :157:{32,86}]
    .io_in_vs2_preg_idx_6    ({3'h0, io_in_bits_uop_ctrl_lsrc_1 + 5'h6}),	// @[VIexWrapper.scala:154:86, :157:{32,86}]
    .io_in_vs2_preg_idx_7    ({3'h0, io_in_bits_uop_ctrl_lsrc_1 + 5'h7}),	// @[VIexWrapper.scala:154:86, :157:{32,86}]
    .io_in_old_vd_preg_idx_0 ({3'h0, io_in_bits_uop_ctrl_ldest}),	// @[VIexWrapper.scala:154:86, :158:32]
    .io_in_old_vd_preg_idx_1 ({3'h0, io_in_bits_uop_ctrl_ldest + {4'h0, ~io_in_bits_uop_ctrl_vGatherEi16EEW8}}),	// @[VIexWrapper.scala:62:29, :154:86, :158:{32,86}, :159:38]
    .io_in_old_vd_preg_idx_2 ({3'h0, io_in_bits_uop_ctrl_ldest + {3'h0, io_in_bits_uop_ctrl_vGatherEi16EEW8 ? 2'h1 : 2'h2}}),	// @[VIexWrapper.scala:154:86, :155:{38,81}, :158:{32,86}, :159:38]
    .io_in_old_vd_preg_idx_3 ({3'h0, io_in_bits_uop_ctrl_ldest + {3'h0, ~io_in_bits_uop_ctrl_vGatherEi16EEW8, 1'h1}}),	// @[VIexWrapper.scala:64:36, :154:86, :158:{32,86}, :159:38]
    .io_in_old_vd_preg_idx_4 ({3'h0, io_in_bits_uop_ctrl_ldest + {2'h0, io_in_bits_uop_ctrl_vGatherEi16EEW8 ? 3'h2 : 3'h4}}),	// @[VIexWrapper.scala:154:86, :155:{38,81}, :156:38, :158:{32,86}, :159:38]
    .io_in_old_vd_preg_idx_5 ({3'h0, io_in_bits_uop_ctrl_ldest + {2'h0, io_in_bits_uop_ctrl_vGatherEi16EEW8 ? 3'h2 : 3'h5}}),	// @[VIexWrapper.scala:154:86, :155:{38,81}, :156:38, :158:{32,86}, :159:38]
    .io_in_old_vd_preg_idx_6 ({3'h0, io_in_bits_uop_ctrl_ldest + {2'h0, io_in_bits_uop_ctrl_vGatherEi16EEW8 ? 3'h3 : 3'h6}}),	// @[VIexWrapper.scala:154:86, :155:{38,81}, :156:38, :158:{32,86}, :159:38]
    .io_in_old_vd_preg_idx_7 ({3'h0, io_in_bits_uop_ctrl_ldest + {2'h0, ~io_in_bits_uop_ctrl_vGatherEi16EEW8, 2'h3}}),	// @[VIexWrapper.scala:154:86, :155:81, :156:38, :158:{32,86}, :159:38]
    .io_in_uop_valid         (mUopValid & io_in_bits_uop_ctrl_perm),	// @[VIexWrapper.scala:51:31, :138:36]
    .io_in_rdata             (io_permRegIn_rdata),
    .io_in_rvalid            (io_permRegIn_rvalid),
    .io_out_uop_info_vlmul   (_SVPerm_io_out_uop_info_vlmul),
    .io_out_rd_en            (io_permOut_rd_en),
    .io_out_rd_preg_idx      (io_permOut_rd_preg_idx),
    .io_out_wb_vld           (_SVPerm_io_out_wb_vld),
    .io_out_wb_data          (io_permOut_wb_data)
  );
  VSFPUWrapper SVFpu (	// @[VIexWrapper.scala:43:23]
    .clock                           (clock),
    .reset                           (reset),
    .io_in_valid                     (mUopValid & io_in_bits_uop_ctrl_fp),	// @[VIexWrapper.scala:51:31, :139:36]
    .io_in_bits_uop_ctrl_funct6      (io_in_bits_uop_ctrl_funct6),
    .io_in_bits_uop_ctrl_funct3      (io_in_bits_uop_ctrl_funct3),
    .io_in_bits_uop_ctrl_vm          (io_in_bits_uop_ctrl_vm),
    .io_in_bits_uop_ctrl_vs1_imm     (io_in_bits_uop_ctrl_vs1_imm),
    .io_in_bits_uop_ctrl_widen       (io_in_bits_uop_ctrl_widen),
    .io_in_bits_uop_ctrl_widen2      (io_in_bits_uop_ctrl_widen2),
    .io_in_bits_uop_ctrl_narrow      (io_in_bits_uop_ctrl_narrow),
    .io_in_bits_uop_ctrl_narrow_to_1 (io_in_bits_uop_ctrl_narrow_to_1),
    .io_in_bits_uop_info_ma          (io_in_bits_uop_info_ma),
    .io_in_bits_uop_info_ta          (io_in_bits_uop_info_ta),
    .io_in_bits_uop_info_vsew        (io_in_bits_uop_info_vsew),
    .io_in_bits_uop_info_vlmul       (io_in_bits_uop_info_vlmul),
    .io_in_bits_uop_info_vl          (io_in_bits_uop_info_vl),
    .io_in_bits_uop_info_vstart      (io_in_bits_uop_info_vstart),
    .io_in_bits_uop_info_vxrm        (io_in_bits_uop_info_vxrm),
    .io_in_bits_uop_info_frm         (io_in_bits_uop_info_frm),
    .io_in_bits_uop_uopIdx           (io_in_bits_uop_uopIdx[2:0]),	// @[VIexWrapper.scala:142:15]
    .io_in_bits_uop_uopEnd           (io_in_bits_uop_uopEnd),
    .io_in_bits_vs1                  (io_in_bits_uopRegInfo_vs1),
    .io_in_bits_vs2                  (io_in_bits_uopRegInfo_vs2),
    .io_in_bits_rs1                  (io_in_bits_scalar_opnd_1),
    .io_in_bits_oldVd                (io_in_bits_uopRegInfo_old_vd),
    .io_in_bits_mask                 (io_in_bits_uopRegInfo_mask),
    .io_in_ready                     (_SVFpu_io_in_ready),
    .io_out_valid                    (_SVFpu_io_out_valid),
    .io_out_bits_vd                  (_SVFpu_io_out_bits_vd),
    .io_out_bits_fflags              (_SVFpu_io_out_bits_fflags)
  );
  assign io_out_valid = _fixCycleValid_T | _SVMask_io_out_valid | _SVReduc_io_out_valid | _SVDiv_io_out_valid | _SVFpu_io_out_valid;	// @[VIexWrapper.scala:39:23, :40:23, :41:23, :43:23, :58:37, :59:61]
  assign io_out_bits_vd = fixCycleValid ? (_SValu_io_out_valid ? _SValu_io_out_bits_vd : 128'h0) | (_SVMac_io_out_valid ? _SVMac_io_out_bits_vd : 128'h0) | (_SVMask_io_out_valid ? _SVMask_io_out_bits_vd : 128'h0) | (_SVReduc_io_out_valid ? _SVReduc_io_out_bits_vd : 128'h0) : _SVDiv_io_out_valid ? _SVDiv_io_out_bits_vd : _SVFpu_io_out_valid ? _SVFpu_io_out_bits_vd : 128'h0;	// @[Mux.scala:27:73, VIexWrapper.scala:37:23, :38:23, :39:23, :40:23, :41:23, :43:23, :179:87, :181:22, :183:24, :185:33, :187:24, :189:33, :191:24, :195:24]
  assign io_out_bits_vxsat = fixCycleValid & (_SValu_io_out_valid & _SValu_io_out_bits_vxsat | _SVMac_io_out_valid & _SVMac_io_out_bits_vxsat);	// @[Mux.scala:27:73, VIexWrapper.scala:37:23, :38:23, :179:87, :181:22, :184:24, :185:33]
  assign io_out_bits_fflags = fixCycleValid ? 5'h0 : _SVDiv_io_out_valid ? _SVDiv_io_out_bits_fflags : _SVFpu_io_out_valid ? _SVFpu_io_out_bits_fflags : 5'h0;	// @[VIexWrapper.scala:41:23, :43:23, :179:87, :181:22, :182:24, :185:33, :186:24, :189:33, :190:24, :194:24]
  assign io_permOut_wb_vld = _SVPerm_io_out_wb_vld;	// @[VIexWrapper.scala:42:23]
  assign io_iexNeedStall = currentState;	// @[VIexWrapper.scala:46:29]
endmodule
