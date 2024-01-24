//4 bit up down counter using jk flip flop
//jk flipflop
module jkff(input j, k, clk,output reg q);
    reg q=0;
    always @ (posedge clk)
    begin
    if (j==0 && k==0)
    q<=q;
    else if (j==0 && k==1)
    q=0;
    else if (j==1 && k==0)
    q=1;
    else
    q<=~q;
    end
endmodule 

module ud4(input clk, ud,output [3:0] q);
    jkff a(1,1,clk,q[0]);
    jkff b(1,1,~(ud^q[0]),q[1]);
    jkff c(1,1,~(q[1]^ud),q[2]);
    jkff d(1,1,~(q[2]^ud),q[3]);
endmodule

//testbench
module testbench();
reg clk,ud;
wire [3:0]q;
ud4 u1(clk,ud,q);
initial
begin
clk=0;
forever #5 clk=~clk;
end
initial
begin
ud=1;
#170 ud=0;
#150 $finish;
end
endmodule