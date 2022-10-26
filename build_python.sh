#!/bin/sh

BUILDUSER="mingxing"


echo "build conda envi"
conda create -n pytorch pip python=3.9
source /home/${BUILDUSER}/.bashrc

echo "install pytorch"
source activate pytorch
pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116

echo "install jupyter"
source /home/${BUILDUSER}/.bashrc
source activate pytorch
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple ipykernel
python -m ipykernel install --name pytorch --user




