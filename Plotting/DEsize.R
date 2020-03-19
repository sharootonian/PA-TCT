DEsize<-function(data)
{
  ggplot(data2, aes(Size,DistError*Size))+geom_point(size=4, alpha = I(1 / 1.5), aes(color=factor(Size)))+
    scale_x_continuous(breaks=seq(0, 360, by=50), expand=c(0,0), lim=c(0, 210))+
    scale_y_continuous(breaks=seq(0, 360, by=50), expand=c(0,0), lim=c(0, 300))+
    geom_smooth(method = "lm", formula = y ~ x)+
    geom_smooth(method = "glm",formula = y ~ (x),colour="#666666")+theme_light()+
    theme(axis.line = element_line(size = 1, colour = "#666666"))+
    geom_abline(intercept = 0, slope = 1,linetype="dashed",color = "black", size=1)+  labs(title = "Experiment 2")+ylab("Subject's distance")+
    xlab("distance")+
    theme(plot.title = element_text(color="#666666", face="bold", size=22, hjust=0)) +
    theme(axis.title = element_text(color="#666666", face="bold", size=18))+ 
    theme(axis.text = element_text(color="#666666", face="bold", size=16))+
    scale_color_brewer(palette="Set1")+
    guides(color=guide_legend(title="Size (m)"))
  
}
