<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs xd"
    version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Aug 29, 2014</xd:p>
            <xd:p><xd:b>Publisher:</xd:b> Freischütz Digital</xd:p>
            <xd:p><xd:b>Author:</xd:b> Benjamin W. Bohl</xd:p>
            <xd:p>This XSLT extracts a defined scene (tei:div) from a TEI file, by a supplied @xml:id value.</xd:p>
            <xd:p><xd:b>@param sceneID:</xd:b> the parameter for the externally supplied @xml:id value</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output
        method="xml"
        version="1.0"
        encoding="UTF-8"
        omit-xml-declaration="yes"
        indent="no"
        media-type="text/xml"/>
    
    <xd:doc scope="component">
        <xd:desc>
            <xd:p><xd:b>@param sceneID:</xd:b> the parameter for the externally supplied @xml:id value</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="sceneID"/>
    
    <xd:doc scope="component">
        <xd:desc>
            <xd:p>Override for default root template to return deep copy of the designated tei:div with the supplied @xml:id</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:copy-of select="//tei:div[@xml:id = $sceneID]"/>
    </xsl:template>
    
</xsl:stylesheet>