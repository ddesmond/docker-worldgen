#!/bin/bash

#SETUP WorldGen
cd $HOME

curl https://pyenv.run | bash

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

eval "$(pyenv virtualenv-init -)"

pyenv install "3.10.18"

# edit 3.11 to 3.10
# nunchakku edit to 3.10
# https://github.com/nunchaku-tech/nunchaku/releases/download/v0.2.0/nunchaku-0.2.0+torch2.7-cp310-cp310-linux_x86_64.whl

pyenv global 3.11
export TORCH_CUDA_ARCH_LIST=8.9   #ada rtx 6000
git clone https://github.com/facebookresearch/pytorch3d.git
cd pytorch3d
python setup.py install
pip install "git+https://github.com/facebookresearch/pytorch3d.git"
cd ..

# Clone the repository
git clone https://github.com/ZiYang-xie/WorldGen.git
cd WorldGen


pip install -I .

pip install git+https://github.com/ZiYang-xie/viser.git

https://github.com/sunset1995/py360convert.git
runpod pyenv

export VENV_DIR=<YOUR-VENVS-DIR>
export NAME=unik3d

python -m venv $VENV_DIR/$NAME
source $VENV_DIR/$NAME/bin/activate

# Install UniK3D and dependencies (more recent CUDAs work fine)
pip install -e . --extra-index-url https://download.pytorch.org/whl/cu121

# Install Pillow-SIMD (Optional)
pip uninstall pillow
CC="cc -mavx2" pip install -U --force-reinstall pillow-simd

# Install KNN (for evaluation only)
cd ./unik3d/ops/knn;bash compile.sh;cd ../../../
