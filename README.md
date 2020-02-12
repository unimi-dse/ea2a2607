
# ea2a2607
<h1 align="leftr">ManaSimul Package </h1> 

This package was created for the exam _Coding for Data Science and Data Management_, R module (2019/2020), Msc.Data Science and Economics, University of Milan.
The idea it behind is managing simulated data produced by Netlogo, plotting groups of observed variables and run all possible combination fo multilinear regression, thus extimating coefficient. 

## Installation

```R
# first install the R package "devtools" if not installed
devtools::install_github('unimi-dse/ea2a2607')
```

## Dataset

The package provides a dataset containing 44 Variables,  global vars for Times, fine based Tax revenue, Total damage caused by cartel and 4 variables (Price, Revenues, Market share and Cartel's Market share) for the best 5 firms and the worst 5 firms.  

```R
View(ManaSimul::Data4Exam)
```

## Usage

```R
# load the package
require(ManaSimul)
```

### Plot.group(n)

The function `Plot.group(n)` give the possibilty to plot by group the avalaible data accordingly:
```R
 Plot.group(1) Plot the price data from both top 5 firms and bottom 5 firms 
 Plot.group(2) Plot the revenues data from both top 5 firms and bottom 5 firms
 Plot.group(3) Plot the market quotas  from both top 5 firms and bottom 5 firms
 Plot.group(4) Plot the market share of cartels  from both top 5 firms and bottom 5 firms.
```


### Regmaker()


```R
Regmaker()
```

The function `Regmaker()` returns a nested list, inside this list of lists all the data from all possible multilinear regression are organize model by model.



