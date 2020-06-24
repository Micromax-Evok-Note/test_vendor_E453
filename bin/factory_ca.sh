sileadprop=`getprop sys.service.silead`
echo $sileadprop
if [ $sileadprop = "enabled" ]; then
echo "test begin"
setprop sys.service.silead disabled
sleep 1
echo $*
factorytool_ca $*
setprop sys.service.silead enabled
echo "test end"
else
echo "silead fingerprint not exist exit test"
fi

