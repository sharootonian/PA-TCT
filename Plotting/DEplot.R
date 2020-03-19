DEplot<-function(data,exp){
  
  if(exp==1)
  {
    title="Experiment 1 (Triangle Type vs Distance Error)"
    palette="Set2"
    xaxis="Triangle Type"
    
    cdata <- ddply(data, c("Full.Type","subjID" ), summarise,
                   N1    = length(AngleError),
                   meandist=mean(DistError),
                   circ = deg(circ.mean(rad(AngleError))))
    
    ggplot(cdata, aes(x=Full.Type ,y=meandist, fill=Full.Type))+
      geom_boxplot(size=1, alpha = I(1 / 1.5),outlier.shape = NA) + geom_jitter(width = 0.15, size=2, alpha = I(1 / 1.5))+
      scale_fill_brewer(palette="Set2")+
      theme_minimal()+
      theme(axis.line = element_line(size = 1, colour = "#666666"))+
      theme(plot.title = element_text(color="#666666", face="bold", size=28, hjust=0)) +
      theme(axis.title = element_text(color="#666666", face="bold", size=28))+
      theme(axis.text = element_text(,color="#666666", face="bold", size=26))+
      ylab("Mean DE (Walked/Actual)")+
      xlab(xaxis)+
      theme(legend.position="none")+
      labs(title = title)+coord_cartesian(ylim = c(-180, 180))+scale_y_continuous(breaks=seq(-180, 180,60))+
      stat_summary(fun.y=mean, colour="White", geom="point", shape=17, size=4,show.legend = FALSE)+
      geom_hline(yintercept=1, linetype="dashed",color = "red", size=1)
    
  }
  else if (exp==2)
  {
    title="Experiment 2 (Triangle Type vs Distance Error)"
    palette="Set1"
    xaxis="Triangle Size (m)"
    
    cdata <- ddply(data, c("Size","subjID"), summarise,
                   N1    = length(AngleError),
                   meandist=mean(DistError),
                   circ = deg(circ.mean(rad(AngleError))))
    fill="Size";
    
    ggplot(cdata, aes(x=factor(Size) ,y=meandist, fill=factor(Size) ))+
      geom_boxplot(size=1, alpha = I(1 / 1.5),outlier.shape = NA) + geom_jitter(width = 0.15, size=2, alpha = I(1 / 1.5))+
      theme_minimal()+
      theme(axis.line = element_line(size = 1, colour = "#666666"))+
      theme(plot.title = element_text(color="#666666", face="bold", size=28, hjust=0)) +
      theme(axis.title = element_text(color="#666666", face="bold", size=28))+
      theme(axis.text = element_text(,color="#666666", face="bold", size=26))+
      scale_fill_brewer(palette=palette)+
      ylab("Mean DE (Walked/Actual)")+
      xlab(xaxis)+
      theme(legend.position="none")+geom_hline(yintercept=1, linetype="dashed",color = "red", size=1)+
      stat_summary(fun.y=mean, colour="White", geom="point", shape=17, size=4,show.legend = FALSE) + 
      labs(title = title)+coord_cartesian(ylim = c(-180, 180))+scale_y_continuous(breaks=seq(-180, 180, 60))
  }
  else{
    print("Please specify correct experiment")
  }
  
  
  
  
}
