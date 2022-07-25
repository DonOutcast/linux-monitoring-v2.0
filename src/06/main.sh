#!/bin/bash
if [[ $# -ne 0 ]]; then
        echo "ERROR"
        exit 1
else
sudo goaccess ../04/log_*.log --log-format=COMBINED  -a -o index.html
exit 0

fi
