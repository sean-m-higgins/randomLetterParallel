# Hello, world!
#
# This is an example function named 'hello' 
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

run <- function() {
  library(parallel)
  detectCores()
  ## [1] 4
  # Calculate the number of cores
  no_cores <- detectCores() - 1
  # Initiate cluster
  cl <- makeCluster(no_cores)
  
  print("non-parallel: 10000000")
  start <- Sys.time()
  lapply(1:10000000, function(x){x^2})
  end <- Sys.time()
  print(end-start)
  
  print("parallel: 10000000")
  start <- Sys.time()
  parLapply(cl, 1:10000000, function(x){x^2})
  end <- Sys.time()
  print(end-start)
  ## Time difference of 0.05823398 secs
  stopCluster(cl)
}
