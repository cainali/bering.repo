\name{bering.repo.dir}
\alias{bering.repo.dir}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
bering.repo.dir(dirname)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dirname}{
%%     ~~Describe \code{dirname} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (dirname) 
{
    mainDir <- "~"
    subDir <- dirname
    ifelse(!dir.exists(file.path(mainDir, subDir)), dir.create(file.path(mainDir, 
        subDir)), FALSE)
    dirname <- path.expand(subDir)
    contribDir <- file.path(dirname, "src", "contrib")
    dir.create(contribDir, recursive = TRUE)
    rVersion <- paste(unlist(getRversion())[1:2], collapse = ".")
    binPaths <- list(win.binary = file.path("bin/windows/contrib", 
        rVersion), mac.binary = file.path("bin/macosx/contrib", 
        rVersion), mac.binary.mavericks = file.path("bin/macosx/mavericks/contrib", 
        rVersion), mac.binary.leopard = file.path("bin/macosx/leopard/contrib", 
        rVersion))
    binPaths <- lapply(binPaths, function(x) file.path(dirname, 
        x))
    lapply(binPaths, function(path) {
        dir.create(path, recursive = TRUE)
    })
    tools::write_PACKAGES(contribDir, type = "source")
    lapply(binPaths, function(path) {
        tools::write_PACKAGES(path)
    })
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
