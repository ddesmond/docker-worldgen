#!/bin/bash

echo "Setup work ENVS"

cd /opt
echo "Run: Clone datacrunch comfy setup"
git clone https://github.com/ddesmond/datacrunch-templates.git
cd /opt/datacrunch-templates
git pull


# rundown

echo "Run: Init"
source init.sh #> /opt/logs-init.txt

