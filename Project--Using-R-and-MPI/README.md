# Project: Word-count using 11 node MPI Cluster & Data Analysis of its results using ‘R
(Contributed by: Nimish Joshi, Ameya Kathapurrkar, Rushikesh Jagdale & Tahhan Sadaf Yusuf)

# Abstract -
    The rapid growth of measuring paradigms has led to accumulation of “Big-Data”; leading to an urgency of data analysis. Data accumulating at what rate, its understandability and usability is the current task of Data Analysis personnel. With proper handling and appropriate analysis can lead to new results and thus these results can be used for modelling automation. This project is a prototype towards the Big Data problem. MPI based communication coupled with powerful statistical language like R has paved the way to solve complex data analytic problem. We use the same tools to demonstrate the analysis of a sample data to plot its graphs and display its meaning from supplied dataset of dictionary.

# INTRODUCTION:

  * Data now stream from daily life: from phones and credit cards and televisions and computers; from the infrastructure of cities; from sensor-equipped buildings, trains, buses, planes, bridges, and factories. The data flow so fast that the total accumulation of the past two years—a zettabyte—dwarfs the prior record of human civilization. “There is a big data revolution,” says Weather head University Professor Gary King. But it is not the quantity of data that is revolutionary. “The big data revolution is that now we can do something with the data.” The revolution lies in improved statistical and computational methods, not in the exponential growth of storage or even computational capacity, King explains. The doubling of computing power every 18 months (Moore’s Law) “is nothing compared to a big algorithm”—a set of rules that can be used to solve a problem a thousand times faster than conventional computational methods could. 

  * The project touchbacks the Data Analytic problem and takes towards solving critical applications. The moto is to pass a data set to the MPI cluster and then count the frequency of data that occurs frequently. Scripting language like python glues the application and produces output for usage in R. The R generates statistics and produces data for simple usability and result orientation.

# METHODOLOGY:

  * To serve the objective of this project one of the possible ways can be point to point communication that allows the transmittal of data between a pair of processes through sending data from one side and receiving at the other end. Message passing among 11 processes (1 master,10 slaves) is completed using comm.send(data,dest,tag) and comm.recv(source,tag) methods.
  * The tag information allows selectivity of messages at the receiving end. The number of processes in a communicator and the calling process rank can be respectively obtained with methods Get_size() and Get_rank(). Library “sys” is imported to use it in taking input of words as arguments in master(rank=0) and send these 10 words to 10 different slaves( from rank 1 to 10).  Each of the 10 slave process count number of occurrences of corresponding received word from searchtest.txt file and send the number of counts to rank 0. In R part of the project, two files are considered: one is the “output.csv” which is the output file from python that contains desired list of words and count of these and other is a dictionary file named “dictionary_new.csv”. Using read.csv() command will allow the files to be read and converted into data frame type at the same time. 
  
  * This data-frame format helps to handle files easily in R environment. Importing of library “gdata” and “plotrix” is necessary before performing any data analysis and plotting in R. Then data from “output.csv” is plotted and presented graphically to show the count of chosen words. In addition, logic of looking up for exact words in dictionary is implemented using is.na() and pmatch() functions. Comparing between the columns of words from two csv files using pmatch() or partial matching function can provide combination of indices of matching words. Then applying is.na() or is not available function on pmatch() will provide non-matched words. Negation of this logic provide the desired output of matching words with corresponding meaning from the dictionary. Finally the result will be shown in the console window from dictionary data frame mydata.

# FUNCTIONALITY:

  * The words to be searched are parsed by the user. Python script will use Message Parsing Interface (MPI) for searching the words from the text file. In python collective communication is used for broadcasting text file, and point-to-point communication for parsing the words to each slave node. In this project we are using 10 nodes for searching 10 different words. Each node will run word searching logic and will output word count for respective words. Master node will collect word count from each node and generate output file which contains each word and its count. This file is parsed to R for further data analysis.
  
  * R is used to display plots for word counts in a text file and also to find meaning of respective words from Dictionary file; which is parsed to R from local directory. In graphical presentation pie chart, bar plot and 3D pie chart is been used. All the plots are generated in a PDF format and are saved to local folder. For finding meaning of a word generic function ‘is.na’ and ‘match’ are used in R.

# RESULTS:
   
	* The scripts contains three essential parts, considering all required library mentioned above are preloaded into the system with proper requirements. These three parts are followed.
    * 1.	Python script
    * 2.	R-script
    * 3.	Bash script
    * 
* The bash script will combine these two: python and R-script to-gather. It fulfils our motto of scripts automation to speed up the process and to reduce the manual implementation of individual script.  
We will look each results one by one.
  *1.	Python Script:




