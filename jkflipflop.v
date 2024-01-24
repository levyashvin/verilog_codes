//jk flip flop
module jkff(input j, k, clk, output reg q, qbar);  
always @ (posedge clk)  
case ({j,k})  
    2'b00 :  begin q <= q; qbar <= ~q; end
    2'b01 :  begin q <= 0; qbar <= 1; end
    2'b10 :  begin q <= 1;  qbar <= 0; end
    2'b11 :  begin q <= ~q;  qbar <= q; end
endcase  
endmodule

//testbench
module flipfloptb();
reg j, k, clk;
wire q, qbar;

jkff dut(.q(q), .qbar(qbar), .j(j), .clk(clk), .k(k));
initial begin
  clk=0;
     forever #10 clk = ~clk;  
end 
initial begin 
j = 0;k = 0;
#100
j = 0;k = 1;
#100
j = 1;k = 0;
#100
j = 1;k = 1;
#100
$finish;
end 
endmodule