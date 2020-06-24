#!/system/bin/sh

echo cpu info
cd /sys/devices/system/cpu
echo kernel_max=`cat kernel_max`
echo modalias=`cat modalias`
echo offline=`cat offline`
echo online=`cat online`
echo possible=`cat possible`
echo present=`cat present`

echo cpu online info=
for i in {0..12}
do
echo cpu$i=`cat cpu0/online`
done




