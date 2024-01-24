//sequence 010 nonoverlapping
module dff(input d,clk,clr,output reg q);
always@(posedge clk or posedge clr)
begin
if(clr)
q <= 0;
else
q <= d;
end
endmodule

module mealyseq(input in,clk,clr,output out);
dff da(q2&in,clk,clr,q1);
dff db(~q1&~in,clk,clr,q2);
assign out = q1&~in;
endmodule

//testbench
module tb();
reg clk,clr,in;
wire out;
mealyseq dut(in,clk,clr,out);

always #5 clk = ~clk;
initial begin
#2 clr = 0;
end
initial begin
clk = 0;
clr = 1;
in = 0;
#10 in  = 1;
#10 in  = 0;
#10 in  = 1;
#10 in  = 0;
#10 in  = 1;
#10 in  = 1;
#10 in  = 0;
#10 in  = 1;
#10 in  = 0;
#10 in  = 0;
#10 $finish;
end
endmodule

//sequence 1111 overlapping
module dff(input d,clk,clr,output reg q);
always@(posedge clk or posedge clr)
begin
if(clr)
q <= 0;
else
q <= d;
end
endmodule

module mealyseq(input in,clk,clr,output out);
wire q1, q2;
dff da((q2&in)|(in&q1),clk,clr,q1);
dff db((q1&in)|(in&~q2),clk,clr,q2);
assign out = q1&q2&in;
endmodule

//testbench
module tb();
reg clk,clr,in;
wire out;
mealyseq dut(in,clk,clr,out);

always #5 clk = ~clk;
initial begin
#2 clr = 0;
end
initial begin
clk = 0;
clr = 1;
in = 0;
#10 in  = 1;
#10 in  = 0;
#10 in  = 1;
#10 in  = 1;
#10 in  = 1;
#10 in  = 1;
#10 in  = 0;
#10 in  = 1;
#10 in  = 1;
#10 in  = 1;
#10 in  = 1;
#10 in  = 1;
#10 in  = 0;
#10 $finish;
end
endmodule