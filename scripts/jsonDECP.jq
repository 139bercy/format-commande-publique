def walk(f):
  . as $in
  | if type == "object" then
      reduce keys_unsorted[] as $key
        ( {}; . + { ($key):  ($in[$key] | walk(f)) } ) | f
  elif type == "array" then map( walk(f) ) | f
  else f
  end;
def safeToNumber(value):
    if (value | type) == "string" then
    value | tonumber
    else empty
    end;
def processModificationMarche(modification):
    modification | {
        objetModification,
        dureeMois: safeToNumber(.dureeMois),
        datePublicationDonneesModification,
        dateNotificationModification,
        montant: safeToNumber(.montant),
        titulaires :
        .titulaires.titulaire | (if type == "array" then
            map(.)
            else [.]
            end)
    };
def processModificationConcession(modification):
    modification | {
        objetModification,
        dureeMois: safeToNumber(.dureeMois),
        datePublicationDonneesModification,
        dateNotificationModification,
        valeurGlobale: safeToNumber(.valeurGlobale)
    };
def processMarche(marche):
    marche |{
    id,
    uid,
    acheteur,
    _type: "Marché",
    nature,
    objet,
    codeCPV,
    procedure,
    lieuExecution,
    "dureeMois": .dureeMois | tonumber,
    dateNotification,
    datePublicationDonnees,
    "montant": .montant | tonumber,
    formePrix,
    titulaires:
    .titulaires.titulaire | (if type == "array" then
        map(.)
        else [.]
        end),
    modifications:
    .modifications?.modification | (if type == "array" then
        map(processModificationMarche(.))
        elif type == "object" then [processModificationMarche(.)]
        else []
        end)
    };
def processTarif(tarif):
    tarif | {
        intituleTarif,
        tarif: safeToNumber(.tarif)
    };
def processDonneesExecution(donneesExecution):
    donneesExecution | {
        datePublicationDonneesExecution,
        depensesInvestissement: safeToNumber(.depensesInvestissement),
        tarifs:
        .tarifs.tarif | (if type == "array" then
            map(processTarif(.))
            elif type == "object" then [processTarif(.)]
            else []
            end),
    };
def processContratConcession(concession):
    concession | {
    id,
    uid,
    autoriteConcedante,
    _type: "Contrat de concession",
    nature,
    procedure,
    lieuExecution,
    "dureeMois": .dureeMois | tonumber,
    dateSignature,
    datePublicationDonnees,
    dateDebutExecution,
    valeurGlobale,
    montantSubventionPublique: .montantSubventionPublique | tonumber,
    donneesExecution:
    .donneesExecution?.donneesAnnuelles | (if type == "array" then
        map(processDonneesExecution(.))
        elif type == "object" then [processDonneesExecution(.)]
        else []
        end),
    concessionnaires:
    .concessionnaires.concessionnaire | (if type == "array" then
        map(.)
        else [.]
        end),
    modifications:
    .modifications?.modification | (if type == "array" then
        map(processModificationConcession(.))
        elif type == "object" then [processModificationConcession(.)]
        else []
        end)

};

    .marches.marche as $marches |
    .marches."contrat-concession" as $concessions |

    {
    "$schema": "https://raw.githubusercontent.com/etalab/format-commande-publique/master/sch%C3%A9mas/json/paquet.json",
    marches :
    ($marches |
    (if type == "array" then
        map(processMarche(.))
    else
        [processMarche(.)]
    end)
    +
    ($concessions |
    (if type == "array" then
        map(processContratConcession(.))
    else
        [processContratConcession(.)]
    end)))
}
# Added to remove all null properties from the resulting tree
| walk(
    if type == "object" then
        with_entries(select( .value != null and .value != {} and .value != [] or .key == "modifications" or .key == "donneesExecution"))
    elif type == "array" then
        map(select( . != null and . != {} ))
    else
        .
    end
)
