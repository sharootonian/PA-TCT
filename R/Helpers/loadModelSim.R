loadModelSim<-function(data,exp){
  if(exp==1){
    #model 1
    Sim_m1e1 <- readMat("./Modeling/ModelSimulations/Sim_m1e1.mat")$Sim.m1e1
    data$M1AE=ConvertSimulations(data,Sim_m1e1)$AE
    data$M1DE=ConvertSimulations(data,Sim_m1e1)$DE
    
    #model 2
    Sim_m2e1 <- readMat("./Modeling/ModelSimulations/Sim_m2e1.mat")$Sim.m2e1
    data$M2AE=ConvertSimulations(data,Sim_m2e1)$AE
    data$M2DE=ConvertSimulations(data,Sim_m2e1)$DE
    
    #Encoding-Error Model
    Sim_mEEe1 <- readMat("./Modeling/ModelSimulations/Sim_mEEe1.mat")$Sim.mEEe1
    data$EEMAE=ConvertSimulations(data,Sim_mEEe1)$AE
    data$EEMDE=ConvertSimulations(data,Sim_mEEe1)$DE
  }
  else if (exp==2){
    #model 1
    Sim_m1e2 <- readMat("./Modeling/ModelSimulations/Sim_m1e2.mat")$Sim.m1e2
    data$M1AE=ConvertSimulations(data,Sim_m1e2)$AE
    data$M1DE=ConvertSimulations(data,Sim_m1e2)$DE
    
    #model 2
    Sim_m2e2 <- readMat("./Modeling/ModelSimulations/Sim_m2e2.mat")$Sim.m2e2
    data$M2AE=ConvertSimulations(data,Sim_m2e2)$AE
    data$M2DE=ConvertSimulations(data,Sim_m2e2)$DE

    
    #Encoding-Error Model
    Sim_mEEe2 <- readMat("./Modeling/ModelSimulations/Sim_mEEe2.mat")$Sim.mEEe2
    data$EEMAE=ConvertSimulations(data,Sim_mEEe2)$AE
    data$EEMDE=ConvertSimulations(data,Sim_mEEe2)$DE
  }
  else{
    print("Please choose between experiment 1 or 2")
  }
  return(data)
}