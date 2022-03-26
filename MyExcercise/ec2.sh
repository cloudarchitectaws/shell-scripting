#!/bin/bash
#create EC2 Instance

#Finding out AMI ID

AMID=$(aws ec2 describe-images --filters "Name=name,Values=Centos-7-DevOps-Practice" | jq '.Images[].ImageId' | sed -e 's/"//g')
echo $AMID

#Create EC2 instace using the AMIID captured using above command
aws ec2 run-instances --image-id {$AMID} --instance-type t2.micro

