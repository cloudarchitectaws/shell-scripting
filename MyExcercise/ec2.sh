#!/bin/bash
#create EC2 Instance

#Finding out AMI ID

AMID=$(aws ec2 describe-images --filters "Name=name,Values=Centos-7-DevOps-Practice" | jq '.Images[].ImageId')
echo $AMID

