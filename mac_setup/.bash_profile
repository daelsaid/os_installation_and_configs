#!/bin/bash

software="~/software"
icloud_path="`echo ${HOME}`/Library/Mobile\ Documents/com~apple~CloudDocs"

alias icloud="cd ${HOME}/Library/Mobile\ Documents/com~apple~CloudDocs"

alias home_server="ssh daelsaid@192.168.1.200"
alias retired_mbpro="ssh dawlat_local@192.168.1.202"

# alias tunnel1="expect ~/Desktop/stanford/scripts/ssh_smurf_expect.sh"

alias ls="ls -G"
alias eprime="iconv -f utf-16le -t utf8"
alias nb="cd i${icloud_path}/scripts/jupyter_notebooks && jupyter notebook "

# alias inquisit="cd /Users/lillyel-said/Desktop/stanford/scripts/inquisit/final/grader_inq_to_edit"

export PATH=$PATH:${software}
export PS1='[\D{%m.%d.%Y}.\A.\u] \w $ '
# export PATH=$PATH:${HOME}/Desktop/stanford/scripts/inquisit/final/

# added by Anaconda2 4.2.0 installer
# export PATH="${HOME}/anaconda2/bin:$PATH"
# export PATH=$PATH:${HOME}/anaconda2/pkgs/homebrew/bin

function inquisit_grader () {
    raw_csv=$1
    demo=$2
    summary=$3
    out=$4

    python ${HOME}/scripts/inquisit/final/grader_inq_to_edit/complete_inquisit_output.py -r $1 -d $2 -s $3 -o $4
}

function wait_for_proc () {
    proc=$1
    pid=0
    while [ pid -eq 0 ]
    do
        ps -ef | grep "${proc}" | grep -v grep > /dev/null
        pid=`echo $!`
        sleep 10
    done
}

function del_dsstore () {
    find ~/ -name ".DS_Store" -exec rm {} \;
    find ~/ -name "._DS_Store" -exec rm {} \;
 }

function rename_dirs () {
    old=$1;
    new=$2;

    for file in `ls *`; do
        mv "${file}" "${file/$old/$new}";
    done
}

function make_lower() {
    for dir in `ls *`; do
        tochange=`echo "$dir" | awk '{print tolower($0)}'`;
        mv $dir $tochange;
    done
}

# # FSL Setup
# FSLDIR=/usr/local/fsl
# PATH=${FSLDIR}/bin:${PATH}
# export FSLDIR PATH
# . ${FSLDIR}/etc/fslconf/fsl.sh

#freesurfer
# export FREESURFER_HOME=/Applications/software/freesurfer
# source $FREESURFER_HOME/SetUpFreeSurfer.sh
source ~/.bashrc
