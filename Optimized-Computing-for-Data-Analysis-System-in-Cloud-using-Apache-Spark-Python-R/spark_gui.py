import Tkinter
from Tkinter import *

from Tkinter import Label, W

import Pmw
import sys
import csv
import os
import subprocess
 
root = Tk()
root.title('CITY CRIME DATA ANALYSIS')
Pmw.initialise()


var1 = StringVar()
var1.set('---select---')
opt_menu_1 = Pmw.OptionMenu(root, labelpos=W,
        label_text='City :', menubutton_textvariable=var1,
        items=('Boston', 'Chicago'),
  menubutton_width=16)
opt_menu_1.pack(anchor=W, padx=20, pady=17)



"""var2 = StringVar()
var2.set('---select---')


opt_menu_2 = Pmw.OptionMenu(root, labelpos=W,
        label_text='Zip Code :', menubutton_textvariable=var2,
        items=('60601', '60602', '60603', '60604','60605','60606','60607', '60608', '60609', '60610','60611', '60612', '60613', '60614', '60615','60616','60617','60618','60619','60620', '60621','60622','60623','60624','60625','60626','60627','60628','60629','60630'),
  menubutton_width=16)
opt_menu_2.pack(anchor=W, padx=20, pady=15)"""

var2 = StringVar()


var2 = Pmw.ComboBox(root, labelpos = W, entry_width=16, label_text= 'Zip Code :',entryfield_value='---select---')
for item in reversed(['60601', "60602", "60603", "60604","60605","60606", "60607", "60608", "60609","60610","60611", "60612", "60613", "60614","60615","60616", "60617", "60618", "60619","60620",'60621','60622','60623','60624','60625','60626','60627','60628','60629','60630']):
	var2.insert(0,item)
#var2.configure(width = 16)
var2.pack(anchor=W,padx=20, pady=17)







var3 = StringVar()
var3.set('---select---')

opt_menu_3 = Pmw.OptionMenu(root, labelpos=W,
        label_text='Type of Crime :', menubutton_textvariable=var3,
        items=('THEFT', 'BATTERY', 'CRIMINAL DAMAGE', 'NARCOTICS','OTHER OFFENSE','ASSAULT','DECEPTIVE PRACTICE','BURGLARY','MOTOR VEHICLE THEFT','ROBBERY'),
  menubutton_width=16)
opt_menu_3.pack(anchor=W, padx=20, pady=17)


var4 = StringVar()


var4 = Pmw.ComboBox(root, labelpos = W, entry_width=16, label_text= 'Year :',entryfield_value='---select---')

for item1 in reversed(['2016', '2015', '2014', '2013', '2012','2011','2010','2009', '2008','2007','2006','2005','2004','2003','2002','2001']):
	var4.insert(0,item1)
#var2.configure(width = 16)
var4.pack(anchor=W,padx=20, pady=17)


        


var5 = StringVar()
var5.set('---select---')
opt_menu_5 = Pmw.OptionMenu(root, labelpos=W,
        label_text='Month :', menubutton_textvariable=var5,
        items=('JANUARY', 'FEBRUARY', 'MARCH', 'APRIL', 'MAY', 'JUNE', 'JULY', 'AUGUST', 'SEPTEMBER', 'OCTOBER','NOVEMBER', 'DECEMBER'),
  menubutton_width=16)
opt_menu_5.pack(anchor=W, padx=20, pady=15)




var6 = StringVar()

var6 = Pmw.ComboBox(root, labelpos = W, entry_width=16, label_text= 'Date :',entryfield_value='---select---')

for item1 in reversed(['01', '02', '03', '04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31']):
	var6.insert(0,item1)
#var2.configure(width = 16)
var6.pack(anchor=W,padx=20, pady=17)

    


var7 = StringVar()

var7 = Pmw.ComboBox(root, labelpos = W, entry_width=16, label_text= 'Time Frame :',entryfield_value='---select---')

for item1 in reversed(['(00-01)AM','(01-02)AM','(02-03)AM','(03-04)AM','(04-05)AM','(05-06)AM','(06-07)AM','(07-08)AM','(08-09)AM','(09-10)AM', '(10-11)AM','(11-12)AM','(12-01)PM','(01-02)PM','(02-03)PM','(03-04)PM','(04-05)PM','(05-06)PM','(06-07)PM','(07-08)PM','(08-09)PM', '(09-10)PM','(10-11)PM','(11-12)PM']):
	var7.insert(0,item1)

var7.pack(anchor=W, padx=20, pady=17)


opt_menu_1.pack(fill=X)
var2.pack(fill=X)
#opt_menu_2.pack(fill=X)
opt_menu_3.pack(fill=X)
var4.pack(fill=X)
opt_menu_5.pack(fill=X)
var6.pack(fill=X)
var7.pack(fill=X)


def state(): 
   print "\n \t Selection : \n"
   print "city: ->  ",var1.get(),'\n', "Zip Code: -> ",var2.get(),'\n', "Type of Crime: -> ",var3.get(),'\n', "Year: -> ",var4.get(),'\n', "Month: -> ",var5.get(),'\n', "Date: -> ",var6.get(),'\n', "Time Frame: -> ",var7.get()

   y = var7.get()
   x= var5.get()
   if x== "JANUARY":
      x= '01'
   elif x=="FEBRUARY":
      x= '02'
   elif x=="MARCH":
      x= '03'
   elif x=="APRIL":
      x= '04'
   elif x=="MAY":
      x='05'
   elif x=="JUNE":
      x='06'
   elif x=="JULY":
      x='07'
   elif x=="AUGUST":
      x='08'
   elif x=="SEPTEMBER":
      x='09'
   elif x=="OCTOBER":
       x='10'
   elif x=="NOVEMBER":
       x='11'
   elif x=="DECEMBER":
       x='12'
   
   with open('zip_code.csv','w') as outputfile:
       print >> outputfile, "col1"

   with open('zip_code.csv','a') as outputfile:
       print >> outputfile, var2.get()


   with open('type_of_crime.csv','w') as outputfile:
       print >> outputfile, "col1"

   with open('type_of_crime.csv','a') as outputfile:
       print >> outputfile, var3.get()


   with open('year.csv','wb') as outputfile:
       print >> outputfile, "col1"
   

   with open('year.csv','a') as outputfile:
       print >> outputfile, var4.get()


  # with open('month.txt','wb') as outputfile:
   #    print >> outputfile
   with open('month.csv','wb') as outputfile:
       print >> outputfile, "col1"
   with open('month.csv','a') as outputfile:
       print >> outputfile,x

   with open('date.csv','wb') as outputfile:
       print >> outputfile, "col1"

   with open('date.csv','ab') as outputfile:
       print >> outputfile,var6.get()  
 
   with open('time.csv','wb') as outputfile:
       print >> outputfile, "col1, col2"

   with open('time.csv','ab') as outputfile:
       print >> outputfile, y[1:3],",", y[7:9]


   with open('outputfile.csv','w') as outputfile:
       print >> outputfile, "col1"
   
   with open('outputfile.csv','a') as outputfile:
   	x= [var1.get(),var2.get(),var3.get(),var4.get(),var5.get(),var6.get(),var7.get()]
	for i in x:
       	    print >> outputfile, i


  

Button(root, command=state,bg='green',fg='white', text='submit').pack(padx=20, pady=15)

def carry_on():

	#os.system("python "+ 'gui2.py')
	#os.system("Rscript " + "R/gui3map_final.R")
	os.system("./bin/sparkR " + "/home/nj/R/gui3map_final.R")


Button(root,bg='green',fg='white',text = 'Click To Continue', command = carry_on).pack(padx=20)
#button.pack()


Button(root, text = 'Exit',bg='red',fg='white', command = root.destroy).pack(padx=10, pady=10, side = 'bottom')

#exitButton.
#widget = Demo(root)

root.mainloop()



