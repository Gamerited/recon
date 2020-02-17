#!/bin/bash
echo "Resolving target"
if [ "$1" == "" ]
then
echo "NO TARGET FOUND !!!!"
echo "Please Enter your domain"
echo ""
echo "The Syntax is ./recon.sh domain.com "
else
echo "Target found *.$1"
echo "Starting Amass to find subdomain of $1"
echo "please wait"
amass enum -d $1 -o $1.txt
echo "Subdomain finding has completed"
echo "Starting httprobe to test the subdomains"
cat $1.txt | httprobe | tee hosts
echo "Now taking screenshots of subdomains"
cat hosts | aquatone -out $1.html
echo "Task completed"
echo "Please check your results" 
fi
