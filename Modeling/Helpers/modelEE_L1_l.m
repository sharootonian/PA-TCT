function obj=modelEE_L1_l(B,a,b,v1,v2)

for i = 1:length(a) 
    
    %fit leg A
    x1(i)=(B(1)*v1(i))+B(2);
    
    %fit leg B
    x2(i)=(B(1)*v2(i))+B(2);
    
    
    E(i,1)=(a(i)-x1(i))^2;
    E(i,2)=(b(i)-x2(i))^2;

    diff(i)=(E(i,1)+E(i,2))^.5;

end


obj=sum(diff(:));
end
