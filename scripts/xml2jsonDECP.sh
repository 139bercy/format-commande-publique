#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
# https://stackoverflow.com/a/246128


xml2json $1 | jq -f $dir/jsonDECP.jq
