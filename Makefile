# Makefile for RobotTests
#
#
ROBOT=python -m robot
PYTHON=python

all: RobotTests

tests: simulate_robot_test

RobotTests: RobotTests.robot
	$(ROBOT) $<

simulate_robot_test: simulate_robot_test.py
	$(PYTHON) $<


clean:
	-@rm -rf *.log screenlog.* *.html *.pyc output.xml
