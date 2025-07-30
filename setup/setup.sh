#!/bin/bash

#SETUP WorldGen
cd $HOME

# Clone the repository
git clone https://github.com/ZiYang-xie/WorldGen.git
cd WorldGen

# Create a new environment

# Install torch and torchvision (with GPU support)
pip3 install torch torchvision --index-url https://download.pytorch.org/whl/cu128
pip install git+https://github.com/facebookresearch/pytorch3d.git

# Install worldgen
pip install .

pip install git+https://github.com/ZiYang-xie/viser.git