<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:bs="http://www.battlescribe.net/schema/rosterSchema" 
                xmlns:exslt="http://exslt.org/common" 
                extension-element-prefixes="exslt">

    <xsl:variable name="specialisms" select="'Leader|Combat|Zealot|Demolitions|Comms|Veteran|Scout|Heavy|Medic|Sniper|Strength|Strategist'"/>
    <xsl:variable name="advances" select="'1. Fleet|2. Lucky|3. Courageous|4. Skilled|5. Lethal|6. Die-hard'"/>

    <xsl:template match="bs:roster">
        <html>
            <head>
                <meta></meta>
            </head>
            <body>
                <div>
                    <xsl:value-of select="@name"/>
                </div>
                <xsl:apply-templates select="bs:forces/bs:force"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="bs:forces/bs:force">
        <xsl:apply-templates select="bs:selections/bs:selection[@type='model']"/>
    </xsl:template>

    <xsl:template match="bs:selections/bs:selection[@type='model']">
        <div>  <!-- CARD -->
            <div> <!-- NAME -->
                <div> <!-- CUSTOM NAME -->
                    <xsl:value-of select="@customName"/>
                </div>
                <div> <!-- POINTS -->

                </div>
            </div>
            <div> <!-- UNIT -->
                <xsl:call-template name="characteristics"/>
            </div>
            <div> <!-- WEAPONS -->
                <table>
                <tr>
                    <th>Weapon</th>
                    <th>Range</th>
                    <th>Type</th>
                    <th>S</th>
                    <th>AP</th>
                    <th>D</th>
                    <th>Abilities</th>
                </tr>
                    <xsl:apply-templates select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Weapon']"/>
                </table>
            </div>
            <!-- <div>
                <xsl:apply-templates select="bs:selections/bs:selection"/>
            </div> -->
            <div> <!-- ABILITIES -->
                <xsl:apply-templates select="bs:selections/bs:selection[contains($specialisms, @name)]"/>
                <xsl:apply-templates select="bs:profiles/bs:profile[@typeName='Ability']"/>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="bs:selections/bs:selection/bs:selections/bs:selection">
        <xsl:if test="contains($specialisms, @name)">
            <table>
            <tr>
                <td>Specialism: </td>
                <td><xsl:value-of select="@name"/></td>
            </tr>
            </table>
            <xsl:apply-templates select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Ability']"/>
        </xsl:if>
    </xsl:template>

    <xsl:template name="characteristics">
        <table>
            <tr>
                <th>Name</th>
                <th>M</th>
                <th>WS</th>
                <th>BS</th>
                <th>S</th>
                <th>T</th>
                <th>W</th>
                <th>A</th>
                <th>Ld</th>
                <th>Sv</th>
            </tr>
            <tr>
                <td><xsl:value-of select="@name"/></td>
                <xsl:apply-templates select="bs:profiles/bs:profile[@typeName='Model']"/>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="bs:characteristics/bs:characteristic">
        <td>
            <xsl:value-of select="current()"/>
        </td>
    </xsl:template>

    <xsl:template match="bs:profiles/bs:profile[@typeName='Model']">
        <xsl:apply-templates select="bs:characteristics/bs:characteristic"/>
    </xsl:template>

    <xsl:template match="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Weapon']">
        <tr>
            <td>
                <xsl:value-of select="@name"/>
            </td>
            <xsl:apply-templates select="bs:characteristics/bs:characteristic"/>
        </tr>
    </xsl:template>

    <xsl:template match="bs:profiles/bs:profile[@typeName='Ability']">
        <table>
            <tr>
                <td><xsl:value-of select="@name"/></td>
                <td><xsl:value-of select="bs:characteristics/bs:characteristic[@name='Description']/."></xsl:value-of></td>
            </tr>
        </table>
    </xsl:template>

</xsl:stylesheet>