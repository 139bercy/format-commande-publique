#!/bin/bash

xml2json $1 | jq -f jsonDECP.jq 
