#!/bin/bash
echo "shell start !"

echo "" > /home/ubuntu/shell/output/logs_tsdb
echo "clean logs"

#java -jar /home/ubuntu/git_projects/dyTS_preRead/exp_googleData_hbase/jar/thoughputDT.jar /home/ubuntu/data/output50/ /home/ubuntu/hbase/hbase-0.98.9-hadoop2/conf/hbase-site.xml 50 50T_128S_NPR_1 128 >> /home/ubuntu/shell/output/logs
#echo "job done"

i=1
for threads in 1 
do
		for test_loop in 1 2 3
		do
#		/home/ubuntu/git_projects/dyTS_NPR_shell/exp_googleData_hbase/jar/thoughput50WL_DT_Nologs.jar
#		java -jar /home/ubuntu/git_projects/dyTS_NPR_shell/exp_googleData_hbase/jar/
		python /home/ubuntu/git_projects/exp_googleData_py_opentsdb/thoughput_opentsdb/thoughput_opentsdb_DyTh_import.py /home/ubuntu/data/output_tsdb/output${threads}/ ${threads} >> /home/ubuntu/shell/output/logs_tsdb
		echo "[done] "$i" th  threads: "${threads}" split: "${split} " testNum: " ${test_loop}
		i=`expr $i + 1`
		done
done

echo "all done!"

#ubuntu@m1:~/exp_data$ ls
#splitEqually.py

#cat /home/ubuntu/exp_data/splitEqually.py >> /home/ubuntu/shell/output/logs
