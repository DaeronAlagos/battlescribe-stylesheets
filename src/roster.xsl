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
                <style>
                    <!-- inject:../build/style.css -->
					<!-- contents of html partials will be injected here -->
					<!-- endinject -->
                </style>
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
        <xsl:variable name="nodePoints">
            <xsl:for-each select="bs:selections/bs:selection">
                <xsl:choose>
                    <xsl:when test="contains($specialisms, @name)">
                        <xsl:for-each select="bs:selections/bs:selection/bs:costs/bs:cost">
                            <ItemCost>
                                <xsl:value-of select="@value"/>
                            </ItemCost>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <ItemCost>
                            <xsl:value-of select="bs:costs/bs:cost/@value"/>
                        </ItemCost>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="subTotal" select="exslt:node-set($nodePoints)"/>
        <div class="card">  <!-- CARD -->
            <div> <!-- NAME -->
                <div> <!-- CUSTOM NAME -->
                    <xsl:value-of select="@customName"/>
                </div>
                <div> <!-- POINTS -->
                    <xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/> Points
                </div>
            </div>
            <div> <!-- UNIT -->
                <xsl:variable name="models" select="bs:profiles/bs:profile[@typeName='Model']"></xsl:variable>
                <table>
                    <tr>
                        <th>
                            Name
                        </th>
                        <xsl:apply-templates select="$models" mode="header"/>
                    </tr>
                    <tr>
                        <td>
                            <xsl:value-of select="@name"/>
                        </td>
                        <xsl:apply-templates select="$models" mode="body"/>
                    </tr>
                </table>
            </div>
            <div> <!-- WEAPONS -->
                <xsl:variable name="weapons" select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Weapon']"/>
                <table>
                    <tr>
                        <xsl:for-each select="$weapons[1]">
                            <th>
                                <xsl:value-of select="@typeName"/>
                            </th>
                            <xsl:apply-templates mode="header"/>                    
                        </xsl:for-each>
                    </tr>
                    <xsl:for-each select="$weapons">
                        <tr>
                            <td>
                                <xsl:value-of select="@name"/>
                            </td>
                            <xsl:apply-templates mode="body"/>                    
                        </tr>
                    </xsl:for-each>
                </table>
            </div>
            <div> <!-- ABILITIES -->
                <xsl:variable name="abilities" select="bs:profiles/bs:profile[@typeName='Ability']"/>
                <table>
                    <xsl:for-each select="$abilities">
                        <tr>
                            <td>
                                <xsl:value-of select="@name"/>
                            </td>
                            <xsl:apply-templates mode="body"/>
                        </tr>
                    </xsl:for-each>
                </table>
            </div>
            <div>
                <xsl:variable name="specialism" select="bs:selections/bs:selection[contains($specialisms, @name)]"/>
                <table>
                    <tr>
                        <td>Specialism</td>
                        <td><xsl:value-of select="$specialism/@name"/></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <xsl:value-of select="$specialism/bs:selections/bs:selection/bs:profiles/bs:profile/@name"/>
                        </td>
                        <td>
                            <xsl:apply-templates select="$specialism" mode="body"/>
                            <!-- <xsl:value-of select="$specialism"/>                         -->
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="bs:characteristics/bs:characteristic" mode="header">
        <th>
            <xsl:value-of select="@name"/>
        </th>
    </xsl:template>
    <xsl:template match="bs:characteristics/bs:characteristic" mode="body">
        <td>
            <xsl:value-of select="."/>    
        </td>
    </xsl:template>

</xsl:stylesheet>