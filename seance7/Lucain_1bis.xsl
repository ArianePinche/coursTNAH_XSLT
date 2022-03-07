<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>
   
    <xsl:template match="/">
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), '.xml', '')"/>
            <!-- récupération du nom du fichier courant -->
        </xsl:variable>
       <xsl:result-document href="{concat($witfile, '.tex')}"> 
           ﻿﻿\documentclass[12pt, a4paper]{report}
           ﻿\usepackage[utf8x]{inputenc}
           \usepackage[T1]{fontenc}
           \usepackage{lmodern}
           \usepackage{graphicx}
           \usepackage[french]{babel}
           \usepackage{reledmac}
           
           \setstanzaindents{0,1}
           \setcounter{stanzaindentsrepetition}{1}        
           
           \Xarrangement[A]{paragraph}
           \Xparafootsep{$\parallel$~}
           
           \begin{document}
           
           \firstlinenum{5}
           \linenumincrement{5}
           \linenummargin{right}
           \setline{<xsl:value-of select=".//lg/l[1]/@n"/>}
           
           \beginnumbering
           \stanza 
        <xsl:apply-templates select=".//lg"/>
        \endnumbering
        \end{document}
       </xsl:result-document>
    </xsl:template>
    <xsl:template match="lg">
        <xsl:for-each select="l">
            <xsl:value-of select="./text() | .//lem/text()"/>
      <xsl:choose>
            <xsl:when test="position() = last()"><xsl:text> \&amp; </xsl:text></xsl:when>
            <xsl:otherwise><xsl:text> &amp; </xsl:text></xsl:otherwise>
        </xsl:choose>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>