#!/bin/bash

HISTSIZE=
HISTFILESIZE=

for dir in `ls -d ~/software/*`; do
	export PATH=$PATH:${dir}
done

export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "`hostname | awk -F"." "{ print $1 }"` $(date "+%Y-%m-%d.%H:%M:%S") $(pwd) `echo $(history 1) | cut -d" " -f 2-`" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi';

source activate daelsaid_base_env;
