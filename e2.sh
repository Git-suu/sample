#!/bin/bash
echo "Enter your access key "
read accesskey
echo "Enter your secret access key "
read secret
echo "Enter instance type from(t1.micro t2.nano t2.micro t2.small t2.medium t2.large t2.xlarge t2.2xlarge t3.nano t3.micro t3.small t3.medium t3.large)"
read type
echo "How much storage do you want (enter in GB's)"
read storage
echo "How many ec2 machine you want? "
read machine
echo "Give instance any Name "
read hostname

export AWS_ACCESS_KEY_ID=$accesskey
export AWS_SECRET_ACCESS_KEY=$secret
export AWS_DEFAULT_REGION=us-west-2

 aws ec2 run-instances --image-id ami-0e999cbd62129e3b1 --count $machine --instance-type $type \
--key-name oree --subnet-id subnet-568a272e --security-group-ids sg-980f03bb \
--user-data 

if [ $? -eq 0 ]
then
echo "ec2 instance launch successfully"
else
echo "ec2 instance launch failed , check your inputs"
fi