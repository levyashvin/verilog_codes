//synchronous counter for 0-3-5-7-2-1-0 sequence
module count(input clk,clr, output [2:0]o);    
dff aa(((~o[0])&o[1]&o[2]|o[0]&~o[1]),clk,clr,o[0]);
dff bb(o[0]|~(o[1]|o[2]),clk,clr,o[1]);
dff cc(~o[2]|(o[1]^o[0]),clk,clr,o[2]);
endmodule

//d flip flop
module dff(input d,clk,clr, output reg q);
always@(negedge clk or posedge clr)
if(clr == 1)
q<=0;
else if(d == 1)
q<=1;
else
q<= 0;
endmodule

//testbench
module testbench();
reg clk,clr;
wire [2:0]o;
count dut(clk,clr,o);
always #1 clk=~clk;
initial
begin
clk = 1; clr = 1;
#4 clr = 0;
#40 $finish;
end
endmodule