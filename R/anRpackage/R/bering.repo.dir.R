bering.repo.dir <-
function(dirname){

# check existence of the directory dirname and creates if do not exist
mainDir <- "~"
subDir <- dirname
ifelse(!dir.exists(file.path(mainDir, subDir)), dir.create(file.path(mainDir, subDir)), FALSE)

# Create a directory where to save the local CRAN repositories
dirname <- path.expand(subDir)


# create the src/contrib directory
contribDir <- file.path(dirname, "src", "contrib")
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
