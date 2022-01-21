#!/bin/bash

student_name="John"

echo student_name = $student_name
echo student_name = ${student_name}

DATE=2022-01-21
echo Good Morning, Today date is $DATE

## Command Substitution
DATE=$(date +%F)
echo Good Morning, Today date is $DATE
