function obj=m1s(b,x3,x1,x2,size)
obj= 0; 
    for i = 1:length(x3(:,1))
        sigma=b(3)*(abs(x1(i,1))+abs(x1(i,2))+abs(x2(i,1))+abs(x2(i,2)))^.5; 
        n1=randn(1)*sigma; 
        n2=randn(1)*sigma; 
        obj(i,1)=  b(1)*x1(i,1)...
                  +b(2)*x2(i,1)+n1;
            
        obj(i,2)=  b(1)*(x1(i,2))...
            +b(2)*(x2(i,2))+n2;
    end

end
