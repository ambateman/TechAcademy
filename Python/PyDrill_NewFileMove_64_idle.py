
# Python 2.7.13
# Python Course Drill 64 of 68
# Tony Bateman
#

'''
From what I'm reading about this drill, I need to create what is essentially a
cron job. I understand that the schedule module is not thread safe, but I'm going
use it.
'''

from datetime import datetime
import time
import schedule
import shutil
import os


def copyFiles():
    #I copied the working file move portion from the last drill,
    #but changed the shutil.move to shutil.copy, since we aren't
    #deleting the files from the starting folder. The copy method
    #over-writes the older version of the file without any extra work.
    #I also did a pip install of schedule (which I did not have before.)

    pathstrStart ='C:/Users/tmbat/Desktop/EntryFolder'
    pathstrEnd = 'C:/Users/tmbat/Desktop/LastestVersionFolder'
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
             #print files + "  ++ " + subUnits[0] + " days old"  # This is for sanity check
            if float(subUnits[0]) <= 1.0:
                shutil.copy((pathstrStart +'/'+files),pathstrEnd) #Fotunately it overwrites existing


schedule.every().day.at("01:01").do(copyFiles)  #this is how often to run the job
while True:                              #right now an unending loop
    schedule.run_pending()
    time.sleep(60)

