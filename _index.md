### Schémas réglementaires nationaux

Les schémas réglementaires décrivent la même structure de données aux formats JSON et XML. Ces schémas sont publiés dans un dépôt dédié : [139bercy/format-commande-publique](https://github.com/139bercy/format-commande-publique).

Ces schémas sont la traduction technique de [l'arrêté du 22/12/2022 modifié relatif aux données essentielles des marchés publics](https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000048678644) et de [l'arrêté du 22/12/2022 modifié relatif aux données essentielles des contrats de concession](https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000048678628) 

Voici les caractéristiques des **marchés publics** inclues dans le schéma : 

- `id` : numéro d'identification unique du marché public (identifiant du marché public). Un numéro interne (1 caractère minimum à 16 caractères maximum) propre au système d'information de l'acheteur
- `acheteur` :
  - `id` : Numéro d'inscription SIRET de l'acheteur
- `nature` : nature du marché public (Marché, Marché de partenariat, Marché de défense ou de sécurité)
- `objet` : objet du marché public ou du lot (max. 1000 caractères)
- `technique` : technique d'achat (Accord-cadre, Concours, Système de qualification, Système d'acquisition dynamique, Catalogue électronique, Enchère électronique, Sans objet)
- `modaliteExecution` : modalité d'exécution du marché public (Tranches, Bons de commande, Marchés subséquents, Sans objet)
- `idAccordCadre` : numéro d'identification unique de l'accord-cadre auquel est rattaché le marché subséquent
- `codeCPV` : [code CPV principal](https://simap.ted.europa.eu/fr/web/simap/cpv)
- `procedure` : procédure de passation du marché public (Procédure adaptée, Appel d'offres ouvert, Appel d'offres restreint, Procédure avec 
  négociation, Marché passé sans publicité ni mise en concurrence préalable, Dialogue compétitif)
- `lieuExecution` : lieu principal d'exécution
  - `code` : identifiant du lieu principal d'exécution
  - `typeCode` : type de code du lieu principal d'exécution (Code postal, Code commune, Code arrondissement, Code canton, Code département, Code région, 
    Code pays)
- `dureeMois` : durée totale du marché public en nombre de mois (si la durée n'est pas un nombre exact de mois, il convient d'arrondir au nombre entier supérieur)
- `dateNotification` : date de la réception de la notification par le titulaire
- `considerationsSociales` : considération sociale (Clause sociale, Critère social, Marché réservé, Pas de considération sociale)
- `considerationsEnvironnementales` : considération environnementale (Clause environnementale, Critère environnemental, Pas de considération environnementale)
- `marcheInnovant` : marché comportant des travaux, services ou fournitures innovants (`true` ou `false`)
- `origineUE` : part des produits issus de l’Union européenne. Ne peut pas être inférieur à la valeur de 'origineFrance', la France faisant partie de l'Union européenne.
   Ex:1 pour 100%, 0.6 pour 60%, 0.45 pour 45% (voir aussi [Origine des produits](/#origine-des-produits))
- `origineFrance` : part de produits fabriqués en France. Ex: 1 pour 100%, 0.6 pour 60%, 0.45 pour 45% (voir aussi [Origine des produits](/#origine-des-produits))
- `ccag` : CCAG de référence (Travaux, Maitrise d'œuvre, Fournitures courantes et services, Marchés industriels, Prestations 
  intellectuelles, Techniques de l’information et de la communication, Pas de CCAG)
- `offresRecues` : nombre d'offres reçues. Comprend aussi les offres irrégulières, inacceptables, inappropriées et anormalement basses.
- `montant` : montant HT initial forfaitaire en euros ou estimé maximum en euros
- `formePrix` : forme du prix (Unitaire, Forfaitaire, Mixte)
- `typePrix` : type de prix (Définitif ferme, Définitif actualisable, Définitif révisable, Provisoire)
- `attributionAvance` : attribution d'une avance (`true` ou `false`)
- `tauxAvance` : taux de l'avance attribuée (si 'attributionAvance' est 'true', ce nombre doit être supérieur à 0. Ex: 1 pour 100%, 0.6 pour 60%, 0.45 pour 45%)
- `titulaires` : titulaire(s) du marché
  - `id` : identifiant du titulaire
  - `typeIdentifiant` : type d'identifiant du titulaire (SIRET, TVA, TAHITI, RIDET, FRWF, IREP, HORS-UE)
- `typeGroupementOperateurs` : type de groupement d’opérateurs économiques (Conjoint, Solidaire, Pas de groupement)
- `sousTraitanceDeclaree` : sous-traitance déclarée pendant la phase de passation (`true` ou `false`)
- `datePublicationDonnees` : date de publication des données essentielles du marché public 
- `actesSousTraitance` : actes de sous-traitance (voir aussi [cette section](/#fonctionnement-des-actes-spéciaux-de-sous-traitance))
  - `id` : numéro d'identification de l'acte spécial de sous-traitance (les numéros d'identification doivent être attribués en ordre croissant en suivant l'ordre des notifications)
  - `sousTraitant` : identification du sous-traitant
    - `id` : identifiant du sous-traitant
    - `typeIdentifiant` : type d'identifiant (SIRET, TVA, TAHITI, RIDET, FRWF, IREP, HORS-UE)
  - `dureeMois` : durée du contrat de sous-traitance en nombre de mois (si la durée n'est pas un nombre exact de mois, il convient d'arrondir au nombre entier supérieur)
  - `dateNotification` : date de notification de l'acte spécial de sous-traitance (date de la réception de la notification de l'acte spécial de sous-traitance par le titulaire)
  - `montant` : montant en euros HT attribué au sous-traitant (ou montant estimé maximum attribué en euros)
  - `variationPrix` : modalités de variation du prix du contrat de sous-traitance (Ferme, Actualisable, Révisable)
  - `datePublicationDonnees` : date de publication des données essentielles de l'acte spécial de sous-traitance
- `modifications` : modifications du marché public (voir aussi [cette section](/#fonctionnement-des-modifications))
  - `id` : numéro d'identification de la modification (les numéros d'identification doivent être attribués en ordre croissant en suivant l'ordre des notifications)
  - `dureeMois` : durée modifiée du marché public en nombre de mois (si la durée n'est pas un nombre exact de mois, il convient d'arrondir au nombre entier supérieur)
  - `montant` : montant en euros HT modifié du marché public
  - `titulaires` : titulaires modifiés
    - `id` : identifiant du titulaire modifié
    - `typeIdentifiant` : type d'identifiant du titulaire modifié (SIRET, TVA, TAHITI, RIDET, FRWF, IREP, HORS-UE)
  - `dateNotificationModification` : date de la notification de la modification apportée au marché public (date de la réception de la notification de la modification par le titulaire)
  - `datePublicationDonneesModification` : date de publication des données essentielles de la modification apportée au marché public
- `modificationsActesSousTraitance` : modification de sous-traitance pendant l'exécution(voir aussi [cette section](/#fonctionnement-des-actes-spéciaux-de-sous-traitance))
  - `id` : numéro d'identification de l'acte spécial de sous-traitance modifié (doit correspondre au numéro d'identifiant dans 'actesSousTraitance'>'id')
  - `dureeMois` : durée modifiée du contrat de sous-traitance en nombre de mois (si la durée n'est pas un nombre exact de mois, il convient d'arrondir au nombre entier supérieur)
  - `dateNotificationModificationSousTraitance` : date de notification de la modification de l'acte spécial de sous traitance (date de la réception de la notification de la modification de l'acte spécial de sous-traitance)
  - `montant` : montant en euros HT modifié de l'acte spécial de sous-traitance
  - `datePublicationDonnees` : date de publication des données essentielles de la modification de l'acte spécial de sous-traitance.

Voici les caractéristiques des **contrats de concession** inclues dans le schéma :

- `id` :  numéro d'identification unique du contrat de concession (identifiant du contrat de concession). Un numéro interne (1 caractère minimum à 16 caractères maximum) propre au système d'information de l'acheteur
- `autoriteConcedante` : autorité concédante
  - `id` : identification de l'autorité concédante (identifiant du Système d'Identification du Répertoire des Etablissements (SIRET))
- `nature` : nature du contrat de concession (Concession de travaux, Concession de service, Concession de service public, Délégation de service public)
- `objet` : objet du contrat de concession (max. 1000 caractères)
- `procedure` : procédure de passation (Procédure négociée ouverte, Procédure non négociée ouverte, Procédure négociée restreinte, Procédure non négociée restreinte)
- `dureeMois` : durée du contrat de concession en nombre de mois (si la durée n'est pas un nombre exact de mois, il convient d'arrondir au nombre entier supérieur)
- `dateDebutExecution` : date de début d'exécution (date de début d'exécution du contrat de concession)
- `dateSignature` : date de signature (date de signature du contrat de concession)
- `considerationsSociales` : considération sociale (Clause sociale, Critère social, Concession réservée, Pas de considération sociale)
- `considerationsEnvironnementales` : considération environnementale (Clause environnementale, Critère environnemental, Pas de considération environnementale)
- `concessionnaires` : concessionnaires
  - `id` : identifiant du concessionnaire
  - `typeIdentifiant` : type d'identifiant du concessionnaire (SIRET, TVA, TAHITI, RIDET, FRWF, IREP, HORS-UE)
- `valeurGlobale` : valeur globale HT attribuée en euros (valeur globale initiale du contrat de concession hors taxes)
- `montantSubventionPublique` : montant HT des subventions et avantages en euros 
- `datePublicationDonnees` : date de publication des données essentielles du contrat de concession
- `modifications` : modifications du contrat de concession (voir aussi [cette section](/#fonctionnement-des-modifications))
    - `id` : numéro d'identifiant de la modification (les numéros d'identification doivent être attribués en ordre croissant en suivant l'ordre des notifications)
    - `dureeMois` : durée modifiée du contrat de concession en nombre de mois (si la durée n'est pas un nombre exact de mois, il convient d'arrondir au nombre entier supérieur)
    - `valeurGlobale` : valeur globale HT modifiée en euros du contrat de concession (nouvelle valeur globale hors taxes du contrat de concession)
    - `dateSignatureModification` : date de signature de la modificationau contrat de concession
    - `datePublicationDonneesModification` : date de publication des données essentielles de la modification apportée au contrat de concession (date de la republication des données incluant la modification)
- `donneesExecution` : données d'exécution du contrat de concession (les données d'exécution du contrat de concession à une date donnée. Tous les ans, l'autorité concédante publie les données d'exécution,
jusqu'à la fin du contrat de concession. Ces données ne sont inclues qu'à partir de la première année, pas lors de la publication initiale des données qui fait suite à la notification)
  - `depensesInvestissement` : dépenses d'investissement HT en euros (les dépenses d'investissement réalisées par le concessionnaires)
  - `tarifs` : tarifs à la charge des usagers (principaux tarifs à la charge des usagers)
     - `intituleTarif` : intitulé des principaux tarifs à la charge des usagers (max. 256 caractères)
     - `tarif` : tarif HT en euros (les montants HT en euros des principaux tarifs à la charge des usagers)
  - `datePublicationDonneesExecution` : date de publication des données d'exécution (date à laquelle les données annuelles relatives à l'exécution du contrat de concession ont été publiées)


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

Si un acte spécial de sous-traitance est modifié après la notification du marché :

- ajouter la/les modification(s) dans `modificationsActesSousTraitance` avec la/les nouvelle(s) valeur(s)

#### Fonctionnement des modifications

Ce fonctionnement s'applique aux données de marchés publics et de contrats de concession.

Le producteur de données doit ajouter une modification dans `modifications` lorsqu'une modification 
du marché ou du contrat de concession a été notifiée.

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


- Version 2.0.1 (arrêté du 22 décembre 2022 modifié) :
  - JSON : https://schema.data.gouv.fr/schemas/139bercy/format-commande-publique/2.0.1/marches.json
  - XML : https://raw.githubusercontent.com/139bercy/format-commande-publique/master/marches.xsd
- Version 1.5.0 (arrêté du 22 mars 2019) :
  - JSON : https://schema.data.gouv.fr/schemas/139bercy/format-commande-publique/1.5.0/marches.json
  - XML : https://raw.githubusercontent.com/139bercy/format-commande-publique/c3d3225be363460da55fba8a47bcaa173dcd99ba/marches.xsd
- Version 1.4.0 (arrêté modificatif du 27 juillet 2018) :
  - JSON : https://schema.data.gouv.fr/schemas/139bercy/format-commande-publique/1.4.0/marches.json
  - XML : https://raw.githubusercontent.com/139bercy/format-commande-publique/7655b975a208bd9f5adb7e1f9d6fa2dd5475b919/marches.xsd




