IFS=$'\n' read -d '' -r -a instances < instances.txt

for i in "${instances[@]}"
do
  echo "] running: scp -i key.pem $1 ec2-user@$i:"
  echo "]      on: $i"

  scp -i key.pem $1 ec2-user@$i:
  ssh -i key.pem ec2-user@$i artillery run $@ &

done