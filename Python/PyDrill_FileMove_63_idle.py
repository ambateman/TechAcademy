#Python 2.7.13
#Python Drill 63 of 68 -- File moving
#By Tony Bateman (with help by instructors Aja and Lyci)


def moveFiles():
    #Originally I was going to do a two step process of copying from
    #FolderA to Folder B and delete contents of FolderA, but the shutil
    #'move' function does both.
    import shutil
    import os
    pathstrStart ='C:/Users/tmbat/Desktop/FolderA'
    pathstrEnd = 'C:/Users/tmbat/Desktop/FolderB'
    src = os.listdir(pathstrStart)
    
 
    pathstrEnd = 'C:/Users/tmbat/Desktop/FolderB'

    for files in src:
        if files.endswith(".txt"):
            shutil.move((pathstrStart +'/'+files),pathstrEnd)
        src=os.listdir(pathstrEnd) #Get list of files in FolderB
    print "Filepaths of all files in FolderB:" 
    for i in range(0,len(src)):
        print pathstrEnd + "/" + src[i]
        

       

#Since we need a button, we must use tkinter
from Tkinter import *
root = Tk()

root.title("File Transfer")

button1 = Button(root,text="Click to Transfer Files",width=35,background='yellow',command=moveFiles)
button1.pack()

root.mainloop()
