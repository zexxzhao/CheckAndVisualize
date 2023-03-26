
for i in {2000..6000..20};
do
	while true
	do
		fname=mesh150/solution.${i}.tec
		echo "cheking ${fname}"
		if [ ! -f $fname ]; then
			echo "${fname} unfound" && sleep 4
			continue
		fi
		pid=$(/usr/bin/lsof -t $fname | wc -l)
		if [ $pid -gt 0 ]; then
			echo "solution.${i}.tec downloading" && sleep 4
			continue
		fi
		pvpython mesh150/fig/loop.py $i && break
		echo "====================================="
	done
done
