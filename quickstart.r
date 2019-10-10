library(data.table)
args = commandArgs(trailingOnly=TRUE)
S1d15<-fread(args[1])
S1d0<-fread(args[2])
S1<-list(d0=S1d0,d15=S1d15)

source("ALICE.R")
S1_alice<-ALICE_pipeline(DTlist=S1,folder="S1_res",cores=1,iter=10,nrec=5e5) #this takes few minutes to run
sapply(S1_alice,nrow)
