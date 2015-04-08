"""

"""
import os
import csv
import time

NUM = 16

#INPUT_PATH = "/root/expdata/media/EEAEDA2FAED9EFD7/GoogleCluster/UsedData/fewer_throughput/split1/"
INPUT_PATH = "/home/ubuntu/data/"
#OUTPUT_PATH = "/root/expdata/media/EEAEDA2FAED9EFD7/GoogleCluster/UsedData/fewer_throughput/split" + str(NUM) + "/"
OUTPUT_PATH = "/home/ubuntu/data/output" + str(NUM) + "/"

INPUT_FILE_LIST = sorted([name for name in os.listdir(INPUT_PATH) if name.endswith('.csv')])
OUTPUT_FILE_POOL = [open(OUTPUT_PATH + "" + str(i) + ".csv", 'w') for i in range(NUM)]

if __name__ == "__main__":
    count = 0
    for filename in INPUT_FILE_LIST:
        print "Start to parse", filename
        reader = open(INPUT_PATH + filename, 'r')
        for line in reader:
            OUTPUT_FILE_POOL[count % NUM].write(line)
            count = (count + 1) % NUM
        print "Parse", filename, 'done.'
    for output in OUTPUT_FILE_POOL:
        output.close()
    print "Done!"
