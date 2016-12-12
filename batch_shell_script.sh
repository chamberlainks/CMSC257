
#!/bin/bash

#FILE= $(<$1)

#echo "$FILE"

function gitCommit 
{
    git add -A .

    git commit -m "automated commit from script"

    git push -u origin master
}

if [ "$#" -eq 0 ]
then
    echo "Name Of File: "
    exit 1
fi

printf "Amount of lines in file: "

wc -l $1


printf "\nAmount of words in the file: "

wc -w $1


printf "\nMost repetitive word in file: "

tr -c '[:alnum:]' '[\n*]' < $1 | sort | uniq -c | sort -nr | head  -1


printf "\nLeast repetitive word in file: "

tr -c '[:alnum:]' '[\n*]' < $1 | sort | uniq -c | sort | head  -1


#sed '/d.*d//Ig'
printf "Amount of words that start and end with d or D in file: \n"

grep -Ewo '[dD].*[dD]' $1 | wc -w


printf "\nAmount of words that start with A or a in file:\n"

grep -Ewo '[aA].*[^ ]' $1 | wc -w


printf "\nAmount of numeric words in file:\n"

grep -Ewo '[0-9][0-9]*' $1 | wc -w


printf "\nAmount of alphanumeric words\n"

#grep -Ewo "[a-zA-Z0-9]*" $1 | wc -w
grep -Eow '[a-zA-Z0-9]*' test.txt | sed 's/^[0-9]*//g' | sed 's/^[a-zA-Z]*//g' | wc -w





