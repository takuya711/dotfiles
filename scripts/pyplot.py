import sys
import numpy as np
import matplotlib.pyplot as plt 


def main(filename, xrow=1, yrow=2):
    x,y = np.loadtxt(filename, delimiter=',', unpack=True, usecols=(xrow-1, yrow-1))
    plt.plot(x,y)
    plt.show()
    

if __name__ == "__main__":
    if len(sys.argv) == 4:
        filename = sys.argv[1]
        xrow = int(sys.argv[2])
        yrow = int(sys.argv[3])
        main(filename, xrow, yrow)
    elif len(sys.argv) == 3:
        filename = sys.argv[1]
        xrow = int(sys.argv[2])
        main(filename, xrow)
    elif len(sys.argv) == 2:
        filename = sys.argv[1]
        main(filename)
    else:
        print ('Usage: py -2 pyplot.py FILE [xrow] [yrow]')