#!/bin/bash

#define paths
setup_path=${HOME}/scripts/mac_setup;

#make dirs
echo "Creating main directories"
mkdir ~/scripts ~/github ~/software

echo "Installing miniconda2 at ~/Users/daelsaid  .........."
${setup_path}/Miniconda2-latest-MacOSX-x86_64.sh -b -p ~/miniconda2

#add conda executables to path
export PATH=$PATH:~/miniconda2/bin

#add path export to bash profile
echo "export PATH=$PATH:${HOME}/miniconda2/bin/" >> ~/.bash_profile/

#add env activation to bashrc
echo "source activate daelsaid_base_env" >> ~/.bashrc

#add bashrc to bash profile
echo "source ~/.bashrc" >> ~/.bash_profile

#verify installation
echo "verification of conda installation....."
conda info

#create daelsaid_base_env
echo "creating daelsaid base environment.......";
conda create --name daelsaid_base_env --file package_list.txt -p ~/miniconda2/envs/;

#source bash rpofile and thus bash rc
source ~/.bash_profile

#activate environment
source activate daelsaid_base_env

#install some dependencies
conda install pip;
conda install ipython;
conda install anaconda;
conda install numpy=1.9.0;
