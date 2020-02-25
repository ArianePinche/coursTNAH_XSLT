<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    <!-- Attention une sortie HTML => exclusion du préfixe tei des résultats -->

    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/> <!-- pour éviter les espaces non voulus -->
    
    <!-- configurer les sorties dans les règles XSL -->
    
    <xsl:template match="/">
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), '.xml', '')"/>
            <!-- récupération du nom et du chemin du fichier courant -->
        </xsl:variable>
 
        <xsl:variable name="pathAllo">
            <xsl:value-of select="concat($witfile,'allograph','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathNorm">
            <xsl:value-of select="concat($witfile,'norm','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathIndex">
            <xsl:value-of select="concat($witfile,'index','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathAccueil">
            <xsl:value-of select="concat($witfile, 'accueil','.html')"/>
        </xsl:variable>
        <xsl:result-document href="{$pathAccueil}"
            method="html" indent="yes">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title"/>
                    </title>
                </head>
                <body>
                    <h1><xsl:value-of select="//body/head"/></h1>
                    <span>
                        <a href="{//pb/@facs}">[lien vers le manuscrit]</a>
                    </span>
                    <ul>
                        <li><a href="{$pathIndex}">Index des noms de personnages</a></li>
                        <li><a href="{$pathAllo}">Transcription allographétique</a></li>
                        <li><a href="{$pathNorm}">Transcription normalisée</a></li>
                    </ul>
                </body>
            </html>
        </xsl:result-document>
        <xsl:result-document href="{$pathNorm}"
            method="html" indent="yes">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title"/>
                    </title>
                </head>
                <body>
                    <h1><xsl:value-of select="//body/head"/></h1>
                    <div>
                        <a href="{//pb/@facs}">lien vers le manuscrit</a>
                    </div>
                    <div>
                        <a href="{$pathAccueil}">Retour accueil</a>
                    </div>
                    
                        <h2>Transcription normalisée</h2>
                        <div>
                            <ul><xsl:apply-templates select="//text//div" mode="reg"/></ul>
                        </div>
                </body>
            </html>
        </xsl:result-document>
        <xsl:result-document href="{$pathAllo}"
            method="html" indent="yes">       
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title"/>
                    </title>
                </head>
                <body>
                    <h1><xsl:value-of select="//body/head"/></h1>
                    <div>
                        <a href="{//pb/@facs}">lien vers le manuscrit</a>
                    </div>
                    <div>
                        <a href="{$pathAccueil}">Retour accueil</a>
                    </div>
                        <h2>Transcription facsimilaire</h2>
                        <div>
                            <ul>
                                <xsl:apply-templates select="//text//div" mode="orig"/>
                            </ul>
                        </div>
                </body>
            </html>
        </xsl:result-document>
        <xsl:result-document href="{$pathIndex}"
            method="html" indent="yes">          
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title"/>
                    </title>
                </head>
                <body>
                    <h1><xsl:value-of select="//body/head"/></h1>
                    <span>
                        <a href="{$pathAccueil}">Retour accueil</a>
                    </span>
                    <h2>Index des noms propres</h2>
                    <div>
                        <ul><xsl:call-template name="index"/></ul>
                    </div>     
                </body>
            </html>
        </xsl:result-document>     
    </xsl:template>
    
    
    
    <!-- Règles de présentation du texte -->
    
    <xsl:template match="l" mode="#all">
        <xsl:element name="li">
            <xsl:attribute name="n">
                <xsl:number count="." format="1"/>
            </xsl:attribute>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="choice" mode="orig">
        <xsl:value-of select=".//orig/text() |
            .//abbr/text()"/>
    </xsl:template>
    
    <xsl:template match="choice" mode="reg">
        <xsl:value-of select=".//reg/text() |
            .//expan//text()"/>
    </xsl:template>
    
    
    <!-- règle pour l'index -->
    <xsl:template name="index">
        <xsl:for-each select="//listPerson//persName">
            <li>
            <xsl:value-of select="."/>
             <xsl:variable name="idPerson">
                 <xsl:value-of select="parent::person/@xml:id"/>
             </xsl:variable>
            <xsl:text> : </xsl:text>
           <xsl:for-each select="ancestor::TEI//body//persName[replace(@ref, '#','')=$idPerson]">
               <xsl:value-of select="text() |
                   .//reg/text() |
                   .//expan//text()"/>
               <xsl:text> (v.</xsl:text>
               <xsl:value-of select="count(parent::l/preceding-sibling::l) + 1"/>
               <xsl:text>)</xsl:text>
               <xsl:if test="position()!= last()">, </xsl:if>
               <xsl:if test="position() = last()">.</xsl:if>
           </xsl:for-each>
            </li>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>
