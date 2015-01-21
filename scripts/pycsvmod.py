#coding:utf-8

import sys
import csv
import os

import numpy as np
import matplotlib.pyplot as plt

def main(filename, skiprow, endrow):
    name, ext = os.path.splitext(filename)
    if os.path.exists(name + '_mod' + ext):
        os.remove(name + '_mod' + ext)

    f=open(str(filename), 'r')
    f2=open(name + '_mod' + ext, 'a')
    
    dataReader=csv.reader(f)
    csvWriter=csv.writer(f2, lineterminator="\n")

    for i in range(skiprow):
        row=dataReader.__next__()

    fullLength=endrow - skiprow
    defLen=len(row)

    for i in range(fullLength):
        listData = []
        if defLen == len(row):
            for j in range(defLen):
                if str(row[j].replace(".","").replace("-","").replace(" ","").replace("E","").replace("+","")).isdigit():
                    val=float(row[j])
                    listData.append(val)
                else:
                    break
            csvWriter.writerow(listData)
        if i != fullLength - 1:
            row=dataReader.__next__()

    f.close()
    f2.close()



if __name__ == "__main__":
    if len(sys.argv) == 4:
        filename = sys.argv[1]
        skiprow = int(sys.argv[2])
        endrow = int(sys.argv[3])
        main(filename, skiprow+1, endrow+1)
    else:
        print ('Usage: py -2 pycsvmod.py FILE skiprow endrow')
