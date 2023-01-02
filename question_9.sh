#!/bin/bash
input_file="$1"
output_file="/tmp/output_1.txt"
echo "" > ${output_file}
while IFS= read -r line
do
  if [[ "$line" = "\#*" ]]
  then
    echo "aqui"
    echo $line >> ${output_file}
  else
    fake_ip=`echo $line | cut -d" " -f1`
    echo $fake_ip
    repeated=`grep -ci $fake_ip ${output_file}`
    echo $repeated
    if [[ $repeated -lt 1 ]]
    then
      echo "acola"
      echo $line >> ${output_file}
    fi
  fi
done < ${input_file}
