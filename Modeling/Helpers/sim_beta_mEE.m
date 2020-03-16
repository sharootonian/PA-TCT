function obj=sim_beta_mEE(b)
  % size=zscore(size);
sb=b;
for k = 1:3
    for i = 1:length(b(:,k))
%         sb(i,k) = normrnd(b(i,k),.5);
    end
end
obj=sb;
end
 