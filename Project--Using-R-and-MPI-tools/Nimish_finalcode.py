################################################################################
"""
	Word-count using 11 node MPI Cluster 
		&
	Data analysis of its results using 'R'					
"""
#	     Authors: Ameya Kathapurkar						#
#	 	      Nimish Joshi						#
#		      Rushikesh Jagdale						#
#		      Tahhan Sadaf Yusuf					#
#										#
#	This code will need any .txt file that contains words/paragraphs.	#
#										#
#################################################################################



#! usr/bin/env python

import sys
import numpy as np
import time
import re 
from mpi4py import MPI
comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()
from mpi4py.MPI import ANY_SOURCE



count = 0



#the text file would be read here.
text = open('searchtest.txt', 'r')


if rank == 0: 
	    a = str(sys.argv[1])
            b = str(sys.argv[2])
	    c = str(sys.argv[3])

	    d = str(sys.argv[4])
	    e = str(sys.argv[5])
	    f = str(sys.argv[6])


	    g = str(sys.argv[7])
	    h = str(sys.argv[8])
	    i = str(sys.argv[9])


	    j = str(sys.argv[10])
            s1={} 
	    s2={}
            s3={}
            s4={} 
	    s5={}
            s6={}
	    s7={} 
	    s8={}
            s9={}
            s10={}
            count = 0



	    c1={}
	    c2={}
	    c3={}
	    c4={}
	    c5={}
	    c6={}
            c7={}
	    c8={}
	    c9={}
            c10={}  
             
	    
	    # the '.txt file will be broadcasted to the slave nodes
	    comm.bcast(text,root=0)
	    print " \n\t# ...sending the '.txt' file to diifferent nodes \n:"
            
 	    #Now one by one all user inputs would be sent to 10 slave nodes: one node will receive only one word.
	    print " \t# ...sending the individual user input to slave nodes\n\n"
	    
            comm.send(a,dest=1,tag=11)
	    comm.send(b,dest=2,tag=11)
            comm.send(c,dest=3,tag=11)
	    comm.send(d,dest=4,tag=11)  
            comm.send(e,dest=5,tag=11)
	    comm.send(f,dest=6,tag=11)
            comm.send(g,dest=7,tag=11)
	    comm.send(h,dest=8,tag=11)
            comm.send(i,dest=9,tag=11)
	    comm.send(j,dest=10,tag=11)
	
            # Output will be written and store inot .csv file into two column format:
	    with open('outputfile.csv','w') as outputfile:
		print >> outputfile, "col1,col2"
	    # Receiving the count of words from all the nodes
            c1 = comm.recv(source=1,tag=13)
            c2 = comm.recv(source=2,tag=13)
	    c3 = comm.recv(source=3,tag=13)	
	    c4 = comm.recv(source=4,tag=13)
	    c5 = comm.recv(source=5,tag=13) 
            c6 = comm.recv(source=6,tag=13)
	    c7 = comm.recv(source=7,tag=13)	
	    c8 = comm.recv(source=8,tag=13)
	    c9 = comm.recv(source=9,tag=13)
            c10 = comm.recv(source=10,tag=13) 
	    print ("\t# all counts have been received from slave nodes\n\n")
	    
         
            print "The count of the word: ","'",c1[0],"'"," is:",c1[1]
 	    print "\nThe count of the word: ","'",c2[0],"'"," is:",c2[1]
            print "\nThe count of the word: ","'",c3[0],"'"," is:",c3[1]
 	    print "\nThe count of the word: ","'",c4[0],"'"," is:",c4[1] 
            print "\nThe count of the word: ","'",c5[0],"'"," is:",c5[1]
            print "\nThe count of the word: ","'",c6[0],"'"," is:",c6[1]
            print "\nThe count of the word: ","'",c7[0],"'"," is:",c7[1]
            print "\nThe count of the word: ","'",c8[0],"'"," is:",c8[1]
            print "\nThe count of the word: ","'",c9[0],"'"," is:",c9[1]
            print "\nThe count of the word: ","'",c10[0],"'"," is:",c10[1],"\n"
            

		
    
elif rank == 1:
  		#data is received from the master nodes
                s1 = comm.recv(source=0,tag=11)
		#Now, we looking into the logic to find the number of counts for the user word
		for line in text:
                    for part in line.split():
                        if s1 == part:
                           count += 1      
                #each count will be written into the .csv file one by one in order
                with open('outputfile.csv','a') as outputfile:
			print >> outputfile, s1,",",count
		#it sends the count and the word to the master node
		comm.send([s1,count],dest=0,tag=13)	 

elif rank == 2:
  		
                s2 = comm.recv(source=0,tag=11)
		for line in text:
                    for part in line.split():
                        if s2 == part:
                           count += 1      
                           
		with open('outputfile.csv','a') as outputfile:
	        	print >> outputfile, s2,",",count 
		comm.send([s2,count],dest=0,tag=13)

elif rank == 3:
  	 	
                s3 = comm.recv(source=0,tag=11)
		for line in text:
                    for part in line.split():
                        if s3 == part:
                           count += 1      
                 
		with open('outputfile.csv','a') as outputfile:
	        	print >> outputfile, s3,",",count 		
		comm.send([s3,count],dest=0,tag=13)

elif rank == 4:
  		
                s4 = comm.recv(source=0,tag=11)
		for line in text:
                    for part in line.split():
                        if s4 == part:
                           count += 1      
                
		with open('outputfile.csv','a') as outputfile:
	        	print >> outputfile,s4,",",count  
		comm.send([s4,count],dest=0,tag=13)	
		        
elif rank == 5:
  		
                s5 = comm.recv(source=0,tag=11)
		for line in text:
                    for part in line.split():
                        if s5 == part:
                           count += 1      
                
		with open('outputfile.csv','a') as outputfile:
	        	print >> outputfile, s5,",",count 
		comm.send([s5,count],dest=0,tag=13)

elif rank == 6:
  		
                s6 = comm.recv(source=0,tag=11)
		for line in text:
                    for part in line.split():
                        if s6 == part:
                           count += 1      
                
		with open('outputfile.csv','a') as outputfile:
	        	print >> outputfile,s6,",",count  
		comm.send([s6,count],dest=0,tag=13)	
        
elif rank == 7:
  		
                s7 = comm.recv(source=0,tag=11)
		for line in text:
                    for part in line.split():
                        if s7 == part:
                           count += 1      
                
		with open('outputfile.csv','a') as outputfile:
	        	print >> outputfile, s7,",",count 
		comm.send([s7,count],dest=0,tag=13)

elif rank == 8:
  		
                s8 = comm.recv(source=0,tag=11)
		for line in text:
                    for part in line.split():
                        if s8 == part:
                           count += 1      
                
		with open('outputfile.csv','a') as outputfile:
	        	print >> outputfile, s8,",",count 
		comm.send([s8,count],dest=0,tag=13)	
        
elif rank == 9:
  		
                s9 = comm.recv(source=0,tag=11)
		for line in text:
                    for part in line.split():
                        if s9 == part:
                           count += 1      
                
		with open('outputfile.csv','a') as outputfile:
	        	print >> outputfile,s9,",",count 	
		comm.send([s9,count],dest=0,tag=13)

else:
  		
                s10 = comm.recv(source=0,tag=11)
		for line in text:
                    for part in line.split():
                        if s10 == part:
                           count += 1 
     
		with open('outputfile.csv','a') as outputfile:
	        	print >> outputfile,s10,",",count 
		comm.send([s10,count],dest=0,tag=13)                 
	
        	
  
        


