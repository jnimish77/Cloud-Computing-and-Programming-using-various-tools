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

* Code:4 Implement the Load-balancing fix to the code trapParallel_1.py. The program should be able
  to take in any number of trapezoids n for any number of processes and the trapezoids
  should divide themselves among the processes evenly, differing by at most one between
  any two processes.

