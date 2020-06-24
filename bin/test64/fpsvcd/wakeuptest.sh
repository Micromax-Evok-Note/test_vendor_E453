#!/system/bin/sh

ScreenStatus()
{
	screen=`dumpsys power| grep "Display Power: state=OFF"`
	if [ "$screen" = "" ];then
		return 1
	fi 
	return 0
}

Wakeup()
{
	echo uevent > /proc/sl_fp
}

Sleep()
{
	input keyevent 26
}

toggle()
{
	ScreenStatus
	if [ $? = 0 ];then
		Sleep
	fi
	Wakeup
	
}

for i in 20;do
	toggle
	sleep 3
done
