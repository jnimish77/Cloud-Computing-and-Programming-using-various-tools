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



#!/usr/bin/env Rscript


library(gdata)

library(plotrix)

data=read.csv("outputfile.csv")
cat("\t# user input words from the MPI script:")
cat("\t\n")
cat("\n")
data

cat("\t\n")
cat("\n")

mydata = read.csv("dictionary_new.csv")
cat("\t# Custiized small set of Dictionary Words:")
cat("\t\n")
cat("\n")
mydata

cat("\t\n")
cat("\n")

var= mydata[!is.na(pmatch(mydata$col1,data$col1)),]
cat("\t# the dictionary output of the user input words are:")
cat("\t\n")
cat("\n")
var



#************Graph Plotting***************
attach(data)



pie(col2,labels = col1,main = "PIE CHART")
pie3D(col2,labels = col1,explode = 0.1,main = "3D PIE CHART")

plot(col1,col2,xlim=c(0,10),ylim=c(0,10),las=2)
title("Plot of Word Frequency")

color=c("Yellow","red","blue","Orange","Green","Cyan","Pink","purple","black","brown")

barplot(data$col2,xlab = "Words",las =2,col = color)
hist(

