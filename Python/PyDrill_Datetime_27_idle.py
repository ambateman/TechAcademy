#Python 2.7
#Branches open test
#Drill for Item 62 of Python Course
#
#The only quantity that should matter here is the hour. If the hour is between 9 and 21
#for that office, then that office is open.

import datetime
portlandTime = datetime.datetime.now().hour
nyTime = (portlandTime + 3)%24 #NYC is three hours ahead of portland
londonTime = (portlandTime + 8)%24 #London is 8 hours ahead of portland

#Which of the non-Portland branch offices are open?
if nyTime>=9 and nyTime<21:
    print "NYC Branch Office is Open"
else:
    print "NYC Branch Office is Closed"

if londonTime>=9 and londonTime<21:
    print "London Branch Office is Open"
else:
    print "London Branch Office is Closed"

    



