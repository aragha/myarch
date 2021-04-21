#delete partitions
echo "d
1
w" | fdisk /dev/sda

echo "d
2
w" | fdisk /dev/sda

echo "d
3
w" | fdisk /dev/sda
