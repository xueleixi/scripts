#!/bin/bash
##############################################
#File Name: scan_namp.sh
#Version: V1.0
#Author: 
#Created Time: 2018-03-19 14:32:27
#Description: 
##############################################
CMD=" nmap -sP "
Ip="172.16.1.0/24"
CMD2=" nmap -sS"
$CMD $Ip| awk '/Nmap scan report for/ {print $NF}'
