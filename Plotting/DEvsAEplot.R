DEvsAEplot<-function(data,exp){
  
  if(exp==1)
  {
    title="Experiment 1 (Angle Error vs Distance Error)"
    palette="Set2"
    color=data$Full.Type
  }
  else if (exp==2)
  {
    title="Experiment 2 (Angle Error vs Distance Error)"
    palette="Set1"
    color=factor(data$Size)
  }
  else{
    print("Please specify correct experiment")
  }

  p <- ggplot(data, aes(DistError,AngleError,color=color))+ geom_point(size=4,show.legend = FALSE) + theme_classic()+ geom_vline(xintercept=1, linetype="dashed",color = "red", size=1) +geom_hline(yintercept=0, linetype="dashed",color = "red", size=1)
  p <-p + labs(x = "Distance error (ratio)")
  p <-p + labs(y = "Angle error (deg)")
  p <- p + labs(title = title)+
    theme_light()+
    theme(axis.line = element_line(size = 1, colour = "#666666"))+
    theme(plot.title = element_text(color="#666666", face="bold", size=26, hjust=0)) +
    theme(axis.title = element_text(color="#666666", face="bold", size=28))+coord_cartesian(ylim = c(-180, 180))+
    theme(axis.text = element_text(,color="#666666", face="bold", size=26))+scale_x_continuous(limits = c(0, 4.5))+scale_y_continuous(limits=c(-180,180),breaks=seq(-180, 180, 60))+
    scale_color_brewer(palette=palette)
  p <- p + geom_smooth(method = "lm", formula = y ~ x,color="black",se=T,size=1.5)

  p
  ggExtra::ggMarginal(p, type = "histogram", color="#666666")
  
  # summary(lm(AngleError ~ DistError + color,data=data))

}
