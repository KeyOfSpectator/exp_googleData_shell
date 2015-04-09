#!/bin/bash

hbh=$HBASE_HOME
unset HBASE_HOME
exec "$hbh/bin/hbase" shell <<EOF

disable "tsdb"
drop "tsdb"

disable "tsdb-meta"
drop "tsdb-meta"

disable "tsdb-tree"
drop "tsdb-tree"

disable "tsdb-uid"
drop "tsdb-uid"

EOF
