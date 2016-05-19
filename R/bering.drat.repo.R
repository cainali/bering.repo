
## Call drat package

if(!require("drat")) {
    install.packages("drat")
    library("drat")
}


# Call repo with drat packages 
drat::addRepo("beringresearch")  ## or just addRepo

# install packages
install.packages("bering.repo")     

# update already installed packages
update.packages()
