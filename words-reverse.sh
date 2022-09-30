#!/bin/bash
# Subtask 4: Putting it All Together
[[ ! -z $1 ]] && [[ "$1" != "--bypass" ]] && echo "Ugyldig: '$1'" >&2 && exit 1
bypass=$1
hashDir=$(echo "$text" | sh ./depunctuate.sh $hashDir)
mkdir $hashDir

tekst=$(</dev/stdin)

# Skiller teksten,
# og lager hashes
tekst=$(echo "$tekst" | sh ./depunctuate.sh $hashDir)

if [[ "$bypass" != "--bypass" ]]; then
	tekst=$(echo $tekst | sh ./words-reverse.sh)
fi

# Setter sammen igjen
tekst=$(echo "$tekst" | sh ./repunctuate.sh $hashDir)

rm -r $hashDir
echo "TEKST:"
echo "$tekst"

# ekstra kommentar

# ekstra kommentar

# ekstra kommentar

# ekstra kommentar

# ekstra kommentar
