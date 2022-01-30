#!/bin/bash
rebuild-lib() {
    prt-cache update -fr -if -im -is \
        `for f in $(grep -lr "$*" /usr/lib/ 2> /dev/null | sed 's|.*/||'); \
        do prt-get fsearch $f | grep '^Found in' | sed -e 's|.*/||' -e 's|:$||'; \
        done | sort -u | xargs prt-cache isinst | grep -e 'is installed' | awk '{ print $2 }'`; 
}

rebuild-lib "${1}"
