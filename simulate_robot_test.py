#!/usr/bin/env python

import string
import random
import time

report_filename="robot_tests_report.txt"
test_line_filename="robot_test_line.txt"
eof=False

lfile = open(test_line_filename,"r")
line=lfile.readline() # read first line, it should contain test_line=<num>
if string.find(line,"test_line") == -1:
    print("Wrong file: "+test_line_filename)
    exit()
test_line=int(line.split("=")[1])
lfile.close()
#print("Test Line: "+str(test_line))

rfile = open(report_filename,"r")
for i in range(0,test_line):
    line=rfile.readline()
    if line == "":
        # end of file reached
        rfile.seek(0)
        line=rfile.readline()
        test_line=0

delay=random.randint(1,10)
time.sleep(delay)   
print(line)

# line = rfile.readline()
# if string.find(line,"END") != -1:
#     eof=True
rfile.close()

# update test line
lfile = open(test_line_filename,"w")
lfile.write("test_line="+str(test_line+1))
lfile.close()
