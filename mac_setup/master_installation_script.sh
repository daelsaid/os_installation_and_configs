#!/bin/bash

#master script
# make miniconda environemnts and dinstall all dependencies

cd /${HOME}/scripts/mac_setup;

bash install_conda_setup_envs.sh;

#run script to install applications etc
bash app_installation_mac_settings_adjus.sh

#import ISTAT settings + registration key
#copy over atom dir with config settings
rsync -avpu app_settings/.atom .*bash*  ~/
