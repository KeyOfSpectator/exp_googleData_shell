import os

os.system("/home/ubuntu/shell/hbase_shell/deleteMetrics_tsdb.sh")

os.system("/home/ubuntu/opentsdb/opentsdb/src/create_table.sh")

os.system("/home/ubuntu/shell/hbase_shell/createMetrics_tsdb.sh")

