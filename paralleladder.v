//3-bit parallel adder using full adder
module full_adderb(input A,B,Cin,output reg S,Cout);
 
 always@(A,B,Cin)
    begin
        S = A^B^Cin;
        Cout = (A&B)|(B&Cin)|(A&Cin);
    end
 
endmodule

module paradd(input a1,a2,a3,b1,b2,b3,output a,b,c,d);
wire w1,w2,w3;
full_adderb f1(d,w3,a1,b1,0);
full_adderb f2(c,w2,a2,b2,w3);
full_adderb f3(b,w1,a3,b3,w2);
assign a = w1;
endmodule

//testbench all values without loop
module bit3paradd();

reg a,b,c,d,e,f;
wire w,x,y,z;
paradd dut(.a1(a),.a2(b),.a3(c),
.b1(d),.b2(e),.b3(f),.a(w),.b(x),.c(y),.d(z));

initial begin
a=0;b=0;c=0;d=0;e=0;f=0;
#5
a=0;b=0;c=0;d=0;e=0;f=1;
#5
a=0;b=0;c=0;d=0;e=1;f=0;
#5
a=0;b=0;c=0;d=0;e=1;f=1;
#5
a=0;b=0;c=0;d=1;e=0;f=0;
#5
a=0;b=0;c=0;d=1;e=0;f=1;
#5
a=0;b=0;c=0;d=1;e=1;f=0;
#5
a=0;b=0;c=0;d=1;e=1;f=1;
#5
a=0;b=0;c=1;d=0;e=0;f=0;
#5
a=0;b=0;c=1;d=0;e=0;f=1;
#5
a=0;b=0;c=1;d=0;e=1;f=0;
#5
a=0;b=0;c=1;d=0;e=1;f=1;
#5
a=0;b=0;c=1;d=1;e=0;f=0;
#5
a=0;b=0;c=1;d=1;e=0;f=1;
#5
a=0;b=0;c=1;d=1;e=1;f=0;
#5
a=0;b=0;c=1;d=1;e=1;f=1;
#5
a=0;b=1;c=0;d=0;e=0;f=0;
#5
a=0;b=1;c=0;d=0;e=0;f=1;
#5
a=0;b=1;c=0;d=0;e=1;f=0;
#5
a=0;b=1;c=0;d=0;e=1;f=1;
#5
a=0;b=1;c=0;d=1;e=0;f=0;
#5
a=0;b=1;c=0;d=1;e=0;f=1;
#5
a=0;b=1;c=0;d=1;e=1;f=0;
#5
a=0;b=1;c=0;d=1;e=1;f=1;
#5
a=0;b=1;c=1;d=0;e=0;f=0;
#5
a=0;b=1;c=1;d=0;e=0;f=1;
#5
a=0;b=1;c=1;d=0;e=1;f=0;
#5
a=0;b=1;c=1;d=0;e=1;f=1;
#5
a=0;b=1;c=1;d=1;e=0;f=0;
#5
a=0;b=1;c=1;d=1;e=0;f=1;
#5
a=0;b=1;c=1;d=1;e=1;f=0;
#5
a=0;b=1;c=1;d=1;e=1;f=1;
#5
a=1;b=0;c=0;d=0;e=0;f=0;
#5
a=1;b=0;c=0;d=0;e=0;f=1;
#5
a=1;b=0;c=0;d=0;e=1;f=0;
#5
a=1;b=0;c=0;d=0;e=1;f=1;
#5
a=1;b=0;c=0;d=1;e=0;f=0;
#5
a=1;b=0;c=0;d=1;e=0;f=1;
#5
a=1;b=0;c=0;d=1;e=1;f=0;
#5
a=1;b=0;c=0;d=1;e=1;f=1;
#5
a=1;b=0;c=1;d=0;e=0;f=0;
#5
a=1;b=0;c=1;d=0;e=0;f=1;
#5
a=1;b=0;c=1;d=0;e=1;f=0;
#5
a=1;b=0;c=1;d=0;e=1;f=1;
#5
a=1;b=0;c=1;d=1;e=0;f=0;
#5
a=1;b=0;c=1;d=1;e=0;f=1;
#5
a=1;b=0;c=1;d=1;e=1;f=0;
#5
a=1;b=0;c=1;d=1;e=1;f=1;
#5
a=1;b=1;c=0;d=0;e=0;f=0;
#5
a=1;b=1;c=0;d=0;e=0;f=1;
#5
a=1;b=1;c=0;d=0;e=1;f=0;
#5
a=1;b=1;c=0;d=0;e=1;f=1;
#5
a=1;b=1;c=0;d=1;e=0;f=0;
#5
a=1;b=1;c=0;d=1;e=0;f=1;
#5
a=1;b=1;c=0;d=1;e=1;f=0;
#5
a=1;b=1;c=0;d=1;e=1;f=1;
#5
a=1;b=1;c=1;d=0;e=0;f=0;
#5
a=1;b=1;c=1;d=0;e=0;f=1;
#5
a=1;b=1;c=1;d=0;e=1;f=0;
#5
a=1;b=1;c=1;d=0;e=1;f=1;
#5
a=1;b=1;c=1;d=1;e=0;f=0;
#5
a=1;b=1;c=1;d=1;e=0;f=1;
#5
a=1;b=1;c=1;d=1;e=1;f=0;
#5
a=1;b=1;c=1;d=1;e=1;f=1;
#5
$stop;
end

endmodule