import numpy
import sys
from mpi4py import MPI

comm = MPI.COMM_WORLD
rank = comm.Get_rank()

randNum = numpy.zeros(1)

rank = 1
a=input("number of processes ?? \n")

while(rank<a):    
        randNum = numpy.random.random_sample(1)
        print "Process", rank, "draw the number", randNum[0]   
        comm.Send(randNum, dest=0)        
        comm.Recv(randNum, source=0)  
        print "Process", rank+1, "received the number", randNum[0]
     	rank = rank +1

if(rank==a):
        randNum = numpy.random.random_sample(1)
        print "Process", rank, "draw the number", randNum[0]
        comm.Send(randNum, dest=0)
        comm.Recv(randNum, source=0)
        print "Process", "1", "received the number", randNum[0]
