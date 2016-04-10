#########################################################
#		             	                        #
#  Nimish Joshi						#
#  							#
#  MPI: matrix Multiplication using                     #
#       Covllective Commnication	                #
#						        #
#########################################################

import numpy as np
import time
from mpi4py import MPI
comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()
        #create a 1000 x 1000 matrix
#A = np.arange(0,10000,0.01).reshape((1000,1000))
#print " Matrices A is Equal : "  ,A.shape

#print A.shape

#B = A.T
#print " Transpose of A: " , B.shape

my_N = 4
N = my_N*comm.size

if comm.rank == 0:
        A = np.arange(0,10000,0.01).reshape((1000,1000))
        print " Matrices A is Equal : "  ,A.shape
        B = A.T
        C= [100,200,300,400,500,600,700,800,900,1000]

else:
        A = None
        C = None

A = comm.bcast(A, root = 0)
C = comm.scatter(C,root=0)
dp = np.dot(A,C)
comm.Barrier()
dp = comm.gather(dp, root = 0)
print " Value of D is equal to : " ,dp
