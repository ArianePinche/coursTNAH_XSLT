﻿<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template match="TEI">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Exercice de structuration HTML</title>
            </head>
            <body>
                <h1>
                    <xsl:apply-templates select="teiHeader"/>
                </h1>
                 <ul>
                <xsl:apply-templates select="descendant::body"/>
                  </ul> 
            </body>
        </html>
    </xsl:template>

    <xsl:template match="teiHeader">
            <!-- <xsl:variable name="titre" select="descendant::title"/>
             <xsl:variable name="auteur" select="descendant::author"/> -->
            <xsl:value-of
                select="concat(descendant::title/text(), ' ', 'écrit par', ' ', descendant::author/text())"/>
            <!-- <xsl:value-of select="concat($titre, ' écrit par ', $auteur)"/> -->
  

    </xsl:template>

    <xsl:template match="lg">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>

    <xsl:template match="l">
        <xsl:element name="li">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
