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

run <- function(n = 100000) {
  library(parallel)
  detectCores()
  # Calculate the number of cores
  no_cores = detectCores() - 1
  # Initiate cluster
  cl = makeCluster(no_cores)
  
  ftn = function(x) {
    alphabet = c("a", "b", "c", "d", "e", "f", "g", "h", "i", 
                 "j", "k", "l", "m", "n", "o", "p", "q", "r", 
                 "s", "t", "u", "v", "w", "x", "y", "z")
    alphabet[sample(1:26, 1,replace=F)[1]]
  }
  
  start = Sys.time()
  lapply(1:n, ftn)
  end = Sys.time()
  time1 = end-start

  start = Sys.time()
  parLapply(cl, 1:n, ftn)
  end = Sys.time()
  time2 = end-start
  
  print("n: ")
  print(n)
  print("non-parallel:")
  print(time1)
  print("parallel:")
  print(time2)

  stopCluster(cl)
}
