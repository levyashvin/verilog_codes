//behavioral
module full_adderb(input A,B,Cin,output reg S,Cout);
 
 always@(A,B,Cin)
    begin
        S = A^B^Cin;
        Cout = (A&B)|(B&Cin)|(A&Cin);
    end
 
endmodule

//dataflow
module full_adderd(
input A,B,C,
output S,Cout
    );

assign S = A^B^C;
assign Cout = (A&B)|(B&C)|(A&C);   

endmodule

//gatelevel
module full_adderg(
input A,B,C,
output S,Cout
    );
    
wire w1,w2,w3;
and
a0 (w1,A,B),
a1 (w2,A,C),
a2 (w3,B,C);
xor
x0 (S,A,B,C);
or
r0 (Cout,w1,w2,w3);

endmodule

// full adder using half adder
module half_adder(input a,b, output sum,carry);
xor m1(sum,a,b);
and m2(carry,a,b);
endmodule

module full_adder(input a,b,cin,output sum,carry);
wire c,c1,s;
half_adder h1(a,b,s,c);
half_adder h2(cin,s,sum,c1);
or o1(carry,c,c1);
endmodule