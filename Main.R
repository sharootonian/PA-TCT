library('R6')
library('data.table')
library('plyr')
library('dplyr')
library('stringr')
library('png')
library('grid')
library('ggplot2')
library('jsonlite')
library('svgR')
library('circular');
library('plyr');
library('CircStats');
library('ggExtra');
library('ggpubr');
library('R.matlab')
##Exp1
#fit directory
data1 = read.csv("C:/Users/Sev/Documents/git/PA-TCT/Data/Processed/Exp1Data.csv")
#plot exp1 
DEvsAEplot(data1,1)
AEplot(data1,1)
DEplot(data1,1)

##Exp2
data2 = read.csv("C:/Users/Sev/Documents/git/PA-TCT/Data/Processed/Exp2Data.csv")
#plot exp2 
DEvsAEplot(data2,2)
AEplot(data2,2)
DEplot(data2,2)

DEsize(data2) #fig 4A
DEsd(data2)   #fig 4B
DEvar(data2)  #fig 4c




