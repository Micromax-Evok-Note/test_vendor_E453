#!/system/bin/sh
  echo 1 > /sys/module/sec/parameters/recovery_done
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery:10156032:b1b6561d27076c7b5f97a5e8f13f9d2c371ed390; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/boot:9013248:b4bb37e0916bf35fc2519f17e5d707b7a85b9a92 EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery b1b6561d27076c7b5f97a5e8f13f9d2c371ed390 10156032 b4bb37e0916bf35fc2519f17e5d707b7a85b9a92:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  if applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery:10156032:b1b6561d27076c7b5f97a5e8f13f9d2c371ed390; then
        echo 0 > /sys/module/sec/parameters/recovery_done
        log -t recovery "Install new recovery image completed"
        
  if applysig /system/etc/recovery.sig recovery; then
    sync
    log -t recovery "Apply recovery image signature completed"
  else
    log -t recovery "Apply recovery image signature fail!!"
  fi
  
  else
        echo 2 > /sys/module/sec/parameters/recovery_done
        log -t recovery "Install new recovery image not completed"
  fi
else
  echo 0 > /sys/module/sec/parameters/recovery_done
  log -t recovery "Recovery image already installed"
fi
