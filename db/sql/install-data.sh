#!/bin/bash
PSQL_ROOT_PASSWORD="root"

#!/bin/bash
psql -uroot -p$PSQL_ROOT_PASSWORD <<EOF
source $WORK_PATH/$FILE_0;
source $WORK_PATH/$FILE_1;
EOF
#
sh /docker-entrypoint-initdb.d/init_trade_history.sh1
