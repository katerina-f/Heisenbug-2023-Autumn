#!/bin/bash

echo "127.0.0.1 $(cat ~/orig_hostname)" >> /etc/hosts \
&& echo "precedence ::ffff:0:0/96  100" > /etc/gai.conf \
&& echo "sshd" \
        && nohup /usr/sbin/sshd \
        && echo "run.sh" \
        && su gpadmin -c "/usr/local/bin/run.sh" \
        && su gpadmin -c "export MASTER_DATA_DIRECTORY=/gpdata/master/gpseg-1; source /usr/local/greenplum-db/greenplum_path.sh;" \
        && /bin/bash && tail -f /dev/null
