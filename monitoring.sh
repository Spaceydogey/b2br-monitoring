arc=$(uname -a)
Pcpus=$(nproc)
Vcpus=$(cat /proc/cpuinfo | grep processor | wc  -l)
Fmem=$(free -m | grep Mem | awk '{print $3}')
Tmem=$(free -m | grep Mem | awk '{print $2}')
Pmem=$(free -m | grep Mem | awk '{printf("%.2f"), $3/$2*100}')
Fdisk=$(df -Bg | grep ^/dev/ | awk '{ft += $3} END {print ft}')
Tdisk=$(df -Bg | grep ^/dev/ | awk '{tt += $2} END {print tt}')
Pdisk=$(df -Bg | grep ^/dev/ | awk '{ft += $3} {tt += $2} END {printf("%d"), ft/tt*100}')
Ucpu=$(top -bn1 | grep ^%Cpu | cut -c 9- | awk '{printf("%.1f%%"), $1 + $3}')
wall "#Architecture: $arc
#CPU physical : $Pcpus
#vCPU : $Vcpus
#Memory Usage: $Fmem/${Tmem}MB ($Pmem%)
#Disk Usage: $Fdisk/${Tdisk}Gb ($Pdisk%)
#CPU load: $Ucpu
"
top -bn1 | grep ^%Cpu | cut -c 9- | awk '{print $1}'
top -bn1 | grep ^%Cpu | cut -c 9- | awk '{print $3}'
