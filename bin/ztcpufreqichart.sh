#!/system/bin/sh


freq()
{
    echo `date +%x-%X.%N`:ap=`cat affected_cpus`:pf=`cat cpuinfo_cur_freq`:gf=`cat scaling_cur_freq`
}

if [ $1 = "" ]; then
    loops=4000000000
else
    loops=$1
fi




echo "affected cpus=ap:cpuinfo_cur_freq=pf:scaling_cur_freq=gf"
c=0
#echo ${loops}
while [ $c -lt $loops ]
do
#   c=`expr $c + 1`
   let c=c+1
   cd /sys/devices/system/cpu/cpu0/cpufreq
   if [ $? != 0 ]; then
		continue
   fi
   freq
#   sleep 1
done


