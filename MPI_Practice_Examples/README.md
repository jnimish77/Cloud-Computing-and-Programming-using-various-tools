# MPI: using point to point & Collective Communication examples.


* Code_1.: Rewrite the first example of code “passRandomDraw.py” so that it passes instead a n x 1
  vector of random draws from one process to the other. For practice, write it so that the user
  inputs at execution the value of n on the command-line (similar to the code developed in this
  section for the trapezoid rule.
  
* Code_2: Try modifying some of the parameters in comm.Send and comm.Recv in the code from the
  previous exercise (dest, source, and tag). What happens to the program? Does it hang or
  crash? What do you suppose the tag parameter does? 
  
* Code_3: We will again rewrite the first example code “passRandomDraw.py”. This time write the
  program so that each process i sends a random draw to to process i+1. The process with
  the highest number will send to the root process. Notice that we are communicating in a
  ring. For communication, only use Send and Recv. The program should work for any
  number of processes. (Hint: Remember that Send and Recv are blocking functions.
  Because each process will be sending and receiving,if every process calls its Recv first, the
  program will hang. What about if each calls Send?)

* Code_4: In our parallel implementation of the calculation of the dot product,
  “dotProductParallel_1.py”, the number of processes must evenly divide the
  length of the vectors. Rewrite the code so that it runs regardless of vector
  length and number of processes (though for convenience, you may
  assume that the vector length is greater than the number of processes).
  Remember the principle of load balancing. Use Scatterv() to accomplish
  this.

* code_5: Alter your code from the previous exercise so that it calculates the
  supremum norm(the maximal element) of one of the vectors (choose any
  one). This will include changing the operator Op in the call to Reduce.

*code_6: Use Scatter to parallellize the multiplication of a matrix and a vector. There
  are two ways that this can be accomplished. Both use Scatter to distribute
  the matrix, but one uses Bcast to distribute the vector and Gather to finish
  while the other uses Scatter to segment the vector and finishes with
  Reduce. Outline how each would be done. Discuss which would be more
  efficient (hint: think about memory usage). Then, write the code for the
  better one. Generate an arbitrary matrix on the root node. You may
  assume that the number of processes is equal to the number of rows
  (columns) of a square matrix. Example code demonstrating scattering a
  matrix is shown below:
  
          from mpi4py import MPI
          import numpy
          comm = MPI.COMM_WORLD
          rank = comm.Get_rank()
          A = numpy.array([[1.,2.,3.],[4.,5.,6.],[7.,8.,9.]])
          local_a = numpy.zeros(3)
          comm.Scatter(A,local_a)
          print "process", rank, "has", local_a

