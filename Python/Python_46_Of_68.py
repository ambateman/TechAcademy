#Python Range Function Drill
# Item 46 of 68
# Tony Bateman
# I added spaces between the numerals because that's how it looked
# on the screen.

strOut = ''

for i in range(0,4):
    print(i)
print("\n")
for i in range(3,-1,-1):
    strOut += str(i)+ ' '
print (strOut)
print("\n")
strOut=''
for i in range(8,1,-2):
    strOut += str(i)+ ' '
print (strOut)
