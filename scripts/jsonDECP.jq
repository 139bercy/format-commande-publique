def walk(f):
  . as $in
  | if type == "object" then
      reduce keys_unsorted[] as $key
        ( {}; . + { ($key):  ($in[$key] | walk(f)) } ) | f
  elif type == "array" then map( walk(f) ) | f
  else f
  end;
def processModification(modification):
    modification | {
        objetModification,
        dureeMois,
        datePublicationDonneesModification,
        dateNotificationModification,
        montant,
        titulaires :
        .titulaires.titulaire | (if type == "array" then
            map(.)
            else [.]
            end)
    }
    ;
def processMarche(marche):
    marche |{
    id,
    uid,
    acheteur,
    "_type": "Marché",
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
        map(processModification(.))
        elif type == "object" then [processModification(.)]
        else []
        end)
    };

    {
    "$schema": "https://raw.githubusercontent.com/etalab/format-commande-publique/master/sch%C3%A9mas/json/paquet.json",
    marches :
    .marches.marche | (if type == "array" then
        map(
        processMarche(.)
        )
        else processMarche(.)
        end)
}
# Added to remove all null properties from the resulting tree
| walk(
    if type == "object" then
        with_entries(select( .value != null and .value != {} and .value != [] or .key == "modifications" ))
    elif type == "array" then
        map(select( . != null and . != {} ))
    else
        .
    end
)
