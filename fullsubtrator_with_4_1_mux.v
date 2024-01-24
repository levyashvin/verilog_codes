//fullsubtractor using 4:1 mux
module FullSubtractor(input A,B,Bin,output reg Diff,Bout);
wire s1, s2, s3;
wire d1, d2, d3;
assign d1 = (A ^ B);
assign d2 = (~A & B);
assign d3 = (d1 ^ Bin);

assign s1 = 1'b0;
assign s2 = d2;
assign s3 = d1 & Bin;
always@(A,B,Bin)
begin
    Diff = (s3 ? d3 : (s2 ? d2 : d1));
    Bout = (d1 & Bin) | (d2 & ~Bin);
end
endmodule