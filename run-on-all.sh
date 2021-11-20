IFS=$'\n' read -d '' -r -a instances < instances.txt

for i in "${instances[@]}"
do
  echo "] running: $1"
  echo "]      on: $i"

  ssh -i key.pem ec2-user@$i $@

  echo

done