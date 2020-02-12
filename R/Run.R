





#'Plot.group
#'
#'Return a linear plot of all 10 observed agent group according to n.
#'
#'@param n (1:4) 1 for grouping according to price variables, 2 revenues, 3 market share, 4 cartel's market share
#'
#' @example
#' \dontrun{
#' Plot.group(1)
#' }
#'
#' @export
#'


Plot.group = function(n){
  Org.group=ManaSimul::Org.group
  #"Org.group.rda"
  if(n==1)

  {TP <- reshape2::melt(Org.group[[2]] , id.vars = 'DatasetEx.Times', variable.name = 'series')
  dfp <- reshape2::melt(df ,  id.vars = 'Time', variable.name = 'Prce series')
   graph1 =ggplot2::ggplot(TP,ggplot2::aes(DatasetEx.Times,value)) + ggplot2::geom_line(ggplot2::aes(colour = series))
   return(graph1)}

  if(n==2)

  {TR <-reshape2::melt(Org.group[[3]] ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
  dft <-reshape2::melt(df ,  id.vars = 'Times', variable.name = 'series')
  graph1 =ggplot2::ggplot(TR,ggplot2::aes(DatasetEx.Times,value)) + ggplot2::geom_line(ggplot2::aes(colour = series))
  return(graph1)}


  if(n==3)

  {Mrk_shares <-reshape2::melt(Org.group[[4]] ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
  dfs <-reshape2::melt(df ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
  graph1 =ggplot2::ggplot(Mrk_shares,ggplot2::aes(DatasetEx.Times,value)) + ggplot2::geom_line(ggplot2::aes(colour = series))
  return(graph1)}


  if(n==4)

  {C_Mrk_shares <-reshape2::melt( Org.group[[5]] ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
  dfcs <-reshape2::melt(df ,  id.vars = 'DatasetEx.Times', variable.name = 'series')
  graph1=ggplot2::ggplot(C_Mrk_shares,ggplot2::aes(DatasetEx.Times,value)) + ggplot2::geom_line(ggplot2::aes(colour = series))
  return(graph1)}
}

#'Regmaker
#'
#'This function automatically compound all the possible multilinear regression, with anova, using all variables present in the dataset and
#' gives back a rda file composed of all the information necessary organize
#'
#'  @examples
#' \dontrun{
#' Regmaker()
#' }
#'
#' @export
#'

Regmaker=function(){
  DatasetEx = ManaSimul::DatasetEx
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
    rlist::list.append(reg_list,d)
    rlist::list.append(reg_list,b)
    }
  save(reg_list, file="Results.rda")
  return(View(reg_list, "Results"))
}










