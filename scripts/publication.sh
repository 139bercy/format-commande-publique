#/bin/bash

date=`date +%Y-%m-%d`
annee=`date +%Y`
mois=`date +%m`
jour=`date +%d`

source configTransformation.sh
scriptDir=`pwd`

# Paramètre 1 : le chemin absolu du répertoire où les zips ont été téléchargés
zips=$1

mkdir -p $racine


echo "\n\nMise en lecture seule des ZIPs et décompression des fichiers XML vers l'historique..."

echo "Répertoire courant (zips) : $zips"
cd $zips
chmod 444 *.zip
mkdir -p $racine/historiqueXML/$date
unzip '*.zip' -d $racine/historiqueXML/$date

echo "\n\nCopie des fichiers XML vers un dossier temporaire..."

echo "Répertoire courant (racine) : $racine"
cd $racine

mkdir temp
cp -rv historiqueXML/$date/* temp/

echo "\n\nDéplacement des fichiers ZIP vers l'historique ZIP..."

mkdir -p historiqueZIP/$date
mv -v $zips/*.zip historiqueZIP/$date

echo "\n\nRéencodage en UTF-8 et transformation des fichiers XML..."

cd temp
for xml in `find -path **/*.xml`
do
iconv -f ISO-8859-1 -t UTF-8 $xml -o $xml.utf8.xml
mv $xml.utf8.xml $xml
java -jar $saxonJar -s:$xml -xsl:$scriptDir/decpDGFIP.xsl
done

# echo "Fusion des fichiers XML (quand c'est nécessaire)..."

echo "Fusion et dédoublonnage des données urlProfilAcheteur..."
mkdir -p $racine/profilsAcheteurs
sort `ls sirets/$annee/$mois/$jour/*.xml/*` | uniq > $racine/profilsAcheteurs/profilsAcheteurs-$date.csv

