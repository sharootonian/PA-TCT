function obj=modelEE_L1(data1,data2)
    x0=[1 0];
    lb=[-inf -inf];
    ub=[+inf +inf];
    %exp1
    obfunc=@(x)modelEE_L1_l(x,data1.combine.a,data1.combine.b,data1.combine.nvec1,data1.combine.nvec2);
    L1.exp1.l(:)=fmincon(obfunc,x0,[],[],[],[],lb,ub);
    obfunc=@(x)ModelEE_L1_a(x,data1.combine.alphahat,data1.combine.alpha);
    L1.exp1.a(:)=fmincon(obfunc,x0,[],[],[],[],lb,ub);
    %exp2
    obfunc=@(x)modelEE_L1_l(x,data2.combine.a,data2.combine.b,data2.combine.nvec1,data2.combine.nvec2);
    L1.exp2.l(:)=fmincon(obfunc,x0,[],[],[],[],lb,ub);
    obfunc=@(x)ModelEE_L1_a(x,data2.combine.alphahat,data2.combine.alpha);
    L1.exp2.a(:)=fmincon(obfunc,x0,[],[],[],[],lb,ub);

    obj=L1;
end