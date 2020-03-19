DEsd<-function(data)
{
  cdata <- ddply(data, c("Size"), summarise,
                  N1    = length(AngleError),
                  meandist=mean(DistError),
                  sd   = sd(DistError*Size),
                  var=stats::var(DistError*Size),
                  circ = deg(circ.mean(rad(AngleError))))
  
  
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
