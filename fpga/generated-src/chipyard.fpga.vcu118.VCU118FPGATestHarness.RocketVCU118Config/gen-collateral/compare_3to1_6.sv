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

module compare_3to1_6(
  input  [7:0] io_a,
               io_b,
               io_c,
  input        io_max,
               io_signed,
  output [7:0] io_d
);

  wire        _adder_xb_2_io_cout;	// @[Reduction.scala:653:26]
  wire        _adder_xb_1_io_cout;	// @[Reduction.scala:653:26]
  wire        _adder_xb_io_cout;	// @[Reduction.scala:653:26]
  wire [23:0] vs_lo_inv = ~{io_b, {2{io_c}}};	// @[Cat.scala:33:92, Reduction.scala:648:19]
  wire        less_0 = io_signed ? io_b[7] ^ vs_lo_inv[7] ^ _adder_xb_io_cout : ~_adder_xb_io_cout;	// @[Reduction.scala:648:19, :653:26, :658:{19,36,65,83,94}]
  wire        less_1 = io_signed ? io_a[7] ^ vs_lo_inv[15] ^ _adder_xb_1_io_cout : ~_adder_xb_1_io_cout;	// @[Reduction.scala:648:19, :653:26, :658:{19,36,65,83,94}]
  wire        less_2 = io_signed ? io_a[7] ^ vs_lo_inv[23] ^ _adder_xb_2_io_cout : ~_adder_xb_2_io_cout;	// @[Reduction.scala:648:19, :653:26, :658:{19,36,65,83,94}]
  Adder_xb_20 adder_xb (	// @[Reduction.scala:653:26]
    .io_in1  (vs_lo_inv[7:0]),	// @[Reduction.scala:648:19, :654:33]
    .io_in2  (io_b),
    .io_cout (_adder_xb_io_cout)
  );
  Adder_xb_20 adder_xb_1 (	// @[Reduction.scala:653:26]
    .io_in1  (vs_lo_inv[15:8]),	// @[Reduction.scala:648:19, :654:33]
    .io_in2  (io_a),
    .io_cout (_adder_xb_1_io_cout)
  );
  Adder_xb_20 adder_xb_2 (	// @[Reduction.scala:653:26]
    .io_in1  (vs_lo_inv[23:16]),	// @[Reduction.scala:648:19, :654:33]
    .io_in2  (io_a),
    .io_cout (_adder_xb_2_io_cout)
  );
  assign io_d = less_2 & less_1 & ~io_max | ~less_2 & ~less_1 & io_max ? io_a : ~less_2 & less_0 & ~io_max | less_2 & ~less_0 & io_max ? io_b : ~less_1 & ~less_0 & ~io_max | less_1 & less_0 & io_max ? io_c : 8'h0;	// @[Reduction.scala:658:19, :661:8, :662:{28,31,40,44,56,65,77}, :663:10, :664:{35,47,62,71,83}, :665:10, :666:{36,48,71,83}, :667:10]
endmodule

