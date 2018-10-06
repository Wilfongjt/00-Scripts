function delete_blank_lines_file()
{
  # replace a given string in a file then rewrite the file
  # $1 is file_name

  local file_name=$1
  local search_value=""

  echo $file_name

  contents=()
  while IFS= read -r line; do
# while read line; do
# echo "$line"
    if [[ $line != $search_value ]]; then
      contents+=("$line")
    fi
  done < $file_name
  # echo "" > $file_name
  rm $file_name
  for line in "${contents[@]}"; do
#echo "$line"
    echo "$line" >> $file_name
  done

# for((i = 0;i <= ${#contents[@]}; i++)); do
#  echo "${contents[$i]}"
#   echo "${contents[$i]}" >> $file_name
# done
}

#echo '---------------------------'
#rpl="A A A"


#delete_blank_lines_file files/test_delete_lines.txt

# echo "\"scripts\": {" > test_real.txt
# echo "  \"test\": \"echo \"Error: no test specified\" && exit 1\"" >> test_real.txt
# echo '},' >> test_real.txt

# rpl='scripts'
# rpls=()
# rpls+=('"dev": "webpack-dev-server --mode development",')
# rpls+=('"prod": "webpack --mode production",')

# insert_after_file test_real.txt "$rpl" "${rpls[@]}"
