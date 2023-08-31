#!/bin/bash
virsh destroy patroni
virsh undefine patroni
rm /mnt/focal-server-cloudimg.qcow2 
virsh destroy patroni2
virsh undefine patroni2
rm /mnt/focal-server-cloudimg2.qcow2 
virsh destroy patroni3
virsh undefine patroni3
rm /mnt/focal-server-cloudimg3.qcow2 
rm /mnt/test1-seed.img
