temp_file=$(mktemp)
counter=0
task due.any: status:pending export | jq -c '.[]' | while read -r json; do
  description=$(echo "$json" | jq -r .description)
  due=$(echo "$json" | jq -r .due | cut -c 1-8 | xargs -I {} date -d "{}" "+%Y,%m,%d")
  echo "$counter,$due,$description,1,once,normal" >>"$temp_file"
  ((counter++))
done
echo "done"
cat "$temp_file" >/hdd/falcon/argonarch/.config/calcure/events.csv
