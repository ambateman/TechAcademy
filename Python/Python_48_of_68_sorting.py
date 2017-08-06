# Create sorting function that doesn't use built in sort functions
# Item 48 of 68 in Python course
# Tony Bateman
# I think I'll do the bubble sort, since I have used that one in the past for
# small sort jobs.

def bubbly(sortableList):
    swapped = True
    listLength = len(sortableList)
    for  i in sortableList:
        while(swapped):
            swapped = False
            for i in range(0,listLength - 1):
                if sortableList[i]>sortableList[i+1]:
                    tempElement = sortableList[i+1]
                    sortableList[i+1] = sortableList[i]
                    sortableList[i] = tempElement
                    swapped = True

    print(sortableList)


bubbly([67, 45, 2, 13, 1, 998])
bubbly([89, 23, 33, 45, 10, 12, 45, 45, 45])
