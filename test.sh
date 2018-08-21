#/bin/bash

# Ce script sert à tester la validité des fichiers d'exemples par rapport aux schémas. Il teste exemples JSON.

function testExempleJson {
    prefixe=$1
    schema=$2
    for exemple in `ls $prefixe*`
    do
        echo "  $exemple ($schema)"
        ajv -s ../../schémas/json/$schema -d $exemple > testlog
        if [ `head -n 1 testlog | grep invalid` ]
        then
            cat testlog
        else
            echo "> OK"
        fi
        echo ""
    done
}

echo "Test des exemples JSON"
echo ""

cd exemples/json

testExempleJson "mar" "marchés.json"
testExempleJson "cc" "contrats-concessions.json"
testExempleJson "mds" "marchés-défense-sécurité.json"


rm testlog
