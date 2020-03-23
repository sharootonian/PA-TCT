ConvertSimulations<-function(data,sim){
  for (s in 1:length(levels(data$subjID))){
    subjData=data[data$subjID==levels(data$subjID)[s],]
    for(t in 1:length(subjData$Triangle_index)){
      #where the simulated vactor pos points to
      pos=c(sim[[s]][t,1],sim[[s]][t,2])
      #the correct anlge to 0 (used to calculate angle)
      correctAngle=subjData$AC_angle[subjData$Trial_number==sim[[s]][t,3]]
      #calc angle to 0
      simangle=angle_from_positions(pos,c(0,0))
      #calc distance to 0
      simpdist=euclid_distance(pos,c(0,0))
      #DE = simpdist/(correctDistance)
      data$DE[data$subjID==levels(data$subjID)[s] & data$Trial_number==sim[[s]][t,3]]=simpdist/subjData$AC_dist[subjData$Trial_number==sim[[s]][t,3]]
      #calc AE and normalize to 0<x<360
      if(simangle<(correctAngle-180)){
        data$AE[data$subjID==levels(data$subjID)[s] & data$Trial_number==sim[[s]][t,3]] <-(simangle-correctAngle+360)
      }
      else{  
        #last angle - what it should be so positive is they over shot
        data$AE[data$subjID==levels(data$subjID)[s] & data$Trial_number==sim[[s]][t,3]] <-(simangle-correctAngle)
      }
      #correct for left handed trials
      if(subjData$Hand[subjData$Trial_number==sim[[s]][t,3]]=="LH"){
        if(simangle<(correctAngle-180)){
          data$AE[data$subjID==levels(data$subjID)[s] & data$Trial_number==sim[[s]][t,3]] <-(-(simangle-correctAngle+360))
        }
        else{  
          #last angle - what it should be so positive is they over shot
          data$AE[data$subjID==levels(data$subjID)[s] & data$Trial_number==sim[[s]][t,3]] <-(-(simangle-correctAngle))
        }
      }
    }
  }
  return(data)
}
