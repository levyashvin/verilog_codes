//parallel adder and subtractor with same circuit
module p4bitadd_sub( output [4:0]sum,input ctrl,[3:0]a,b);

wire c1,c2,c3;

fadder ad0(a[0],ctrl^b[0],ctrl, sum[0], c1);
fadder ad1(a[1],ctrl^b[1],c1, sum[1], c2);
fadder ad2(a[2],ctrl^b[2],c2, sum[2], c3);
fadder ad3(a[3],ctrl^b[3],c3, sum[3], sum[4]);
assign sum[4] = (~ctrl)&sum[4];

endmodule

//full adder
module fadder(input a,b,cin,output s,cout);

assign s=a^b^cin;
assign cout = (a&b)|(b&cin)|(cin&a);

endmodule

//testbench
module p4bitadd_sun_tb();

reg [3:0] a;
reg [3:0] b;
reg ctrl;
wire [4:0] s;

p4bitadd_sub dut(.sum(s),.a(a),.b(b),.ctrl(ctrl));
initial begin

ctrl=0;a=4'b1000;b=4'b0100;
#5
$display("Addition:");
$display("   %b%b%b%b",a[3],a[2],a[1],a[0]);
$display("  +%b%b%b%b",b[3],b[2],b[1],b[0]);
$display("  -----");
$display("  %b%b%b%b%b",s[4],s[3],s[2],s[1],s[0]);
ctrl=0;a=4'b0101;b=4'b0011;
#5
$display("");
$display("   %b%b%b%b",a[3],a[2],a[1],a[0]);
$display("  +%b%b%b%b",b[3],b[2],b[1],b[0]);
$display("  -----");
$display("  %b%b%b%b%b",s[4],s[3],s[2],s[1],s[0]);
ctrl=1;a=4'b1000;b=4'b0100;
#5
$display("Subtraction:");
$display("   %b%b%b%b",a[3],a[2],a[1],a[0]);
$display("  -%b%b%b%b",b[3],b[2],b[1],b[0]);
$display("  -----");
$display("  %b%b%b%b%b",s[4],s[3],s[2],s[1],s[0]);
ctrl=1;a=4'b0101;b=4'b0011;
#5
$display("");
$display("   %b%b%b%b",a[3],a[2],a[1],a[0]);
$display("  -%b%b%b%b",b[3],b[2],b[1],b[0]);
$display("  -----");
$display("  %b%b%b%b%b",s[4],s[3],s[2],s[1],s[0]);

$finish;
end
endmodule