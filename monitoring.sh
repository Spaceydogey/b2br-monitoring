arc=$(uname -a)
Pcpus=$(nproc)
Vcpus=$(cat /proc/cpuinfo | grep processor | wc  -l)
Fmem=$(free -m | grep Mem | awk '{print $3}')
Tmem=$(free -m | grep Mem | awk '{print $2}')
Pmem=$(free -m | grep Mem | awk '{printf("%.2f"), $3/$2*100}')
Fdisk=$(df -Bg | grep ^/dev/ | awk '{ft += $3} END {print ft}')
Tdisk=$(df -Bg | grep ^/dev/ | awk '{tt += $2} END {print tt}')
Pdisk=$(df -Bg | grep ^/dev/ | awk '{ft += $3} {tt += $2} END {printf("%d"), ft/tt*100}')
Ucpu=$(top -bn1 | grep ^%Cpu | cut -c 9- | xargs |awk '{printf("%.1f%%"), $1 + $3}')
LB=$(who -b | awk '{print $3 " " $4}')
LVMcount=$(lsblk | grep "lvm" | wc -l)
LVMuse=$(if [ $lVMcount==0 ]; then echo no; else  echo yes; fi)
#net tool needed -> sudo apt install net-tool
TCPconnection=$(cat /proc/net/sockstat | grep TCP | awk  '{printf $3}')
USERlog=$(users | wc -l)
IPV4=$(hostname -I)
MAC=$(ip link show | grep ether | awk '{print $2}')
SUDOcmd=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

wall "#Architecture: $arc
#CPU physical : $Pcpus
#vCPU : $Vcpus
#Memory Usage: $Fmem/${Tmem}MB ($Pmem%)
#Disk Usage: $Fdisk/${Tdisk}Gb ($Pdisk%)
#CPU load: $Ucpu
#Last boot: $LB
#LVM use: $LVMuse
#Connection TCP : $TCPconnection ESTABLISHED
#User log: $USERlog
#Network: IP $IPV4 ($MAC)
#Sudo : $SUDOcmd cmd"
