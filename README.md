# APM监控数据测试 脚本部分
* hbase thoughput 
> 相关脚本：exp.ssh
> <p>数据集 56M 50WLine 监控数据</p>

* hbase split table thoughput
> <p>相关脚本：exp_split_table_hbase.sh</p>
> <p>数据集 56M 50WLine 监控数据</p>
> <p>分为2个表和3个表</p>

* opentsdb thoughput
> <p>相关脚本：exp_opentsdb.sh</p>
> <p>数据集 56M 50WLine 监控数据</p>

* hbase 查询实验脚本
> <p>相关脚本：exp_query_shell.sh</p>
> <p>数据集 task_event task_usage</p>

* 数据结构声明 与 查询要求
> <p>create_table.sql</p>

* 数据平分n份工具
> <p>splitEqually.py</p>

* hbase 表批量删除工具
> <p>./hbase_shell/MultiDeleteHbaseTable.sh</p>

