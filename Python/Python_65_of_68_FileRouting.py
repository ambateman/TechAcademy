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

from apscheduler.schedulers.background import BackgroundScheduler
    
def createUI():
    root.btnSourceFolder = ttk.Button(root, text = 'Source Folder',command = getSourceFolder)
    root.btnSourceFolder.pack()
    root.btnDestFolder = ttk.Button(root, text = 'Destination Folder',command = getDistinationFolder)
    root.btnDestFolder.pack()
    root.btnDestFolder = ttk.Button(root, text = 'Run Transfer',command = copyFiles)
    root.btnDestFolder.pack()
    root.mainloop()

#default values for the global path variables.
globalStartFolder = 'C:/Users/tmbat/Desktop/EntryFolder'
globalDestinationFolder = 'C:/Users/tmbat/Desktop/LastestVersionFolder'


def copyFiles():  #
    global globalStartFolder
    global globalDestinationFolder
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
            deltaT = str(datetime.now() - filetime)  #Get the age of the file
            units = deltaT.split()                   #Get the major parts of the difference
            subUnits = units[0].split(':')           #Get the time parts of the difference
            print (files + "  ++ " + subUnits[0] + " days old")  # This is for sanity check
            if float(subUnits[0]) <= 1.0:
                shutil.copy((pathstrStart +'/'+files),pathstrEnd) #Fotunately it overwrites existing

def getSourceFolder():  #this finds and returns the user chosen file source folder
    global globalStartFolder
    root.filename =  filedialog.askdirectory(initialdir = "/" ,title = "Select Start Directory") #,filetypes = (("Text files","*.txt"),("all files","*.*")))
    print (root.filename)
    globalStartFolder=root.filename
    
def getDistinationFolder(): #this finds and returns the user chosen file destination folder
    global globalDestinationFolder
    root.filename2 =  filedialog.askdirectory(initialdir = "/",title = "Select Destiniation Directory") #,filetypes = (("Text files","*.jpg"),("all files","*.*")))
    print (root.filename2)
    globalDestinationFolder = root.filename2

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
