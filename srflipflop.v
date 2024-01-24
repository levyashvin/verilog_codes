//sr flipflop
module srff(input s,r,clk,output reg q, qbar);
always@(posedge clk)
begin
    if(s == 1)
        begin q <= 1;qbar <= 0; end
    else if(r == 1)
        begin q <= 0;qbar <= 1; end
    else if(s == 0 & r == 0) 
        begin q <= q;qbar <= qbar;end
end
endmodule

//testbench
module flipfloptb();
reg s,r, clk;
wire q, qbar;

srff dut(.q(q), .qbar(qbar), .s(s), .r(r), .clk(clk));
initial begin
  clk=0;
     forever #10 clk = ~clk;  
end 
initial begin 
s = 1; r = 0;
#100;
s = 0; r = 1; 
#100;
s = 0;r = 0;
#100;
s = 1;r = 1; 
#100
$finish;
end 
endmodule