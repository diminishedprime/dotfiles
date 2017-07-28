#!/bin/bash

total_num=10
light_float=`light`
light_int=${light_float%.*}
filled_num=$(($light_int / $total_num))
empty_num=$(($total_num - $filled_num))
filled=`head -c $filled_num < /dev/zero | tr '\0' ''`
empty=`head -c $empty_num < /dev/zero | tr '\0' ''`
hearts=$filled$empty
echo $hearts
