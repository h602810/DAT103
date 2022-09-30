#!/bin/bash
# Subtask 3: Repunctuation Script

# Setter argumentet til en variabel
hashDir=$1
stdinTxt=$(</dev/stdin) 
tekst=""

# Bytt hashkoder tilbake til punktene de representerer
IFS=$'\n'
for line in $stdinTxt; do
	if [[ -f $hashDir/$line ]]; then
		line=$(cat $hashDir/$line)
	fi
	tekst="$tekst$line"
done

# Bytter pipeline med new line
tekst=$(echo $tekst | sed 's/|/\n/g')

echo "$tekst"
