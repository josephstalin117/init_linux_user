#!/bin/sh

BUILDUSER="${BUILDUSER}"

echo "test internet"
curl baidu.com

echo "add conda proxy"
/mnt/disk1/${BUILDUSER}/anaconda3/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
/mnt/disk1/${BUILDUSER}/anaconda3/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge
/mnt/disk1/${BUILDUSER}/anaconda3/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/


echo "build conda envi"
/mnt/disk1/${BUILDUSER}/anaconda3/bin/conda create -n pytorch pip python=3.9
source /home/${BUILDUSER}/.bashrc


echo "install pytorch"
source /home/${BUILDUSER}/.bashrc
/mnt/disk1/${BUILDUSER}/anaconda3/envs/pytorch/bin/pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu118

echo "install pandas"
/mnt/disk1/${BUILDUSER}/anaconda3/envs/pytorch/bin/pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pandas
echo "install sklearn"
/mnt/disk1/${BUILDUSER}/anaconda3/envs/pytorch/bin/pip install -i https://pypi.tuna.tsinghua.edu.cn/simple scikit-learn

echo "install jupyter"
source /home/${BUILDUSER}/.bashrc
/mnt/disk1/${BUILDUSER}/anaconda3/envs/pytorch/bin/pip install -i https://pypi.tuna.tsinghua.edu.cn/simple ipykernel
/mnt/disk1/${BUILDUSER}/anaconda3/envs/pytorch/bin/python -m ipykernel install --name pytorch --user
/mnt/disk1/${BUILDUSER}/anaconda3/bin/jupyter notebook --generate-config
/mnt/disk1/${BUILDUSER}/anaconda3/bin/jupyter notebook password


source /home/${BUILDUSER}/.bashrc
sed -i "s/\# c.NotebookApp.ip = 'localhost'/c.NotebookApp.ip = '*'/g" /home/${BUILDUSER}/.jupyter/jupyter_notebook_config.py 
sed -i 's/\# c.NotebookApp.open_browser = True/c.NotebookApp.open_browser = False/g' /home/${BUILDUSER}/.jupyter/jupyter_notebook_config.py





