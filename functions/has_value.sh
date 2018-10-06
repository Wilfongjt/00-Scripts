function has_value()
{
  # replace a given string in a file then rewrite the file
  # $1 is file_name
  # $2 is string to find

  local file_name=$1
  local search_value=$2
  local rc=0

  while read line; do

    if [[ $line == *$search_value* ]]; then
        echo 1
        exit
    fi
  done < $file_name
  echo 0
}

#echo "AAA" > files/has_value.txt
#echo "BBB" >> files/has_value.txt
#echo "CCC" >> files/has_value.txt
#echo "DDD" >> files/has_value.txt


#rc=$(has_value "files/has_value.txt" "xxx")
#echo "not found is $rc"
#rc=$(has_value "files/has_value.txt" "AAA")
#echo "found is $rc"

