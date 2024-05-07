#!/bin/sh

BUILDUSER="user"

echo "test internet"
curl baidu.com

echo "add conda proxy"
/home/${BUILDUSER}/anaconda3/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
/home/${BUILDUSER}/anaconda3/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge
/home/${BUILDUSER}/anaconda3/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/


echo "build conda envi"
/home/${BUILDUSER}/anaconda3/bin/conda create -n pytorch pip python=3.9
source /home/${BUILDUSER}/.bashrc


echo "install pytorch"
source /home/${BUILDUSER}/.bashrc
#/home/${BUILDUSER}/anaconda3/envs/pytorch/bin/pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116
#/home/${BUILDUSER}/anaconda3/envs/pytorch/bin/pip install torch===1.12.1 torchvision===0.13.1 torchaudio===0.12.1 -i https://pypi.tuna.tsinghua.edu.cn/simple
/home/${BUILDUSER}/anaconda3/envs/pytorch/bin/pip install torch===1.13.1 torchvision===0.14.1 torchaudio===0.13.1 -i https://pypi.tuna.tsinghua.edu.cn/simple --extra-index-url https://download.pytorch.org/whl/cu116

echo "install pandas"
/home/${BUILDUSER}/anaconda3/envs/pytorch/bin/pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pandas
echo "install sklearn"
/home/${BUILDUSER}/anaconda3/envs/pytorch/bin/pip install -i https://pypi.tuna.tsinghua.edu.cn/simple scikit-learn



