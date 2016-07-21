#!/bin/bash

/usr/bin/mysql -uroot -ptoor --execute="set global max_allowed_packet=1000000000;"
/usr/bin/mysql -uroot -ptoor p5sn_dev < /database/import_db/p5sndb.sql
