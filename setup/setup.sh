#!/bin/bash

#SETUP WorldGen
cd $HOME

# Clone the repository
git clone https://github.com/ZiYang-xie/WorldGen.git
cd WorldGen

# Create a new environment

# Install torch and torchvision (with GPU support)
pip install torch torchvision --index-url https://download.pytorch.org/whl/cu128
pip install git+https://github.com/facebookresearch/pytorch3d.git

# Install WorldGen
pip install .

pip install git+https://github.com/ZiYang-xie/viser.git

cd /root/.pyenv/versions/3.11.13/lib/python3.11/site-packages/unik3d/ops/knn

updatedb && locate "compile.sh"

bash compile.sh

echo "Done setup for WorldGen"