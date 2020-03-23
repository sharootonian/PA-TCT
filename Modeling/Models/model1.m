function obj=model1(b,x3,x1,x2,x1p,x2p,x3p,T,size)

for i = 1:length(x3(:,1))
    sigma=b(3)*(abs(x1(i,1))+abs(x1(i,2))+abs(x2(i,1))+abs(x2(i,2)))^.5; 
    %x3 x component 
    x3t(i,1)= b(1)*x1(i,1)...
            +b(2)*x2(i,1); 
         
    %x3 y component      
    x3t(i,2)= b(1)*(x1(i,2))...
            +b(2)*(x2(i,2));
 
   %log like hood of x component for trial i
   L(i,1) = ((-log((2*pi*sigma^2)^.5))-(((x3(i,1)-x3t(i,1))^2)/(2*sigma^2)));
   %log like hood of y component for trial i
   L(i,2) = ((-log((2*pi*sigma^2)^.5))-(((x3(i,2)-x3t(i,2))^2)/(2*sigma^2)));
end

 obj=-sum(sum(L(:,1))+sum(L(:,2)));
end
