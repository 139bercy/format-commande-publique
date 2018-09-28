#/bin/bash

date=`date +%Y-%m-%d`
annee=`date +%Y`
mois=`date +%m`
jour=`date +%d`

echo "Décompression des fichiers HELSTATG..."
unzip HELSTATG*

echo "Déplacement des fichiers XML vers /xml..."
mkdir -p xml/$date
mv **/*.xml xml/

cd xml

echo "Transformation des fichiers XML..."
java -cp saxon9he.jar net.sf.saxon.Transform

echo "Fusion des fichiers XML (quand c'est nécessaire)..."


echo "Fusion et dédoublonnage des données urlProfilAcheteur..."
siretsDuJour=`ls sirets/$annee/$mois/$jour/*`
sort $siretsDuJour profilsAcheteur.csv | uniq
