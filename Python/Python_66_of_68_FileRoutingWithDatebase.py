#Python 3.6.2
#Drill 65 of Python Course
#Tony Bateman
#Some of the code from an APScheduler example was used (APScheduler site),
#then modified.

from datetime import datetime
import time
import schedule
import shutil
from tkinter import filedialog
from tkinter import *
from tkinter import ttk
import os
import threading
import sqlite3

from apscheduler.schedulers.background import BackgroundScheduler
    
def createUI():
    global globalStartFolder
    global globalDestinationFolder
    root.btnSourceFolder = ttk.Button(root, text = 'Source Folder',command = getSourceFolder)
    root.btnSourceFolder.grid(row=0,sticky=W)
    root.btnDestFolder = ttk.Button(root, text = 'Destination Folder',command = getDistinationFolder)
    root.btnDestFolder.grid(row=1,sticky=W)
    root.btnDestFolder = ttk.Button(root, text = 'Run Transfer',command = copyFiles)
    root.btnDestFolder.grid(row=2,stick=W)
    root.lastRun=ttk.Label(root,text="Time of Last File Check: ")
    root.lastRunValue= ttk.Label(root,text=str(getFileCheckTime()))
    root.lastRun.grid(row=3)
    root.lastRunValue.grid(row=3,column=1)

    #Even though not explictly asked for, here are the fields that hold the folders used.
    root.srcFolder = ttk.Label(root,text=globalStartFolder)
    root.srcFolder.grid(row=0,column=1,sticky=W)
    root.destFolder = ttk.Label(root,text=globalDestinationFolder)
    root.destFolder.grid(row=1,column=1,stick=W)
    root.mainloop()

#default values for the global path variables.
globalStartFolder = 'C:/Users/tmbat/Desktop/EntryFolder'
globalDestinationFolder = 'C:/Users/tmbat/Desktop/LastestVersionFolder'


def copyFiles():  
    global globalStartFolder
    global globalDestinationFolder
    strDT = str(getFileCheckTime())  #Get the last time the filecheck was done from the database in string form.
    
    print (strDT)
    #Since the strptime function barfs on fractions of seconds, I will strip those out for the format string's sake.
    #There is no jeopardy of losing a file since this makes the test time a fraction of a second younger at worst.
    cleanDateTime = strDT.split('.')
    cleanDateTime[0] = (cleanDateTime[0].replace('(\'',''))  #Had to really work this to get this conversion right.
    dateDT = datetime.strptime(cleanDateTime[0], '%Y-%m-%d %H:%M:%S')
 
    #I copied the working file move portion from the last drill,
    pathstrStart = globalStartFolder
    pathstrEnd = globalDestinationFolder
    print(pathstrStart, " " , pathstrEnd)
    src = os.listdir(pathstrStart)
    for files in src:
        if files.endswith(".txt"):
            #check to find if file is new enough to transfer
            #The idea here is that if the file time stamp
            #is less than or equal to 24 hours old (1 day),
            #it should be copied over.
            filetime = datetime.fromtimestamp(os.path.getmtime((pathstrStart +'/'+files)))
            print(str(datetime.now()))
            deltaT = str(dateDT - filetime)  #Get the age of the file
            print("DT: " + deltaT)
            units = deltaT.split()                   #Get the major parts of the difference
            subUnits = units[0].split(':')           #Get the time parts of the difference
            print (files + "  ++ " + subUnits[0] + " days old")  # This is for sanity check
            if float(subUnits[0]) <= 1.0:
                shutil.copy((pathstrStart +'/'+files),pathstrEnd) #Fotunately it overwrites existing
    saveFileCheckTime()  #Now save the time this routine was run.
    updateLastRunLabel()


def getSourceFolder():  #this finds and returns the user chosen file source folder
    global globalStartFolder
    root.filename =  filedialog.askdirectory(initialdir = "/" ,title = "Select Start Directory") #,filetypes = (("Text files","*.txt"),("all files","*.*")))
    print (root.filename)
    globalStartFolder=root.filename
    updateFolderLabels()
    
def getDistinationFolder(): #this finds and returns the user chosen file destination folder
    global globalDestinationFolder
    root.filename2 =  filedialog.askdirectory(initialdir = "/",title = "Select Destiniation Directory") #,filetypes = (("Text files","*.jpg"),("all files","*.*")))
    print (root.filename2)
    globalDestinationFolder = root.filename2
    updateFolderLabels()

def saveFileCheckTime():
    strDT = str(datetime.now())
    connection = sqlite3.connect('FileCheckTime.db')
    c=connection.cursor()
    c.execute("CREATE TABLE IF NOT EXISTS FileCheckTime(fileChecks TEXT)")
    c.execute("INSERT INTO FileCheckTime (fileChecks) VALUES(?)",(strDT,))  #The comma after strDT threw me.
    connection.commit()
    c.close()
    connection.close()

def getFileCheckTime():
    connection = sqlite3.connect('FileCheckTime.db')
    c=connection.cursor()
    try:
        c.execute('SELECT * FROM FileCheckTime')
        results = c.fetchall()
        i=0  #count how many rows in returned set
        for row in results:   #The last row is what we are really intested in, but without an additional id...
            strDT = row       #The last iteration will have the value we want
            ++i
    except: #send back the now() value as a placeholder
        strDT = datetime.now()
    c.close()
    connection.close()
    return str(strDT).replace(',', '')         #Send the string value back for futher processing (conversion)

def updateLastRunLabel():
    root.lastRunValue['text'] = getFileCheckTime()  #Update the last file check label from databsse.

def updateFolderLabels():
    global globalStartFolder
    global globalDestinationFolder
    root.srcFolder['text']=globalStartFolder
    root.destFolder['text']=globalDestinationFolder
        
if __name__ == '__main__':
    scheduler = BackgroundScheduler()
    scheduler.add_job(copyFiles,'cron',hour='0', minute = '01')  #Run one minute after midnight
    scheduler.start()
    print('Press Ctrl+{0} to exit'.format('Break' if os.name == 'nt' else 'C'))
    root = Tk()
    createUI()  #Just call this once to prevent a memory leak

    try:
        # This is here to simulate application activity (which keeps the main thread alive).
        while True:
            time.sleep(2)
    except (KeyboardInterrupt, SystemExit):
        # Not strictly necessary if daemonic mode is enabled but should be done if possible
        scheduler.shutdown()
