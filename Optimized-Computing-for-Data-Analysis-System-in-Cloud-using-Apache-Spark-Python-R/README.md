# Crime Data Analysis System:

* GUI (Graphical User Interface):
      * Aim of the project is to create an analytical system that will help to solve the issue towards the society by giving a visual and detailed overview of the crime information based on the data we have. 
In order to create such analytical system user friendly and accessible for any simple user without having any knowledge of cloud or spark, I have designed a GUI (Graphical User Interface). This will take input based on the provided option and will forward the selection to the SparkR based platform for further analysis.
The coding for this GUI is done in Python. I have used Tkinter library for such design approach. Tkinter is Python's de-facto standard GUI (Graphical User Interface) package. It is a thin object-oriented layer on top of Tcl/Tk.
Considering the fact that we have more than 2 GB of data (csv) file and millions of information inside it. Where we might need just few useful information because of the user need, this GUI will help to narrow down the search terms and facilitate an idea to process the result.

Options for the GUI incudes:

          1.city
          2.zipcode/ area name
          3. type of crime
          4. year
          5. Month
          6. Day/Date
          7. Time frame/window of the day (in hours)

* Here is a sample gui & design which shows the idea of end results.
 



   ![image](https://cloud.githubusercontent.com/assets/14539985/17390052/0c6e4138-59cf-11e6-8e30-635d0dfc3690.png)
   
   
* In the Graphical User Interface the first Criteria is City; it has two options (1.Bostin & 2. Chicago)

* The second option is zip code, which ranges from 60601 to 60696 that covers the Chicago city areas. With this option user will be able to get the specific crime analysis for the chosen zip code option.

* Third option, crime type gives the filter results for the chosen crime type into the particular area. Crime types are taken for the previous interim results for the further analysis.

* In the Year option, user can choose from 2001 to 2016. This option will further narrow down the results.
Likewise, the Month and Date and Time option gives the particular month date and time frame respectively.

* User further need to submit the selection after they make their selection. Later the user need to ‘Click to Continue’ for the process of the data and to get the analyzed results.

* NOTE:  Here the GUI framework is done in Python and uses the PySpark framework for the process. These selection is fed to the R framework which uses the SparkR framework and synced very carefully with the GUI & further processes  results in R based GUI and with the map analysis respectively.





