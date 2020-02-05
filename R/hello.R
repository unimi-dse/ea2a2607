# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
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

hello <- function() {
  print("Hello, world!")
}

#dataset_df<-read.csv(system.file("extdata", "Tesla top 5.csv", package="teslasales"),sep=",")


LoadData <- function(){
  #E=new.env()
  Data4Exam<-read.csv("ThData4Exam.csv", stringsAsFactors = FALSE)
  Data4Exam$X <- NULL
  View(Data4Exam)
  Data4exam <- list(Data4Exam)
  return(Data4Exam)
}
#programmare una main Data4Exam=LoadData()
#Data4Exam <-as.data.frame(Data4Exam)
#Data4Exam <- data.frame(ThData4Exam, stringsAsFactors = FALSE)
#View(Data4Exam)

Organize = function(){
by_Timess <- Data4Exam %>% group_by(Times)
 DatasetEx = by_Timess %>% summarise_all(mean)
Pricess <- data.frame(DatasetEx$Times,DatasetEx$Best1price, DatasetEx$Best2price, DatasetEx$Best3price, DatasetEx$Best4price, DatasetEx$Best5price, DatasetEx$Worst1price,DatasetEx$Worst2price,DatasetEx$Worst3price,DatasetEx$Worst4price, DatasetEx$Worst5price, stringsAsFactors = FALSE)
Tot_Rev <- data.frame(DatasetEx$Times,DatasetEx$Best1Tot_Rev, DatasetEx$Best2Tot_Rev, DatasetEx$Best3Tot_Rev, DatasetEx$Best4Tot_Rev, DatasetEx$Best5Tot_Rev, DatasetEx$Worst1Tot_Rev,DatasetEx$Worst2Tot_Rev,DatasetEx$Worst3Tot_Rev,DatasetEx$Worst4Tot_Rev, DatasetEx$Worst5Tot_Rev, stringsAsFactors = FALSE)
 Market_shares = data.frame(DatasetEx$Times,DatasetEx$Best1Market_shares, DatasetEx$Best2Market_shares, DatasetEx$Best3Market_shares, DatasetEx$Best4Market_shares, DatasetEx$Best5Market_shares, DatasetEx$Worst1Market_shares,DatasetEx$Worst2Market_shares,DatasetEx$Worst3Market_shares,DatasetEx$Worst4Market_shares, DatasetEx$Worst5Market_shares, stringsAsFactors = FALSE)
 Cartel_Market_shares = data.frame(DatasetEx$Times,DatasetEx$Best1Cartel_market_shares, DatasetEx$Best2Cartel_market_shares, DatasetEx$Best3Cartel_market_shares, DatasetEx$Best4Cartel_market_shares, DatasetEx$Best5Cartel_market_shares, DatasetEx$Worst1Cartel_market_shares,DatasetEx$Worst2Cartel_market_shares,DatasetEx$Worst3Cartel_market_shares,DatasetEx$Worst4Cartel_market_shares, DatasetEx$Worst5Cartel_market_shares, stringsAsFactors = FALSE)
 return(list(DatasetEx,Pricess, Tot_Rev,Market_shares,Cartel_Market_shares)  )}

# Org.group=Organize() Org.group[[1]], Org.group[[2]] Org.group[[3]] Org.group[[4]] Org.group[[5]]
# Vargroup$2 Vargroup$3 Vargroup$4 Vargroup$5 Org.group[[3]]

Plot.group.num = function(TP=NULL, TR=NULL, Mrk_shares=NULL, C_Mrk_shares=NULL){

   if(!is.null(TP))

  {TP <- melt(Org.group[[2]] , id.vars = 'DatasetEx.Times', variable.name = 'series')
 dfp <- melt(df ,  id.vars = 'Time', variable.name = 'Prce series')
 ggplot(TP, aes(DatasetEx.Times,value)) + geom_line(aes(colour = series))}

   if(TR)

{TR <- melt(Org.group[[3]] ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
 dft <- melt(df ,  id.vars = 'Times', variable.name = 'series')
 ggplot(TR, aes(DatasetEx.Times,value)) + geom_line(aes(colour = series))}


  if(!is.null(Mrk_shares))

 {Mrk_shares <- melt(Org.group[[4]] ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
 dfs <- melt(df ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
 ggplot(Mrk_shares, aes(DatasetEx.Times,value)) + geom_line(aes(colour = series))}


 if(!is.null(C_Mrk_shares))

 {C_Mrk_shares <- melt( Org.group[[5]] ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
 dfcs <- melt(df ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
 ggplot(C_Mrk_shares, aes(DatasetEx.Times,value)) + geom_line(aes(colour = series))}
}

Plot.group.num = function(n){

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


#areg(Org.group[[2]]$DatasetEx.Best1price,Org.group[[2]]$DatasetEx.Worst1price)
Regmaker = function(){

}


Plot.Price = function(){

  TP <- melt(Org.group[[2]] , id.vars = 'DatasetEx.Times', variable.name = 'series')
  dfp <- melt(df ,  id.vars = 'Time', variable.name = 'Prce series')
  ggplot(TP, aes(DatasetEx.Times,value)) + geom_line(aes(colour = series))}

Plot.Rev = function(){

  TR <- melt(Org.group[[3]] ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
  dft <- melt(df ,  id.vars = 'Times', variable.name = 'series')
  ggplot(TR, aes(DatasetEx.Times,value)) + geom_line(aes(colour = series))}

Plot.Mrk.sh = function(){


  Mrk_shares <- melt(Org.group[[4]] ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
  dfs <- melt(df ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
  ggplot(Mrk_shares, aes(DatasetEx.Times,value)) + geom_line(aes(colour = series))}


Plot.C.Mrk = function(){


  C_Mrk_shares <- melt( Org.group[[5]] ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
  dfcs <- melt(df ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
  ggplot(C_Mrk_shares, aes(DatasetEx.Times,value)) + geom_line(aes(colour = series))}

















