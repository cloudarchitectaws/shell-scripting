#!/bin/bash

if [ -f components/$1.sh ]; then
  bash components/$1.sh
else
  echo "Invalid Input"
  echo "Available Inputs - frontend|mongodb|catalogue|redis|user|cart|mysql|shipping|payment|rabbitmq|dispatch"
fi

