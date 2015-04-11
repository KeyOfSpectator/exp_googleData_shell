CREATE TABLE task_events (
   time VARCHAR(15) NOT NULL,
   missing_info VARCHAR(20),
   jobID VARCHAR(20) NOT NULL,
   task_index INTEGER NOT NULL,
   machineID VARCHAR(15),
   event_type INTEGER NOT NULL,
   user VARCHAR(50),
   scheduling_class INTEGER,
   priority INTEGER NOT NULL,
   CPU_request FLOAT,
   memory_request FLOAT,
   disk_space_request FLOAT,
   different_machines_restriction BOOLEAN,
   PRIMARY KEY(time, jobID, task_index, event_type)
);

CREATE TABLE task_events_9 (
   time VARCHAR(15) NOT NULL,
   missing_info VARCHAR(20),
   jobID VARCHAR(20) NOT NULL,
   task_index INTEGER NOT NULL,
   machineID VARCHAR(15),
   event_type INTEGER NOT NULL,
   user VARCHAR(50),
   scheduling_class INTEGER,
   priority INTEGER NOT NULL,
   PRIMARY KEY(time, jobID, task_index, event_type)
);

CREATE TABLE task_events_8 (
   time VARCHAR(15) NOT NULL,
   jobID VARCHAR(20) NOT NULL,
   task_index INTEGER NOT NULL,
   event_type INTEGER NOT NULL,
   CPU_request FLOAT,
   memory_request FLOAT,
   disk_space_request FLOAT,
   different_machines_restriction BOOLEAN,
PRIMARY KEY(time, jobID, task_index, event_type)
);

CREATE TABLE task_events_70 (
   time VARCHAR(15) NOT NULL,
   missing_info VARCHAR(20),
   jobID VARCHAR(20) NOT NULL,
   task_index INTEGER NOT NULL,
   machineID VARCHAR(15),
   event_type INTEGER NOT NULL,
   user VARCHAR(50),  
   PRIMARY KEY(time, jobID, task_index, event_type)
);


CREATE TABLE task_events_71 (
   time VARCHAR(15) NOT NULL,
   jobID VARCHAR(20) NOT NULL,
   task_index INTEGER NOT NULL,
   event_type INTEGER NOT NULL,
   scheduling_class INTEGER,
   priority INTEGER NOT NULL,
   CPU_request FLOAT,
PRIMARY KEY(time, jobID, task_index, event_type)
);

CREATE TABLE task_events_72 (
   time VARCHAR(15) NOT NULL,
   jobID VARCHAR(20) NOT NULL,
   task_index INTEGER NOT NULL,
   event_type INTEGER NOT NULL,
   memory_request FLOAT,
   disk_space_request FLOAT,
   different_machines_restriction BOOLEAN,
PRIMARY KEY(time, jobID, task_index, event_type)
);

CREATE TABLE task_usage (
0 start_time VARCHAR(15) NOT NULL,
1 end_time VARCHAR(15) NOT NULL,
2 jobID VARCHAR(20) NOT NULL,
3 task_index INTEGER NOT NULL,
4 machineID VARCHAR(15) NOT NULL,
5 CPU_rate FLOAT,
6 canonical_memory_usage FLOAT,
7 assigned_memory_usage FLOAT,
8 unmapped_page_cache FLOAT,
9 total_page_cache FLOAT,
10 maximum_memory_usage FLOAT,
11 disk_IO_time FLOAT,
12 local_disk_space_usage FLOAT,
13 maximum_CPU_rate FLOAT,
14 maximum_disk_IO_time FLOAT,
15 cycles_per_instruction FLOAT,
16 memory_accesses_per_instruction FLOAT,
17 sample_portion FLOAT,
18 aggregation_type BOOLEAN,
19 sampled_CPU_usage FLOAT,
PRIMARY KEY(start_time, end_time, jobID, task_index)
);


select jobID, task_index, count(*)
from task_usage
group by jobID, task_index
order by count(*) desc
limit 1;

most common jobID, task_index
5285926325          0

（单点）
select CPU_rate
from task_usage
where jobID=5285926325 and task_index=0 and start_time=3276000000; 

5285926325000003276000000
Arg:
1 /home/fsc/hbase/hbase-0.98.9-hadoop2/conf/hbase-site.xml GoogleData_task_usage 5285926325000003276000000 5285926325000003299000000

（范围）
select CPU_rate
from task_usage
where jobID=5285926325 and task_index=0 and start_time>=3276000000 and start_time<=3299000000;

5285926325000003276000000  5285926325000003299000000
Arg:
2 /home/fsc/hbase/hbase-0.98.9-hadoop2/conf/hbase-site.xml GoogleData_task_usage 5285926325000003276000000 5285926325000003299000000

select time
from task_events
where jobID=5285926325 and task_index=0 and event_type=3;  (5285926325000003)
Arg:
1 /home/fsc/hbase/hbase-0.98.9-hadoop2/conf/hbase-site.xml GoogleData_task_event 5285926325000003 0

(扫描)
select count(*)
from task_events
where event_type=3;


sar -r -u -d 1

## hbase task_usage rowkey design
rowkey = jobID(10位) + task_index(5位) + start_time(10位) + i

（单点）
rowkey 528592632503276000000+i
（范围）
rowkey 528592632503276000000+i ~ 528592632503299000000+i

## hbase task_events rowkey design
rowkey = jobID(10位) + task_index(5位) + event_type(1位)  