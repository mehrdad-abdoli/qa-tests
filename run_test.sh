#!/bin/bash
source qatask/bin/activate
robot -P ./libs/ -d logs -v browser:chrome signup_and_Login.robot
deactivate
