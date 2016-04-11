#!/usr/bin/env python

import numpy
from mpi4py import MPI
import sys
from mpi4py.MPI import ANY_SOURCE

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()

n = float(sys.argv[1])       
randNum = numpy.zeros(n)   

if rank ==0:
        print "Process", rank, "before receiving has the numbers", randNum
        for i in range(1,size):
                comm.Recv(randNum,source = ANY_SOURCE, tag = 3)
                print "Process",i , "received the numbers", randNum
else:
        randNum = numpy.random.random_sample(n)
        print "Process", rank, "before sending has the numbers", randNum
        comm.Send(randNum, dest=0, tag = 5)
