#!/bin/bash

# for

for fruit in apple banana ; do
  echo $fruit
done

# for loop is going to iterate number of times is based on number of inputs

# while

# while works on expressions that if condition is using
i=10
while [ $i -gt 0 ]; do
  echo Iteration - $i
  i=$(($i-1))
done

