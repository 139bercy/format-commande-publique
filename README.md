# Format réglementaire pour la publication des données essentielles des marchés publics français (v0.3.1)

**Outils et documents divers autour du format réglementaire pour la publication des données essentielles des marchés publics français.**

Ce dépôt est destiné à accueillir :

- les schémas (JSON et XML) permettant de vérifier la validité des données publiées
- les référentiels qui définissent ces schémas
- des données exemple
- une suite de tests permettant de vérifier que les schémas couvrent bien les cas de figure envisagés, en utilisant les données exemple

## Vos commentaires

Vos questions et commentaires sont les bienvenus [sur le forum d'Etalab](https://forum.etalab.gouv.fr/t/schemas-de-validation-des-donnees-essentielles-des-marches-publics/3141).

## Voir aussi

- [Consultation publique sur les projets d’arrêtés relatifs aux fonctionnalités et exigences minimales des profils d’acheteurs et aux données essentielles, jusqu'au 28 novembre](http://www.economie.gouv.fr/daj/consultation-publique-projets-arretes-fonctionnalites-et-exigences-minimales-profils-acheteurs)
- [Projet d’arrêté relatif aux données essentielles dans la commande publique, au 28/10/2016](http://www.economie.gouv.fr/files/files/directions_services/daj/actualites/consultation-publique-10-2016/Projet_arrete_Donnees_essentielles.pdf) (la version du 13/12/2016 sera bientôt publiée)
- [La commande publique augmentée par la données sur forum.etalab.gouv.fr](https://forum.etalab.gouv.fr/t/la-commande-publique-augmentee-par-la-donnee/909)

## Notes de version

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
