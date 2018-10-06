function insert_after_file()
{
  # replace a given string in a file then rewrite the file
  # $1 is file_name
  # $2 is string to find
  # $3 is replacement string array
  local file_name=$1
  local search_value=$2
  shift
  local rpls=("$@")

  contents=()
  while IFS= read -r line; do
    if [[ $line == *$search_value* ]]; then
      for r in "${rpls[@]}"; do
        # echo $r
        contents+=("$r")
      done
    else
      contents+=("$line")
    fi
  done < $file_name
  # echo "" > $file_name
  rm $file_name
  for line in "${contents[@]}"; do
# echo "$line"
    echo "$line" >> $file_name
  done
#rm $file_name
#  for((i = 0;i < ${#contents[@]}; i++)); do
#    echo "${contents[$i]}"
#    echo "${contents[$i]}" >> $file_name
#  done

}


#echo " A A A" > test_read.txt
#echo " B B B" >> test_read.txt
#echo " C C C" >> test_read.txt
#echo " D D D" >> test_read.txt

#echo '---------------------------'
#rpl="A A A"
#rpls=()
#rpls+=("  1 1")
#rpls+=("  2 2")
#rpls+=("  3 3")

#insert_after_file test_read.txt "$rpl" "${rpls[@]}"

# echo "\"scripts\": {" > test_real.txt
# echo "  \"test\": \"echo \"Error: no test specified\" && exit 1\"" >> test_real.txt
# echo '},' >> test_real.txt

# rpl='scripts'
# rpls=()
# rpls+=('"dev": "webpack-dev-server --mode development",')
# rpls+=('"prod": "webpack --mode production",')

# insert_after_file test_real.txt "$rpl" "${rpls[@]}"
