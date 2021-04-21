#create my partitions
echo "n
1

+550M
w" | fdisk /dev/sda
echo "/n


+4G
w" | fdisk /dev/sda
echo "n



w" | fdisk /dev/sda
