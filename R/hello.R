






#insert value from 1 to 4 1 plot observed prices among the agents, 2 Revenues, 3 Market share, 4 Cartel's market share

Plot.group = function(n){
  "Org.group.rda"
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

#Regmaker() automatically compound all the possible multilinear regression, with anova, using all variables present in the dataset and gives back a rda file composed of all the information necessary organize
Regmaker=function(){
  "DasetEX"
  reg_list=list("Models_results")
  for (i in colnames(DatasetEx))
    {
    DatasetEx=as.data.frame(DatasetEx)
    x= DatasetEx[,i] ~. -DatasetEx[,i]
    model=lm(DatasetEx[,i] ~. -DatasetEx[,i], DatasetEx)
    d=list(suppressWarnings(summary(model)))
    print(d)
    b=list(suppressWarnings(anova(model)))
    print(b)
    reg_list[[i]] = model
    list.append(reg_list,d)
    list.append(reg_list,b)

    }
  save(reg_list, file="Results.rda")
  return(View(reg_list, "Results"))
}










