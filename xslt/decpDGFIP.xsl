<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns2="http://data.gouv.fr/marches/etalab"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs ns2"
    version="2.0">

    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:param name="filename" select="subsequence(reverse(tokenize(base-uri(), '/')), 1, 1)"></xsl:param>

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="ns2:marches">
        <xsl:for-each-group select="ns2:marche|ns2:contrat-concession" group-by="acheteur/id/text()|autoriteConcedante/id/text()">
            <xsl:variable name="acheteur" select="acheteur|autoriteConcedante"/>
            <xsl:variable name="siret" select="current-grouping-key()"/>
            <xsl:variable name="year" select="year-from-date(current-date())"/>
            <xsl:variable name="month" select="format-date(current-date(),'[M01]')"/>
            <xsl:variable name="day" select="day-from-date(current-date())"/>
            <xsl:variable name="id" select="replace(id/text(),'[/\\.\?!\*\$&amp;]','_')"/>
            <xsl:result-document method="xml" href="../exemples/xml/{$siret}/{$year}/{$month}/{$day}/{$siret}_{$year}-{$month}-{$day}.xml">
                <marches xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="https://raw.githubusercontent.com/etalab/format-commande-publique/dgfip/sch%C3%A9mas/xml/paquet.xsd">
                    <xsl:for-each select="current-group()">
                        <xsl:apply-templates select="."/>
                    </xsl:for-each>
                </marches>
            </xsl:result-document>
            <xsl:result-document method="text" href="../exemples/xml/sirets/{$year}/{$month}/{$day}/{$filename}/{$siret}">
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
    
    <xsl:template match="(ns2:marche|ns2:contrat-concession)/id">
        <ui><xsl:value-of select="text()"/></ui>
        <uid><xsl:value-of select="concat(../acheteur/id/text(),./text())"/></uid>
    </xsl:template>

    <xsl:template match="dateTransmissionDonneesEtalab"/>
    <xsl:template match="urlProfilAcheteur"/>

</xsl:stylesheet>
