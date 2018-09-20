<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs ns2" 
    version="1.0">
    
    <xsl:output encoding="UTF-8" method="xml"/>
    
    <xsl:template match="/">
            <xsl:apply-templates/>
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
    
    <xsl:template match="dateTransmissionDonneesEtalab"/>
    <xsl:template match="urlProfilAcheteur"/>
   
</xsl:stylesheet>