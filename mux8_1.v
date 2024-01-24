//behavioral
module mux_8_1(input i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,output reg o);

always@(s0,s1,s2)
begin
    o = i0&~s0&~s1&~s2|i1&~s0&~s1&s2|i2&~s0&s1&~s2|
        i3&~s0&s1&s2|i4&s0&~s1&~s2|i5&s0&~s1&s2|i6&s0&s1&~s2|
        i7&s0&s1&s2;
end
endmodule

//dataflow
module mux_8_1(input i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,output o);

assign o = i0&~s0&~s1&~s2|i1&~s0&~s1&s2|i2&~s0&s1&~s2|
i3&~s0&s1&s2|i4&s0&~s1&~s2|i5&s0&~s1&s2|i6&s0&s1&~s2|
i7&s0&s1&s2;

endmodule

//gatelevel
module mux_8_1(input i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,output o);

wire w0,w2,w3,w4,w5,w6,w7;

and
a0(w0,i0,~s0,~s1,~s2),
a1(w1,i1,~s0,~s1,s2),
a2(w2,i2,~s0,s1,~s2),
a3(w3,i3,~s0,s1,s2),
a4(w4,i4,s0,~s1,~s2),
a5(w5,i5,s0,~s1,s2),
a6(w6,i6,s0,s1,~s2),
a7(w7,i7,s0,s1,s2);

or o0(o,w0,w1,w2,w3,w4,w5,w6,w7);

endmodule