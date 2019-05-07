#!/bin/bash
virtualenv qatask -p python3
source qatask/bin/activate
pip install -r requirements.txt
cp drivers/* qatask/bin/
deactivate
