IFS=$'\n' read -d '' -r -a instances < instances.txt
IFS=$'\n' read -d '' -r -a script_lines < $1

for i in "${instances[@]}"
do
  echo "] running script: $1"
  echo "]             on: $i"

  for script_line in "${script_lines[@]}"
  do
    echo "]   running line: $script_line"

    ssh -i key.pem ec2-user@$i $script_line

  done

done