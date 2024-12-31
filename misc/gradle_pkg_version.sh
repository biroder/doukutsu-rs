#!/bin/bash

function get_len {
    echo $(echo $1 | wc -c)
}

function get_version {
    local quote_len=0
    if [ "$3" = "1" ]; then
        quote_len=1
    fi

    local prop_len=$(get_len $1)
    local line="$(grep $1 $2 | tr -d [:space:])"
    local line_len=$(get_len $line)
    local version="$(echo $line | cut -c $((prop_len+quote_len))-$((line_len-2*quote_len)))"
    echo $version
}

get_version $1 $2 $3
