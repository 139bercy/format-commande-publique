#/bin/bash

date=`date +%Y-%m-%d`
annee=`date +%Y`
mois=`date +%m`
jour=`date +%d`
heure=`date +%H:%M:%S`

source configTransformation.sh

# Paramètre 1 : le chemin absolu du répertoire où les zips ont été téléchargés
zips=$1
racine=$1

if [[ -z $schemasDir || -z $saxonJar || -z $validatorJar || -z $xsltDir ]] ; then
    echo -e "\n[Erreur] Vous devez renseigner les variables de configuration suivantes dans configTransformation.sh : schemasDir, saxonJar, validatorJar, xsltDir."
    exit 1
fi

echo "Début du traitement des fichiers : $date $heure"


echo -e "\033[1m\n\nMise en lecture seule des ZIPs et décompression des fichiers XML vers l'historique...\033[0m"

echo -e "Répertoire courant (*.zip) : $zips"
cd $zips
ls -1 *.zip
chmod 444 *.zip
mkdir -p $racine/sourceXML
unzip -q '*.zip' -d $racine/sourceXML
chmod -R 544 $racine/sourceXML

echo -e "\033[1m\n\nDéplacement des fichiers ZIP vers l'historique ZIP...\033[0m"

mkdir sourceZIP
mv -v $zips/*.zip sourceZIP

echo -e "\033[1m\n\nRéencodage en UTF-8 et transformation des fichiers XML...\033[0m"

cd $racine/sourceXML
vides=0
pasvides=0
for xml in `find -path **/*.xml`
do
    if [ -s $xml ]; then
        echo -e "$xml : réencodage et transformation"
        java -jar $saxonJar -s:$xml -xsl:$xsltDir/decpDGFIP.xsl racine="$racine"
        ((pasvides++))
    else
        echo -e "$xml : fichier vide"
        ((vides++))
    fi
done

total=$((pasvides + vides))
echo -e "\nFichiers traités : $pasvides Fichiers vides : $vides Total : $total"

echo -e "\033[1m\n\nFusion et validation des fichiers XML par SIRET...\033[0m"

cd $racine


echo -e "\nSIRETs de la session :"
ls -1 sirets
echo ""

sirets=`ls sirets`

for siret in $sirets
do
    cd $racine/sortieXML/$siret

    pwd
    for xml in `ls *.xml`
    do
        nouveauFichier=${xml/__*/.xml}
        java -jar $saxonJar -s:$xml -xsl:$xsltDir/merge.xsl > $nouveauFichier
        java -jar $validatorJar -sf $schemasDir/paquet.xsd -if $nouveauFichier
        rm *.xml.xml
        break
    done
    echo -e "\n`ls -l`\n"
    cd $racine
done

echo -e "\033[1m\n\nFusion et dédoublonnage des données urlProfilAcheteur...\033[0m"
sort `ls $racine/sirets/*` | uniq > $racine/profilsAcheteurs.csv

date=`date +%Y-%m-%d`
heure=`date +%H:%M:%S`

echo -e "\nFin du traitement des fichiers : $date $heure"
