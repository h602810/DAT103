#!/bin/bash
# Subtask 2: Depunctuation Script

[[ $# == 0 ]] && echo "Usage: $0 <hash_directory>" >&2 && exit 1

hashDir=$1
text=$(</dev/stdin)

# endrer teksten stegvis for å forhindre små feil
separert=$(echo "$text" | sed -z 's/\n/|/g' | sed 's/\ /\n&\n/g;s/[,.]/\n&/g;s/|/&\n/g')

punkt=$(echo "$separert" | grep -E ',|/\.|\s' | sort | uniq)

# lager en funksjon som lager hasher
# lager hash filer, 
# og ser etter at filene er riktige
function hashing() {
	fil=$(echo $1 | sha256sum | cut -d " " -f 1)
	if [[ ! -f $hashDir/$fil ]]; then
		echo $1 > $hashDir/$fil
		return 0
	fi
	
	if [[ "$(cat $hashDir/$fil)" != "$1" ]]; then
		echo "Feil! Duplikat av hash-kode i = "
		echo " '$(cat hashDir/$fil)'"
		exit 1
	fi
}

# Lager hash-lookUp filer
IFS=$'\n'
for p in $punkt; do
	hashing $p
done

# Output i konsollen
for s in $separert; do
	erPunkt=false
	for p in $punkt; do
		[[ "$s" == "$p" ]] && erPunkt=true
	done

	if [[ $erPunkt = true ]]; then
		echo $(echo $s | sha256sum | cut -d " " -f 1)
	else
		echo "$s"
	fi 
	done
# ekstra kommentar
# ekstra kommentar
