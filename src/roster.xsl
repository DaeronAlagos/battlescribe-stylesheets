<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:bs="http://www.battlescribe.net/schema/rosterSchema" 
                xmlns:exslt="http://exslt.org/common" 
                extension-element-prefixes="exslt">

    <xsl:variable name="specialisms" select="'Leader|Combat|Zealot|Demolitions|Comms|Veteran|Scout|Heavy|Medic|Sniper|Strength|Strategist'"/>
    <xsl:variable name="advances" select="'1. Fleet|2. Lucky|3. Courageous|4. Skilled|5. Lethal|6. Die-hard'"/>

    <xsl:template match="bs:selection">
        <div>
            <xsl:value-of select="@name"/>
        </div>
    </xsl:template>

    <xsl:template match="bs:selections">
        <xsl:apply-templates select="bs:selection[@type='model']"/>
    </xsl:template>

    <xsl:template match="bs:forces">
        <xsl:apply-templates select="bs:force"/>
    </xsl:template>

    <xsl:template match="/bs:roster">
        <html>
            <head></head>
            <body>
                <xsl:value-of select="@name"/>
                <xsl:apply-templates select="bs:forces"/>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>