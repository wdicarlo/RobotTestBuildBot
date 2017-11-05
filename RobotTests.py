import string
import subprocess
import string

class RobotTests(object):
    def __init__(self):
        pass
    
    def preprocess_test_result(self,line):
        return line.split(";",1)
    
    def preprocess_test_report(self,line):
        return line.split(";")
    
    def should_be_a_valid_pin_value(self,pin,value):
        if int(value) == -1:
            raise AssertionError('Pin %s with value %s' % (pin,value))

    def execute_robot_test(self):
        return subprocess.check_output("python simulate_robot_test.py", shell=True)
