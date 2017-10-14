# Install and configure Anaconda
wget --directory-prefix=$HOME/Downloads https://repo.continuum.io/archive/Anaconda3-5.0.0.1-Linux-x86_64.sh
echo -ne '\n' | bash ./Downloads/Anaconda3-5.0.0.1-Linux-x86_64.sh -b -p $HOME/apps/anaconda3
cp .bashrc .bashrc_backup
echo "# Anaconda3 path" >> .bashrc
echo "export PATH=\$HOME/apps/anaconda3/bin:\$PATH" >> .bashrc
$HOME/apps/anaconda3/bin/conda config --add channels conda-forge --yes
$HOME/apps/anaconda3/bin/conda update --prefix $HOME/apps/anaconda3 anaconda --yes


# Install Thonny
wget --directory-prefix=$HOME/Downloads https://bitbucket.org/plas/thonny/downloads/thonny-2.1.11.sh
echo -ne '\n\n' | bash ./Downloads/thonny-2.1.11.sh


# Install Cling
wget --directory-prefix=$HOME/Downloads https://root.cern.ch/download/cling/cling_2017-10-11_ubuntu16.tar.bz2
tar --extract --bzip2 --verbose --file=$HOME/Downloads/cling_2017-10-11_ubuntu16.tar.bz2 --directory=$HOME/apps
echo "# Cling path" >> .bashrc
echo "export PATH=\$HOME/apps/cling_2017-10-11_ubuntu16/bin:\$PATH" >> .bashrc


# Create conda environment
$HOME/apps/anaconda3/bin/conda create --name=notebook --yes
source $HOME/apps/anaconda3/bin/activate notebook
$HOME/apps/anaconda3/envs/notebook/bin/conda install numpy scipy matplotlib --yes
$HOME/apps/anaconda3/envs/notebook/bin/conda install sympy pandas seaborn --yes
$HOME/apps/anaconda3/envs/notebook/bin/conda install jupyter --yes


# Install Cling kernel to Jupyter
pip install -e $HOME/apps/cling_2017-10-11_ubuntu16/share/cling/Jupyter/kernel/
$HOME/apps/anaconda3/envs/notebook/bin/jupyter-kernelspec install --user $HOME/apps/cling_2017-10-11_ubuntu16/share/cling/Jupyter/kernel/cling-cpp11
$HOME/apps/anaconda3/envs/notebook/bin/jupyter-kernelspec install --user $HOME/apps/cling_2017-10-11_ubuntu16/share/cling/Jupyter/kernel/cling-cpp14
$HOME/apps/anaconda3/envs/notebook/bin/jupyter-kernelspec install --user $HOME/apps/cling_2017-10-11_ubuntu16/share/cling/Jupyter/kernel/cling-cpp17
source $HOME/apps/anaconda3/envs/notebook/bin/deactivate
