
Random.letter <- function(){
  sample(LETTERS,1)
}
library(parallel)
#Not in parallel
startNP <- Sys.time()
replicate(100000, Random.letter())
endNP <- Sys.time()
Not.Parallel.time <- endNP - startNP

#In Parallel
numCores <- detectCores()
cl <- makeCluster(numCores)  
Parallel.Time <- system.time({
  Paralell.Output <- parSapply(cl, 1:100000, function(i){sample(LETTERS, 1)})
})[3]
stopCluster(cl) 

cat("Non-parallel time was", Not.Parallel.time, "\n")
cat("Parallel time was", Parallel.Time, "\n")
diff <- Not.Parallel.time - Parallel.Time
cat("The parallel time was", diff, "seconds faster than the non-parallel time")

