#!/bin/bash

echo "Creating env..."
python3 -m venv robot-framework-env
source robot-framework-env/bin/activate

echo "installing dependencies"
pip3 install robotframework
pip install robotframework-seleniumlibrary

