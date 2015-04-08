#!/bin/bash
echo "shell start !"

echo "" > /home/ubuntu/shell/output/logs
echo "clean logs"


#split 2 table
echo "[start] split 2 table"

i=1
for threads in 
do
	for split in 
	do
		for test_loop in 
		do
		java -jar /home/ubuntu/git_project/exp_googleData_hbase/jar/Exp_thoughput_split2table_DynamicThreads_50WLine.jar /home/ubuntu/data/output${threads}/ /home/ubuntu/hbase/hbase-0.98.9-hadoop2/conf/hbase-site.xml ${threads} ${split}  ${threads}T_${split}S_NPR_splittable2_${test_loop} >> /home/ubuntu/shell/output/logs
		echo "[done] "$i" th  threads: "${threads}" split: "${split} " testNum: " ${test_loop}
		i=`expr $i + 1`
		done
	done
done
echo "[done] split 2 table"

echo "[start] split 3 table"

i=1
for threads in 16 
do
        for split in 4 #8 16 32 64
        do
                for test_loop in 1 #2 3
                do
                java -jar /home/ubuntu/git_project/exp_googleData_hbase/jar/Exp_thoughput_split3table_DynamicThreads_50WLine.jar /home/ubuntu/data/output${threads}/ /home/ubuntu/hbase/hbase-0.98.9-hadoop2/conf/hbase-site.xml ${threads} ${split}  ${threads}T_${split}S_NPR_splittable3_${test_loop} >> /home/ubuntu/shell/output/logs
                echo "[done] "$i" th  threads: "${threads}" split: "${split} " testNum: " ${test_loop}
                i=`expr $i + 1`
                done
        done
done
echo "[done] split 3 table"


echo "[done] all done"

