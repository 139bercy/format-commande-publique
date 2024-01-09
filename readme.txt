DECP validation présentation
-----------------------------

Cet outil est destiné à être utilisé par ceux qui produisent des DECP. Cela concerne les contrats de concessions et les marchés publics.
En cas de rejet des données, cet outil sert à identifier les ajustements requis afin de correspondre aux arrêtés en vigueur.


Utilisation
-----------

L'outil se présente sous la forme d'une application Java présentée sous la forme d'un JAR exécutable.
Etapes à suivre pour l'utiliser :
1. Télécharger l'application (le fichier .jar).
2. Télécharger dans le même répertoire que le .jar, le xsd (schéma de validation).
3. Copier dans ce même répertoire votre fichier xml que vous souhaitez valider.
4. Ouvrez un invité de commande (Win + R -> tapez cmd -> tapez entrée), allez dans ce répertoire utilisé aux points 1,2,3 et ensuite :
java -jar DECPValidation.jar decp_v2.0.1.xsd <votre_xml>

Exemple utilisant le sml se trouvant au même niveau de l'arborescence que la readme.txt

java -jar DECPValidation.jar decp_v2.0.1.xsd decp_v2.0.1.xml


Si votre fichier comporte des non-conformités par rapport aux arrêtés en vigueur, vous allez obtenir des informations vous guidant dans l'identification des causes des non-conformité.

Si votre fichier est conforme, vous allez avoir le message suivant :
----->>> Début de l'analyse. <<<-----
Votre XML est conforme au format 2022.
----->>> Fin de l'analyse. <<<-----