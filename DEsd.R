DEsd<-function(data,model){
  
  if(model=="data"){
    cdata <- ddply(data, c("Size" ), summarise,
                   N1    = length(AngleError),
                   sd   = sd(DistError*AC_dist),
                   var=stats::var(DistError*AC_dist))
  }
  
  else if(model=="m1"){
    cdata <- ddply(data, c("Size" ), summarise,
                   N1    = length(M1DE),
                   sd   = sd(M1DE*AC_dist),
                   var=stats::var(M1DE*AC_dist))
  }
  
  else if(model=="m2"){
    cdata <- ddply(data, c("Size" ), summarise,
                   N1    = length(M2DE),
                   sd   = sd(M2DE*AC_dist),
                   var=stats::var(M2DE*AC_dist))
  }
  
  else if(model=="mEE"){
    cdata <- ddply(data, c("Size" ), summarise,
                   N1    = length(EEMDE),
                   sd   = sd(EEMDE*AC_dist),
                   var=stats::var(EEMDE*AC_dist))
  }
  
  else{
    print("Please specify between correct model (data, m1,m2,mEE)")
  }
  
  
  ggplot(data = cdata,mapping = aes(y = sd, x = Size))+geom_point(size=10,alpha = I(1 / 1.5), aes(color=factor(Size)))+
    labs(title = "Experiment 2 (Distance)")+ylab("Standard Diviation of Unguided Walked Distance")+
    xlab("Homing Vector Distance (m)")+
    #coord_trans(x="log")+
    #geom_smooth(method = "lm",colour="#666666")+theme_light()+
    geom_smooth(method = "lm", formula = y ~ (x))+
    #geom_smooth(method = "auto")+
    theme_light()+
    theme(axis.line = element_line(size = 1, colour = "#666666"))+
    theme(plot.title = element_text(color="#666666", face="bold", size=22, hjust=0)) +
    theme(axis.title = element_text(color="#666666", face="bold", size=18))+ 
    theme(axis.text = element_text(color="#666666", face="bold", size=16))+
    scale_color_brewer(palette="Set1")+
    guides(color=guide_legend(title="Size (m)"))
  
}
