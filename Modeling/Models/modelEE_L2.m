function obj=modelEE_L2(B,Bl,Ba,v1,v2,v3,alphaH,hand)

for i = 1:length(v1) 
    sigma=B(5)*(v1(i)+v2(i))^.5;
    %fit alpha
    alpha(i)=(Ba(1)*alphaH(i))+Ba(2);
    
    %fit leg A
    x1(i)=(Bl(1)*v1(i))+Bl(2);
    
    %fit leg B
    x2(i)=(Bl(1)*v2(i))+Bl(2);
    
    %law of cos to make make leg c mag
    cn(i)=(norm(x1(i))^2+norm(x2(i))^2-(2*norm(x2(i))*norm(x1(i))*cosd(alpha(i))))^.5;

    %create beta angle
    betaH(i)=acosd((norm(x2(i))^2+cn(i)^2-norm(x1(i))^2)/(2*norm(x2(i))*cn(i)));
    
    %fit leg C
    cnx(i)=(B(1)*cn(i))+B(2);
        %fit alpha
    betaHx(i)=(B(3)*betaH(i))+B(4);
    
    %perdicted x and y pos
    x3t(i,1)=cnx(i)*cosd(betaHx(i));
    x3t(i,2)=cnx(i)*sind(betaHx(i));
    
    
   L(i,1)=((-log((2*pi*sigma^2)^.5))-(((v3(i,1)-x3t(i,1))^2)/(2*sigma^2)));
   
   %log like hood of y component for trail i
   L(i,2) = ((-log((2*pi*sigma^2)^.5))-(((v3(i,2)-x3t(i,2))^2)/(2*sigma^2)));

end

xLL=-sum(L(:,1));
yLL=-sum(L(:,2));

    obj=xLL^.5 +yLL^.5;
end
