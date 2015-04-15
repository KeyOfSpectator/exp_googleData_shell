__author__ = 'ubuntu'

import sys

INPUT_FILE = "E:\\exp 2015-4-7\\opentsdb exp 2015-4-3\\logs\\parse\\opentsdb_32thread\\172.18.9.100-00_58_32-1.log"
OUTPUT_FILE = "E:\\exp 2015-4-7\\opentsdb exp 2015-4-3\\logs\\parse\\opentsdb_32thread_parseout\\172.18.9.100-00_58_32-1.csv"
CYCLE = 8
CPU_INDEX = [1, 8]
MEM_INDEX = [3, 4]
DISK_INDEX = [5, 5] # three value [5, 5] [6, 5] [7, 5]
CPU_METRICS = []
MEM_METRICS = []
DISK_METRICS = []

if __name__ == "__main__":
    matrix = []
    reader = open(INPUT_FILE, 'r')
    # ignore the first two line
    reader.readline()
    reader.readline()
    print 'Begin to read...'
    line = reader.readline()
    while line != '':
        if line == '\n':
            line = reader.readline()
            continue
        else:
            matrix.append(line.split())
            line = reader.readline()
    reader.close()
    print "Finish to read..."
    print 'Total length', len(matrix)

    if len(matrix) % CYCLE != 0:
        print "Can't be divide exactly!!!"
        sys.exit()
    for i in range(len(matrix)/CYCLE - 1):
        CPU_METRICS.append(str(100 - float(matrix[CPU_INDEX[0] + i * CYCLE][CPU_INDEX[1]])))
        MEM_METRICS.append(matrix[MEM_INDEX[0] + i * CYCLE][MEM_INDEX[1]])
        DISK_METRICS.append(str((float(matrix[DISK_INDEX[0] + i * CYCLE][DISK_INDEX[1]]) +
                            float(matrix[DISK_INDEX[0] + i * CYCLE + 1][DISK_INDEX[1]]) +
                            float(matrix[DISK_INDEX[0] + i * CYCLE + 2][DISK_INDEX[1]])) / 3))
    # print CPU_METRICS
    # print MEM_METRICS
    # print DISK_METRICS
    print 'Begin to output...'
    output = open(OUTPUT_FILE, 'w')
    output.write(",".join(CPU_METRICS) + '\n')
    output.write(",".join(MEM_METRICS) + '\n')
    output.write(",".join(DISK_METRICS) + '\n')
    output.close()

