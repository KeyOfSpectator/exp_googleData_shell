#!/bin/bash

hbh=$HBASE_HOME
unset HBASE_HOME

echo "disable and drop hbase table $1"

exec "$hbh/bin/hbase" shell <<EOF

disable "$1"
drop "$1"

EOF
