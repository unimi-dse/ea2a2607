


#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'


require(tidyr)
library(reshape2)
library(ggplot2)
library(dplyr)
library(devtools)
library(roxygen2)
require(Hmisc)
require(foreach)
require(lessR)
require(rlist)


Plot.group = function(n){
  load(file = "Org.group.rda")
  if(n==1)

  {TP <- melt(Org.group[[2]] , id.vars = 'DatasetEx.Times', variable.name = 'series')
  dfp <- melt(df ,  id.vars = 'Time', variable.name = 'Prce series')
   graph1 = ggplot(TP, aes(DatasetEx.Times,value)) + geom_line(aes(colour = series))
   return(graph1)}

  if(n==2)

  {TR <- melt(Org.group[[3]] ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
  dft <- melt(df ,  id.vars = 'Times', variable.name = 'series')
  graph1 = ggplot(TR, aes(DatasetEx.Times,value)) + geom_line(aes(colour = series))
  return(graph1)}


  if(n==3)

  {Mrk_shares <- melt(Org.group[[4]] ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
  dfs <- melt(df ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
  graph1 = ggplot(Mrk_shares, aes(DatasetEx.Times,value)) + geom_line(aes(colour = series))
  return(graph1)}


  if(n==4)

  {C_Mrk_shares <- melt( Org.group[[5]] ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
  dfcs <- melt(df ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
  graph1=ggplot(C_Mrk_shares, aes(DatasetEx.Times,value)) + geom_line(aes(colour = series))
  return(graph1)}
}


Regmaker=function(){
  load(file = "DasetEX.rda")
  reg_list=list("Models_results")
  for (i in colnames(DatasetEx))
    {
    DatasetEx=as.data.frame(DatasetEx)
    x= DatasetEx[,i] ~. -DatasetEx[,i]
    model=lm(DatasetEx[,i] ~. -DatasetEx[,i], DatasetEx)
    #summary(model)
    #anova(model)
     #options(warn=0)
    d=list(suppressWarnings(summary(model)))
    print(d)
    b=list(suppressWarnings(anova(model)))
    #print(b)
    reg_list[[i]] = model#,d,b #lm(my_formula, data = data)
    list.append(reg_list,d)
    list.append(reg_list,b)
    #list.append(Petardo,d,b)
    }
  return(reg_list)
}










