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

module VFDivSqrtDataModule(
  input         clock,
                reset,
                io_in_valid,
  input  [63:0] io_in_bits_vs1,
                io_in_bits_vs2,
  input  [7:0]  io_in_bits_prestart,
                io_in_bits_mask,
                io_in_bits_tail,
  input         io_in_bits_uop_ctrl_vm,
  input  [2:0]  io_in_bits_uop_info_frm,
  input         io_in_bits_uop_vfpCtrl_isSqrt,
                io_in_bits_uop_typeTag,
                io_out_ready,
  output        io_in_ready,
                io_out_valid,
  output [63:0] io_out_bits_vd,
  output [4:0]  io_out_bits_fflags
);

  wire        _io_in_ready_output;	// @[VFDivSqrt.scala:44:92]
  wire [63:0] _divSqrt64_0_io_result;	// @[VFDivSqrt.scala:62:22]
  wire [4:0]  _divSqrt64_0_io_fflags;	// @[VFDivSqrt.scala:62:22]
  wire        _divSqrt64_0_io_specialIO_in_ready;	// @[VFDivSqrt.scala:62:22]
  wire        _divSqrt64_0_io_specialIO_out_valid;	// @[VFDivSqrt.scala:62:22]
  wire [31:0] _divSqrt32_1_io_result;	// @[VFDivSqrt.scala:62:22]
  wire [4:0]  _divSqrt32_1_io_fflags;	// @[VFDivSqrt.scala:62:22]
  wire        _divSqrt32_1_io_specialIO_in_ready;	// @[VFDivSqrt.scala:62:22]
  wire        _divSqrt32_1_io_specialIO_out_valid;	// @[VFDivSqrt.scala:62:22]
  wire [31:0] _divSqrt32_0_io_result;	// @[VFDivSqrt.scala:62:22]
  wire [4:0]  _divSqrt32_0_io_fflags;	// @[VFDivSqrt.scala:62:22]
  wire        _divSqrt32_0_io_specialIO_in_ready;	// @[VFDivSqrt.scala:62:22]
  wire        _divSqrt32_0_io_specialIO_out_valid;	// @[VFDivSqrt.scala:62:22]
  wire        in_fire = io_in_valid & _io_in_ready_output;	// @[VFDivSqrt.scala:14:29, :44:92]
  reg         outSel_0;	// @[Reg.scala:35:20]
  reg         outSel_1;	// @[Reg.scala:35:20]
  reg         activeBuf_0;	// @[Reg.scala:19:16]
  reg         activeBuf_1;	// @[Reg.scala:19:16]
  assign _io_in_ready_output = _divSqrt32_0_io_specialIO_in_ready & _divSqrt32_1_io_specialIO_in_ready & _divSqrt64_0_io_specialIO_in_ready;	// @[VFDivSqrt.scala:44:92, :62:22]
  reg         validBuf32_0;	// @[VFDivSqrt.scala:48:27]
  reg         validBuf32_1;	// @[VFDivSqrt.scala:48:27]
  wire        _io_out_valid_T = validBuf32_0 & validBuf32_1;	// @[VFDivSqrt.scala:48:27, :49:22]
  always @(posedge clock) begin
    if (reset) begin
      outSel_0 <= 1'h1;	// @[Reg.scala:35:20, VFDivSqrt.scala:66:46]
      outSel_1 <= 1'h1;	// @[Reg.scala:35:20, VFDivSqrt.scala:66:46]
      validBuf32_0 <= 1'h0;	// @[VFDivSqrt.scala:48:27]
      validBuf32_1 <= 1'h0;	// @[VFDivSqrt.scala:48:27]
    end
    else begin
      if (in_fire) begin	// @[VFDivSqrt.scala:14:29]
        outSel_0 <= ~io_in_bits_uop_typeTag;	// @[Reg.scala:35:20, VFDivSqrt.scala:23:61]
        outSel_1 <= io_in_bits_uop_typeTag;	// @[Reg.scala:35:20]
      end
      validBuf32_0 <= ~_io_out_valid_T & (_divSqrt32_0_io_specialIO_out_valid | validBuf32_0);	// @[VFDivSqrt.scala:48:27, :49:{22,40}, :50:19, :53:{47,63}, :62:22]
      validBuf32_1 <= ~_io_out_valid_T & (_divSqrt32_1_io_specialIO_out_valid | validBuf32_1);	// @[VFDivSqrt.scala:48:27, :49:{22,40}, :50:19, :51:19, :53:47, :54:{47,63}, :62:22]
    end
    if (in_fire) begin	// @[VFDivSqrt.scala:14:29]
      activeBuf_0 <= ~(io_in_bits_prestart[0]) & ~(io_in_bits_tail[0]) & (io_in_bits_uop_ctrl_vm | io_in_bits_mask[0]);	// @[Reg.scala:19:16, VFPUSubModule.scala:41:{27,47,54,70,75}, :42:{28,45}]
      activeBuf_1 <= ~(io_in_bits_prestart[4]) & ~(io_in_bits_tail[4]) & (io_in_bits_uop_ctrl_vm | io_in_bits_mask[4]);	// @[Reg.scala:19:16, VFPUSubModule.scala:41:{27,47,54,70,75}, :42:{28,45}]
    end
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
        outSel_0 = _RANDOM_0[0];	// @[Reg.scala:35:20]
        outSel_1 = _RANDOM_0[1];	// @[Reg.scala:35:20]
        activeBuf_0 = _RANDOM_0[2];	// @[Reg.scala:19:16, :35:20]
        activeBuf_1 = _RANDOM_0[3];	// @[Reg.scala:19:16, :35:20]
        validBuf32_0 = _RANDOM_0[4];	// @[Reg.scala:35:20, VFDivSqrt.scala:48:27]
        validBuf32_1 = _RANDOM_0[5];	// @[Reg.scala:35:20, VFDivSqrt.scala:48:27]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  FDIV divSqrt32_0 (	// @[VFDivSqrt.scala:62:22]
    .clock                  (clock),
    .reset                  (reset),
    .io_a                   (io_in_bits_vs2[63:32]),	// @[VFDivSqrt.scala:26:57]
    .io_b                   (io_in_bits_vs1[63:32]),	// @[VFDivSqrt.scala:26:75]
    .io_rm                  (io_in_bits_uop_info_frm),
    .io_specialIO_in_valid  (in_fire & ~io_in_bits_uop_typeTag),	// @[VFDivSqrt.scala:14:29, :23:61, :66:54]
    .io_specialIO_out_ready (io_out_ready),
    .io_specialIO_isSqrt    (io_in_bits_uop_vfpCtrl_isSqrt),
    .io_result              (_divSqrt32_0_io_result),
    .io_fflags              (_divSqrt32_0_io_fflags),
    .io_specialIO_in_ready  (_divSqrt32_0_io_specialIO_in_ready),
    .io_specialIO_out_valid (_divSqrt32_0_io_specialIO_out_valid)
  );
  FDIV divSqrt32_1 (	// @[VFDivSqrt.scala:62:22]
    .clock                  (clock),
    .reset                  (reset),
    .io_a                   (io_in_bits_vs2[31:0]),	// @[VFDivSqrt.scala:27:54]
    .io_b                   (io_in_bits_vs1[31:0]),	// @[VFDivSqrt.scala:27:72]
    .io_rm                  (io_in_bits_uop_info_frm),
    .io_specialIO_in_valid  (in_fire & ~io_in_bits_uop_typeTag),	// @[VFDivSqrt.scala:14:29, :23:61, :66:54]
    .io_specialIO_out_ready (io_out_ready),
    .io_specialIO_isSqrt    (io_in_bits_uop_vfpCtrl_isSqrt),
    .io_result              (_divSqrt32_1_io_result),
    .io_fflags              (_divSqrt32_1_io_fflags),
    .io_specialIO_in_ready  (_divSqrt32_1_io_specialIO_in_ready),
    .io_specialIO_out_valid (_divSqrt32_1_io_specialIO_out_valid)
  );
  FDIV_2 divSqrt64_0 (	// @[VFDivSqrt.scala:62:22]
    .clock                  (clock),
    .reset                  (reset),
    .io_a                   (io_in_bits_vs2),
    .io_b                   (io_in_bits_vs1),
    .io_rm                  (io_in_bits_uop_info_frm),
    .io_specialIO_in_valid  (in_fire & io_in_bits_uop_typeTag),	// @[VFDivSqrt.scala:14:29, :66:54]
    .io_specialIO_out_ready (io_out_ready),
    .io_specialIO_isSqrt    (io_in_bits_uop_vfpCtrl_isSqrt),
    .io_result              (_divSqrt64_0_io_result),
    .io_fflags              (_divSqrt64_0_io_fflags),
    .io_specialIO_in_ready  (_divSqrt64_0_io_specialIO_in_ready),
    .io_specialIO_out_valid (_divSqrt64_0_io_specialIO_out_valid)
  );
  assign io_in_ready = _io_in_ready_output;	// @[VFDivSqrt.scala:44:92]
  assign io_out_valid = outSel_0 & _io_out_valid_T | outSel_1 & _divSqrt64_0_io_specialIO_out_valid;	// @[Mux.scala:27:73, Reg.scala:35:20, VFDivSqrt.scala:49:22, :62:22]
  assign io_out_bits_vd = (outSel_0 ? {_divSqrt32_0_io_result, _divSqrt32_1_io_result} : 64'h0) | (outSel_1 ? _divSqrt64_0_io_result : 64'h0);	// @[Cat.scala:33:92, Mux.scala:27:73, Reg.scala:35:20, VFDivSqrt.scala:62:22]
  assign io_out_bits_fflags = (outSel_0 ? (activeBuf_0 ? _divSqrt32_1_io_fflags : 5'h0) | (activeBuf_1 ? _divSqrt32_0_io_fflags : 5'h0) : 5'h0) | (outSel_1 & activeBuf_0 ? _divSqrt64_0_io_fflags : 5'h0);	// @[Mux.scala:27:73, Reg.scala:19:16, :35:20, VFDivSqrt.scala:39:21, :41:{21,70}, :42:25, :62:22]
endmodule
