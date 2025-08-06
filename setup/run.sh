#!/bin/bash
echo "_____ RUN _____"
export PIP_ROOT_USER_ACTION=ignore
source /setup/env.sh

cd $HOME/WorldGen
# Generate a 3D scene from a text prompt
python demo.py -p "A beautiful landscape with a river and mountains"
python demo.py -p "A beautiful landscape of ancient city of Rome" --return_mesh

# Generate a 3D scene from an image
# python demo.py -i "path/to/your/image.jpg" -p "<Optional: TEXT PROMPT to describe the scene>"

# 🔥 New feature: Generate a 3D scene in mesh mode
# Make sure you installed my customized viser to correctly visualize the mesh without backface culling
# pip install git+https://github.com/ZiYang-xie/viser.git

python demo.py -p "A beautiful landscape with a river and mountains" --return_mesh