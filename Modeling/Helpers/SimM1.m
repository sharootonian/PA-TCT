function obj=SimM1(B_data1,B_data2,data1,data2)
% simulation 
    for(k= 1:100)
     sb1(k).sim=sim_beta_m1(B_data1);
     sb2(k).sim=sim_beta_m1(B_data2);

     %simulate x3 from model0 
         for(i= 1:length(data1.subj))
            md1(i).subj(k).sim=m1s(sb1(k).sim(i,:),data1.subj(i).vec3,data1.subj(i).vec1,data1.subj(i).vec2,data1.subj(i).size);
         end
        for(i= 1:length(data2.subj))
            md2(i).subj(k).sim=m1s(sb2(k).sim(i,:),data2.subj(i).vec3,data2.subj(i).vec1,data2.subj(i).vec2,data2.subj(i).size);
        end
    end
    
    % format to datatable for R and save
    %exp1
    for(j=1:length(data1.subj))
        for t= (1:length(data1.subj(j).Trial))
            for(k= 1:100)
             foo(k,1)=md1(j).subj(k).sim(t,1); 
             foo(k,2)=md1(j).subj(k).sim(t,2);
            end
            mmd1(j).mean(t,1)= mean(foo(:,1));
            mmd1(j).mean(t,2)= mean(foo(:,2));
            mmd1(j).mean(t,3)= data1.subj(j).Trial(t,1);
        end
    end
    %exp2
    for(j=1:length(data2.subj))
        for t= (1:length(data2.subj(j).Trial))
            for(k= 1:100)
             foo(k,1)=md2(j).subj(k).sim(t,1);
             foo(k,2)=md2(j).subj(k).sim(t,2);
            end
            mmd2(j).mean(t,1)= mean(foo(:,1));
            mmd2(j).mean(t,2)= mean(foo(:,2));
            mmd2(j).mean(t,3)= data2.subj(j).Trial(t,1);
        end
    end
    
    sim.exp1=mmd1;
    sim.exp2=mmd2;
    
obj=sim;
end
 