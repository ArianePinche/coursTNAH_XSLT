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
            <div type="cantilene">
                <xsl:variable name="titre">
                    <xsl:value-of select="upper-case(.//head)"/>
                </xsl:variable>
                <head><xsl:value-of select="$titre"/></head>
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
    <xsl:template match="l" mode="#all">
        <l>
            <xsl:apply-templates mode="#current"/>
        </l>
    </xsl:template>
    <!--
    <xsl:template match="l" mode="orig">
        <l>
            <xsl:value-of select=".//orig/text() | .//abbr/text()"/>
        </l>
    </xsl:template>
    <xsl:template match="l" mode="reg">
        <l>
            <xsl:value-of select=".//reg/text() | .//expan/text() | .//ex/text()"/>
        </l>
    </xsl:template>
    -->
    <xsl:template match="choice" mode="orig">
        <xsl:value-of select="orig/text() | abbr/text()"/>
    </xsl:template>
    <xsl:template match="choice" mode="reg">
        <xsl:value-of select="reg/text() | expan/text() | ex/text()"/>
    </xsl:template>
</xsl:stylesheet>
