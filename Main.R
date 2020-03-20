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
library('circular')
library('plyr')
library('CircStats')
library('ggExtra')
library('ggpubr')
library('R.matlab')
##Exp1
#fit directory
data = read.csv("C:/Users/Sev/Documents/git/PA-TCT/Data/Processed/Exp1Data.csv")
#plot exp1 
AEplot(data,1,"data")     #fig 2A
DEplot(data,1,"data")     #fig 2B
DEvsAEplot(data,1,"data") #fig 2C

##Exp2
data = read.csv("C:/Users/Sev/Documents/git/PA-TCT/Data/Processed/Exp2Data.csv")
#plot exp2 
AEplot(data,2,"data")     #fig 2A
DEplot(data,2,"data")     #fig 2B
DEvsAEplot(data,2,"data") #fig 2c
DEsize(data2,"data") #fig 4A
DEsd(data2,"data")   #fig 4B
DEvar(data2,"data")  #fig 4c



