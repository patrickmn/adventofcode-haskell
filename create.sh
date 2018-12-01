#!/bin/bash
day=$1
fname=Day$day.hs
cp Day01.hs $fname
perl -p -i -e "s/day01/day$day/g" $fname
perl -p -i -e "s/Day01/Day$day/g" $fname
