//d flipflop
module dff(input d, clk, output reg q, qbar);

always @(posedge clk)
  begin
  q <= d;
  qbar <= ~d;
  end
endmodule 

//testbench
module flipfloptb();
reg d, clk;
wire q, qbar;

dff dut(.q(q), .qbar(qbar), .d(d), .clk(clk));
initial begin
  clk=0;
     forever #10 clk = ~clk;  
end 
initial begin 
d = 0;
#100
d = 1;
#100
$finish;
end 
endmodule
