#!/bin/bash

for p in $(bbrf programs); do
    bbrf domains --view unresolved -p "$p" | \
        dnsx -silent -a -resp | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' | tr -d '[]' | tee \
        >(awk '{print $1 ":" $3}' | bbrf domain update - -p "$p" -s dnsx) \
        >(awk '{print $1 ":" $3}' | bbrf domain add - -p "$p" -s dnsx) \
        >(awk '{print $3 ":" $1}' | bbrf ip add - -p "$p" -s dnsx) \
        >(awk '{print $3 ":" $1}' | bbrf ip update - -p "$p" -s dnsx)
done

#!/bin/bash
#
#for p in $(bbrf programs); do
#    bbrf domains --view unresolved -p $p |
#        dnsx -silent -a -resp | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' | tr -d '[]' |
#        awk '{print $1 ":" $3}'
#    tee \
#        >(awk '{print $1 ":" $3}' | bbrf domain update - -p $p -s dnsx) \
#        >(awk '{print $1 ":" $3}' | bbrf domain add - -p $p -s dnsx) \
#        >(awk '{print $3 ":" $1}' | bbrf ip add - -p $p -s dnsx) \
#        >(awk '{print $3 ":" $1}' | bbrf ip update - -p $p -s dnsx)
#done
