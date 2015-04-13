#insert task_event
 java -jar /home/ubuntu/git_projects/exp_googleData_hbase-master/jar/Exp_insert_task_event_singleThread_forQuery.jar /home/ubuntu/data/query_data/task_event/1_1.csv /home/ubuntu/hbase/hbase-0.98.9-hadoop2/conf/hbase-site.xml Google_task_event 399997

#insert task_usage
 java -jar /home/ubuntu/git_projects/exp_googleData_hbase-master/jar/Exp_insert_task_usage_singleThread_forQuery.jar /home/ubuntu/data/query_data/task_usage/1_1.csv /home/ubuntu/hbase/hbase-0.98.9-hadoop2/conf/hbase-site.xml Google_task_usage 1654293

# query 单点 usage
 java -jar /home/ubuntu/git_projects/exp_googleData_hbase-master/jar/hbase_query.jar 1 /home/ubuntu/hbase/hbase-0.98.9-hadoop2/conf/hbase-site.xml Google_task_usage 5285926325000003276000000 0

# query 范围 usage
 java -jar /home/ubuntu/git_projects/exp_googleData_hbase-master/jar/hbase_query.jar 2 /home/ubuntu/hbase/hbase-0.98.9-hadoop2/conf/hbase-site.xml Google_task_usage 5285926325000003276000000 5285926325000003299000000

# query 范围 event
 java -jar /home/ubuntu/git_projects/exp_googleData_hbase-master/jar/hbase_query.jar 1 /home/ubuntu/hbase/hbase-0.98.9-hadoop2/conf/hbase-site.xml Google_task_event 5285926325000003 0
