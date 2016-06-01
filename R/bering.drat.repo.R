
## Call drat package

if(!require("drat")) {
    install.packages("drat")
    library("drat")
}


# Call repo with drat packages 
drat::addRepo("beringresearch/r-cluster")  ## or just addRepo

# install packages
install.packages("bering.ml")     
install.packages("bering.d3")
install.packages("bering.ui")

# update already installed packages
update.packages()
