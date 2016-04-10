#########################################################
#                                                       #
#  Nimish Joshi                                         #
#  10/05/2015                                           #
#  Homework #3 Program to Convolve given two signls     #
#   and observing its output                            #
#                                                       #
#########################################################

import numpy as np          #importing np as numpy library
import matplotlib.pyplot as plt   #importing library for plotting
from matplotlib.backends.backend_pdf import PdfPages  #importing library for pdf conversion


t = np.arange(0, 10, 0.01) # defining starting and ending value of scale
s1 = 10*np.sin(2*t)
s2 = 0.1*np.sin(20*t)

res = np.convolve(s1, s2)   #convolution result of two signal
x1 = np.zeros(shape=(0,1000))   #it takes off the the second half of the signl
x1= res[0:1000]                 #defining limit of the result that we want to show


x2= np.zeros(shape=(1000,))  # takes off the first half of the result
x2 = res[999:1999]

#plotting the graphs

plt.subplot(411)
plt.plot(t,s1)
plt.title('signl 1')
plt.grid(True)

plt.subplot(412)
plt.plot(t,s2)
plt.ylim(-0.10, 0.15)
plt.title('signal 2')

plt.grid(True)
               
plt.subplot(413)
plt.plot(t,x1)
plt.ylim(-8, 8)
plt.title('1st half of the convolution')

plt.subplot(414)
plt.plot(t,x2)
plt.title('Last Half of the Convolution')

plt.subplots_adjust(hspace=.4)  # to adjust space between two graphs
#plt.tight_layout()
plt.show()

# pp = PdfPages('hw3_out.pdf')  # converts the figure/output into the pdf
# pp.savefig(a)
# pp.close()

                  

