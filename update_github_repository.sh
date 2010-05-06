#!/bin/bash

if [ -n "$1" ]
then
  git add .
  git commit -am "$1"
  git push github master
else
  echo "Please supply message for update"
fi
