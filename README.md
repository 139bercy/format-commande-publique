# Format réglementaire pour la publication des données essentielles des marchés publics français

> v1.1.2

**Outils et documents divers autour du format réglementaire pour la publication des données essentielles des marchés publics français.**

Ce dépôt est destiné à accueillir :

- les schémas (JSON et XML) permettant de vérifier la validité des données publiées
- les référentiels qui définissent ces schémas
- des données exemples

## Vos commentaires

Vos questions et commentaires sont les bienvenus [sur le forum d'Etalab](https://forum.etalab.gouv.fr/t/schemas-de-validation-des-donnees-essentielles-des-marches-publics/3141).

Si vous avez un compte Github, vous pouvez également [créer un ticket](https://github.com/etalab/format-commande-publique/issues/new).

## Voir aussi

- [Le site Web thématique de la Direction des Affaires Juridiques du Ministère des Finances](https://www.economie.gouv.fr/daj/ouverture-des-donnees-commande-publique)
- [Arrêté du 14 avril 2017 relatif aux données essentielles dans la commande publique](https://www.legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000034492587&dateTexte=&categorieLien=id)
- [Arrêté du 14 avril 2017 relatif aux fonctionnalités et exigences minimales des profils d'acheteurs](https://www.legifrance.gouv.fr/affichTexte.do;jsessionid=00B73A5DA9B3A710ABD6B312CD109476.tpdila16v_3?cidTexte=JORFTEXT000034492557&dateTexte=&oldAction=rechJO&categorieLien=id&idJO=JORFCONT000034491769)
- [La commande publique augmentée par la données sur forum.etalab.gouv.fr](https://forum.etalab.gouv.fr/t/la-commande-publique-augmentee-par-la-donnee/909)


## Notes de version

**1.1.2** (20 février 2018)

- Allongement du champ identifiant de marché afin d'accueillir le numéro d'ordre de modification prévu dans l'article 1 de l'arrêté ([voir #22](/etalab/format-commande-publique/issues/22))

**1.1.1** (1er février 2018)

- Résolution d'un bug dans le schéma XML des paquets

**1.1.0** (2 octobre 2017)

- Ajout du type de document ["paquet"](https://github.com/etalab/format-commande-publique/tree/master/exemples/xml) via l'élément `marches` dans le format XML pour publier plusieurs marchés, de différent types, dans un même fichier XML
- Exemples : remplacement de l'URL des schémas pour une URL absolue, et non relative

**1.0.2** (29 septembre 2017)

- Correction : le champ `montantSubventionPublique` avait été appelé `montantAvantagesFinanciers`
- Correction : les `ìd` des schémas JSON utilisaient des URN, au lieu d'URI
- Correction : la version 2017_1 des référentiels n'était en fait pas la dernière. Se référer au [texte en ligne](https://www.legifrance.gouv.fr/affichTexte.do?$)

**1.0.1** (18 juillet 2017)

- Correction : le champ `dateSignatureModification` avait été oublié dans les schémas JSON et XML, et dans les exemples
- Correction : le champ `donneesExecution` était mal écrit dans un des exemples XML
- Correction : la clé `description` de l'objet `id` était en double dans le schéma JSON des marchés défense et sécurité
- Suppression de la balise \<\_type> dans les schémas et exemples XML
- Mise à jour des liens dans le README
_
**1.0.0** (2 mai 2017)

- Ajout du concept de "paquet" via l'array `marches` dans le format JSON pour publier plusieurs marchés, de différent types, dans un même fichier JSON
- Ajout de la propriété `_type` dans le format JSON pour distinguer le type de marché (marché public, marché défense et sécurité, contrat de concession)

**0.4.0** (13 janvier 2016)

**1.0.0** (2 mai 2017)

- Ajout des liens vers les arrêtés publiés
- Ajout du schéma "paquet" pour les données JSON, permettant d'avoir plusieurs marchés/contrats de concessions dans un même fichier.
- La même fonctionnalité sera bientôt disponible pour les données XML

**0.4.0** (13 janvier 2017)

- Création de quelques données exemples en JSON et XML
- Quelques changements esthétiques dans les référentiels

**0.3.1** (30 décembre 2016)

- Bug réglé : oubli de l'identification de l'acheteur dans le schéma des marchés défense et sécurité
- Bug réglé : la structure du schéma des contrats de concession était invalide
- La propriété `donneesExecution` doit être présente, mais peut être une liste vide
- Remplacement des apostrophes ’ par des apostrophes '

**0.3.0** (27 décembre 2016)

- mise à jour des schémas et des référentiels pour coller à l'arrêté relatif aux données essentielles, version **13/12/2016**

**0.2.1** (9 novembre 2016)

- ajout de liens autour de la spécification JSON Schema ([ici](https://github.com/etalab/format-commande-publique/tree/master/json-schema))
- correction de coquilles

**0.2.0** (28 octobre 2016)

- mise à jour des schémas pour coller à l'arrêté relatif aux données essentielles, version **28/10/2016**
- Ajout d'information dans le README

**0.1.0** (13 septembre 2016)

- schémas pour les marchés publics, les marchés de défense ou de sécurité, et les concessions
- schémas JSON conformes à la norme **JSON Schema draft v4**
- pas (encore) de tests du schéma
