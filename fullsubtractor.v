//behavioral
module full_subb(input x,y,z,output reg d,b);

always@(x,y,z)
begin
    d = x^y^z;
    b = ((~x)&y)|(y&z)|((~x)&z);
end

endmodule

//dataflow
module half_subb(input x,y,z,output d,b);

assign d = x^y^z;
assign b = ((~x)&y)|(y&z)|((~x)&z);

endmodule

//gatelevel
module half_subb(input x,y,z,output d,b);

wire w1,w2,w3,w0;
xor x0(d,x,y,z);
not n0(w0,x);
and
a0(w1,w0,y);
a1(w2,y,z);
a2(w3,w0,z);
or r0(b,w1,w2,w3);

endmodule