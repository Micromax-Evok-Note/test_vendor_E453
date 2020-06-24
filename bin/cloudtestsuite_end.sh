#!/system/bin/sh

cloudtestsuitedprop=`getprop sys.cloudtestsuited.silead`
echo $cloudtestsuitedprop
if [ $cloudtestsuitedprop = "enabled" ]; then
echo "cloudtestsuited end"
setprop sys.cloudtestsuited.silead disabled
#/system/bin/cloudtestsuited &
sleep 1
fi
sileadprop=`getprop sys.service.silead`
echo $sileadprop
if [ $sileadprop = "disabled" ]; then
echo "test end"
setprop sys.service.silead enabled
else 
echo "silead fingerprint not exist exit test"
fi

