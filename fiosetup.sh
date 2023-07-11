#!/bin/bash
#Check the system
echo "LISTING NETWORK DEVICES"
lshw -class network -businfo
echo "LISTING DEVICES WITH RDMA SUPPORT"
ibv_devices

#Prepare fio invironment
yum install fio -y
mkdir /mnt/vstorage/t1r3
vstorage -c $1 set-attr -R /mnt/vstorage/t1r3 replicas=3:2 tier=1
mkdir /mnt/vstorage/t1r2
vstorage -c $1 set-attr -R /mnt/vstorage/t1r2 replicas=2:1 tier=1
mkdir /mnt/vstorage/t1r1
vstorage -c $1 set-attr -R /mnt/vstorage/t1r1 replicas=1:1 tier=1
vstorage -c $1 get-attr /mnt/vstorage/
vstorage -c $1 list-services
echo "FINISHED"
