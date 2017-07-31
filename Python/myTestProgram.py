#Python: 2.7.13
#
#Author: Tony Bateman
#
#Purpose: TechAcademy Python Course Item 36 of 68 -- Simple program
#
#

def myFunction(strString,intInteger,fltFloat):
    print("Your String: {}, your Floating Point value: {}, and your Integer value: {}".format(strString,fltFloat,intInteger))

myFirstInt = 5
myFirstFloat=33.1415
myFirstString="Huh Yun-Mi is working the Asian Festival of Speed this weekend."


#Use arithmetic operators on two numbers, one an int, the other a float.
def myArithmeticFunction(myInt,myFloat):
    myInt += 11
    myAddition = myInt + myFloat
    mySubtraction = myFloat/float(myInt)
    myMultiplication = myFloat*myInt
    myDivision = myFloat/myInt
    myRemainder = myAddition%myInt
    print("\n My new int value : {}, \n MyAddition value: {}, \n mySubtraction value: {},\n myMultiplication value: {}, \n myDivision value: {}, \n and myRemainder value: {}".format(myInt,myAddition,mySubtraction,myMultiplication,myDivision,myRemainder))


#While and for loops.
def looping():  #Pretty silly example -- while and for loops in same function. The for loop prints out difference messages if the outer control variable is larger, smaller or equal to the inner control variable.
    i = 10
    while i > 1:
        print("\n Current i: {}".format(i))
        for j in range(1,6):
            if(j==i):
                print("\n Inner and outer loop variables are equal at {}".format(j))
            elif i>j:
                print("\n Still looking for equality point. Difference is {}".format(i-j))
            else:
                print("\n Overshot point.")
        i-=1
            
#This function just returns a string. You could add a raw_input statement here if you wanted to.
def gimmeString():
    answer = "The answer to life, the universe and everything is 42"
    return answer

def myList(listy):
    items = listy
    counter = 1
    for listItem in listy:
        print("\nList Item {} in List is {}".format(counter,listItem))
        counter += 1
    
#reading a tuple.   
def myTuple(tupelo ):
    counter = 1
    for tup in tupelo:
        print("\nTuple Item {} in tuple is {}".format(counter,tup))
        counter += 1

#A quick example of how to use and, or, not
def myLogicOps(int1,int2,int3):
    condition1 = int1 + int2
    condition2 = int1 + int3
    condition3 = int1*int3
    if(condition1 > 12) and (condition2 <5):  #Both of these conditional statments will print ONLY if the logic is true. Otherwise, nothing.
        print("\nCondition1 is greater than 12 AND Condition2 is less than 5.")
    if(condition2<1) or not(condition3 == 4):
        print ("\nEither Condition1 less than 1 OR Condition3 is NOT equal to 4") #If you want to know which is which (or both), futher testing is indicated.




if __name__ == "__main__":

    myFunction(myFirstString,myFirstInt,myFirstFloat)
    myArithmeticFunction(3,97.7897)
    looping()
    myLittleList = ["Fred","Wilma","Barney", "Betty", "Pebbles", "BamBam", "Dino"] #Here's the list
    myList(myLittleList)
    myTuple = ('apple','pie','bananas','foster','cherry','tart') #created a tuple here.
    myLogicOps(18,55,-19)
    gimmeString()
    
