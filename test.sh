#!/bin/bash

find tests -maxdepth 1 -mindepth 1 -type d | while read line; do
if [ ! -f $line/test.json ]; then
    echo "ERROR - $line has no test.json file"
    exit 1
fi
done
