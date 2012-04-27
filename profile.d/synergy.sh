##
# Start synergy server if configured hosts are available.
#
# Configuration files are in ${etc}/synergy named ${host}.conf for
# each remote host. Synergy will run for the first host detected,
# checking them in in alphanumeric order.
#
# Copyright 2011 by Andrew Kennedy; All Rights Reserved.
#
# Author: Andrew Kennedy <andrew.international@gmail.com>
# Last modified: 201105302135
##

#set -x # debug

etc=/opt/local/etc

if [ "${SYNERGYS_ENABLED}" ]; then
    ps aux | grep -v "grep" | grep "synergys" >/dev/null 2>&1 || (
        for conf in ${etc}/synergy/*.conf; do
            host=$(basename ${conf} .conf)
            if ping -W10 -c1 ${host} > /dev/null 2>&1; then
                echo "Starting synergy server for ${host}..."
                synergys -n cadmium -c ${conf}
                echo
                break
            fi
        done
    )
fi
