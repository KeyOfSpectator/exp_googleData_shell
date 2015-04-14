#!/bin/bash
echo "shell start !"

echo "" > /home/ubuntu/shell/output/logs
echo "clean logs"

#java -jar /home/ubuntu/git_projects/dyTS_preRead/exp_googleData_hbase/jar/thoughputDT.jar /home/ubuntu/data/output50/ /home/ubuntu/hbase/hbase-0.98.9-hadoop2/conf/hbase-site.xml 50 50T_128S_NPR_1 128 >> /home/ubuntu/shell/output/logs
#echo "job done"

i=1
for threads in 32
do
	for split in 64
	do
		for test_loop in 1 #2 3
		do

		current_time=`python /home/ubuntu/git_projects/exp_googleData_shell/monitor-shell/getCurrentTime.py` 
		echo "current_time = " ${current_time}

#monitor1		
		python /home/ubuntu/git_projects/exp_googleData_shell/monitor-shell/monitor1.py ${current_time}  ${threads} &
		echo "[Monitor] start"

#exec
		java -jar /home/ubuntu/git_projects/exp_googleData_hbase-master/jar/thoughput50WL_DT_Nologs.jar /home/ubuntu/data/output${threads}/ /home/ubuntu/hbase/hbase-0.98.9-hadoop2/conf/hbase-site.xml ${threads} ${split}  ${threads}T_${split}S_NPR_shellEXE2_${test_loop} 

#monitor2
		python /home/ubuntu/git_projects/exp_googleData_shell/monitor-shell/monitor2.py ${current_time} ${threads} &


		echo "[done] "$i" th  threads: "${threads}" split: "${split} " testNum: " ${test_loop}
		i=`expr $i + 1`
		done
	done
done

echo "all done!"

#ubuntu@m1:~/exp_data$ ls
#splitEqually.py

#cat /home/ubuntu/exp_data/splitEqually.py >> /home/ubuntu/shell/output/logs


