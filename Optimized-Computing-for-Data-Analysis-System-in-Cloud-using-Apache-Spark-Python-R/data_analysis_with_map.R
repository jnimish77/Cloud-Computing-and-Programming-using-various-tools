#!/usr/bin/env Rscript

library(gdata)
library(plotrix)



z_12 = read.csv("/home/nj/spark-1.6.1/outputfile.csv")
z_12 = as.character(z_12[1,1])


cat("\t# City :",z_12)
cat("\t\n")


data = read.csv("/home/nj/spark-1.6.1/zip_code.csv")
data


class(data)



data2 = read.csv("/home/nj/R/sample_crime_file.csv")
#data2
result_1 = length(data2$col20)
#p = as.character(p)
result_1
cat("\t# Over all Crime Number from the Chicago City data File = ", result_1)
cat("\t\n")

result_2 = result_1 * 22
cat("\t# Total Data Logs from the file = ", result_2)
cat("\t\n")


data2$col1= NULL
data2$col2= NULL
data2$col5=NULL
data2$col9=NULL
data2$col10=NULL
data2$col11=NULL
data2$col12=NULL
data2$col13=NULL
data2$col14=NULL
data2$col15=NULL
data2$col16=NULL
data2$col17=NULL
data2$col18=NULL
data2$col19= NULL
#data2
#------------------1st option------------------------------------------

if(data==60601){
	data3= subset(data2, col20>41.882 & col20<=41.884)
}else if(data==60602){
	data3 = subset(data2, col20>41.8809 & col20<=41.882)
}else if(data==60603){
	data3 = subset(data2, col20>41.8785 & col20<=41.8809)
}else if(data==60604){
	data3 = subset(data2, col20>41.87003 & col20<=41.8785)
}else if(data==60605){
	data3 = subset(data2, col20>41.8818 & col20<=41.87003)
}else if(data==60606){
	data3 = subset(data2, col20>41.8734 & col20<=41.8818)
}else if(data==60607){
	data3 = subset(data2, col20>41.8492 & col20<=41.8734)
}else if(data==60608){
	data3 = subset(data2, col20>41.8063 & col20<=41.8492)
}else if(data==60609){
	data3 = subset(data2, col20>41.8063 & col20<=41.9003)
}else if(data==60610){
	data3 = subset(data2, col20>41.8925 & col20<=41.9003)
}else if(data==60611){
	data3 = subset(data2, col20>41.8817 & col20<=41.8925)
}else if(data==60612){
	data3 = subset(data2, col20>41.8817 & col20<=41.9578)
}else if(data==60613){
	data3 = subset(data2, col20>41.8925 & col20<=41.9003)
}else if(data==60614){
	data3 = subset(data2, col20>41.8004 & col20<=41.9203)
}else if(data==60615){
	data3 = subset(data2, col20>41.8004 & col20<=41.8403)
}else if(data==60616){
	data3 = subset(data2, col20>41.7247 & col20<=41.8403)
}else if(data==60617){
	data3 = subset(data2, col20>41.7247 & col20<=41.9464)
}else if(data==60618){
	data3 = subset(data2, col20>41.7458 & col20<=41.9464)
}else if(data==60619){
	data3 = subset(data2, col20>41.7458 & col20<=41.747)
}else if(data==60620){
	data3 = subset(data2, col20>41.747 & col20<=41.7714)
}else if(data==60621){
	data3 = subset(data2, col20>41.7714 & col20<=41.9013)
}else if(data==60622){
	data3 = subset(data2, col20>41.8476 & col20<=41.9013)
}else if(data==60623){
	data3 = subset(data2, col20>41.8476 & col20<=41.8822)
}else if(data==60624){
	data3 = subset(data2, col20>41.8822 & col20<=41.9711)
}else if(data==60625){
	data3 = subset(data2, col20>41.9711 & col20<=42.0099)
}else if(data==60626){
	data3 = subset(data2, col20>41.6565 & col20<=41.7514)
}else if(data==60628){
	data3 = subset(data2, col20>41.6865 & col20<=41.7728)
}else if(data==60630){
	data3 = subset(data2, col20>41.9721 & col20<=41.9930)
}else if(data == '---select---'){
	data3 = data2
}


#data3
a1= data$col1

result_3= length(data3$col20)
result_3
cat("\t# Total crime for the seleced Zip code: ", a1, " = ", result_3)
cat("\t\n")
#----------3rdnd option starts from here----------#

option2 = read.csv("/home/nj/spark-1.6.1/type_of_crime.csv")
option2
a3= option2$col1
a4 = as.character(a3)
a4
#improve here: instead of if else; use below two lines
cat("\t# Type of Crime Selected:", a4)
cat("\t\n")

option2 = as.character(option2$col1)
if (option2 == '---select---'){
	data4 = data3
}else{
	data4 = data3[grep(option2, data3$col6),]
}



#data4

result_4 = length(data4$col20)
cat("\t# Crime numbe for :", a4, " = ", result_4)
cat("\t\n")

#------------4th Option starts from here----------#

option3 = read.csv("/home/nj/spark-1.6.1/year.csv")
a5 = option3$col1

if (option3 == '---select---'){
	data5 = data4
}else{
	data5 = data4[grepl(option3$col1, data4$col3),]
}


result_5 = length(data5$col20)
#data5
cat("\t# Crime numbe in :", a5, " = ", result_5)
cat("\t\n")
#------------5th Option starts from here----------#


library(dplyr)

option4 = read.csv("/home/nj/spark-1.6.1/month.csv", colClasses='factor')

option4
z1=option4$col1
z2 = as.character(z1)
z2


if (option4 == '---select---'){
	data6 = data5
}else{
	data6 = data5%>% filter(format(as.Date(data5$col3, format = "%m/%d/%Y"), "%m") == z2)
}

z5_1 = read.csv("/home/nj/spark-1.6.1/outputfile.csv")
z5_1
z5_1 = as.character(z5_1[5,1])

result_6 = length(data6$co20)
cat("\t# Crime numbe in the month :",z5_1, " = ", result_6)
cat("\t\n")
#data6

#------------6th Option starts from here----------#

option5 = read.csv("/home/nj/spark-1.6.1/date.csv", colClasses='factor')
option5


z3= option5$col1
z4= as.character(z3)
z4
if (option5 == '---select---'){
	data7 = data6
}else{
	data7 = data6%>% filter(format(as.POSIXct(data6$col3, format = "%m/%d/%Y %H:%M:%S"), "%d") == z4)
}

#data7
result_7 = length(data7$col20)
cat("\t# Crime numbe for the Date :",z4, " =", result_7)
cat("\t\n")

#------------7th Option starts from here----------#
z_15 = read.csv("/home/nj/spark-1.6.1/outputfile.csv")
z_15 = as.character(z_15[7,1])

option7 = read.csv("/home/nj/spark-1.6.1/time.csv", colClasses='factor', strip.white=T)
option7

z5= option7$col1
z6= as.character(z5)
z6

z7=option7$col2
z8=as.character(z7)
z8
data7

if (z5 == '--'){
	data8 = data7
        data9 = data8
}else{
	data8=  data7%>% filter(format(as.POSIXct(data7$col3, format = "%m/%d/%Y %I:%M:%S %p"), "%I") == z6)
        data9 = data8%>% filter(format(as.POSIXct(data8$col3, format="%m/%d/%Y %I:%M:%S %p"), "%p") == z8)
}


#data8


#data9
result_8 = length(data9$col20)
cat("\t# Crime numbe in the time slot :",z8, " = ", result_8)
cat("\t\n")

#data9 =data5%>% filter(format(as.POSIXct(data5$col3, format="%m/%d/%Y %I:%M:%S %p"),"%p")=="PM")
data9

#------------------------------GUI-----------------Starts here--------------------------
library(tcltk)
library(tcltk2)


win2  <- tktoplevel()
tktitle(win2) <- "A read-only text"
win2$env$txt <- tk2text(win2, width = 60, height =10)
tkpack(win2$env$txt, fill = "both", expand = TRUE)
# You must insert text before to disable edition!
tkinsert(win2$env$txt, "end", "\t #------You have made these selections------\n\n\t")
tkinsert(win2$env$txt, "end","City:  " )
tkinsert(win2$env$txt, "end",z_12 )
tkinsert(win2$env$txt, "end","\n\t" )

tkinsert(win2$env$txt, "end","Zip Code:  " )
tkinsert(win2$env$txt, "end",a1 )
tkinsert(win2$env$txt, "end"," \n\t" )

tkinsert(win2$env$txt, "end","Type od Crime:  " )
tkinsert(win2$env$txt, "end",a4 )
tkinsert(win2$env$txt, "end","\n\t" )

tkinsert(win2$env$txt, "end","Year:  " )
tkinsert(win2$env$txt, "end",a5 )
tkinsert(win2$env$txt, "end","\n\t" )

tkinsert(win2$env$txt, "end","Month:  " )
tkinsert(win2$env$txt, "end",z5_1 )
tkinsert(win2$env$txt, "end","\n\t" )

tkinsert(win2$env$txt, "end","Date:  " )
tkinsert(win2$env$txt, "end",z4 )
tkinsert(win2$env$txt, "end","\n\t" )

tkinsert(win2$env$txt, "end","Time-Frame:  " )
tkinsert(win2$env$txt, "end",z_15 )
tkinsert(win2$env$txt, "end","\n\t" )

win2$env$txt <- tk2text(win2, width = 60, height = 3.0,background="light pink")
tkpack(win2$env$txt, fill = "both", expand = TRUE)
tkinsert(win2$env$txt, "end", "\n\ttotal crime statistics above selections = ")
tkinsert(win2$env$txt, "end", result_8)
tkinsert(win2$env$txt, "end", "\n\t")

tkconfigure(win2$env$txt, state = "disabled")

tkfocus(win2$env$txt)

tkpack( tkbutton(win2, text='Continue', command=function()tkdestroy(win2)), side='bottom')
tkbind(win2,'<Key>', function()tkdestroy(win2) )
tkwait.window(win2)

#----------------------gui---END & Graph show function starts-----------------------------------------------

library(jpeg)
plot_jpeg = function(path, add=FALSE)
{
  require('jpeg')
  jpg = readJPEG(path, native=T) # read the file
  res = dim(jpg)[1:2] # get the resolution
  if (!add) # initialize an empty plot area if add==FALSE
    plot(1,1,xlim=c(1,res[2]),ylim=c(1,res[2]),asp=1,type='n',xaxs='i',yaxs='i',xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
  rasterImage(jpg,1,1,res[2],res[2])
}

#x11()
#plot_jpeg('final_method_5.jpg')

#locator(1)

#--------------------------GOOGLE MAP PLOTTING----------------------------------------------------#

library(ggplot2)
library(ggmap)
library(grid)
require(MASS)


chicago = get_map(location='chicago', zoom = 11)

chicago_1 = get_map(location='chicago', maptype = "satellite", zoom = 11)

chicago_2 = get_map(location='chicago', maptype = "hybrid", zoom = 11)

x_1= ggmap(chicago,extent = "device")
print("the first one")
ggsave("output-maps-graphs/fig1.jpg",x_1)




x_2=ggmap(chicago_1,extent = "device")
print("the 2nd one")
ggsave("output-maps-graphs/fig2.jpg",x_2)



x_3=ggmap(chicago_2,extent = "device")
print("the 3rd one")
ggsave("output-maps-graphs/fig3.jpg",x_3)


#data2

lon = data2$col21
lat = data2$col20
df1 = data.frame(lon,lat)
df = df1[!is.na(df1$lat),]
df

x_5=ggmap(chicago,extent = "device")+ geom_point(aes(x=lon, y=lat), colour = "red", alpha = 0.9, size =2, data = df)

ggsave("output-maps-graphs/fig4.jpg",x_5)


x_6=ggmap(chicago_1,extent = "device")+ geom_point(aes(x=lon, y=lat), colour = "red", alpha = 0.9, size =2, data = df)

ggsave("output-maps-graphs/fig5.jpg",x_6)


x_7=ggmap(chicago_2,extent = "device")+ geom_point(aes(x=lon, y=lat), colour = "red", alpha = 0.9, size =2, data = df)

ggsave("output-maps-graphs/fig6.jpg",x_7)




y_1 = ggmap(chicago, extent = "device") + geom_density2d(data = df, aes(x=lon, y = lat), size = 2)+stat_density2d(data = df, aes(x=lon, y=lat, fill = ..level.., alpha = ..level..), size = 0.01, bins = 16, geom = "polygon")+ scale_fill_gradient(low="green", high = "red", guide = FALSE) + scale_alpha(range = c (0,0.5), guide = FALSE)
ggsave("output-maps-graphs/fig7.jpg", y_1)



y_2 = ggmap(chicago_1, extent = "device") + geom_density2d(data = df, aes(x=lon, y = lat), size = 2)+stat_density2d(data = df, aes(x=lon, y=lat, fill = ..level.., alpha = ..level..), size = 0.01, bins = 16, geom = "polygon")+ scale_fill_gradient(low="green", high = "red", guide = FALSE) + scale_alpha(range = c (0,0.5), guide = FALSE)
ggsave("output-maps-graphs/fig8.jpg", y_2)



y_3= ggmap(chicago_2, extent = "device") + geom_density2d(data = df, aes(x=lon, y = lat), size = 2)+stat_density2d(data = df, aes(x=lon, y=lat, fill = ..level.., alpha = ..level..), size = 0.01, bins = 16, geom = "polygon")+ scale_fill_gradient(low="green", high = "red", guide = FALSE) + scale_alpha(range = c (0,0.5), guide = FALSE)
ggsave("output-maps-graphs/fig9.jpg", y_3)


#-----------------------------------------------gui based map-----------------

data9

lon = data9$col21
lat = data9$col20
df2 = data.frame(lon,lat)
df3 = df2[!is.na(df2$lat),]
df3

#library(grid)

#lon1 = -87.65
#lat1 = 41.85
#myd = data.frame(lon1,lat1)

#x_8=ggmap(chicago,extent = "device")+ geom_point(data = myd, aes(x= lon1, y = lat1),colour = "red", size = 20, alpha = .3) +geom_point(aes(x=lon, y=lat), colour = "red", alpha = 0.9, size =2, data = df3)

x_8=ggmap(chicago,extent = "device")+geom_point(aes(x=lon, y=lat), colour = "red", alpha = 0.9, size =2, data = df3)

ggsave("output-maps-graphs/fig10.png",x_8)



x_9=ggmap(chicago_1,extent = "device")+ geom_point(aes(x=lon, y=lat), colour = "red", alpha = 0.9, size =2, data = df3)

ggsave("output-maps-graphs/fig11.jpg",x_9)


x_10=ggmap(chicago_2,extent = "device")+ geom_point(aes(x=lon, y=lat), colour = "red", alpha = 0.9, size =2, data = df3)
ggsave("output-maps-graphs/fig12.jpg",x_10)

#-----------------type of crime data for mapping----------

option2

map_data4= data2[grep(option2, data2$col6),]
map_data4

#----------year option----

option3$col1
map_data5 = map_data4[grepl(option3$col1, map_data4$col3),]

map_data5
#----------------month option------

library(dplyr)
option4
map_z = as.character(option4$col1)
map_z

if (option4 == '---select---'){
	map_data6 = map_data5
}else{
	map_data6 = map_data5%>% filter(format(as.Date(map_data5$col3, format = "%m/%d/%Y"), "%m") == map_z)
}

map_data6

#------------------date option--------------

option5

map_z3= option5$col1
map_z4= as.character(map_z3)
map_z4
if (option5 == '---select---'){
	map_data7 = map_data6
}else{
	map_data7 = map_data6%>% filter(format(as.POSIXct(map_data6$col3, format = "%m/%d/%Y %H:%M:%S"), "%d") == map_z4)
}

map_data7

#--------------time_option----------------------

option7

map_z5= option7$col1
map_z6= as.character(map_z5)
map_z6

map_z7=option7$col2
map_z8=as.character(map_z7)
map_z8
map_data7
map_data8=  map_data7%>% filter(format(as.POSIXct(map_data7$col3, format = "%m/%d/%Y %I:%M:%S %p"), "%I") == map_z6)
map_data8

map_data9 = map_data8%>% filter(format(as.POSIXct(map_data8$col3, format="%m/%d/%Y %I:%M:%S %p"), "%p") == map_z8)
map_data9


#data9 =data5%>% filter(format(as.POSIXct(data5$col3, format="%m/%d/%Y %I:%M:%S %p"),"%p")=="PM")
#data9

#--------plotting-------------

map_lon = map_data9$col21
map_lat = map_data9$col20
map_df2 = data.frame(map_lon,map_lat)
map_df3 = map_df2[!is.na(map_df2$map_lat),]
map_df3









#map_x_8=ggmap(chicago,extent = "device")+geom_point(aes(x=map_lon, y=map_lat), colour = "red", alpha = 0.9, size =2, data = map_df3)

#ggsave("output-maps-graphs/map_fig10.jpg",map_x_8)


#map_x_9=ggmap(chicago_1,extent = "device")+ geom_point(aes(x=map_lon, y=map_lat), colour = "red", alpha = 0.9, size =2, data = map_df3)

#ggsave("output-maps-graphs/map_fig11.jpg",map_x_9)

#map_x_10=ggmap(chicago_2,extent = "device")+ geom_point(aes(x=map_lon, y=map_lat), colour = "red", alpha = 0.9, size =2, data = map_df3)
#ggsave("output-maps-graphs/fig12.jpg",map_x_10)



#---------zip code option-----------

zip = read.csv("/home/nj/zipcode.csv")
zip
data
data$col1
map_data = as.character(data$col1)

map_zip = zip[grep(data$col1, zip$ZIP.CODE),]
map_zip

map_lon2 = map_zip$LONG
map_lat2 = map_zip$LAT
map_df4 = data.frame(map_lon2, map_lat2)


map_df4

x1 = map_df4$map_lon2
x2 = map_df4$map_lon2 + 0.025

y1 = map_df4$map_lat2
y2 = map_df4$map_lat2 + 0.030


if (data == '---select---'){
        print("if condition is used here\n")
	map_x_8=ggmap(chicago,extent = "device")+geom_point(aes(x=map_lon, y=map_lat), colour = "red", alpha = 0.9, size =2, data = map_df3)

        ggsave("output-maps-graphs/map_fig10.jpg",map_x_8)
	

        map_x_9=ggmap(chicago_1,extent = "device")+ geom_point(aes(x=map_lon, y=map_lat), colour = "red", alpha = 0.9, size =2, data =map_df3)

        ggsave("output-maps-graphs/map_fig11.jpg",map_x_9)
	

        map_x_10=ggmap(chicago_2,extent = "device")+ geom_point(aes(x=map_lon, y=map_lat), colour = "red", alpha=0.9, size =2, data = map_df3)
        ggsave("output-maps-graphs/map_fig12.jpg",map_x_10)

	
}else{  
        print("else condition is used here\n")
        map_x_8=ggmap(chicago,extent = "device")+geom_point(aes(x=map_lon2, y=map_lat2), colour = "red", alpha = 0.9, size =2, data = map_df4)+  coord_map(xlim = c(x1, x2),ylim = c(y1, y2))

        ggsave("output-maps-graphs/map_fig10.jpg",map_x_8)
	


        map_x_9=ggmap(chicago_1,extent = "device")+ geom_point(aes(x=map_lon2, y=map_lat2), colour = "red", alpha = 0.9, size =2, data =map_df4) +  coord_map(xlim = c(x1, x2),ylim = c(y1, y2))

        ggsave("output-maps-graphs/map_fig11.jpg",map_x_9)
	
	

        map_x_10=ggmap(chicago_2,extent = "device")+ geom_point(aes(x=map_lon2, y=map_lat2), colour = "red", alpha=0.9, size =2, data = map_df4) +  scale_x_continuous(limits = c(x1, x2), expand = c(0, 0)) +scale_y_continuous(limits = c(y1, y2), expand = c(0, 0))
        ggsave("output-maps-graphs/map_fig12.jpg",map_x_10)
	

# + annotate("rect", xmin = 3, xmax = 4.2, ymin = 12, ymax = 21,alpha = .2)


#----------------for zip code area showcase into the existing map-------------------------------------------------------------

	map_x_11=ggmap(chicago,extent = "device")+ geom_point(aes(x=lon, y=lat), colour = "red", alpha = 0.9, size =2, data = df)+geom_point(data = map_df4, aes(x= map_lon2, y = map_lat2),colour = "yellow", size = 6, alpha = 0.7)+geom_line() + ggtitle("Chicago Crime Amalysis Map")+ annotate("text", x = -87.55, y = 42, label = "Zip Code = ",size= 5, color = "yellow", alpha = 1 )+ annotate("text", x = -87.49, y = 42, label = map_data, size=5 , color = "yellow", alpha = 1 )+ annotate("rect", xmin = -87.6, xmax = -87.44, ymin = 42.025, ymax = 41.950,alpha = .2)

	ggsave("output-maps-graphs/map_fig13.jpg",map_x_11)
	

	map_x_12=ggmap(chicago_1,extent = "device")+ geom_point(aes(x=lon, y=lat), colour = "red", alpha = 0.9, size =2, data = df)+geom_point(data = map_df4, aes(x= map_lon2, y = map_lat2),colour = "yellow", size = 6, alpha = 0.7) + geom_line() + ggtitle("Chicago Crime Amalysis Map")+ annotate("text", x = -87.55, y = 42, label = "Zip Code = ",size=5 , color = "yellow", alpha = 1 )+ annotate("text", x = -87.49, y = 42, label = map_data, size=5 , color = "yellow", alpha = 1 )+ annotate("rect", xmin = -87.6, xmax = -87.44, ymin = 42.025, ymax = 41.950,alpha = .5)

	ggsave("output-maps-graphs/map_fig14.jpg",map_x_12)
	

	map_x_13=ggmap(chicago_2,extent = "device")+ geom_point(aes(x=lon, y=lat), colour = "red", alpha = 0.9, size =2, data = df)+geom_point(data = map_df4, aes(x= map_lon2, y = map_lat2),colour = "yellow", size = 6, alpha = 0.7) + geom_line() + ggtitle("Chicago Crime Amalysis Map")+ annotate("text", x = -87.55, y = 42, label = "Zip Code = ",size=5 , color = "yellow", alpha = 1 )+ annotate("text", x = -87.49, y = 42, label = map_data, size=5 , color = "yellow", alpha = 1 )+ annotate("rect", xmin = -87.6, xmax = -87.44, ymin = 42.025, ymax = 41.950,alpha = .5)

	ggsave("output-maps-graphs/map_fig15.jpg",map_x_13)
	
	
	#map_df4 = data.frame(map_lon2, map_lat2)

# + annotate("rect", xmin = 3, xmax = 4.2, ymin = 12, ymax = 21,alpha = .2)
	
}



x11()
plot_jpeg('output-maps-graphs/chicagomap_1.jpeg')
locator(1)
x11()
plot_jpeg('output-maps-graphs/dailyCrimes.jpeg')
locator(2)
x11()
plot_jpeg('output-maps-graphs/HeatMAp.jpeg')
locator(3)


x11()
plot_jpeg('output-maps-graphs/fig1.jpg')
locator(4)

x11()
plot_jpeg('output-maps-graphs/fig2.jpg')
locator(5)

x11()
plot_jpeg('output-maps-graphs/fig3.jpg')
locator(6)

x11()
plot_jpeg('output-maps-graphs/fig4.jpg')
locator(7)

x11()
plot_jpeg('output-maps-graphs/fig5.jpg')
locator(8)

x11()
plot_jpeg('output-maps-graphs/fig6.jpg')
locator(9)

x11()
plot_jpeg('output-maps-graphs/fig7.jpg')
locator(10)

#x11()
plot_jpeg('output-maps-graphs/fig8.jpg')
locator(11)

#x11()
plot_jpeg('output-maps-graphs/fig9.jpg')
locator(12)

#x11()
plot_jpeg('output-maps-graphs/fig10.jpg')
locator(13)



#x11()
plot_jpeg('output-maps-graphs/fig11.jpg')
locator(14)

#x11()
plot_jpeg('output-maps-graphs/fig12.jpg')
locator(15)


x11()
plot_jpeg('output-maps-graphs/map_fig10.jpg')
locator(16)

x11()
plot_jpeg('output-maps-graphs/map_fig11.jpg')
locator(17)

x11()
plot_jpeg('output-maps-graphs/map_fig12.jpg')
locator(18)

x11()
plot_jpeg('output-maps-graphs/map_fig13.jpg')
locator(19)

x11()
plot_jpeg('output-maps-graphs/map_fig14.jpg')
locator(20)

x11()

plot_jpeg('output-maps-graphs/map_fig15.jpg')
locator(21)











