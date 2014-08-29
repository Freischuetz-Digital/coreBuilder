<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="xs xd"
  version="2.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Aug 29, 2014</xd:p>
      <xd:p><xd:b>Author:</xd:b> bwb</xd:p>
      <xd:p></xd:p>
    </xd:desc>
  </xd:doc>
  
  <xsl:output indent="yes" omit-xml-declaration="yes"/>
  
  <xsl:template match="/">
    <xsl:text>[</xsl:text>
    <xsl:for-each select="collection('../libretti/?select=*.xml')">
      <xsl:text>{"source":</xsl:text>
        <xsl:text>"</xsl:text>
          <xsl:value-of select="tokenize(document-uri(.),'/')[last()]"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"scenes":[</xsl:text>
          <xsl:for-each select="//tei:div[@type='scene']">
            <xsl:text>{</xsl:text>
              <xsl:text>"n":"</xsl:text><xsl:value-of select="@n"/>
              <xsl:text>","act":"</xsl:text><xsl:value-of select="parent::tei:div[@type='act']/@n"/>
              <xsl:text>","id":"</xsl:text><xsl:value-of select="@xml:id"/>
            <xsl:text>"}</xsl:text>
            <xsl:if test="index-of(//tei:div[@type='scene'],.) != count(//tei:div[@type='scene'])">,</xsl:if>
          </xsl:for-each>
        <xsl:text>]</xsl:text>
      <xsl:text>}</xsl:text>
      <xsl:if test="index-of(collection('../libretti/?select=*.xml'),.) != count(collection('../libretti/?select=*.xml'))">,</xsl:if>
      </xsl:for-each>
    <xsl:text>]</xsl:text>
  </xsl:template>
  
</xsl:stylesheet>