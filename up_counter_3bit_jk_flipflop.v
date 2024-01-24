//3bit up counter using jk flipflop
module count(input clk,clr, output [2:0]o);    
jkff aa(1,1,clk,clr,o[0]);
jkff bb(o[0],o[0],clk,clr,o[1]);
jkff cc(o[0]&o[1],o[0]&o[1],clk,clr,o[2]);
endmodule

//jk flip flop
module jkff(input j,k,clk,clr, output reg q);
always@(negedge clk or posedge clr)
if(clr == 1)
q<=0;
else
begin
case({j,k})
2'b00: q<=q;
2'b01: q<=0;
2'b10: q<=1;
2'b11: q<=~q;
endcase
end
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