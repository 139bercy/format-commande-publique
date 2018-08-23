#/bin/bash

# Ce script sert à tester la validité des fichiers d'exemples par rapport aux schémas. Il teste les exemples JSON et XML.

base=`pwd`



function testExemplesJson {
    prefixe=$1
    schema=$2
    for exemple in `ls $prefixe*`
    do
        echo "$exemple ($schema)"
        ajv -s ../../schémas/json/$schema -d $exemple > testlog
        if [ `head -n 1 testlog | grep invalid` ]
        then
            cat testlog
        else
            echo "> OK"
        fi
        echo ""
        rm testlog
    done
}

function testSchémasXml {
    for xsd in `ls *.xsd`
    do
        echo "$xsd"
        xmllint --noout --schema $base/test/XMLSchema.xsd $xsd 2> testlog
        if [[ $(< testlog) == "$xsd validates" ]]
        then
            echo "> OK"
        else
            cat testlog
        fi
        echo ""
        rm testlog
    done
}

function testExemplesXml {
    prefixe=$1
    schema=$2
    for exemple in `ls $prefixe*`
    do
        echo "$exemple ($schema)"
        java -jar $base/test/xsd11-validator.jar -sf ../../schémas/xml/$schema -if $exemple 2> testlog
        if [ -s testlog ]
        then
            cat testlog
        else
            echo "> OK"
        fi
        echo ""
        rm testlog
    done
}

if [ -d $base/schémas/json ]
then
    echo "Test des exemples JSON"
    echo ""

    cd $base/exemples/json

    testExemplesJson "mar" "marchés.json"
    testExemplesJson "cc" "contrats-concessions.json"
    testExemplesJson "mds" "marchés-défense-sécurité.json"
else
    echo "Pas de schémas JSON à valider."
fi

if [ -d $base/schémas/xml ]
then
    echo "Validation des schémas XML"
    echo ""

    cd $base/schémas/xml

    testSchémasXml

    echo "Test des exemples XML"
    echo ""

    cd $base/exemples/xml

    testExemplesXml "mar" "marchés.xsd"
    testExemplesXml "cc" "contrats-concessions.xsd"
    testExemplesXml "mds" "marchés-défense-sécurité.xsd"
else
    echo "Pas de schémas XML à valider."
fi
