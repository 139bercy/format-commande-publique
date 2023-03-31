---
title: "Schémas de données"
date: 2020-05-05T12:57:45+02:00
weight: 2
---

### Schémas réglementaires nationaux

Les schémas réglementaires décrivent la même structure de données aux formats JSON et XML. Ces schémas sont publiés dans un dépôt dédié : [139bercy/format-commande-publique](https://github.com/139bercy/format-commande-publique).

Ces schémas sont la traduction technique des [textes réglementaires]({{< ref "/" >}}).

Voici les caractéristiques des **marchés publics** inclues dans le schéma :

- `id` : identifiant du marché, un numéro d'ordre interne propre à l'acheteur public (1 à 16 caractères)
- `objet` : objet du marché (max. 1000 caractères)
- `montant` : montant HT initial forfaitaire ou estimé maximum
- `procedure` : procédure utilisée (Procédure adaptée, Appel d'offres ouvert, Appel d'offres restreint, Procédure avec 
  négociation, Dialogue compétitif, Marchés publics passés sans publicité ni mise en concurrence préalables)
- `acheteur` :
  - `id` : SIRET de l'acheteur
- `titulaires` : titulaires du marché
  - `id` : identifiant du titulaire
  - `typeIdentifiant` : type d'identifiant du titulaire (SIRET, TVA, TAHITI, RIDET, FRWF, UE, HORS-UE, IREP)
- `nature` : nature du marché (Marché, Marché de partenariat, Marché de défense ou de sécurité)
- `dureeMois` : durée du marché (en mois)
- `codeCPV` : [code CPV](https://www.collectivites-locales.gouv.fr/acces-a-nomenclature-europeenne)
- `formePrix` : (Unitaire, Forfaitaire, ou Mixte)
- `lieuExecution` : lieu principal d'exécution
  - `code` : code du lieu d'exécution
  - `typeCode` : type de code utilisé (Code commune, Code canton, Code arrondissement, Code département, Code région, 
    Code pays, Code postal)
- `datePublicationDonnees` : date de publication des données initiales
- `dateNotification` : date de la réception de la notification de l'attribution du marché par le titulaire
- `ccag` : cahiers des clauses administratives générales de référence du marché public (liste de valeurs à choisir 
  parmi Travaux, Maîtrise d'œuvre, Fournitures courantes et services, Marchés industriels, Prestations 
  intellectuelles, Techniques de l’information et de la communication, ou vide)
- `typePrix` : liste de valeurs parmi les suivantes : Définitif ferme : le prix est fixé pour toute la durée marché. 
  Définitif actualisable : le prix peut évoluer périodiquement selon des conditions prévues dans le contrat initial 
  (ex : variation d'indice). Définitif révisable : l'acheteur et le titulaire peuvent s'entendre sur une 
  modification du prix après la signature du marché.). Provisoire : le prix n'est pas définitif.
- `technique` : la ou les techniques d'achat utilisées par l'acheteur (liste de valeurs parmi les suivantes : 
  Accord-cadre, Concours, Système de qualification, Système d’acquisition dynamique, Catalogue électronique, Enchère 
  électronique, ou vide)
- `marcheInnovant` : marché public comportant des travaux, services ou fournitures innovants (`true` ou `false`)
- `typeGroupementOperateurs` : le type de groupement d’entreprises ou d’opérateurs économiques (Solidaire, Conjoint,
  ou vide)
- `modaliteExecution` : la ou les modalités d'exécution du marché public. Mixte = bon de commande et marché subséquent 
  (liste de valeurs parmi les suivantes : Marché à tranches, Bon de commande, Marché subséquent, Mixte, ou vide)
- `idAccordCadre` : pour un marché subséquent, le numéro d’identification de marché public relevant de la 
  technique d’achat accord-cadre
- `attributionAvance` : une avance a été accordée au titulaire principal du marché public (`true` ou `false`)
- `tauxAvance` : taux de l'avance accordée au titulaire principal du marché public par rapport au montant du marché 
  (O.1 = 10 % du montant du marché). En fonction de la valeur de `attributionAvance`, une valeur égale à 0 signifie soit 
  qu'aucune avance n'a été accordée (si `attributionAvance` = `false`), soit que le taux de l'avance n'est pas connu (si 
  `attributionAvance` = `true`). Le champ peut aussi être omis si `attributionAvance` = `false`.
- `offresRecues` : nombre d'offres reçues par l'acheteur de la part des soumissionnaires. Comprend aussi les offres 
  irrégulières, inacceptables, inappropriées et anormalement basses.
- `origineUE` : la part des produits issus de l’Union européenne avec laquelle le marché sera exécuté. 0.2 = 20 % de 
  la part des produits provient de l'Union européenne (voir aussi [Origine des produits](/#origine-des-produits))
- `origineFrance` : la liste annexée à l'arrêté, la part des produits français avec laquelle le marché sera 
  exécuté. 0.2 = 20 % de la part des produits sont français (voir aussi [Origine des produits](/#origine-des-produits))
- `sousTraitanceDeclaree` : les sous-traitants ont été déclarés pendant la passation du marché public (`true` ou 
  `false`)
- `actesSousTraitance` : les actes de sous-traitance notifiés par l'acheteur (voir aussi [cette section](/#fonctionnement-des-actes-spéciaux-de-sous-traitance))
  - `id` : numéro d'identification de l'acte spécial de sous-traitance
  - `dureeMois` : durée de l'acte spécial de sous-traitance en mois
  - `montant` : montant HT en euros ou montant estimé maximum attribué
  - `dateNotification` : date de réception de la notification de l'acte spécial de sous-traitance par le sous-traitant
  - `variationPrix` : modalités de variation du prix du contrat de sous-traitance (Ferme, Actualisable, Révisable)
  - `sousTraitant` :
    - `id` : identifiant du sous-traitant
    - `typeIdentifiant` : type d'identifiant du titulaire (SIRET, TVA, TAHITI, RIDET, FRWF, UE, HORS-UE, IREP)
  - `datePublicationDonnees` : date de publication des données essentielles de l'acte spécial de 
    sous-traitance
- `considerationsSociales` : considérations sociales (liste de valeurs parmi les suivantes : Critère social, Clause 
  sociale, Marché réservé)
- `considerationsEnvironnementales` : considérations environnementales (liste de valeurs parmi les suivantes : Critère 
  environnemental, Clause environnementale)
- `modificationsActesSousTraitance` : aucune modification des données initiales d'un acte spéciale de sous-traitance 
  n'est possible, si ce n'est par l'ajout d'objets dans `modificationsActesSousTraitance` (voir aussi [cette section](/#fonctionnement-des-actes-spéciaux-de-sous-traitance))
  - `id` : numéro permettant d'identifier l'acte de sous-traitance à modifier
  - `dateNotificationModificationActeSousTraitance` : date à laquelle le sous-traitant a reçu la notification de la 
    modification de l'acte de sous-traitance, au format AAAA-MM-JJ
  - `datePublicationDonneesModificationActeSousTraitance` : date à laquelle les données essentielles sont 
    republiées suite à la modification de l'acte spécial de sous-traitance, au format AAAA-MM-JJ.
  - `montant` : le nouveau montant HT de l'acte spécial de sous-traitance
  - `dureeMois` : la nouvelle durée du contrat de sous-traitance, en mois.
- `modifications` : modifications du marché (voir aussi [cette section](/#fonctionnement-des-modifications))
  - `id` : numéro d'identifiant de la modification 
  - `montant` : montant modifié
  - `titulaires` : liste des titulaires modifiée
    - `id` : identifiant du titulaire
    - `typeIdentifiant` : type d'identifiant du titulaire (SIRET, TVA, TAHITI, RIDET, FRWF, UE, HORS-UE, IREP)
  - `dureeMois` : durée modifiée
  - `datePublicationDonneesModification` : date de publication des données de modification
  - `dateNotificationModification` : date de la réception de la notification de la modification par le titulaire

Voici les caractéristiques des **contrats de concession** inclues dans le schéma :

- `id` : identifiant du contrat de concession, un numéro d'ordre interne propre à l'acheteur public (1 à 16 caractères)
- `objet` : objet du contrat de concession (max. 1000 caractères)
- `autoriteConcedante` : autorité concédante
  - `id` : SIRET de l'autorité concédante
- `nature` : nature du contrat de concession (Concession de travaux, Concession de service, Concession de service 
  public, Délégation de service public)
- `procedure` : procédure (Procédure négociée ouverte, Procédure non négociée ouverte, Procédure négociée restreinte, 
  Procédure non négociée restreinte)
- `valeurGlobale` : valeur globale du contrat de concession
- `dureeMois` : durée (en mois)
- `montantSubventionPublique` : montant des subventions publiques
- `donneesExecution` : données d'exécution annuelles
  - `datePublicationDonneesExecution` : date de publication des données d'exécution
  - `depensesInvestissement` : montant des dépenses d'investissement
  - `tarifs` : tarifs pratiqués
     - `intituleTarif` : intitulé du tarif (max. 256 caractères)
     - `tarif` : montant du tarif
- `concessionnaires` : concessionnaires
  - `id` : identifiant du concessionnaire
  - `typeIdentifiant` : type d'identifiant du concessionnaire (SIRET, TVA, TAHITI, RIDET, FRWF, UE, HORS-UE, IREP)
- `dateSignature` : date de la signature
- `dateDebutExecution` : date du début d'exécution
- `datePublicationDonnees` : date de publication des données
- `considerationsSociales` : considérations sociales (liste de valeurs parmi les suivantes : Critère social, Clause 
  sociale, Concession réservée)
- `considerationsEnvironnementales` : considérations environnementales (liste de valeurs parmi les suivantes : 
  Critère environnemental, Clause environnementale)
- `modifications` : modifications (voir aussi [cette section](/#fonctionnement-des-modifications))
    - `id` : numéro d'identifiant de la modification
    - `valeurGlobale` : valeur globale modifiée
    - `dureeMois` : durée modifiée
    - `datePublicationDonneesModification` : date de publication des données de modification
    - `dateSignatureModification` : date de signature de la modification

#### Origine des produits

Pour les marchés de fournitures de denrées alimentaires, de véhicules, de produits de santé et d’habillement, selon 
la liste annexée à l'arrêté, la part des produits français et issus de l'Union européenne doit être renseignée. 
Si le marché est concerné, la valeur de ces champs doit être un nombre décimal compris entre 0 et 1. Si le marché 
n'est pas concerné ou que la donnée n'est pas disponible, la valeur de ces champs doit être :

- `null` en JSON
- une chaîne de caractères vide en XML (`<origineUE/>`, `<origineFrance/>`).

Les produits français provenant de l'Union européenne, la valeur de `origineUE` ne peut pas être inférieure à la 
valeur de `origineFrance`.

#### Fonctionnement des actes spéciaux de sous-traitance

Au moment de l'attribution du marché, l'acheteur doit :

- renseigner la liste des sous-traitants dans le bloc des déclarations d'actes spéciaux de sous-traitance
- si les sous-traitants sont connus mais que leur notification n'a pas encore eu lieu au moment de la notification 
  du marché, l'acheteur doit le renseigner en fixant `sousTraitanceDeclaree` à `true`. Si aucune sous-traitance 
  n'est prévue ou que les sous-traitants ne sont pas connus de l'acheteur au moment de la notification du marché, 
  fixer `sousTraitanceDeclaree` à `false`

Le numéro d'acte spécial de sous-traitance (`id`) peut être un numéro ajouté automatiquement par le producteur des 
données ou bien saisi manuellement par l'acheteur. Les contraintes sur ce numéro sont les suivantes :

- il doit s'agir d'un entier
- il doit être supérieur ou égal à 0
- les numéros d'ordre des actes spéciaux de sous-traitance doivent former une séquence croissante correspondant à 
  l'ordre de leur notification
- chaque numéro doit être unique dans une liste d'actes spéciaux de sous-traitance

Si un nouvel acte spécial de sous-traitance est notifié après la notification du marché :

- ajouter un acte spécial de sous-traitance dans `actesSousTraitance`
- ajouter une modification dans `modifications`
- les dates de publication des données de la modification et du nouvel acte spécial de sous-traitance doivent être 
  identiques

Si un acte spécial de sous-traitance est modifié après la notification du marché :

- s'il s'agit d'une modification de `montant` ou de `dureeMois`, ajouter une modification dans 
  `modificationsActesSousTraitance` avec les nouvelles valeurs
- s'il s'agit d'une autre modification, ajouter une modification dans `modifications`

#### Fonctionnement des modifications

Ce fonctionnement s'applique aux données de marchés publics et de contrats de concession.

Le producteur de données doit ajouter une modification dans `modifications` lorsqu'une modification 
du marché ou du contrat de concession a été notifiée, y compris dans les cas où cette modification ne porte pas sur 
les données pouvent être renseignées dans le bloc de modification (durée du contrat, liste des titulaire et 
montant/valeur globale).

L'identifiant de la modification (`id`) peut être un numéro ajouté automatiquement par le producteur des données ou 
bien saisi manuellement par l'acheteur. Les contraintes sur cet identifiant sont les suivantes :

- il doit s'agir d'un entier
- il doit être supérieur ou égal à 0
- les numéros d'ordre des modifications doivent former une séquence croissante correspondant à leur ordre de 
  notification
- chaque numéro doit être unique dans une liste de modifications

#### Référencement des schémas dans les données

Pour référencer ces schémas dans vos données et dans votre code informatique, voici les URL que nous vous 
recommandons d'utiliser :

- Toujours la dernière version :
  - JSON : https://schema.data.gouv.fr/schemas/139bercy/format-commande-publique/latest/marches.json
  - XML : non proposé pour le schéma XML ([#46](https://github.com/139bercy/format-commande-publique/issues/46#issuecomment-628710331))
- Version 2.0.0 (arrêté du **xx** 2022) :
  - JSON : https://schema.data.gouv.fr/schemas/139bercy/format-commande-publique/2.0.0/marches.json
  - XML : https://raw.githubusercontent.com/139bercy/format-commande-publique/master/marches.xsd
- Version 1.5.0 (arrêté du 22 mars 2019) :
  - JSON : https://schema.data.gouv.fr/schemas/139bercy/format-commande-publique/1.5.0/marches.json
  - XML : https://raw.githubusercontent.com/139bercy/format-commande-publique/c3d3225be363460da55fba8a47bcaa173dcd99ba/marches.xsd
- Version 1.4.0 (arrêté modificatif du 27 juillet 2018) :
  - JSON : https://schema.data.gouv.fr/schemas/139bercy/format-commande-publique/1.4.0/marches.json
  - XML : https://raw.githubusercontent.com/139bercy/format-commande-publique/7655b975a208bd9f5adb7e1f9d6fa2dd5475b919/marches.xsd

### Schémas standards internationaux

Les données sont également publiées selon le standard [Open Contracting Data Standard](https://standard.open-contracting.org/latest/fr/) pour permettre la comparaison et l'exploitation des données à l'échelle internationale.

À ce jour, seules les données initiales d'attribution sont publiées au format OCDS, pas les modifications (montant, titulaires, durée). Les attributions modifiées une fois ou plus représentent moins de 1 % des données.
