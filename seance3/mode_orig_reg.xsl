<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="TEI">
        <xsl:copy>
            <xsl:copy-of select="teiHeader"/>
            <text>
                <xsl:apply-templates select="text"/>
            </text>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="body">
        <xsl:copy>
            <xsl:apply-templates select="head"/>
            <div type="cantilene">
                <xsl:copy-of select="pb"/>
                <lg type="orig">
                    <xsl:apply-templates select="descendant::l" mode="orig"/>
                </lg>
                <lg type="reg">
                    <xsl:apply-templates select="descendant::l" mode="reg"/>
                </lg>
            </div>
        </xsl:copy>
    </xsl:template>
    
    <xsl:variable name="titre">
        <xsl:value-of select="upper-case(descendant::body/head)"/>
    </xsl:variable>
    

    <xsl:template match="head">
        <xsl:copy>
            <xsl:value-of select="$titre"/>
        </xsl:copy>
    </xsl:template>
    

    <!--
    <xsl:template match="l" mode="orig">
        <xsl:copy>
        <xsl:value-of select="./choice/orig/text() | ./choice/abbr/text() | text()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="l" mode="reg">
        <xsl:copy>
            <xsl:value-of select="./choice/reg/text() | ./choice/expan/text() | .//expan/ex/text() | text()"/>
        </xsl:copy>
    </xsl:template>
    -->




    <xsl:template match="l" mode="#all">
        <xsl:element name="l">
            <xsl:attribute name="n">
                <xsl:number count="l" format="1" level="any"/>
            </xsl:attribute>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>


    <xsl:template match="choice" mode="orig">
        <xsl:value-of select="orig/text() | abbr/text()"/>
    </xsl:template>
    <xsl:template match="choice" mode="reg">
        <xsl:value-of select="reg/text() | expan/text() | ex/text()"/>
    </xsl:template>

</xsl:stylesheet>
