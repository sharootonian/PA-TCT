function obj=mEEs(B,Bl,Ba,v1,v2,v3,alphaH,hand)
obj= 0; 

    for i = 1:length(v3(:,1))
        sigma=B(5)*(v1(i)+v2(i))^.5;
        n1=randn(1)*sigma; 
        n2=randn(1)*sigma; 

           %fit alpha
        alpha(i)=(Ba(1)*alphaH(i))+Ba(2);

        %fit leg A
        x1(i)=(Bl(1)*v1(i))+Bl(2);

        %fit leg B
        x2(i)=(Bl(1)*v2(i))+Bl(2);

        %law of cos to create side c 
        cn(i)=(norm(x1(i))^2+norm(x2(i))^2-(2*norm(x2(i))*norm(x1(i))*cosd(alpha(i))))^.5;

        %create ab angle
        betaH(i)=acosd((norm(x2(i))^2+cn(i)^2-norm(x1(i))^2)/(2*norm(x2(i))*cn(i)));

        %fit side C
        cnx(i)=(B(1)*cn(i))+B(2);
            %fit alpha
        betaHx(i)=(B(3)*betaH(i))+B(4);

        %perdicted x and y pos
        obj(i,1)=cnx(i)*cosd(betaHx(i))+n1;
        obj(i,2)=cnx(i)*sind(betaHx(i))+n2;
        
            if hand(i,1)==-1
                obj(i,2)=-obj(i,2);
            end
        

    end


end
