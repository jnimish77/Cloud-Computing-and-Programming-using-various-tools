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

if rank ==2:
        print "Process", rank, "before receiving has the numbers", randNum
        for i in range(3,size):
                comm.Recv(randNum,source = ANY_SOURCE, tag = 6)
                print "Process",i , "received the numbers", randNum
else:
        randNum = numpy.random.random_sample(n)
        print "Process", rank, "before sending has the numbers", randNum
        comm.Send(randNum, dest=0, tag = 5)

""" Note: Send and Recv are referred to as blocking functions. That is, if a process calls Recv,
    it will sit idle until it has received a message from a corresponding Send before it will proceeed.
If it did not receive its message it will indicate to the system that it will be receiving a message, 
proceed beyond theIrecv to do other useful work, and then check back later to see if the message has arrived. 
This can be used to dramatically improve performance

On a Recv you do not always need to specify the source. Instead, you can allow the calling process 
to accept a message from any process that happend to be sending to the receiving process. 
This is done by setting source to a predefined MPI constant, source=ANY_SOURCE 
(note that you would first need to import this with from mpi4py.MPI import ANY_SOURCE or use the syntax source=MPI.ANY_SOURCE).

"""
