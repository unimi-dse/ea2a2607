#'Plot.group
#'
#'Return a linear plot of all 10 observed agent group according to n.
#'
#'@param n (1:4) 1 for grouping according to price variables, 2 revenues, 3 market share, 4 cartel's market share
#'
#'@return Plot
#' \describe{
#'   \item{Time}{Variable always used on the x-axis }
#'   \item{Price series}{Variable used on the y-axis if n=1, prices of the 10 observed firms}
#'   \item{Revenues series}{Variable used on the y-axis if n=2 Revenues of the 10 observed firms}
#'    \item{Market quotas}{Variable used on the y-axis if n=3 Market share of the 10 observed firms}
#'    \item{Cartel's market share}{Variable used on the y-axis if n=4 Cartel's market share of the 10 observed firms}
#'    }
#'
#' @examples
#'
#' Plot.group(1)
#'
#' Plot.group(4)
#'
#' @export

Plot.group = function(n){
  Org.group=ManaSimul::Org.group

    {TP <- reshape2::melt(Org.group[[n+1]] , id.vars = 'DatasetEx.Times', variable.name = 'series')
  dfp <- reshape2::melt(df ,  id.vars = 'Time', variable.name = 'series')
  graph1 =ggplot2::ggplot(TP,ggplot2::aes(DatasetEx.Times,value)) + ggplot2::geom_line(ggplot2::aes(colour = series))
  return(graph1)}
}

#'Regmakercoeff
#'
#'This function automatically compound all the possible multilinear regression, with anova, using all variables present in the dataset and
#' gives back a rda file composed of all the information necessary organize
#'
#'
#'@return data.frame
#' \describe{
#'   \item{Coeff_frame}{The output is a data.frame composed of all the coefficients and their relative P-values organize. }
#'    }
#'
#' @examples
#'
#' RegmakerCoeff()
#'
#' @export

RegmakerCoeff=function(){
  DatasetEx = ManaSimul::DatasetEx
  coeff_frame= data.frame(stringsAsFactors = FALSE)
   for (i in colnames(DatasetEx))
  {
    DatasetEx=as.data.frame(DatasetEx)
    model=lm(DatasetEx[,i] ~. -(DatasetEx[,i]), DatasetEx)
    P_s=summary(model)$coefficients[,4]
    regcoef = coef(model)
    coeff_frame=rbind(coeff_frame,regcoef)
    coeff_frame=rbind(coeff_frame,P_s)
    }
  x = 0
  Onion = NULL

  repeat
  { a = lessR::to("Coeff", x ,from = x, same.size = TRUE )
  e = lessR::to("P-value", x,from = x, same.size = TRUE)
  Onion =append(Onion,a)
  Onion =append(Onion,e)
  x = x + 1
  if (x==44){
    break
  }
  }

  rownames(coeff_frame)= Onion
  VCL= c("Intercepts",colnames(DatasetEx))
  colnames(coeff_frame) = VCL
  return(coeff_frame)
}
