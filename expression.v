//NAND (~A&~B&~C)|(~A&~B&~D)|(~A&B&C&D)|(A&~B&C&D)|(A&B&~C)
//NOR (A|B|~C|~D)&(A|~B|C)&(A|~B|D)&(~A|~B|~C)&(~A|B|C)&(~A|B|D)
module main(input a,b,c,d,output notand,notor);
    wire z1,z2,z3,z4,z5;
    wire x1,x2,x3,x4,x5,x6;
    wire dnota,dnotb,dnotc,dnotd;
    wire rnota,rnotb,rnotc,rnotd;
    nand
    dn1(dnota,a,a),
    dn2(dnotb,b,b),
    dn3(dnotc,c,c),
    dn4(dnotd,d,d),
    m1(z1,dnota,dnotb,dnotc),
    m2(z2,dnota,dnotb,dnotd),
    m3(z3,dnota,b,c,d),
    m4(z4,a,dnotb,c,d),
    m5(z5,a,b,dnotc),
    m6(notand,z1,z2,z3,z4,z5);
    nor
    rn1(rnota,a,a),
    rn2(rnotb,b,b),
    rn3(rnotc,c,c),
    rn4(rnotd,d,d),
    M1(x1,a,b,rnotc,rnotd),
    M2(x2,a,rnotb,c),
    M3(x3,a,rnotb,d),
    M4(x4,rnota,rnotb,rnotc),
    M5(x5,rnota,b,c),
    M6(x6,rnota,b,d),
    M7(notor,x1,x2,x3,x4,x5,x6);
endmodule