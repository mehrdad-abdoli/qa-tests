![Test Status](https://badges.herokuapp.com/browsers?googlechrome=74&firefox=66&versionDivider=true&labels=longName)
![Python3](https://img.shields.io/badge/Python-3-green.svg?style=plastic)
![Robot Framework](https://img.shields.io/badge/Robot%20Framework-3.1.1-green.svg?style=plastic)
![Selenium](https://img.shields.io/badge/Selenium-3.141-green.svg?style=plastic)


## SETUP ENV AND INSTALL REQUIREMENTS ##
- an installation of Python 3 with pip is ready run once:
```
$ bash ./installation.sh
```

## WEB DRIVERS ##
- chromedriver & geckodriver suiteable with your OS and browser version
- chromedriver 74 and geckodriver 0.24 for linux x64 are in libs and will be copied to bin dir of venv)
  - if encounter this error
  ```
  WebDriverException: Message: 'chromedriver' executable needs to be in PATH.
  ```
  its because your chrome version is not 74 Please see https://sites.google.com/a/chromium.org/chromedriver/home

## RUNUNG TEST ##
```
$ bash ./run_test.sh
```

## MANUAL REQUIREMENTS INSTALATION  ##
- Install the virtualenv package
```
$ pip install virtualenv
```
- Add New Virtualenv
```
$ virtualenv qatask -p python3
```
- Activate the virtual environment
```
$ source qatask/bin/activate
```
- Install requirements
```
$ pip install -r requirements.txt
```

## ROBOT FRAMEWORKS COMMAND FOR RUN THE TEST ##
```
$ robot -P ./libs/ -d logs -v browser:chrome signup_and_Login.robot
```

## CHANGE BROWSER ##
- robot -P ./libs/ -d logs -v browser:{browsername} signup_and_Login.robot
  - chrome
  - headlesschrome
  - headlessfirefox
  - firefox

## RUN IN REMOTE SELENIUM GRID ##
 can be run in any remote Selenium grid with uncomment  remote_url=${SelenimURL} in resources/setup.robot and define ${SelenimURL}

## TESTS ##
- Step 1: Validation of Form looks like in the attached image
- step 2: Company Details
- step 3: Administrator account details
- step 4: Terms and conditions
- step 5: Sign up And Login To Dashboard

## LOGS ##
- Logs and reports for tests will be saved in logs directory

## ROBOT FRAMEWORK ##

Robot Framework is a generic test automation framework for acceptance testing and acceptance test-driven development (ATDD). It has easy-to-use tabular test data syntax and it utilizes the keyword-driven testing approach.

 Its testing capabilities can be extended by test libraries implemented either with Python or Java, and users can create new higher-level keywords from existing ones using the same syntax that is used for creating test cases.
Robot Framework project is hosted on GitHub where you can find further documentation, source code, and issue tracker.

 Downloads are hosted at PyPI. The framework has a rich ecosystem around it consisting of various generic test libraries and tools that are developed as separate projects.

Robot Framework is operating system and application independent. The core framework is implemented using Python and runs also on Jython (JVM) and IronPython (.NET).

Robot Framework itself is open source software released under Apache License 2.0, and most of the libraries and tools in the ecosystem are also open source. The framework was initially developed at Nokia Networks and it is nowadays sponsored by Robot Framework Foundation.  

## REFRENCES ##
-	https://github.com/robotframework/robotframework
- http://robotframework.org/robotframework/#user-guide
-	http://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
