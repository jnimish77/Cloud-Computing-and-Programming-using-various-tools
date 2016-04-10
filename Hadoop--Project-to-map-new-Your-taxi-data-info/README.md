#  Overview
  A project to map the New York Taxi data information from a large set of the database file; 
  by creating map & reduce functions that investigates the file, load each line into a set of variables and output the count of the different characteristics.

#Note: 
 * This is an academic project: 
 
 * it requires a file called "unixstadium.csv' on hadoop cluster (in this case it was built in the campus's cloud infrastructure) that was insid the directory name'taxi'


# Introduction

* Hadoop is written in JAVA that give a Hadoop is written in java: provides a distributed file system (HDFS) and a framework+api for   building and running Map reduce jobs
* HDFS is a fle system which is distributed across several machines. Not a relacement to a regular file system.
* HFDS has built in mechanisms to optimize throughput and handle machine outages.
  * Data node: where HDFS stores the data
  * Name node: Master machine
  * Secondary Name node: keeps a copy of edit logs, filesystem image (to be deprecated?)
  * Data is accessed using Java API or command line
* Here is the place where we keep our file that is need to be mapped. In perticlular case our file will be “ unixstadiums.csv”

 *To double check this file into the correct place we type:

              hdfs  dfs -ls /taxi

* MapReduce layer in Hadoop: Hadoop has APIs for Map (transformation) and Reduce (aggregation) operations
* Output to  reduce: Key, Value pair. Input to reduce: Key, Inerrable[Value]. Now  reducer is called once per key output by map.       Inerrable value is the set of values output by the map phase.
* 3 stages between map and reduce: partitioning, sorting, grouping. Provide scaling.
* No dependency between mappers and reducers.
* Two services for scheduling MapReduce jobs: Job Tracker (JT) and Task Tracker(TT). Have auto-retries to guard against failure, TT    can use data locality, JT can blacklist TTs, JT can speculatively execute
* Non python frameworks: Hive (SQL query against hadoop), Pig, RHadoop, Scoobi,
* Python frameworks to work with hadoop: Hadoop Streaming, mrjob (if using Amazon EMR), dumbo, hadoopy, pydoop, luigi.
* If we used Java, we would have a main method, a mapper class and a reducer class.
  o main: set # reducers, set mapper and reducer classes, set partitioner, other setings
  o	mapper: take Key Value and output Key, Value
  o	reducer: it takes Key, Inerrable and output key, Value
* Hadoop Streaming is a Java library that implements these. Allows piping. Assume Key and Value are separated by \t. Is present in     Hadoop’s lib directory.

# Approach 

* first step is to create mapper.py
* secobnd would be to create reducer.py
*The point to be noted here is that first the mapper class executes completely on the entire data set splitting the words and forming  the initial key value pairs. Only after this entire process is completed the reducer starts. Say if we have a total of 10 lines in    our input files combined together, first the 10 lines are tokenized and key value pairs are formed in parallel, only after this the   aggregation/ reducer would start its operation.

* Now coming to the practical side of implementation we need our input file and map reduce program jar to do the process job. In a      common map reduce process two methods do the key job namely the map and reduce , the main method would trigger the map and reduce     methods.

   *Now, in the next step we will be running this file to the Local environment: using the CLI:

          $ cat unixstadiums.csv | python mapper.py |
          $ cat unixstadiums.csv | python mapper.py | python reducer.py
          $ cat unixstadiums.csv | python mapper.py | sort |  python reducer.py

# Output Screen

* the first mapper file will give the output as


      ![1](https://cloud.githubusercontent.com/assets/14539985/14413276/a742bb20-ff3a-11e5-8ebc-f7602eb09e61.png)

* Now in second python file, it will reduce the data that is being scripted as per our requirement:


      ![image](https://cloud.githubusercontent.com/assets/14539985/14413295/4e278e84-ff3b-11e5-9532-3e0cb294638a.png)


* Now, we will sort the values into two points by using 'sort' in between the mapper and reducer file:

      ![image](https://cloud.githubusercontent.com/assets/14539985/14413310/cd76aabc-ff3b-11e5-900a-1a70f4a10955.png)


# Running the Project on Hadoop Cluster

* In order to run the program on the cluster we need to make sure that the input file “ unixstadium.csv” is there on the cluster
    
     *we will run this followin command.
          hadoop \
          jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming-2.7.1.2.3.2.0-2950.jar \
          -file /home/abc123/mapper.py \
          -mapper mapper.py \
          -file /home/abc123/reducer.py \
          -reducer reducer.py \
          -input /taxi/abc123/unixstadiums.csv \
          -output /home/abc123/unixstadium_final_output.txt

* Now , we will see the resulting screeen as :

        ![image](https://cloud.githubusercontent.com/assets/14539985/14413360/e9b1326e-ff3c-11e5-8de9-872472558ab4.png)
        

        ![image](https://cloud.githubusercontent.com/assets/14539985/14413363/f20747be-ff3c-11e5-955e-228a07678480.png)

    
