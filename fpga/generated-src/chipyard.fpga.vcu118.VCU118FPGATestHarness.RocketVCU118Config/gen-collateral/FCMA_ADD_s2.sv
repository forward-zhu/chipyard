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

module FCMA_ADD_s2(
  input  [2:0]  io_in_rm,
  input         io_in_far_path_out_sign,
                io_in_near_path_out_sign,
  input  [7:0]  io_in_near_path_out_exp,
  input         io_in_special_case_valid,
                io_in_special_case_bits_iv,
                io_in_special_case_bits_nan,
                io_in_special_case_bits_inf_sign,
                io_in_small_add,
                io_in_far_path_mul_of,
  input  [47:0] io_in_far_sig_a,
  input  [51:0] io_in_far_sig_b,
  input  [7:0]  io_in_far_exp_a_vec_0,
                io_in_far_exp_a_vec_1,
                io_in_far_exp_a_vec_2,
  input         io_in_near_path_sig_is_zero,
                io_in_near_path_lza_error,
                io_in_near_path_int_bit,
  input  [48:0] io_in_near_path_sig_raw,
  input  [5:0]  io_in_near_path_lzc,
  input         io_in_sel_far_path,
  output [31:0] io_result,
  output [4:0]  io_fflags
);

  wire [7:0]   near_path_res_exp;	// @[FADD.scala:431:27]
  wire [22:0]  _near_path_rounder_io_out;	// @[RoundingUnit.scala:46:25]
  wire         _near_path_rounder_io_inexact;	// @[RoundingUnit.scala:46:25]
  wire         _near_path_rounder_io_cout;	// @[RoundingUnit.scala:46:25]
  wire         _near_path_tininess_rounder_io_tininess;	// @[FADD.scala:446:42]
  wire [22:0]  _far_path_rounder_io_out;	// @[RoundingUnit.scala:46:25]
  wire         _far_path_rounder_io_inexact;	// @[RoundingUnit.scala:46:25]
  wire         _far_path_rounder_io_cout;	// @[RoundingUnit.scala:46:25]
  wire         _far_path_tininess_rounder_io_tininess;	// @[FADD.scala:387:41]
  wire [51:0]  _GEN = {1'h0, io_in_far_sig_a, 3'h0} + io_in_far_sig_b;	// @[Cat.scala:33:92, FADD.scala:364:37]
  wire         keep = _GEN[51:50] == 2'h1;	// @[FADD.scala:364:37, :367:{31,35}]
  wire         cancellation = _GEN[51:50] == 2'h0;	// @[Cat.scala:33:92, FADD.scala:364:37, :367:31, :368:43]
  wire [26:0]  _far_path_res_sig_WIRE = (_GEN[51] ? {_GEN[51:26], |(_GEN[25:0])} : 27'h0) | (keep | io_in_small_add ? {_GEN[50:25], |(_GEN[24:0])} : 27'h0) | (cancellation & ~io_in_small_add ? {_GEN[49:24], |(_GEN[23:0])} : 27'h0);	// @[FADD.scala:364:37, :366:31, :367:35, :368:43, :371:{20,47,50}, :373:{24,36,56,68}, :374:{24,32,44,64,76}, :375:{24,32,44,64,76}, Mux.scala:27:73]
  wire [7:0]   _far_path_res_exp_WIRE = (_GEN[51] ? io_in_far_exp_a_vec_0 : 8'h0) | (keep ? io_in_far_exp_a_vec_1 : 8'h0) | (cancellation ? io_in_far_exp_a_vec_2 : 8'h0);	// @[FADD.scala:364:37, :366:31, :367:35, :368:43, Mux.scala:27:73]
  wire         far_path_of = (&_far_path_res_exp_WIRE) | _far_path_rounder_io_cout & _far_path_res_exp_WIRE == 8'hFE | io_in_far_path_mul_of;	// @[FADD.scala:407:18, :408:58, :409:18, :412:57, Mux.scala:27:73, RoundingUnit.scala:46:25]
  wire         far_path_ix = _far_path_rounder_io_inexact | far_path_of;	// @[FADD.scala:412:57, :413:49, RoundingUnit.scala:46:25]
  wire         near_path_is_zero = near_path_res_exp == 8'h0 & io_in_near_path_sig_is_zero;	// @[FADD.scala:425:{41,49}, :431:27, Mux.scala:27:73]
  assign near_path_res_exp = io_in_near_path_int_bit ? io_in_near_path_out_exp - {2'h0, io_in_near_path_lzc} - {7'h0, io_in_near_path_lza_error} : 8'h0;	// @[Cat.scala:33:92, FADD.scala:399:55, :429:40, :430:23, :431:27, Mux.scala:27:73]
  wire [111:0] _sig_s1_T = {63'h0, io_in_near_path_sig_raw} << io_in_near_path_lzc;	// @[FADD.scala:433:41]
  wire [48:0]  near_path_sig_cor = io_in_near_path_lza_error ? {_sig_s1_T[47:0], 1'h0} : _sig_s1_T[48:0];	// @[Cat.scala:33:92, FADD.scala:433:{41,48}, :434:{19,62}]
  wire [7:0]   near_path_exp_rounded = {7'h0, _near_path_rounder_io_cout} + near_path_res_exp;	// @[FADD.scala:399:55, :431:27, :458:57, RoundingUnit.scala:46:25]
  wire         near_path_zero_sign = io_in_rm == 3'h2;	// @[FADD.scala:460:38]
  wire         near_path_ix = _near_path_rounder_io_inexact | (&near_path_exp_rounded);	// @[FADD.scala:458:57, :467:44, :468:51, RoundingUnit.scala:46:25]
  wire         common_overflow = io_in_sel_far_path & far_path_of | ~io_in_sel_far_path & (&near_path_exp_rounded);	// @[FADD.scala:412:57, :458:57, :467:44, :473:{18,33,36,50}]
  wire         rmin = io_in_rm == 3'h1 | near_path_zero_sign & ~io_in_far_path_out_sign | io_in_rm == 3'h3 & io_in_far_path_out_sign;	// @[FADD.scala:460:38, RoundingUnit.scala:58:{8,31,34,41,48,56}]
  TininessRounder far_path_tininess_rounder (	// @[FADD.scala:387:41]
    .io_in_sign  (io_in_far_path_out_sign),
    .io_in_sig   (_far_path_res_sig_WIRE),	// @[Mux.scala:27:73]
    .io_rm       (io_in_rm),
    .io_tininess (_far_path_tininess_rounder_io_tininess)
  );
  RoundingUnit far_path_rounder (	// @[RoundingUnit.scala:46:25]
    .io_in       (_far_path_res_sig_WIRE[25:3]),	// @[FADD.scala:393:27, Mux.scala:27:73, RoundingUnit.scala:47:33]
    .io_roundIn  (_far_path_res_sig_WIRE[2]),	// @[FADD.scala:393:27, Mux.scala:27:73, RoundingUnit.scala:48:{38,50}]
    .io_stickyIn (|(_far_path_res_sig_WIRE[1:0])),	// @[FADD.scala:393:27, Mux.scala:27:73, RoundingUnit.scala:49:{39,54}]
    .io_signIn   (io_in_far_path_out_sign),
    .io_rm       (io_in_rm),
    .io_out      (_far_path_rounder_io_out),
    .io_inexact  (_far_path_rounder_io_inexact),
    .io_cout     (_far_path_rounder_io_cout)
  );
  TininessRounder near_path_tininess_rounder (	// @[FADD.scala:446:42]
    .io_in_sign  (io_in_near_path_out_sign),
    .io_in_sig   ({near_path_sig_cor[48:23], |(near_path_sig_cor[22:0])}),	// @[FADD.scala:434:19, :443:{45,57,82,94}]
    .io_rm       (io_in_rm),
    .io_tininess (_near_path_tininess_rounder_io_tininess)
  );
  RoundingUnit near_path_rounder (	// @[RoundingUnit.scala:46:25]
    .io_in       (near_path_sig_cor[47:25]),	// @[FADD.scala:434:19, :452:28, RoundingUnit.scala:47:33]
    .io_roundIn  (near_path_sig_cor[24]),	// @[FADD.scala:434:19, :452:28, RoundingUnit.scala:48:{38,50}]
    .io_stickyIn (|{near_path_sig_cor[23], |(near_path_sig_cor[22:0])}),	// @[FADD.scala:434:19, :443:{82,94}, :452:28, RoundingUnit.scala:49:{39,54}]
    .io_signIn   (io_in_near_path_out_sign),
    .io_rm       (io_in_rm),
    .io_out      (_near_path_rounder_io_out),
    .io_inexact  (_near_path_rounder_io_inexact),
    .io_cout     (_near_path_rounder_io_cout)
  );
  assign io_result = io_in_special_case_valid ? (io_in_special_case_bits_nan ? 32'h7FC00000 : {io_in_special_case_bits_inf_sign, 31'h7F800000}) : common_overflow ? {io_in_sel_far_path ? io_in_far_path_out_sign : io_in_near_path_out_sign, 7'h7F, ~rmin, {23{rmin}}} : io_in_sel_far_path ? {io_in_far_path_out_sign, {7'h0, _far_path_rounder_io_cout} + _far_path_res_exp_WIRE, _far_path_rounder_io_out} : {io_in_near_path_out_sign & ~near_path_is_zero | near_path_zero_sign & near_path_is_zero, near_path_exp_rounded, _near_path_rounder_io_out};	// @[Cat.scala:33:92, FADD.scala:347:32, :399:55, :425:49, :458:57, :460:38, :462:{21,24,44,68}, :473:33, :475:8, :477:32, :483:8, :496:19, :499:8, :502:10, Mux.scala:27:73, RoundingUnit.scala:46:25, :58:41]
  assign io_fflags = io_in_special_case_valid ? {io_in_special_case_bits_iv, 4'h0} : {2'h0, common_overflow, io_in_sel_far_path & io_in_small_add & _far_path_tininess_rounder_io_tininess & ~io_in_far_path_mul_of & far_path_ix | ~io_in_sel_far_path & _near_path_tininess_rounder_io_tininess & near_path_ix, io_in_sel_far_path & far_path_ix | ~io_in_sel_far_path & near_path_ix};	// @[Cat.scala:33:92, FADD.scala:387:41, :404:46, :413:49, :446:42, :468:51, :473:{33,36}, :485:{18,33,50}, :487:{18,33,50}, :505:19]
endmodule
