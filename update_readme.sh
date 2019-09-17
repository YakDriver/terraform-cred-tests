#!/bin/bash

file=".temp.md"
printf "REPLACE BEGIN -->\n" > "${file}"
printf "| Test  | Status | Issue |\n" >> "${file}"
printf "| ------------- | ------------- | ------------- |\n" >> "${file}"

find tests -maxdepth 1 -mindepth 1 -type d | sort | while read line; do
    if [ ! -f ${line}/test.json ]; then
        echo "ERROR - ${line} has no test.json file"
        exit 1
    fi

    json="${line}/test.json"

    passing=$(cat ${json} | jq '.status_passing')
    if [ "${passing}" = "true" ]; then
        status=":+1:"
    else
        status=":x:"
    fi

    url=$(cat ${json} | jq -r '.github_issue_url')
    link_text="${url/https:\/\/github.com\//}"
    link_text="${link_text/\/issues\//#}"
    test_name=$(basename ${line})
    
    printf "| [%s](%s) " "${test_name}" "${line}" >> "${file}"
    printf "| %s " "${status}" >> "${file}"
    if [ "${url}" = "null" ]; then
        printf "| None |\n" >> "${file}"
    else 
        printf "| [%s](%s) |\n" "${link_text}" "${url}" >> "${file}"
    fi

done
printf "<!-- REPLACE END" >> "${file}"

new_table=$(cat "${file}")

perl -pe "BEGIN{undef $/;} s^REPLACE BEGIN.*REPLACE END^${new_table}^smg" README.md > README1.md
rm "${file}"
mv README1.md README.md
