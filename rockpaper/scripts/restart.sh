#!/usr/bin/env bash
rm -f *.rshm
sleep 5
mkdir logs > /dev/null 2>&1
cp nohup.out ./logs/nohup.$(date '+%Y%m%d%H%M%S').out > /dev/null 2>&1
nohup java -Xmx512m -jar ./rshm-1.0.0.jar > nohup.out &
sleep 1
tail -100 nohup.out
echo "rshm launching..."
echo "See the nohup.out."