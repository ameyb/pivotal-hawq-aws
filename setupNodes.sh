yum install ed
yum remove ruby

chkconfig iptables off
chkconfig ip6tables off
service iptables stop
service ip6tables stop

password=pivotal123
sed -i "s/#PermitRootLogin yes/PermitRootLogin yes/g" /etc/ssh/sshd_config
sed -i "s/#PasswordAuthentication yes/PasswordAuthentication yes/g" /etc/ssh/sshd_config
sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
service sshd restart
passwd <<EOF
$password
$password
EOF

mkfs -t ext4 /dev/sdf
mkdir /data1
mount -t ext4 /dev/sdf /data1

mkfs -t ext4 /dev/sdg
mkdir /data2
mount -t ext4 /dev/sdg /data2

sed -i 's/SELINUX=[a-z]*/SELINUX=disabled/' /etc/selinux/config
echo 0 > /selinux/enforce
 