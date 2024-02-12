{ home, ... }:
{
  # .Rprofile 
  home.file.".Rprofile".text = ''
    options("width"=160)                # wide display with multiple monitors
    options("digits.secs"=3)            # show sub-second time stamps
    r <- getOption("repos")             # hard code the US repo for CRAN
    r["CRAN"] <- "http://cran.us.r-project.org"
    options(repos = r)
    rm(r)
    ## from the AER book by Zeileis and Kleiber
    options(prompt="R> ", digits=4, show.signif.stars=FALSE)
    q <- function (save="no", ...) {
      quit(save=save, ...)
    }
    sshhh <- function(a.package){
      suppressWarnings(suppressPackageStartupMessages(
        library(a.package, character.only=TRUE)))
    }
    auto.loads <-c("dplyr", "ggplot2")
    if(interactive()){
      invisible(sapply(auto.loads, sshhh))
    }
  '';
}
