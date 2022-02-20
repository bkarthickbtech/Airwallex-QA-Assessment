# Introduction

Airwallex API automation with using robot framework
   
# Requirements <br>
Python 3 <br>
Virutialenv 16.0.0 <br>
pip 18.1 <br>
ChromeDriver <br>


# Installation
  Install Python, PIP, VirtualEnv

	python --version  - 2.7
	Note: Mac OS  you have Python installed by default.


# Install pip

  $ easy_install pip
or if you get an error
  $ sudo easy_install pip

 Once installed you see, 

# Install virtualenv:

Virtualenv is a tool used to create an isolated Python environment. This environment has its own installation directories that doesn't share libraries with other virtualenv environments (and optionally doesn't access the globally installed libraries either).

Virtualenv is the easiest and recommended way to configure a custom Python environment.

# Install virtualenv:

	$ sudo -H pip install virtualenv 
Once installed you see, 


Navigate to where you want to store your code. Create a new directory.
      
    	$ sudo mkdir my_project && cd my_project

Inside project folder create a new virtualenv

	$ virtualenv env

Activate virtualenv environment:

	$ source env/bin/activate

Import Python path:

	$ export PYTHONPATH=library/.


# Create Requirements Text file

Create the requirements.txt file in the project folder
	
robotframework<br>
robotframework-selenium2library<br>
robotframework-requests<br>


# Install Package<br>

Install necessary packages

    $ pip install -r requirements.txt


# Steps to run the code:

    Trigger robot to run test suite
        
        robot -i smoke  suites/ 
    
    To run the positive_cases test cases
        robot -i positive_cases  suites/

    To run the negative test cases
        robot -i negative_cases  suites/      


