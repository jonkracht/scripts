#!/bin/bash

filename=$1

type=$(file -b --mime-type $filename)

echo $type
