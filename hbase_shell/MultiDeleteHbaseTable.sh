#!/bin/bash
echo "shell start !"

i=1
for threads in 16 32
do
        for split in 4 8 16 32 64
        do
                for test_loop in 1 2 3
                do

#32T_32S_NPR_splittable3_3_2
		./deleteHbaseTable.sh ${threads}T_${split}S_NPR_splittable3_${test_loop}_1
		./deleteHbaseTable.sh ${threads}T_${split}S_NPR_splittable3_${test_loop}_2
		./deleteHbaseTable.sh ${threads}T_${split}S_NPR_splittable3_${test_loop}_3


                echo "[done] "$i" delete "${threads}T_${split}S_NPR_shellEXE2_${test_loop}
                i=`expr $i + 1`
                done
        done
done

echo "[done] all done!"

