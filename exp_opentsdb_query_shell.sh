#fix data
$python insert_task_event_opentsdb_DyTh_fixdata.py /home/ubuntu/data/query_data/opentsdb/task_event/ 1 399997 >> /home/ubuntu/data/query_data/opentsdb/task_event/task_event_fixed.csv

$python insert_task_usage_opentsdb_DyTh_fixdata.py /home/ubuntu/data/query_data/opentsdb/task_usage/ 1 1654293 >> /home/ubuntu/data/query_data/opentsdb/task_usage/task_usage_fixed.csv

# mkmetric

#task_event
$./tsdb mkmetric google.data.event.cpu google.data.event.memory google.data.event.disk

#task_usage
$./tsdb mkmetric google.data.usage.CPU_rate google.data.usage.canonical_memory_usage google.data.usage.assigned_memory_usage google.data.usage.unmapped_page_cache google.data.usage.total_page_cache  google.data.usage.maximum_memory_usage google.data.usage.disk_IO_time google.data.usage.local_disk_space_usage google.data.usage.maximum_CPU_rate google.data.usage.maximum_disk_IO_time google.data.usage.cycles_per_instruction google.data.usage.memory_accesses_per_instruction google.data.usage.sample_portion google.data.usage.aggregation_type google.data.usage.sampled_CPU_usage

#gzip
然后把 0.csv 打成 .gz 压缩包 0.csv.gz
gzip XXX.csv

# import
 $./tsdb import /home/ubuntu/data/query_data/opentsdb/task_event/gz/0.csv.gz

 $./tsdb import /home/ubuntu/data/query_data/opentsdb/task_usage/gz/0.csv.gz