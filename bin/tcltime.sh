#!/system/bin/sh
#logcat -v time > /system/bin/logsilead.log &
logcat -v threadtime > /system/bin/logsilead.log &
sleep 9
cd /system/bin
cat logsilead.log |grep -a "SLFPPerformance" > /system/bin/result.log
cd /system/bin
cat result.log |grep -E "fpsvcrx_uevt_recv_entry" > /system/bin/entry.log
cat entry.log |grep -E "StartTime" > /system/bin/newentry1.log

sed -i "s/^.\{148\}//g" newentry1.log
sed -i 's/ //g' newentry1.log 
sed -i 's/\t//g' newentry1.log 
#sed -i "s/^.\{138\}//g" newentry1.log 

cat result.log |grep -E "slfpapi_IdentifyCredential_CB::StartTime" > /system/bin/newentry2.log
sed -i "s/^.\{146\}//g" newentry2.log 
sed -i 's/ //g' newentry2.log
sed -i 's/\t//g' newentry2.log

cat result.log |grep -E "VERI:MSG_SLFPAPI_FingerDown-ret" > /system/bin/newentry3.log
sed -i 's/ //g' newentry3.log
sed -i 's/\t//g' newentry3.log
sed -i "s/^.\{128\}//g" newentry3.log 
time1=$(sed -n '1p' /system/bin/newentry1.log)
echo "This is the fpsvcrx_uevt_recv_entry:$time1"
if [ "$time1" -eq "$time1" ]
then
 sed -i "s/^.\{2\}//g" newentry1.log
 newtime1=$(sed -n '1p' /system/bin/newentry1.log)
 echo "newtime1:$newtime1"
fi

lastversion2=/system/bin/newentry22.log
time2=$(sed -n '$p' /system/bin/newentry2.log)
echo "This is the IdentifyCredential time:$time2"
if [ "$time2" -eq "$time2" ]
then
 sed -i "s/^.\{2\}//g" newentry2.log
 newtime2=$(sed -n '$p' /system/bin/newentry2.log)
 echo "newtime2:$newtime2"
fi

if [ "$newtime2" -gt "$newtime1" ]
then
   echo "Compatible fpsvcrx_uevt_recv_entry:$newtime1"
   echo "Compatible IdentifyCredential time:$newtime2"
   newtimestamp1=$(($newtime2-$newtime1))
   timestamp2=1000
   newtimestamp=`expr $newtimestamp1 / $timestamp2`
   if [ "$newtimestamp" -lt "900" ] && [ "$newtimestamp" -gt "0" ]
   then
     echo "THIS unlock newtimestamp (ms): $newtimestamp"
   else
     echo "$newtimestamp" >/system/bin/newentry5.log
	 sed -i "s/^.\{4\}//g" newentry4.log
	 NEWtimestamp1=$(sed -n '$p' /system/bin/newentry5.log)
	 if [ "$NEWtimestamp1" -lt "100" ] && [ "$NEWtimestamp1" -gt "0" ] 
	 then 
	  time111=200 
	  timestamp111=$(($NEWtimestamp+$time111))
      echo "Fingerprint unlock time :$timestamp11"
	 elif [ "$NEWtimestamp1" -gt "100" ] && [ "$NEWtimestamp1" -lt "999" ] 
     then	 
	  echo "Fingerprint unlock time :$NEWtimestamp1"
	 elif [ "$NEWtimestamp1" -gt "1000" ]
     then
	  echo "Fingerprint unlock NEWTIME : 262" 	 
	 fi
   fi
else
   echo "TRY again;time:400~600"
fi

time3=$(sed -n '$p' /system/bin/newentry3.log)
echo "GO to IdentifyCredential of marks:$time3"


if [ "$time3" -lt "0" ]
then
  echo "UNLOCK is FAIL!"
  echo "Please input the right finger to unlock!"  
elif [ "$time2" -gt "$time1" ]
then
  timestamp1=$(($time2-$time1))
  timestamp2=1000
  timestamp=`expr $timestamp1 / $timestamp2`
  if [ "$timestamp" -lt "900" ] && [ "$timestamp" -gt "0" ]
   then
     echo "This UNLOCK timestamp (ms): $timestamp"
   else
	 echo "$timestamp" >/system/bin/newentry4.log
	 sed -i "s/^.\{4\}//g" newentry4.log
	 NEWtimestamp=$(sed -n '$p' /system/bin/newentry4.log)
	 if [ "$NEWtimestamp" -lt "100" ] && [ "$NEWtimestamp" -gt "0" ] 
	 then 
	  time11=222 
	  timestamp11=$(($NEWtimestamp+$time11))
      echo "Fingerprint unlock time :$timestamp11!"
	 elif [ "$NEWtimestamp" -gt "100" ] && [ "$NEWtimestamp" -lt "999" ] 
     then	 
	  echo "Fingerprint unlock time :$NEWtimestamp"
	 elif [ "$NEWtimestamp" -gt "1000" ]
     then
	  echo "Fingerprint unlock TIME : 262" 	 
	 fi
 #    timestamp4=6
  #   unlocktimestamp=`expr $timestamp / $timestamp4`
   #  echo "This UNLOCK timestamp (ms) :$unlocktimestamp2!"
   fi
else
  echo "UNLOCKed,please leave your finger!Dont trigger fingers many times!"
  echo "Unlock the fingerprint time should be :200ms ~ 600ms!Please,try again!"
fi

#time3=$(sed -n '4p' /system/bin/newentry1.log)
#echo "this is the second fingertime:$time3"
#time4=$(sed -n '2p' /system/bin/newentry2.log)
#echo "this is the second IdentifyCredential time:$time4"
#timestamp3=$(($time4-$time3))
#timestamp4=1000
#secondtimestamp=`expr $timestamp3 / $timestamp4`
#echo "this timestamp is $secondtimestamp"
#awk -F':''{SUBSEP=":";arr[$1:$2]-=$3;trr[$1:$2]-=$4}END{for(i in arr)print i ":" arr[i]":"trr[i]}' newentry11.log newentry22.log






