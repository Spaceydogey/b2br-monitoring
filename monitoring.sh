arc=$(uname -a)
Pcpus=$(nproc)
Vcpus=$(cat /proc/cpuinfo | grep processor | wc  -l)
Fmem=$(free -m | grep Mem | awk '{print $3}')
Tmem=$(free -m | grep Mem | awk '{print $2}')
wall "#Architecture: $arc
#CPU physical : $Pcpus
#vCPU : $Vcpus
#Memory Usage: $Fmem/$Tmem
"
