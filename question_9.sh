#!/bin/bash
input_file="$1"
output_file="/tmp/output_1.txt"
> ${output_file}
while IFS= read -r line
do
  if [[ $line == "#"* ]]
  then
    echo $line >> ${output_file}
  else
    fake_ip=`echo $line | cut -d" " -f1`
    repeated=`grep -ci $fake_ip ${output_file}`
    if [[ $repeated -lt 1 ]]
    then
      echo $line >> ${output_file}
    fi
  fi
done < ${input_file}
