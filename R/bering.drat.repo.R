
# Create the drat directory with the binary dirs
#bering.repo.dir(drat)


## Call drat package and randomForest
if(!require("randomForest")) {
    install.packages("randomForest", repos='http://cran.us.r-project.org', type="source")
    library("randomForest")
}

if(!require("drat")) {
    install.packages("drat", repos="http://eddelbuettel.github.io/drat")
    library("drat")
}


# Call repo with drat packages 
#drat::addRepo("idroz", 'file:///vagrant/drat')  ## or just addRepo

# install packages


install.packages("bering.ml", repos = "file://vagrant/drat", type="source")     
install.packages("bering.d3", repos = "file://vagrant/drat", type="source")
install.packages("bering.ui", repos = "file://vagrant/drat", type="source")

# update already installed packages
update.packages(ask=FALSE)
