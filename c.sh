#create my partitions
echo "n
p
1

+550M
n
p
2
 
+4G
n
p
3
 
 
w" | fdisk /dev/sda
