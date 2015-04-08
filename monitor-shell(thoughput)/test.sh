#!/bin/bash

python ./monitor1.py `python getCurrentTime.py` 2

python ./monitor2.py `python getCurrentTime.py` 2
