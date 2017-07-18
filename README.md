# Format réglementaire pour la publication des données essentielles des marchés publics français (v0.4.0)

**Outils et documents divers autour du format réglementaire pour la publication des données essentielles des marchés publics français.**

Ce dépôt est destiné à accueillir :

- les schémas (JSON et XML) permettant de vérifier la validité des données publiées
- les référentiels qui définissent ces schémas
- des données exemples
- une suite de tests permettant de vérifier que les schémas couvrent bien les cas de figure envisagés, en utilisant les données exemple (non disponible)

## Vos commentaires

Vos questions et commentaires sont les bienvenus [sur le forum d'Etalab](https://forum.etalab.gouv.fr/t/schemas-de-validation-des-donnees-essentielles-des-marches-publics/3141).

Si vous avez un compte Github, vous pouvez également [créer un ticket](https://github.com/etalab/format-commande-publique/issues/new).

## Voir aussi

- [Le site Web thématique de la Direction des Affaires Juridiques du Ministère des Finances](https://www.economie.gouv.fr/daj/ouverture-des-donnees-commande-publique)
- [Arrêté du 14 avril 2017 relatif aux données essentielles dans la commande publique](https://www.legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000034492587&dateTexte=&categorieLien=id)
- [Arrêté du 14 avril 2017 relatif aux fonctionnalités et exigences minimales des profils d'acheteurs](https://www.legifrance.gouv.fr/affichTexte.do;jsessionid=00B73A5DA9B3A710ABD6B312CD109476.tpdila16v_3?cidTexte=JORFTEXT000034492557&dateTexte=&oldAction=rechJO&categorieLien=id&idJO=JORFCONT000034491769)
- [La commande publique augmentée par la données sur forum.etalab.gouv.fr](https://forum.etalab.gouv.fr/t/la-commande-publique-augmentee-par-la-donnee/909)

## Notes de version

**0.4.0** (13 janvier 2016)

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
