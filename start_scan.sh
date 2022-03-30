#!/bin/bash

cd ~/.ytcom &> /dev/null
if [ $? -eq 0 ]
    echo "Installation incomplète. Veuillez ré-exécuter install.sh"
    exit
fi

for url in $(cat url_to_test.txt)
do
    echo "Traitement de l'URL $url"
    ./bin/yt-dlp --write-comments --skip-download $url -o 'json/%(title)s.json' &> /dev/null
done


echo "Resultats de la recherche" > results.txt
echo "===" >> results.txt
echo "" >> results.txt

for file in $(ls json)
do
    echo "Traitement du fichier $file"
    echo "## $file" >> results.txt
    for word in $(cat words_to_test.txt)
    do
        echo "Recherche du mot $word"
        echo "- $word : $(cat json/$file | jq '.comments[].text' | grep -o $word | wc -l)" >> results.txt
    done
    echo "" >> results.txt
done

echo "Recherche terminée, résultats dans results.txt"
