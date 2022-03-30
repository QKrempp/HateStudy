#!/bin/bash

if ! command -v jq &> /dev/null
then
    echo "jq n'est pas installé, veuillez l'installer au préalable"
    exit
fi

echo "Installation dans ~/.ytcom/ ..."
echo "-> Création des dossiers"
mkdir -p ~/.ytcom/bin
cp ./start_scan.sh ~/.ytcom/
cd ~/.ytcom
mkdir json
echo "-> Téléchargement de yt-dlp"
wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O bin/yt-dlp &> /dev/null
echo "-> Autorisation d'exécution des fichiers nécessaires"
chmod +x bin/yt-dlp
chmod +x start_scan.sh
echo "-> Création des fichiers de configuration"
touch url_to_test.txt
touch words_to_test.txt

echo "Installation terminée."
