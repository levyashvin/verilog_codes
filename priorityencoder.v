//priority order D1>D3>D0>D2
//behavioral
module priority_encoder(A, B, C, D,I,Z);
input A, B,C,D;
output reg Y, Z;
always@(A,B,C,D)
begin
    if (B==1) begin Y=1'b0;Z=1'bl;end
    else if (D==1) begin Y=1'b1;Z=1'bl;end
    else if (A==1) begin Y=1'b0; Z=1'b0;end
    else if (C==1) begin Y=1'b1;Z=1'b0;end
end
endmodule

//gatelevel
module priority_encoder(input a,b,c,d,output x,y);

wire w0,w1,w2,w3,na,nb,nc,nd;

not
n1(na,a),
n2(nb,b),
n3(nc,c),
n4(nd,d);

and
a0(w0,na,nb,c,nd),
a1(w1,nb,nc,d),
a2(w3,nc,d);

or
o0(x,w0,w3),
o1(y,b,w3);