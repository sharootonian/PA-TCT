%Main Modeling script
%Created by Sevan K Harootonian 2020
clear all

addpath('./ModelSimulations')
addpath('./VectorizedData')
addpath('./Helpers')
addpath('./Models')


load('VectorizedDataExp1')
load('VectorizedDataExp2')


%%
% model 1
x0=[0 0 10];
lb=[-inf -inf 0];
ub=[+inf +inf +inf];   
    %exp1
    for(i= 1:length(data1.subj))
        obfunc=@(x)model1(x,data1.subj(i).vec3,data1.subj(i).vec1,data1.subj(i).vec2,data1.subj(i).vec1p,data1.subj(i).vec2p,data1.subj(i).vec3p,data1.subj(i).Trial,data1.subj(i).size);
        All_Betas.exp1.m1(i,:)=fmincon(obfunc,x0,[],[],[],[],lb,ub);
    end   
    %exp2
x0=[0 0 6];
lb=[-inf -inf 0];
ub=[+inf +inf +inf];
    for(i= 1:length(data2.subj))
        obfunc=@(x)model1(x,data2.subj(i).vec3,data2.subj(i).vec1,data2.subj(i).vec2,data2.subj(i).vec1p,data2.subj(i).vec2p,data2.subj(i).vec3p,data2.subj(i).Trial,data2.subj(i).size);
        All_Betas.exp2.m1(i,:)=fmincon(obfunc,x0,[],[],[],[],lb,ub);
    end

%simulate model 1
sim1=SimM1(All_Betas.exp1.m1,All_Betas.exp2.m1,data1,data2);
Sim_m1e1=sim1.exp1;
Sim_m1e2=sim1.exp2;

save('ModelSimulations/Sim_m1e1.mat','Sim_m1e1')
save('ModelSimulations/Sim_m1e2.mat','Sim_m1e2')

%% Model2
x0=[0 0 0 0 4];
lb=[-inf -inf -inf 0 0];
ub=[+inf +inf +inf 1 +inf];        
    %exp1
    for(i= 1:length(data1.subj))
        obfunc=@(x)model2(x,data1.subj(i).vec3,data1.subj(i).vec1,data1.subj(i).vec2,data1.subj(i).vec1p,data1.subj(i).vec2p,data1.subj(i).vec3p,data1.subj(i).Trial,data1.subj(i).size);
        All_Betas.exp1.m2(i,:)=fmincon(obfunc,x0,[],[],[],[],lb,ub);
    end   
    %exp2
    for(i= 1:length(data2.subj))
        obfunc=@(x)model2(x,data2.subj(i).vec3,data2.subj(i).vec1,data2.subj(i).vec2,data2.subj(i).vec1p,data2.subj(i).vec2p,data2.subj(i).vec3p,data2.subj(i).Trial,data2.subj(i).size);
        All_Betas.exp2.m2(i,:)=fmincon(obfunc,x0,[],[],[],[],lb,ub);
    end
    
%simulate model 2
sim2=SimM2(All_Betas.exp1.m2,All_Betas.exp2.m2,data1,data2);
Sim_m2e1=sim2.exp1;
Sim_m2e2=sim2.exp2;

save('ModelSimulations/Sim_m2e1.mat','Sim_m2e1')
save('ModelSimulations/Sim_m2e2.mat','Sim_m2e2')

%% Plot Model 1 
PlotM1(All_Betas); %fig 4a
% Plot Model 2 
PlotM2(All_Betas); %fig 4b
%% Error Encoding Model
%Level 1 fitting
L1=modelEE_L1(data1,data2);

% model EE level 2
x1=[0 1 0 1 1];
lb=[-inf -inf -inf -inf -inf];
ub=[+inf +inf +inf +inf +inf];
    %exp1
    for(i= 1:length(data1.subj))
        obfunc=@(x)modelEE_L2(x,L1.exp1.l,L1.exp1.a,data1.subj(i).a,data1.subj(i).b,data1.subj(i).vec3,data1.subj(i).alpha,data1.subj(i).hand);
        B_data1(i,:)=fmincon(obfunc,x1,[],[],[],[],lb,ub);
    end   
    %exp2
    for(i= 1:length(data2.subj))
        obfunc=@(x)modelEE_L2(x,L1.exp2.l,L1.exp2.a,data2.subj(i).a,data2.subj(i).b,data2.subj(i).vec3,data2.subj(i).alpha,data2.subj(i).hand);
        B_data2(i,:)=fmincon(obfunc,x1,[],[],[],[],lb,ub);
    end
    
% simulation 
simEE=SimMEE(B_data1,B_data2,data1,data2,L1);
Sim_mEEe1=simEE.exp1;
Sim_mEEe2=simEE.exp2;

save('ModelSimulations/Sim_mEEe1.mat','Sim_mEEe1')
save('ModelSimulations/Sim_mEEe2.mat','Sim_mEEe2')