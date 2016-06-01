#################################################################
# This is a script to create a drat repository
# Automated drat directory to include the brave packages
#
# The function can be used to create any directory that want to reposit R packages and dependencies
#
#################################################################

#' @dirname: name of the directory (in our case is the drat directory)
#'


repo.dir <- fuction (dirname){


# Create a directory where to save the local CRAN repositories
drat <- path.expand("../dirname")
dir.create(dirname)

# create the src/contrib directory
contribDir <- file.path(drat, "src", "contrib")
dir.create(contribDir, recursive = TRUE)


## R version
rVersion <- paste(unlist(getRversion())[1:2], collapse = ".")

## create binary directories where built binary versions of these packages (for the various architectures supported)
binPaths <- list(
  win.binary = file.path("bin/windows/contrib", rVersion),
  mac.binary = file.path("bin/macosx/contrib", rVersion),
  mac.binary.mavericks = file.path("bin/macosx/mavericks/contrib", rVersion),
  mac.binary.leopard = file.path("bin/macosx/leopard/contrib", rVersion)
)

binPaths <- lapply(binPaths, function(x) file.path(dirname, x))
lapply(binPaths, function(path) {
  dir.create(path, recursive = TRUE)
})

tools::write_PACKAGES(contribDir, type = "source")
lapply(binPaths, function(path) {
  tools::write_PACKAGES(path)
})

}
