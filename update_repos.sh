#!/bin/bash

if [ -n "$1" ]
then
  git add .
  git commit -am "$1"
#  git push origin master # For outside usage
  git push github master
  cap deploy
else
  echo "Please supply message for update"
fi
