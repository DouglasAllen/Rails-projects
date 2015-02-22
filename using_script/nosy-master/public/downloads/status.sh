#!/bin/sh

URI=`ruby -ryaml -e "puts YAML.load_file(File.expand_path('~/.freerange.yml'))['GFR_STATUS_URI']"`
curl --silent --show-error -f -d"status[text]=$1" $URI/statuses -o /dev/null
