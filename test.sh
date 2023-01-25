#!/bin/bash

# Ce script sert à tester la validité des fichiers d'exemples par rapport aux schémas. Il teste les exemples JSON et XML.

root=`pwd`

function testExemplesJson {
    prefixe=$1
    schema=marches.json
    for exemple in `ls $prefixe*`
    do
        echo "$exemple ($schema)"
        ajv --spec=draft7 -s $root/$schema -d $exemple > testlog
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
        xmllint --noout --schema $root/test/XMLSchema.xsd $xsd 2> testlog
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
    schema=marches.xsd
    for exemple in `ls $prefixe*`
    do
        echo "$exemple ($schema)"
        java -jar $root/test/xsd11-validator.jar -sf $root/$schema -if $exemple 2> testlog
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

echo "## Test des exemples JSON"
echo ""

cd $root/exemples/json

testExemplesJson "mar"
testExemplesJson "cc"
testExemplesJson "paquet"

echo "## Validation des schémas XML"
echo ""

cd $root
testSchémasXml

echo "## Test des exemples XML"
echo ""

cd $root/exemples/xml

testExemplesXml "mar"
testExemplesXml "cc"
testExemplesXml "paquet"

