/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_4_bit_ALU (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  

  always @(posedge clk) begin
    case(uio_in)
      2'b00: uo_out = ui_in[0:3] + ui_in[4:7];
      2'b01: uo_out = ui_in[0:3] * ui_in[4:7];
      2'b10: uo_out = ui_in[0:3] - ui_in[4:7];
      2'b11: uo_out = ui_in[0:3] / ui_in[4:7];
      default: out_out = 0;
    endcase
  end
  

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
