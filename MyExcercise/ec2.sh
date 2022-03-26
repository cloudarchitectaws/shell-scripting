#!/bin/bash
#####create EC2 Instance########

#While Running this script input parameter needs to added (for Eg: which machine needs to create eg: cart/user/../../)
#Checking whether the machine name provided or not if not provided then below piece of code will exit
#IF first argument $1 is not provided then it will exit with an exit value 1
COMPONENT=$1
if [ -z "$1" ]
  then
    echo "Input Machine Name is needed"
    exit 1
  else
    echo -e "\e[31mMachine Name is $COMPONENT\e[0m"
fi



#Finding out AMI ID

AMID=$(aws ec2 describe-images --filters "Name=name,Values=Centos-7-DevOps-Practice" | jq '.Images[].ImageId' | sed -e 's/"//g')
echo $AMID

#Create EC2 instace using the AMIID captured using above command
#PROVIDING the TAG specification , fetching the value from $COMPONENT variable
aws ec2 run-instances --image-id ${AMID} --instance-type t2.micro --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]"| jq >>/dev/null
STATUS=$?

if [ $STATUS -ne 0 ]
  then
    echo -e "\e[31mEC2 Instance name $COMPONENT Not Created\e[0m"
  else
    echo -e "\e[32mEC2 Instance name : $COMPONENT Created Successfully\e[0m"
fi



