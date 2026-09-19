// tb.v
// Starter testbench template -- YOU complete this file.

module tb;


  // TODO: declare the inputs and outputs
reg  [1:0] t_sel;   // 2 bits wide (covers addresses 0 to 3)
  wire [7:0] t_dout;  // 8 bits wide

  // TODO: instantiate DUT here

 lut #(
    .WIDTH(8),
    .DEPTH(4)
  ) DUT (
    .sel(t_sel),
    .dout(t_dout)
  );


  // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end

  initial begin
    // TODO: apply different input combinations
    t_sel = 2'd0; #5;  // Read mem[0], should output 0
    t_sel = 2'd1; #5;  // Read mem[1], should output 1
    t_sel = 2'd2; #5;  // Read mem[2], should output 4
    t_sel = 2'd3; #5;  // Read mem[3], should output 9
    
    $finish;

  end

  initial
    $monitor($time, " sel=%d | dout=%d", t_sel, t_dout); // change as required

endmodule
