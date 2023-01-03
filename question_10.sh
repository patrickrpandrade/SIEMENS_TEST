#!/bin/bash
input_file="/tmp/output_1.txt"
output_file="/tmp/output_2.txt"
> ${output_file}
while IFS= read -r line
do
  if [[ $line == "#"* ]]
  then
    echo $line >> ${output_file}
  else
  new_line=""
  n_col=0
  for col in ${line}
  do
    if [[ $n_col -lt 1 ]]
    then
      while [[ ${#col} -lt 18 ]]
      do
        col=$col" "
      done
    else
      col=$col"   "
    fi
  n_col+=1
  new_line+=$col
  done
  echo "$new_line"
  echo "$new_line" >> ${output_file}
  fi
done < ${input_file}
