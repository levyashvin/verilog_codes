module full_adder(input a,b,cin,output sum,carry);
wire c,c1,s;
half_adder h1(a,b,s,c);
half_adder h2(cin,s,sum,c1);
or o1(carry,c,c1);
endmodule