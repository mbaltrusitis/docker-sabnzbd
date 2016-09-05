#!/bin/bash


start() {
    echo 'starting SABNZBD';
    sleep 5s;
		sabnzbdplus -b 0 -s "0.0.0.0:8080" --https "9090";
}


if [[ -f $SCRIPT_PATH/autoProcess.ini ]]; then
    echo 'it exists';
else
    echo 'it does not exist';
    cp $HOME/autoProcess.ini.default $SCRIPT_PATH/autoProcess.ini;
fi

start

