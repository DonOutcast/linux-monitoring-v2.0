#!/bin/bash

list=$(compgen -d / | grep -v 'bin\|sbin\|proc\|sys')
echo "$list"> paths.txt
