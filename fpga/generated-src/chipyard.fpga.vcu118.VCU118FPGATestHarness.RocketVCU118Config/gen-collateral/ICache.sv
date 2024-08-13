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

module ICache(
  input         clock,
                reset,
                auto_master_out_a_ready,
                auto_master_out_d_valid,
  input  [2:0]  auto_master_out_d_bits_opcode,
  input  [3:0]  auto_master_out_d_bits_size,
  input  [63:0] auto_master_out_d_bits_data,
  input         auto_master_out_d_bits_corrupt,
                io_req_valid,
  input  [38:0] io_req_bits_addr,
  input  [31:0] io_s1_paddr,
  input         io_s1_kill,
                io_s2_kill,
                io_invalidate,
  output        auto_master_out_a_valid,
  output [31:0] auto_master_out_a_bits_address,
  output        io_resp_valid,
  output [31:0] io_resp_bits_data,
  output        io_resp_bits_replay,
                io_resp_bits_ae
);

  wire         data_arrays_1_dout_1_en;	// @[ICache.scala:582:46]
  wire         data_arrays_1_MPORT_2_mask_3;	// @[ICache.scala:578:102]
  wire         data_arrays_1_MPORT_2_mask_2;	// @[ICache.scala:578:102]
  wire         data_arrays_1_MPORT_2_mask_1;	// @[ICache.scala:578:102]
  wire         data_arrays_1_MPORT_2_mask_0;	// @[ICache.scala:578:102]
  wire [31:0]  _WIRE_2_3;	// @[ICache.scala:575:71]
  wire         data_arrays_1_MPORT_2_en;	// @[ICache.scala:562:32]
  wire         data_arrays_0_dout_en;	// @[ICache.scala:582:46]
  wire         data_arrays_0_MPORT_1_mask_3;	// @[ICache.scala:578:102]
  wire         data_arrays_0_MPORT_1_mask_2;	// @[ICache.scala:578:102]
  wire         data_arrays_0_MPORT_1_mask_1;	// @[ICache.scala:578:102]
  wire         data_arrays_0_MPORT_1_mask_0;	// @[ICache.scala:578:102]
  wire [31:0]  _WIRE_1_3;	// @[ICache.scala:575:71]
  wire         data_arrays_0_MPORT_1_en;	// @[ICache.scala:562:32]
  wire         s1_tag_hit_3;	// @[ICache.scala:506:26]
  wire         s1_tag_hit_2;	// @[ICache.scala:506:26]
  wire         s1_tag_hit_1;	// @[ICache.scala:506:26]
  wire         s1_tag_hit_0;	// @[ICache.scala:506:26]
  wire         tag_array_MPORT_mask_3;	// @[ICache.scala:428:97]
  wire         tag_array_MPORT_mask_2;	// @[ICache.scala:428:97]
  wire         tag_array_MPORT_mask_1;	// @[ICache.scala:428:97]
  wire         tag_array_MPORT_mask_0;	// @[ICache.scala:428:97]
  wire         refillError;	// @[ICache.scala:422:43]
  wire         tag_array_tag_rdata_en;	// @[ICache.scala:418:83]
  wire [5:0]   _tag_rdata_T_4;	// @[ICache.scala:418:42]
  wire         _io_req_ready_T_2;	// @[ICache.scala:386:19]
  wire         tl_out_a_valid;	// @[ICache.scala:377:35]
  wire [127:0] _data_arrays_1_RW0_rdata;	// @[DescribedSRAM.scala:17:26]
  wire [127:0] _data_arrays_0_RW0_rdata;	// @[DescribedSRAM.scala:17:26]
  wire [83:0]  _tag_array_RW0_rdata;	// @[DescribedSRAM.scala:17:26]
  wire         _repl_way_v0_prng_io_out_0;	// @[PRNG.scala:91:22]
  wire         _repl_way_v0_prng_io_out_1;	// @[PRNG.scala:91:22]
  wire         _repl_way_v0_prng_io_out_2;	// @[PRNG.scala:91:22]
  wire         _repl_way_v0_prng_io_out_3;	// @[PRNG.scala:91:22]
  wire         _repl_way_v0_prng_io_out_4;	// @[PRNG.scala:91:22]
  wire         _repl_way_v0_prng_io_out_5;	// @[PRNG.scala:91:22]
  wire         _repl_way_v0_prng_io_out_6;	// @[PRNG.scala:91:22]
  wire         _repl_way_v0_prng_io_out_7;	// @[PRNG.scala:91:22]
  wire         _repl_way_v0_prng_io_out_8;	// @[PRNG.scala:91:22]
  wire         _repl_way_v0_prng_io_out_9;	// @[PRNG.scala:91:22]
  wire         _repl_way_v0_prng_io_out_10;	// @[PRNG.scala:91:22]
  wire         _repl_way_v0_prng_io_out_11;	// @[PRNG.scala:91:22]
  wire         _repl_way_v0_prng_io_out_12;	// @[PRNG.scala:91:22]
  wire         _repl_way_v0_prng_io_out_13;	// @[PRNG.scala:91:22]
  wire         _repl_way_v0_prng_io_out_14;	// @[PRNG.scala:91:22]
  wire         _repl_way_v0_prng_io_out_15;	// @[PRNG.scala:91:22]
  wire         s0_valid = _io_req_ready_T_2 & io_req_valid;	// @[Decoupled.scala:51:35, ICache.scala:386:19]
  reg          s1_valid;	// @[ICache.scala:333:25]
  wire         s1_hit = s1_tag_hit_0 | s1_tag_hit_1 | s1_tag_hit_2 | s1_tag_hit_3;	// @[ICache.scala:353:{35,40}, :506:26]
  reg          s2_valid;	// @[ICache.scala:355:25]
  reg          s2_hit;	// @[ICache.scala:356:23]
  reg          invalidated;	// @[ICache.scala:359:24]
  reg          refill_valid;	// @[ICache.scala:360:29]
  wire         _refill_fire_T = auto_master_out_a_ready & tl_out_a_valid;	// @[Decoupled.scala:51:35, ICache.scala:377:35]
  wire         s2_miss = s2_valid & ~s2_hit & ~io_s2_kill;	// @[ICache.scala:355:25, :356:23, :370:{29,37,40}]
  reg          s2_request_refill_REG;	// @[ICache.scala:377:45]
  assign tl_out_a_valid = s2_miss & s2_request_refill_REG;	// @[ICache.scala:370:37, :377:{35,45}]
  reg  [31:0]  refill_paddr;	// @[Reg.scala:19:16]
  wire         refill_one_beat = auto_master_out_d_valid & auto_master_out_d_bits_opcode[0];	// @[Edges.scala:106:36, ICache.scala:383:41]
  assign _io_req_ready_T_2 = ~refill_one_beat;	// @[ICache.scala:383:41, :386:19]
  wire [26:0]  _beats1_decode_T_1 = 27'hFFF << auto_master_out_d_bits_size;	// @[package.scala:235:71]
  wire [8:0]   beats1 = auto_master_out_d_bits_opcode[0] ? ~(_beats1_decode_T_1[11:3]) : 9'h0;	// @[Edges.scala:106:36, :221:14, :229:27, package.scala:235:{46,71,76}]
  reg  [8:0]   counter;	// @[Edges.scala:229:27]
  wire [8:0]   counter1 = counter - 9'h1;	// @[Edges.scala:229:27, :230:28]
  wire [8:0]   refill_cnt = beats1 & ~counter1;	// @[Edges.scala:221:14, :230:28, :234:{25,27}]
  wire         tag_array_MPORT_en = refill_one_beat & (counter == 9'h1 | beats1 == 9'h0) & auto_master_out_d_valid;	// @[Edges.scala:221:14, :229:27, :232:{25,33,43}, ICache.scala:383:41, :391:37]
  wire [1:0]   repl_way_v0 = {_repl_way_v0_prng_io_out_1, _repl_way_v0_prng_io_out_0};	// @[ICache.scala:399:35, PRNG.scala:91:22]
  assign _tag_rdata_T_4 = io_req_bits_addr[11:6];	// @[ICache.scala:418:42]
  assign tag_array_tag_rdata_en = ~tag_array_MPORT_en & s0_valid;	// @[Decoupled.scala:51:35, ICache.scala:391:37, :418:{70,83}]
  reg          accruedRefillError;	// @[ICache.scala:420:31]
  assign refillError = auto_master_out_d_bits_corrupt | (|refill_cnt) & accruedRefillError;	// @[Edges.scala:234:25, ICache.scala:420:31, :422:{43,58,64}]
  assign tag_array_MPORT_mask_0 = ~(|repl_way_v0);	// @[ICache.scala:399:35, :428:97]
  assign tag_array_MPORT_mask_1 = repl_way_v0 == 2'h1;	// @[ICache.scala:399:35, :428:97]
  assign tag_array_MPORT_mask_2 = repl_way_v0 == 2'h2;	// @[ICache.scala:399:35, :403:40, :428:97]
  assign tag_array_MPORT_mask_3 = &repl_way_v0;	// @[ICache.scala:399:35, :428:97]
  reg  [255:0] vb_array;	// @[ICache.scala:440:25]
  wire [255:0] _s1_vb_T_1 = vb_array >> io_s1_paddr[11:6];	// @[ICache.scala:440:25, :500:25, :850:21]
  assign s1_tag_hit_0 = _s1_vb_T_1[0] & _tag_array_RW0_rdata[19:0] == io_s1_paddr[31:12];	// @[DescribedSRAM.scala:17:26, ICache.scala:485:30, :500:25, :506:{26,33}, package.scala:155:13]
  wire [255:0] _s1_vb_T_5 = vb_array >> {250'h1, io_s1_paddr[11:6]};	// @[ICache.scala:440:25, :500:25, :850:21]
  assign s1_tag_hit_1 = _s1_vb_T_5[0] & _tag_array_RW0_rdata[40:21] == io_s1_paddr[31:12];	// @[DescribedSRAM.scala:17:26, ICache.scala:485:30, :500:25, :506:{26,33}, package.scala:155:13]
  wire [255:0] _s1_vb_T_9 = vb_array >> {250'h2, io_s1_paddr[11:6]};	// @[ICache.scala:440:25, :500:25, :850:21]
  assign s1_tag_hit_2 = _s1_vb_T_9[0] & _tag_array_RW0_rdata[61:42] == io_s1_paddr[31:12];	// @[DescribedSRAM.scala:17:26, ICache.scala:485:30, :500:25, :506:{26,33}, package.scala:155:13]
  wire [255:0] _s1_vb_T_13 = vb_array >> {250'h3, io_s1_paddr[11:6]};	// @[ICache.scala:440:25, :500:25, :850:21]
  assign s1_tag_hit_3 = _s1_vb_T_13[0] & _tag_array_RW0_rdata[82:63] == io_s1_paddr[31:12];	// @[DescribedSRAM.scala:17:26, ICache.scala:485:30, :500:25, :506:{26,33}, package.scala:155:13]
  assign data_arrays_0_MPORT_1_en = refill_one_beat & ~invalidated;	// @[ICache.scala:359:24, :383:41, :562:{32,35}]
  wire [8:0]   _mem_idx_T_6 = {refill_paddr[11:6], 3'h0};	// @[ICache.scala:566:40, :850:21, Reg.scala:19:16]
  assign _WIRE_1_3 = auto_master_out_d_bits_data[31:0];	// @[ICache.scala:575:71]
  assign data_arrays_0_MPORT_1_mask_0 = ~(|repl_way_v0);	// @[ICache.scala:399:35, :428:97, :578:102]
  assign data_arrays_0_MPORT_1_mask_1 = repl_way_v0 == 2'h1;	// @[ICache.scala:399:35, :428:97, :578:102]
  assign data_arrays_0_MPORT_1_mask_2 = repl_way_v0 == 2'h2;	// @[ICache.scala:399:35, :403:40, :578:102]
  assign data_arrays_0_MPORT_1_mask_3 = &repl_way_v0;	// @[ICache.scala:399:35, :578:102]
  assign data_arrays_0_dout_en = ~data_arrays_0_MPORT_1_en & s0_valid & ~(io_req_bits_addr[2]);	// @[Decoupled.scala:51:35, ICache.scala:556:111, :562:32, :582:{41,46}, package.scala:155:13]
  assign data_arrays_1_MPORT_2_en = refill_one_beat & ~invalidated;	// @[ICache.scala:359:24, :383:41, :562:{32,35}]
  assign _WIRE_2_3 = auto_master_out_d_bits_data[63:32];	// @[ICache.scala:575:71]
  assign data_arrays_1_MPORT_2_mask_0 = ~(|repl_way_v0);	// @[ICache.scala:399:35, :428:97, :578:102]
  assign data_arrays_1_MPORT_2_mask_1 = repl_way_v0 == 2'h1;	// @[ICache.scala:399:35, :428:97, :578:102]
  assign data_arrays_1_MPORT_2_mask_2 = repl_way_v0 == 2'h2;	// @[ICache.scala:399:35, :403:40, :578:102]
  assign data_arrays_1_MPORT_2_mask_3 = &repl_way_v0;	// @[ICache.scala:399:35, :578:102]
  assign data_arrays_1_dout_1_en = ~data_arrays_1_MPORT_2_en & s0_valid & io_req_bits_addr[2];	// @[Decoupled.scala:51:35, ICache.scala:562:32, :582:{41,46}, package.scala:155:13]
  reg          s2_tag_hit_0;	// @[Reg.scala:19:16]
  reg          s2_tag_hit_1;	// @[Reg.scala:19:16]
  reg          s2_tag_hit_2;	// @[Reg.scala:19:16]
  reg          s2_tag_hit_3;	// @[Reg.scala:19:16]
  reg  [31:0]  s2_dout_0;	// @[Reg.scala:19:16]
  reg  [31:0]  s2_dout_1;	// @[Reg.scala:19:16]
  reg  [31:0]  s2_dout_2;	// @[Reg.scala:19:16]
  reg  [31:0]  s2_dout_3;	// @[Reg.scala:19:16]
  reg          s2_tag_disparity_r_0;	// @[Reg.scala:19:16]
  reg          s2_tag_disparity_r_1;	// @[Reg.scala:19:16]
  reg          s2_tag_disparity_r_2;	// @[Reg.scala:19:16]
  reg          s2_tag_disparity_r_3;	// @[Reg.scala:19:16]
  wire [3:0]   _s2_tag_disparity_T = {s2_tag_disparity_r_3, s2_tag_disparity_r_2, s2_tag_disparity_r_1, s2_tag_disparity_r_0};	// @[ICache.scala:606:65, Reg.scala:19:16]
  reg          s2_tl_error;	// @[Reg.scala:19:16]
  wire         invalidate = s2_valid & (|_s2_tag_disparity_T) | io_invalidate;	// @[ICache.scala:355:25, :448:31, :606:{65,72}, :644:{22,39,52}]
  wire [255:0] _vb_array_T_3 = 256'h1 << {248'h0, _repl_way_v0_prng_io_out_1, _repl_way_v0_prng_io_out_0, refill_paddr[11:6]};	// @[ICache.scala:444:32, :850:21, PRNG.scala:91:22, Reg.scala:19:16]
  wire         _s1_can_request_refill_T = s2_miss | refill_valid;	// @[ICache.scala:360:29, :370:37, :372:41]
  always @(posedge clock) begin
    if (reset) begin
      s1_valid <= 1'h0;	// @[ICache.scala:333:25]
      s2_valid <= 1'h0;	// @[ICache.scala:355:25]
      refill_valid <= 1'h0;	// @[ICache.scala:360:29]
      counter <= 9'h0;	// @[Edges.scala:229:27]
      vb_array <= 256'h0;	// @[ICache.scala:440:25]
    end
    else begin
      s1_valid <= s0_valid;	// @[Decoupled.scala:51:35, ICache.scala:333:25]
      s2_valid <= s1_valid & ~io_s1_kill;	// @[ICache.scala:333:25, :355:{25,35,38}]
      refill_valid <= ~tag_array_MPORT_en & (_refill_fire_T | refill_valid);	// @[Decoupled.scala:51:35, ICache.scala:360:29, :391:37, :821:{22,37}, :822:{22,37}]
      if (auto_master_out_d_valid) begin
        if (counter == 9'h0) begin	// @[Edges.scala:229:27, :231:25]
          if (auto_master_out_d_bits_opcode[0])	// @[Edges.scala:106:36]
            counter <= ~(_beats1_decode_T_1[11:3]);	// @[Edges.scala:229:27, package.scala:235:{46,71,76}]
          else	// @[Edges.scala:106:36]
            counter <= 9'h0;	// @[Edges.scala:229:27]
        end
        else	// @[Edges.scala:231:25]
          counter <= counter1;	// @[Edges.scala:229:27, :230:28]
      end
      if (invalidate)	// @[ICache.scala:448:31, :644:{39,52}]
        vb_array <= 256'h0;	// @[ICache.scala:440:25]
      else if (refill_one_beat) begin	// @[ICache.scala:383:41]
        if (tag_array_MPORT_en & ~invalidated)	// @[ICache.scala:359:24, :391:37, :444:{72,75}]
          vb_array <= vb_array | _vb_array_T_3;	// @[ICache.scala:440:25, :444:32]
        else	// @[ICache.scala:444:72]
          vb_array <= ~(~vb_array | _vb_array_T_3);	// @[ICache.scala:440:25, :444:32]
      end
    end
    s2_hit <= s1_hit;	// @[ICache.scala:353:40, :356:23]
    invalidated <= refill_valid & (invalidate | invalidated);	// @[ICache.scala:359:24, :360:29, :448:31, :449:21, :451:17, :644:{39,52}, :820:{24,38}]
    s2_request_refill_REG <= ~_s1_can_request_refill_T;	// @[ICache.scala:372:{31,41}, :377:45]
    if (s1_valid & ~_s1_can_request_refill_T)	// @[ICache.scala:333:25, :372:{31,41}, :378:54]
      refill_paddr <= io_s1_paddr;	// @[Reg.scala:19:16]
    if (refill_one_beat)	// @[ICache.scala:383:41]
      accruedRefillError <= refillError;	// @[ICache.scala:420:31, :422:43]
    if (s1_valid) begin	// @[ICache.scala:333:25]
      s2_tag_hit_0 <= s1_tag_hit_0;	// @[ICache.scala:506:26, Reg.scala:19:16]
      s2_tag_hit_1 <= s1_tag_hit_1;	// @[ICache.scala:506:26, Reg.scala:19:16]
      s2_tag_hit_2 <= s1_tag_hit_2;	// @[ICache.scala:506:26, Reg.scala:19:16]
      s2_tag_hit_3 <= s1_tag_hit_3;	// @[ICache.scala:506:26, Reg.scala:19:16]
      if (io_s1_paddr[2]) begin	// @[package.scala:155:13]
        s2_dout_0 <= _data_arrays_1_RW0_rdata[31:0];	// @[DescribedSRAM.scala:17:26, Reg.scala:19:16]
        s2_dout_1 <= _data_arrays_1_RW0_rdata[63:32];	// @[DescribedSRAM.scala:17:26, Reg.scala:19:16]
        s2_dout_2 <= _data_arrays_1_RW0_rdata[95:64];	// @[DescribedSRAM.scala:17:26, Reg.scala:19:16]
        s2_dout_3 <= _data_arrays_1_RW0_rdata[127:96];	// @[DescribedSRAM.scala:17:26, Reg.scala:19:16]
      end
      else begin	// @[package.scala:155:13]
        s2_dout_0 <= _data_arrays_0_RW0_rdata[31:0];	// @[DescribedSRAM.scala:17:26, Reg.scala:19:16]
        s2_dout_1 <= _data_arrays_0_RW0_rdata[63:32];	// @[DescribedSRAM.scala:17:26, Reg.scala:19:16]
        s2_dout_2 <= _data_arrays_0_RW0_rdata[95:64];	// @[DescribedSRAM.scala:17:26, Reg.scala:19:16]
        s2_dout_3 <= _data_arrays_0_RW0_rdata[127:96];	// @[DescribedSRAM.scala:17:26, Reg.scala:19:16]
      end
      s2_tl_error <= |{s1_tag_hit_3 & _tag_array_RW0_rdata[83], s1_tag_hit_2 & _tag_array_RW0_rdata[62], s1_tag_hit_1 & _tag_array_RW0_rdata[41], s1_tag_hit_0 & _tag_array_RW0_rdata[20]};	// @[DescribedSRAM.scala:17:26, ICache.scala:506:26, :510:32, :607:{43,50}, Reg.scala:19:16, package.scala:155:13]
    end
    s2_tag_disparity_r_0 <= ~s1_valid & s2_tag_disparity_r_0;	// @[ICache.scala:333:25, Reg.scala:19:16, :20:{18,22}]
    s2_tag_disparity_r_1 <= ~s1_valid & s2_tag_disparity_r_1;	// @[ICache.scala:333:25, Reg.scala:19:16, :20:{18,22}]
    s2_tag_disparity_r_2 <= ~s1_valid & s2_tag_disparity_r_2;	// @[ICache.scala:333:25, Reg.scala:19:16, :20:{18,22}]
    s2_tag_disparity_r_3 <= ~s1_valid & s2_tag_disparity_r_3;	// @[ICache.scala:333:25, Reg.scala:19:16, :20:{18,22}]
  end // always @(posedge)
  `ifndef SYNTHESIS
    always @(posedge clock) begin	// @[ICache.scala:513:9]
      if (~reset & ~(~s1_valid | {1'h0, {1'h0, s1_tag_hit_0} + {1'h0, s1_tag_hit_1}} + {1'h0, {1'h0, s1_tag_hit_2} + {1'h0, s1_tag_hit_3}} < 3'h2)) begin	// @[Bitwise.scala:51:90, ICache.scala:333:25, :506:26, :513:{9,10,39,115}]
        if (`ASSERT_VERBOSE_COND_)	// @[ICache.scala:513:9]
          $error("Assertion failed\n    at ICache.scala:513 assert(!(s1_valid || s1_slaveValid) || PopCount(s1_tag_hit zip s1_tag_disparity map { case (h, d) => h && !d }) <= 1.U)\n");	// @[ICache.scala:513:9]
        if (`STOP_COND_)	// @[ICache.scala:513:9]
          $fatal;	// @[ICache.scala:513:9]
      end
    end // always @(posedge)
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
    logic [31:0] _RANDOM_14;
    logic [31:0] _RANDOM_15;
    logic [31:0] _RANDOM_16;
    logic [31:0] _RANDOM_17;
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
        _RANDOM_14 = `RANDOM;
        _RANDOM_15 = `RANDOM;
        _RANDOM_16 = `RANDOM;
        _RANDOM_17 = `RANDOM;
        s1_valid = _RANDOM_0[4];	// @[ICache.scala:333:25]
        s2_valid = _RANDOM_1[12];	// @[ICache.scala:355:25]
        s2_hit = _RANDOM_1[13];	// @[ICache.scala:355:25, :356:23]
        invalidated = _RANDOM_1[14];	// @[ICache.scala:355:25, :359:24]
        refill_valid = _RANDOM_1[15];	// @[ICache.scala:355:25, :360:29]
        s2_request_refill_REG = _RANDOM_1[18];	// @[ICache.scala:355:25, :377:45]
        refill_paddr = {_RANDOM_1[31:19], _RANDOM_2[18:0]};	// @[ICache.scala:355:25, Reg.scala:19:16]
        counter = {_RANDOM_3[31:26], _RANDOM_4[2:0]};	// @[Edges.scala:229:27]
        accruedRefillError = _RANDOM_4[3];	// @[Edges.scala:229:27, ICache.scala:420:31]
        vb_array = {_RANDOM_4[31:4], _RANDOM_5, _RANDOM_6, _RANDOM_7, _RANDOM_8, _RANDOM_9, _RANDOM_10, _RANDOM_11, _RANDOM_12[3:0]};	// @[Edges.scala:229:27, ICache.scala:440:25]
        s2_tag_hit_0 = _RANDOM_13[18];	// @[Reg.scala:19:16]
        s2_tag_hit_1 = _RANDOM_13[19];	// @[Reg.scala:19:16]
        s2_tag_hit_2 = _RANDOM_13[20];	// @[Reg.scala:19:16]
        s2_tag_hit_3 = _RANDOM_13[21];	// @[Reg.scala:19:16]
        s2_dout_0 = {_RANDOM_13[31:22], _RANDOM_14[21:0]};	// @[Reg.scala:19:16]
        s2_dout_1 = {_RANDOM_14[31:22], _RANDOM_15[21:0]};	// @[Reg.scala:19:16]
        s2_dout_2 = {_RANDOM_15[31:22], _RANDOM_16[21:0]};	// @[Reg.scala:19:16]
        s2_dout_3 = {_RANDOM_16[31:22], _RANDOM_17[21:0]};	// @[Reg.scala:19:16]
        s2_tag_disparity_r_0 = _RANDOM_17[22];	// @[Reg.scala:19:16]
        s2_tag_disparity_r_1 = _RANDOM_17[23];	// @[Reg.scala:19:16]
        s2_tag_disparity_r_2 = _RANDOM_17[24];	// @[Reg.scala:19:16]
        s2_tag_disparity_r_3 = _RANDOM_17[25];	// @[Reg.scala:19:16]
        s2_tl_error = _RANDOM_17[26];	// @[Reg.scala:19:16]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  MaxPeriodFibonacciLFSR repl_way_v0_prng (	// @[PRNG.scala:91:22]
    .clock        (clock),
    .reset        (reset),
    .io_increment (_refill_fire_T),	// @[Decoupled.scala:51:35]
    .io_out_0     (_repl_way_v0_prng_io_out_0),
    .io_out_1     (_repl_way_v0_prng_io_out_1),
    .io_out_2     (_repl_way_v0_prng_io_out_2),
    .io_out_3     (_repl_way_v0_prng_io_out_3),
    .io_out_4     (_repl_way_v0_prng_io_out_4),
    .io_out_5     (_repl_way_v0_prng_io_out_5),
    .io_out_6     (_repl_way_v0_prng_io_out_6),
    .io_out_7     (_repl_way_v0_prng_io_out_7),
    .io_out_8     (_repl_way_v0_prng_io_out_8),
    .io_out_9     (_repl_way_v0_prng_io_out_9),
    .io_out_10    (_repl_way_v0_prng_io_out_10),
    .io_out_11    (_repl_way_v0_prng_io_out_11),
    .io_out_12    (_repl_way_v0_prng_io_out_12),
    .io_out_13    (_repl_way_v0_prng_io_out_13),
    .io_out_14    (_repl_way_v0_prng_io_out_14),
    .io_out_15    (_repl_way_v0_prng_io_out_15)
  );
  tag_array_0 tag_array (	// @[DescribedSRAM.scala:17:26]
    .RW0_addr  (tag_array_MPORT_en ? refill_paddr[11:6] : _tag_rdata_T_4),	// @[DescribedSRAM.scala:17:26, ICache.scala:391:37, :418:42, :850:21, Reg.scala:19:16]
    .RW0_en    (tag_array_tag_rdata_en | tag_array_MPORT_en),	// @[DescribedSRAM.scala:17:26, ICache.scala:391:37, :418:83]
    .RW0_clk   (clock),
    .RW0_wmode (tag_array_MPORT_en),	// @[ICache.scala:391:37]
    .RW0_wdata ({refillError, refill_paddr[31:12], refillError, refill_paddr[31:12], refillError, refill_paddr[31:12], refillError, refill_paddr[31:12]}),	// @[DescribedSRAM.scala:17:26, ICache.scala:380:33, :422:43, Reg.scala:19:16]
    .RW0_wmask ({tag_array_MPORT_mask_3, tag_array_MPORT_mask_2, tag_array_MPORT_mask_1, tag_array_MPORT_mask_0}),	// @[DescribedSRAM.scala:17:26, ICache.scala:428:97]
    .RW0_rdata (_tag_array_RW0_rdata)
  );
  data_arrays_0_0 data_arrays_0 (	// @[DescribedSRAM.scala:17:26]
    .RW0_addr  (refill_one_beat ? _mem_idx_T_6 | refill_cnt : io_req_bits_addr[11:3]),	// @[Edges.scala:234:25, ICache.scala:383:41, :557:31, :566:{10,40,67}]
    .RW0_en    (data_arrays_0_dout_en | data_arrays_0_MPORT_1_en),	// @[DescribedSRAM.scala:17:26, ICache.scala:562:32, :582:46]
    .RW0_clk   (clock),
    .RW0_wmode (data_arrays_0_MPORT_1_en),	// @[ICache.scala:562:32]
    .RW0_wdata ({4{_WIRE_1_3}}),	// @[DescribedSRAM.scala:17:26, ICache.scala:575:71]
    .RW0_wmask ({data_arrays_0_MPORT_1_mask_3, data_arrays_0_MPORT_1_mask_2, data_arrays_0_MPORT_1_mask_1, data_arrays_0_MPORT_1_mask_0}),	// @[DescribedSRAM.scala:17:26, ICache.scala:578:102]
    .RW0_rdata (_data_arrays_0_RW0_rdata)
  );
  data_arrays_1 data_arrays_1 (	// @[DescribedSRAM.scala:17:26]
    .RW0_addr  (refill_one_beat ? _mem_idx_T_6 | refill_cnt : io_req_bits_addr[11:3]),	// @[Edges.scala:234:25, ICache.scala:383:41, :557:31, :566:{10,40,67}]
    .RW0_en    (data_arrays_1_dout_1_en | data_arrays_1_MPORT_2_en),	// @[DescribedSRAM.scala:17:26, ICache.scala:562:32, :582:46]
    .RW0_clk   (clock),
    .RW0_wmode (data_arrays_1_MPORT_2_en),	// @[ICache.scala:562:32]
    .RW0_wdata ({4{_WIRE_2_3}}),	// @[DescribedSRAM.scala:17:26, ICache.scala:575:71]
    .RW0_wmask ({data_arrays_1_MPORT_2_mask_3, data_arrays_1_MPORT_2_mask_2, data_arrays_1_MPORT_2_mask_1, data_arrays_1_MPORT_2_mask_0}),	// @[DescribedSRAM.scala:17:26, ICache.scala:578:102]
    .RW0_rdata (_data_arrays_1_RW0_rdata)
  );
  assign auto_master_out_a_valid = tl_out_a_valid;	// @[ICache.scala:377:35]
  assign auto_master_out_a_bits_address = {refill_paddr[31:6], 6'h0};	// @[ICache.scala:434:40, :760:64, Reg.scala:19:16]
  assign io_resp_valid = s2_valid & s2_hit;	// @[ICache.scala:355:25, :356:23, :650:33]
  assign io_resp_bits_data = (s2_tag_hit_0 ? s2_dout_0 : 32'h0) | (s2_tag_hit_1 ? s2_dout_1 : 32'h0) | (s2_tag_hit_2 ? s2_dout_2 : 32'h0) | (s2_tag_hit_3 ? s2_dout_3 : 32'h0);	// @[Bundles.scala:259:74, Mux.scala:27:73, Reg.scala:19:16]
  assign io_resp_bits_replay = |_s2_tag_disparity_T;	// @[ICache.scala:606:{65,72}]
  assign io_resp_bits_ae = s2_tl_error;	// @[Reg.scala:19:16]
endmodule

