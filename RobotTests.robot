*** Settings ***
Documentation		Robot tests

Library			RobotTests.py

*** Variables ***
${TEST_REPORT}		Execute Robot Test

*** Test Cases ***
Test Robot
	${result} = 	Execute Robot Test
	@{report} = 	Preprocess Test Result	${result}
	Set Suite Variable	${SUITE NAME}	@{report}[0]
	Set Suite Variable	${TEST_REPORT}	@{report}[1]

Check Tensions
	Check Tensions		${TEST_REPORT}

Check Pins
	Check Pins		${TEST_REPORT}

*** Keywords ***
Check Tensions
	[Arguments]	${report}
	@{val} = 	Preprocess Test Report		${report}
	Check Tension Levels	@{val}[1] 	@{val}[2] 	@{val}[3] 	@{val}[4]

Check Pins
	[Arguments]	${report}
	@{val} = 	Preprocess Test Report		${report}
	Check Pins Levels	${val}		9		20

Check Tension Levels
	[Arguments] 	${t1} 	${t2} 	${t3} 	${t4} 
	Should be a valid pin value 	1	${t1}
	Should be a valid pin value 	2	${t2}
	Should be a valid pin value 	3	${t3}
	Should be a valid pin value 	4	${t4}

Check Pins Levels
	[Arguments]	${pins}		${begin}	${end}
	:FOR    ${index}    IN RANGE    ${begin}    ${end}
	\    Should be a valid pin value 	${index}	${pins[${index}]}

