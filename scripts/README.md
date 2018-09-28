Une feuille de style XSLT utilisée pour préparer les fichiers envoyés à Etalab par la DGFiP à la publication sur data.gouv.fr.

Les modifications apportées sont les suivantes :

- les éléments XML se voient retirer l'espace de nom (namespace) renseigné par la DGFiP (http://data.gouv.fr/marches/etalab)
- l'élément `dateSignatureModification` est remplacé par `dateNotificationModification`, conformément à [l'article 1er](https://www.legifrance.gouv.fr/affichTexteArticle.do;jsessionid=827F7B40490885361A36CF0736F37AA4.tplgfr29s_3?idArticle=JORFARTI000037283011&cidTexte=JORFTEXT000037282994&dateTexte=29990101&categorieLien=id) de l'arrêté modificatif du 27 juillet 2018
- les éléments suivants sont supprimés
    - `dateTransmissionDonneesEtalab`
    - `urlProfilAcheteur`
