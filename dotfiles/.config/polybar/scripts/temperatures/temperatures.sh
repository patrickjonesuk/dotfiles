
GPU=$(nvidia-smi | grep --colour=none -Po "\d{2}(?=C)")
for zone in $(ls /sys/class/thermal/ | grep thermal_zone)
do
    if [[ $(cat /sys/class/thermal/$zone/type) -eq "x86_pkg_temp" ]]
    then
        CPU=$(cat /sys/class/thermal/$zone/temp)
        CPU=$(echo "scale=1 ; $CPU / 1000" | bc)
        break
    fi
done
echo "GPU: $GPU° CPU: $CPU°"
