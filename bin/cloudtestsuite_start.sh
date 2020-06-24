#!/system/bin/sh

sileadprop=`getprop sys.service.silead`
echo $sileadprop
if [ $sileadprop = "enabled" ]; then
echo "test begin"
setprop sys.service.silead disabled
sleep 1
else
echo "silead fingerprint not exist exit test"
fi
setprop sys.cloudtestsuited.silead disabled
cloudtestsuitedprop=`getprop sys.cloudtestsuited.silead`
echo $cloudtestsuitedprop
if [ $cloudtestsuitedprop = "disabled" ]; then
echo "cloudtestsuited begin"
setprop sys.cloudtestsuited.silead enabled
fi
