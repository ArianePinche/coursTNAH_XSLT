<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="TEI">
        <xsl:element name="TEI">
            <xsl:copy-of select="teiHeader"/>
            <xsl:element name="text">
                <xsl:attribute name="n">
                    <xsl:value-of select="text/@n"/>
                </xsl:attribute>
                <xsl:apply-templates select="text"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="body">
       <xsl:element name="body">
           <xsl:attribute name="n">Play</xsl:attribute>
           <xsl:apply-templates/>
       </xsl:element>
    </xsl:template>
    <xsl:template match="body/div">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="div/div">
        <xsl:element name="div">
            <xsl:attribute name="type">act</xsl:attribute>
            <xsl:attribute name="n">
                <xsl:number count="div" level="single" format="1"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="pb|milestone"/>
    <xsl:template match="sp|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
<!--
    <xsl:template match="speaker">
        <xsl:choose>
            <xsl:when test="./text()='Med.'">
                <xsl:copy>Medea</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Ias.'">
                <xsl:copy>Iason</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Nvtr.'">
                <xsl:copy>Nutrix</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Nvnt.'">
                <xsl:copy>Nuntius</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Chor.'">
                <xsl:copy>Chorus</xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:value-of select="."/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
  
 -->
    <!--
    <xsl:template match="speaker">
        <xsl:variable name="ref">
            <xsl:value-of select="parent::sp/replace(@who, '#', '')"/>
        </xsl:variable>
        <xsl:copy>
            <xsl:value-of select="ancestor::TEI//listPerson/person[@xml:id=$ref]/persName/text()"/>
        </xsl:copy>
    </xsl:template>
    -->
 <!--Méthode n°3 - pour les références multiples -->
    <xsl:template match="speaker">     
        <xsl:variable name="refList" as="item()*"> <!-- permet de stocker une variable sous forme de liste -->
            <xsl:variable name="ref">
                <xsl:value-of select="parent::sp/replace(@who, '#', '')"/> <!-- recupère les refs de sp -->
            </xsl:variable>  
            <xsl:for-each select="tokenize($ref, ' ')"> <!-- création d'un élément unique pour chaque ref -->
                <xsl:value-of select="."/>
            </xsl:for-each>
        </xsl:variable>  
            <xsl:copy>
                <xsl:for-each select="ancestor::TEI/teiHeader//person[@xml:id=$refList]"> 
                    <!-- Pour chacun des éléments person qui possède un xml-id identique à une des valeurs stockées dans refList-->
               <xsl:value-of select="persName"/> <!-- donner les valeurs de persName -->           
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
                </xsl:for-each>
            </xsl:copy>        
    </xsl:template>

    <xsl:template match="l">
        <xsl:element name="l">
            <xsl:attribute name="n">
                <xsl:number count="l" level="any" format="1"/>
            </xsl:attribute>
           <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="name[@type='person']"> 
        <xsl:element name="persName">
           <xsl:if test="./@ref">
               <xsl:attribute name="ref">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
           </xsl:if>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>