function obj=model2(b,x3,x1,x2,x1p,x2p,x3p,T,size)
    for j=1:length(x3(:,1))
       blah=1;
        if j==1
        %x values
        chip1(j,1)=x1p(j,1);
        chip2(j,1)=x2p(j,1);
        chip3(j,1)=x3p(j,1);
        %y values
        chip1(j,2)=x1p(j,2);
        chip2(j,2)=x2p(j,2);
        chip3(j,2)=x3p(j,2);
%         S(j,1)=1;
        end
        if T(j,1)-T(j,2)~=1 && j~=1
        chip1(j,1)=chip1(j-1,1);
        chip2(j,1)=chip2(j-1,1);
        chip3(j,1)=chip3(j-1,1);
        %xy values
        chip1(j,1)=chip1(j-1,2);
        chip2(j,1)=chip2(j-1,2);
        chip3(j,1)=chip3(j-1,2);
%         S(j,1)=b(6)*(size(j,2)/S(j-1,1));
        blah=0;
        end
        if j~=1 && blah ==1
        %x values
        chip1(j,1)=(x1p(j,1)+ b(4)*chip1(j-1,1))/2;
        chip2(j,1)=(x2p(j,1)+ b(4)*chip2(j-1,1))/2;
        chip3(j,1)=(x3p(j,1)+ b(4)*chip3(j-1,1))/2;
        %xy values
        chip1(j,2)=(x1p(j,2)+ b(4)*chip1(j-1,2))/2;
        chip2(j,2)=(x2p(j,2)+ b(4)*chip2(j-1,2))/2;
        chip3(j,2)=(x3p(j,2)+ b(4)*chip3(j-1,2))/2;
%         S(j,1)=size(j,2)+b(6)*(size(j,2)/S(j-1,1));
        end
    end


for i = 1:length(x3(:,1))
    sigma=b(5)*(norm(x2(i,:))+norm(x2(i,:)))^.5;
    %x3 x component 
    x3t(i,1)= b(1)*x1(i,1)...
            +b(2)*x2(i,1)...
            +b(3)*((chip1(i,1))...
            +(chip2(i,1))...
            +(chip3(i,1))); 
         
    %x3 y component      
    x3t(i,2)= b(1)*x1(i,2)...
            +b(2)*x2(i,2)...
            +b(3)*((chip1(i,2))...
            +(chip2(i,2))...
            +(chip3(i,2))); 

   %log like hood of x component for trail i
   L(i,1) = (-(log((2*pi*sigma^2)^.5))-(((x3(i,1)-x3t(i,1))^2)/(2*sigma^2)));
   %log like hood of y component for trail i
   L(i,2) = (-(log((2*pi*sigma^2)^.5))-(((x3(i,2)-x3t(i,2))^2)/(2*sigma^2)));
end
 obj=-sum(sum(L(:,1))+sum(L(:,2)));
end

