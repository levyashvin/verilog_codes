//behavioral
module half_subb(input A,B,output reg D,B0);

always@(A,B)
begin
    D = A^B;
    B0 = ((~A)&B);
end
endmodule

//dataflow
module half_subb(input A,B,output D,B0);

assign D = A^B;
assign B0 = ((~A)&B);

endmodule

//gatelevel
module half_subb(input A,B,output D,B0);

wire w1;
and a0(D,A,B);
not n0(w1,A);
and a1(B0,w1,b);

endmodule
