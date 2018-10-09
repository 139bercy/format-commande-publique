<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns2="http://data.gouv.fr/marches/etalab"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs ns2"
    version="2.0">

    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:param name="nomfichier" select="subsequence(reverse(tokenize(base-uri(), '/')), 1, 1)"></xsl:param>
    <xsl:param name="racine"/>

    <xsl:template match="/">
        <xsl:message select="$racine"></xsl:message>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="*[local-name()='marches']">
        <xsl:for-each-group select="*[local-name()='marche']|*[local-name()='contrat-concession']" group-by="acheteur/id/text()|autoriteConcedante/id/text()">
            <xsl:variable name="urlProfilAcheteur" select="(acheteur|autoriteConcedante)/urlProfilAcheteur"/>
            <xsl:variable name="siret" select="current-grouping-key()"/>
            <xsl:variable name="year" select="year-from-date(current-date())"/>
            <xsl:variable name="month" select="format-date(current-date(),'[M01]')"/>
            <xsl:variable name="day" select="format-date(current-date(),'[D01]')"/>
            <xsl:variable name="id" select="replace(id/text(),'[/\\.\?!\*\$&amp;]','_')"/>
            <xsl:result-document method="xml" href="{$racine}/sortieXML/{$siret}/DECP-{$siret}-{$year}-{$month}-{$day}__{$nomfichier}.xml">
                <marches xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="https://raw.githubusercontent.com/etalab/format-commande-publique/dgfip/sch%C3%A9mas/xml/paquet.xsd">
                    <xsl:for-each select="current-group()">
                        <xsl:apply-templates select="."/>
                    </xsl:for-each>
                </marches>
            </xsl:result-document>
            <xsl:result-document method="text" href="{$racine}/sirets/{$siret}">
                <xsl:value-of select="concat('&quot;',$siret,'&quot;,&quot;',$urlProfilAcheteur,'&quot;')"/>
            </xsl:result-document>
        </xsl:for-each-group>
    </xsl:template>

    <xsl:template match="*">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="dateSignatureModification">
        <dateNotificationModification>
            <xsl:apply-templates/>
        </dateNotificationModification>
    </xsl:template>

    <xsl:template match="(*[local-name()='marche']|*[local-name()='contrat-concession'])/id">
        <id><xsl:value-of select="text()"/></id>
        <uid><xsl:value-of select="concat(../acheteur/id/text(),./text())"/></uid>
    </xsl:template>

    <xsl:template match="dateTransmissionDonneesEtalab"/>
    <xsl:template match="urlProfilAcheteur"/>

</xsl:stylesheet>
