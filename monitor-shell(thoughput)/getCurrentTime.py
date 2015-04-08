import time

def get_current_time():
    localtime = time.localtime()
    time_string = time.strftime("%H:%M:%S", localtime)
    return time_string


if __name__ == "__main__":
    print get_current_time()
#    print "monitor done!"

