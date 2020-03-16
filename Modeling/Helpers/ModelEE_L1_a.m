function obj=ModelEE_L1_a(B,alphaH,alpha)

for i = 1:length(alpha)

    %fit alpha
    y1(i)=(B(1)*alphaH(i))+B(2);    

    E(i,1)=(alpha(i)-y1(i));

    diff(i)=(E(i,1)^2)^.5;

end

obj=sum(diff(:));
end
