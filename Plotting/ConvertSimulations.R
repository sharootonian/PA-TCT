#read from 

##load model vector output

Sim_m1e1 <- readMat("C:/Users/Sev/Documents/git/PA-TCT/Modeling/ModelSimulations/Sim_m1e1.mat")$Sim.m1e1
Sim_m1e2 <- readMat("C:/Users/Sev/Documents/git/PA-TCT/Modeling/ModelSimulations/Sim_m1e2.mat")$Sim.m1e2


totalf$subjID[totalf$subjID==levels(totalf$subjID)[1]] #gets subject