#read from 

##load model vector output

Sim_m1e1 <- readMat("C:/Users/Sev/Documents/git/PA-TCT/Modeling/ModelSimulations/Sim_m1e1.mat")$Sim.m1e1
Sim_m1e2 <- readMat("C:/Users/Sev/Documents/git/PA-TCT/Modeling/ModelSimulations/Sim_m1e2.mat")$Sim.m1e2



df=data.frame(subjID=data$subjID,trial=data$Trial_number);

data$Trial_number

sim=Sim_m1e1


for (s in 1:length(levels(data$subjID))){
  subjData=data[data$subjID==levels(data$subjID)[s],]
  
  for(t in 1:length(subjData$Triangle_index)){
    #where the simulated vactor pos points to
    pos=c(sim[[s]][t,1],sim[[s]][t,2])
    #the correct anlge to 0 (used to calculate angle)
    correctAngle=subjData$AC_angle[subjData$Trial_number==sim[[s]][t,3]]
    
    simangle=angle_from_positions(pos,c(0,0))
    simpdist=euclid_distance(pos,c(0,0))
    
    data$DE[data$subjID==levels(data$subjID)[s] & data$Trial_number==sim[[s]][t,3]]=simpdist/subjData$AC_dist[subjData$Trial_number==sim[[s]][t,3]]

    if(simangle<(correctAngle-180)){
      data$AE[df$subjID==levels(data$subjID)[s] & data$Trial_number==sim[[s]][t,3]] <-(simangle-correctAngle+360)
    }
    else{  
      #last angle - what it should be so positive is they over shot
      data$AE[data$subjID==levels(data$subjID)[s] & data$Trial_number==sim[[s]][t,3]] <-(simangle-correctAngle)
    }
    
    
    if(subjData$Hand[subjData$Trial_number==sim[[s]][t,3]]=="LH"){
      if(simangle<(correctAngle-180)){
        data$AE[df$subjID==levels(data$subjID)[s] & data$Trial_number==sim[[s]][t,3]] <-(-(simangle-correctAngle+360))
      }
      else{  
        #last angle - what it should be so positive is they over shot
        data$AE[data$subjID==levels(data$subjID)[s] & data$Trial_number==sim[[s]][t,3]] <-(-(simangle-correctAngle))
      }
    }

  }
  
}






# if(subjData$Hand[subjData$Trial_number==Sim_m1e1[[s]][t,3]]=="LH"){
#   data$AE[data$subjID==levels(data)[s] & data$Trial_number==Sim_m1e1[[s]][t,3]]= -data$AE[data$subjID==levels(data$subjID)[s] & data$Trial_number==Sim_m1e1[[s]][t,3]]
# }



p <- ggplot(data, aes(DE, AE,color=Full.Type))+ geom_point(size=4,show.legend = FALSE) + theme_classic()+ geom_vline(xintercept=1, linetype="dashed",color = "red", size=1) +geom_hline(yintercept=0, linetype="dashed",color = "red", size=1)
p <-p + labs(x = "Distance error (ratio)")
p <-p + labs(y = "Angle error (deg)")
p <- p + labs(title = "Experiment 1 (Angle Error vs Distance Error)")+
  theme_light()+
  theme(axis.line = element_line(size = 1, colour = "#666666"))+
  theme(plot.title = element_text(color="#666666", face="bold", size=26, hjust=0)) +
  theme(axis.title = element_text(color="#666666", face="bold", size=28))+coord_cartesian(ylim = c(-180, 180))+
  theme(axis.text = element_text(,color="#666666", face="bold", size=26))+scale_x_continuous(limits = c(0, 4.5))+scale_y_continuous(limits=c(-180,180),breaks=seq(-180, 180, 60))+
  scale_color_brewer(palette="Set2")
p <- p + geom_smooth(method = "lm", formula = y ~ x,color="black",se=T,size=1.5)
#summary(lm(totalf$last_norm_act-1 ~ totalf$angle_diff))
ggExtra::ggMarginal(p, type = "histogram", color="#666666")


cdata <- ddply(data, c("Full.Type","subjID" ), summarise,
               N1    = length(AE),
               meandist=mean(DE),
               circ = deg(circ.mean(rad(AE))))

ggplot(cdata, aes(x=Full.Type ,y=circ, fill=Full.Type))+
  geom_boxplot(size=1, alpha = I(1 / 1.5),outlier.shape = NA) + geom_jitter(width = 0.15, size=2, alpha = I(1 / 1.5))+
  scale_fill_brewer(palette="Set2")+
  theme_minimal()+
  theme(axis.line = element_line(size = 1, colour = "#666666"))+
  theme(plot.title = element_text(color="#666666", face="bold", size=28, hjust=0)) +
  theme(axis.title = element_text(color="#666666", face="bold", size=28))+
  theme(axis.text = element_text(,color="#666666", face="bold", size=26))+
  ylab("Circular mean of AE (degrees)")+
  xlab(xaxis)+
  theme(legend.position="none")+
  labs(title = title)+coord_cartesian(ylim = c(-180, 180))+scale_y_continuous(breaks=seq(-180, 180,60))+
  stat_summary(fun.y=mean, colour="White", geom="point", shape=17, size=4,show.legend = FALSE)+
  geom_hline(yintercept=0, linetype="dashed",color = "red", size=1)
  
ggplot(cdata, aes(x=Full.Type ,y=meandist, fill=Full.Type ))+
  geom_boxplot(size=1, alpha = I(1 / 1.5),outlier.shape = NA) + geom_jitter(width = 0.15, size=2, alpha = I(1 / 1.5))+
  scale_fill_brewer(palette="Set2")+
  theme_minimal()+
  theme(axis.line = element_line(size = 1, colour = "#666666"))+
  theme(plot.title = element_text(color="#666666", face="bold", size=28, hjust=0)) +
  theme(axis.title = element_text(color="#666666", face="bold", size=28))+
  theme(axis.text = element_text(,color="#666666", face="bold", size=26))+coord_cartesian(ylim = c(0, 2.5))+
  ylab("Mean DE (Walked/Actual)")+
  xlab("Triangle Type")+
  theme(legend.position="none")+
  labs(title = "Experiment 1 (Triangle Type vs Distance Error)")+
  stat_summary(fun.y=mean, colour="white", geom="point", shape=17, size=4,show.legend = FALSE)+
  geom_hline(yintercept=1, linetype="dashed",color = "red", size=1)







