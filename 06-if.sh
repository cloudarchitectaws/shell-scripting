#!/bin/bash

### String expressions
a=abc1
if [ $a = "abc" ]
then
  echo OK
fi

if [ $a != "abc" ]; then
  echo NOTOK
fi

b=200
if [ -z "$b" ]; then
  echo B is empty / not declared variable
fi
