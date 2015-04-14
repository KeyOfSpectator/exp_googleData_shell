__author__ = 'ubuntu'

import sys
import os
import time
import threading


"""
IP_LIST = ["172.18.9.44", "172.18.9.18", "172.18.9.19", "172.18.9.20", "172.18.9.21", "172.18.9.22",
      "172.18.9.23", "172.18.9.41", "172.18.9.42", "172.18.9.66", "172.18.9.67", "172.18.9.68",
      "172.18.9.69", "172.18.9.70", "172.18.9.71", "172.18.9.72" ]
"""
"""
IP_LIST = ["192.168.61.168"]
"""
IP_LIST = ["172.18.9.100", "172.18.9.99", "172.18.9.98", "172.18.9.97", "172.18.9.96", "172.18.9.95",
      "172.18.9.94", "172.18.9.38", "172.18.9.37", "172.18.9.36", "172.18.9.35", "172.18.9.34",
      "172.18.9.33", "172.18.9.32", "172.18.9.31", "172.18.9.30" ]


def get_current_time():
    localtime = time.localtime()
    time_string = time.strftime("%H:%M:%S", localtime)
    return time_string

def monitor(ip, cur_time , threadNum):
    filename = ip + '-'+ cur_time + '-'+ threadNum + '.log'
    cmd = 'sshpass -p "ubuntu" ssh ubuntu@' + ip + ' sar -r -u -d 1 150 > ~/' + filename
    print cmd
    os.system(cmd)
#    cmd = 'sshpass -p "ubuntu" scp ubuntu@' + ip + ':~/' + filename + ' ~/logs/'
#    print cmd
#    os.system(cmd)

if __name__ == "__main__":
    threadNum = sys.argv[2]
    thread_pool = []
#    cur_time = get_current_time()
    cur_time = sys.argv[1]

    print sys.argv[0]
    print sys.argv[1]
    print sys.argv[2]
    print threadNum
    print cur_time

    for ip in IP_LIST:
        t = threading.Thread(target=monitor, name=ip, args=(ip, cur_time, threadNum,))
        thread_pool.append(t)
    for t in thread_pool:
        t.start()
    for t in thread_pool:
        t.join()
    print "monitor done!"
