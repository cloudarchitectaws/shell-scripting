#!/bin/bash

# THis is just a sample demo script

ls

VAR=SIVA
echo -e "\e[31m My Name is $VAR \e[0m\n"
if [ $VAR == "SIVAA" ]
  then
    echo OK
  else
    echo -e "\e[35mThis is Wrong\e[0m"
fi