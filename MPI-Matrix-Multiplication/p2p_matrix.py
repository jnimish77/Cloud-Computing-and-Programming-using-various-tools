#########################################################
#													                            	#
#     Nimish Joshi									                 		#
#  													                          	#
#     MPI: Matrix Multiplication using         					#
#          Point to Point Communication          				#
#													                            	#
#########################################################

import numpy as np
import time
from mpi4py import MPI
comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()

#create a 1000 x 1000 matrix
A = np.arange(0,10000,0.01).reshape((1000,1000))
print " Matrices A is Equal : "  ,A.shape

print A.shape

B = A.T
print " Transpose of A: " , B.shape

if rank == 0:

        B = np.matrix(B)
        comm.send(B[:,100:200], dest=1, tag=11)

        comm.send(B[:,200:300], dest=2, tag=11)
        comm.send(B[:,300:400], dest=3, tag=11)
        comm.send(B[:,400:500], dest=4, tag=11)
        comm.send(B[:,500:600], dest=5, tag=11)
        comm.send(B[:,600:700], dest=6, tag=11)
        comm.send(B[:,700:800], dest=7, tag=11)
        comm.send(B[:,800:900], dest=8, tag=11)
        comm.send(B[:,900:1000], dest=9, tag=11)


        # A = A.reshape(1000, len(A)/1000)

        A = np.matrix(A)
         Rec_data= {}
        Rec_data[0] = A * B[:,0:100]

        Rec_data[1] = comm.recv(source=1, tag=13)
        print "data received at rank , received : 1"
		Rec_data[2] = comm.recv(source=2, tag=13)
        print "data received at rank , received : 2"
        Rec_data[3] = comm.recv(source=3, tag=13)
        print "data received at rank , received : 3"
        Rec_data[4] = comm.recv(source=4, tag=13)
        print "data received at rank , received : 4"
        Rec_data[5] = comm.recv(source=5, tag=13)
        print "data received at rank , received : 5"
        Rec_data[6] = comm.recv(source=6, tag=13)
        print "data received at rank , received : 6"
        Rec_data[7] = comm.recv(source=7, tag=13)
        print "data received at rank , received : 7"
        Rec_data[8] = comm.recv(source=8, tag=13)
        print "data received at rank , received : 8"
        Rec_data[9] = comm.recv(source=9, tag=13)
        print "data received at rank , received : 9"

        Det = A * B
        print " Determinant is Equal to : ", Det



else:


        B_local = comm.recv(source=0, tag=11)
       #print " try B_Local without .shape" ,B_local

        print "data received at rank , received : " ,rank, B_local.shape

        E_multiply =np.matrix(A) *np.matrix(B_local)
        comm.send(E_multiply, dest=0, tag=13)

        print " E_multiply is equal to  " ,E_multiply

