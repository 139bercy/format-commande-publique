#/bin/bash

date=`date +%Y-%m-%d`
annee=`date +%Y`
mois=`date +%m`
jour=`date +%d`

source configPublication.sh
scriptDir=`pwd`

mkdir -p $racine

cd $racine

echo "Décompression des fichiers XML vers l'historique..."

mkdir -p historiqueXML/$date
unzip 'HELSTATG*' -d historiqueXML/$date
unzip '*.zip' -d historiqueXML/$date

echo "Copie des fichiers XML vers un dossier temporaire..."

mkdir temp
cp -rv historiqueXML/$date/* temp/

echo "Déplacement des fichiers ZIP vers l'historique ZIP..."

mkdir -p historiqueZIP/$date
mv -v HELSTATG* historiqueZIP/$date
mv -v *.zip historiqueZIP/$date

echo "Transformation des fichiers XML..."

cd temp
for xml in `find -path **/*.xml`
do
java -jar $saxonJar -s:$xml -xsl:$scriptDir/decpDGFIP.xsl
done

# echo "Fusion des fichiers XML (quand c'est nécessaire)..."

echo "Fusion et dédoublonnage des données urlProfilAcheteur..."
mkdir $racine/profilsAcheteurs
sort `ls sirets/$annee/$mois/$jour/*.xml/*` | uniq > $racine/profilsAcheteurs/profilsAcheteurs-$date.csv
