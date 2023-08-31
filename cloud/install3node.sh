#wget https://repo.almalinux.org/almalinux/8/cloud/x86_64/images/AlmaLinux-8-GenericCloud-8.8-20230524.x86_64.qcow2
sleep 7
qemu-img create -b /mnt/AlmaLinux-8-GenericCloud-8.8-20230524.x86_64.qcow2   -f qcow2 -F qcow2 /mnt/focal-server-cloudimg.qcow2 45G
cloud-localds -v --network-config=network_config_static.cfg /mnt/test1-seed.img cloud_init.cfg
sleep 10
virt-install --name patroni \
  --virt-type kvm \
  --memory 8112 \
  --vcpus 4 \
  --boot hd,menu=on \
  --cdrom /mnt/test1-seed.img \
  --disk path='/mnt/focal-server-cloudimg.qcow2',device='disk',size=45 \
  --graphics none \
  --network bridge=br0,model=virtio \
  --noautoconsole --wait 0
sleep 40
rm /etc/machine-id
touch /etc/machine-id
rm /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id
sleep 40
qemu-img create -b /mnt/AlmaLinux-8-GenericCloud-8.8-20230524.x86_64.qcow2   -f qcow2 -F qcow2 /mnt/focal-server-cloudimg2.qcow2 45G
cloud-localds -v --network-config=network_config_static2.cfg /mnt/test1-seed.img cloud_init.cfg
sleep 10
virt-install --name patroni2 \
  --virt-type kvm \
  --memory 8112 \
  --vcpus 4 \
  --boot hd,menu=on \
  --cdrom /mnt/test1-seed.img \
  --disk path='/mnt/focal-server-cloudimg2.qcow2',device='disk',size=45 \
  --graphics none \
  --network bridge=br0,model=virtio \
  --noautoconsole --wait 0
sleep 40
rm /etc/machine-id
touch /etc/machine-id
rm /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id
sleep 40
qemu-img create -b /mnt/AlmaLinux-8-GenericCloud-8.8-20230524.x86_64.qcow2   -f qcow2 -F qcow2 /mnt/focal-server-cloudimg3.qcow2 45G
cloud-localds -v --network-config=network_config_static3.cfg /mnt/test1-seed.img cloud_init.cfg
sleep 10
virt-install --name patroni3 \
  --virt-type kvm \
  --memory 8112 \
  --vcpus 4 \
  --boot hd,menu=on \
  --cdrom /mnt/test1-seed.img \
  --disk path='/mnt/focal-server-cloudimg3.qcow2',device='disk',size=45 \
  --graphics none \
  --network bridge=br0,model=virtio \
  --noautoconsole --wait 0
sleep 20
rm /etc/machine-id
touch /etc/machine-id
rm /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id
 


