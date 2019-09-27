<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:bs="http://www.battlescribe.net/schema/rosterSchema" 
                xmlns:exslt="http://exslt.org/common" 
                extension-element-prefixes="exslt">
    <xsl:output method="html" indent="yes"/>

    <xsl:variable name="specialisms" select="'Leader|Combat|Zealot|Demolitions|Comms|Veteran|Scout|Heavy|Medic|Sniper|Strength|Strategist'"/>
    <xsl:variable name="advances" select="'1. Fleet|2. Lucky|3. Courageous|4. Skilled|5. Lethal|6. Die-hard'"/>

    <xsl:template match="bs:roster">
        <html>
            <head>
                <style>
                    <!-- inject:../build/style.css -->
					th {
  background-color: red;
  padding: 2px; }

#page-heading {
  font-size: 3em;
  text-align: center;
  text-transform: uppercase; }

table.roster {
  width: 100%;
  background-color: #efefef; }
  table.roster th {
    width: 14.28571%;
    font-size: 0.9em; }
  table.roster td {
    background-color: white;
    text-align: center;
    font-size: 0.8em; }

.card {
  width: 11.4cm;
  height: 7.4cm;
  background-color: #efefef;
  border-radius: 0.4em;
  padding: 0.1cm;
  font-size: 0.7em;
  border: 0.02cm solid #bbbbbb; }
  .card .header > div {
    display: inline-block;
    margin: 0 0.1cm; }
  .card .header > div:last-child {
    float: right; }
  .card table {
    width: 11.4cm;
    font-size: 1em;
    text-align: center; }
  .card th:first-child {
    text-align: left;
    min-width: 2cm;
    padding-left: 0.1cm; }
  .card td {
    background-color: white;
    padding: 0.05cm; }
    .card td:first-child {
      text-align: left;
      min-width: 2cm;
      width: 2cm;
      padding-left: 0.1cm; }

.unit th:not(:first-child), .unit td:not(:first-child) {
  width: 0.93cm; }

.weapons th:not(:first-child):not(:last-child), .weapons td:not(:first-child):not(:last-child) {
  width: 1.26cm; }

.weapons th:last-child, .weapons td:last-child {
  min-width: 3cm; }

@media screen {
  #cards {
    display: flex;
    flex-wrap: wrap; }
    #cards .card {
      margin: 0.1cm; } }

@media print {
  #roster {
    page-break-after: always; }
  .card {
    float: left;
    page-break-inside: avoid; } }

					<!-- endinject -->
                </style>
            </head>
            <body>
                <xsl:apply-templates select="bs:forces/bs:force"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="bs:forces/bs:force">
        <xsl:apply-templates select="bs:selections/bs:selection[@name='List Configuration']"/>
        <section id="cards">
            <xsl:apply-templates select="bs:selections/bs:selection[@type='model']"/>
        </section>
    </xsl:template>

    <!-- inject:roster.xsl -->
    <xsl:template match="bs:selections/bs:selection/bs:selections/bs:selection">
    <xsl:if test="contains(@name, 'Command Roster')">
        <section>
            <div id="page-heading">command roster</div>
            <hr/>
        </section>
        <section id="roster">
            <table class="roster">
                <tr>
                    <th>Name</th>
                    <th>Model Type</th>
                    <th>Wargear</th>
                    <th>Exp</th>
                    <th>Specialism/Abilities</th>
                    <th>Demeanour</th>
                    <th>Pts</th>
                </tr>
                <xsl:variable name="units" select="../../../.."/>
                <xsl:for-each select="$units/bs:selections/bs:selection[@type='model']">
                    <xsl:variable name="rosterPoints">
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
                    <xsl:variable name="subTotal" select="exslt:node-set($rosterPoints)"/>
                    <tr>
                        <td></td>
                        <td>
                            <xsl:value-of select="@name"/>
                        </td>
                        <td>
                            <xsl:for-each select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Weapon']">
                                <xsl:value-of select="@name"/>, 
                            </xsl:for-each>
                            <xsl:for-each select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Wargear']">
                                <xsl:value-of select="@name"/>, 
                            </xsl:for-each>
                        </td>
                        <td></td>
                        <td>
                            <xsl:for-each select="bs:selections/bs:selection/bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Ability']">
                                <xsl:value-of select="@name"/>,                                 
                            </xsl:for-each>
                            <xsl:for-each select="bs:profiles/bs:profile[@typeName='Ability']">
                                <xsl:value-of select="@name"/>,                                 
                            </xsl:for-each>
                        </td>
                        <td></td>
                        <td>
                            <xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
        </section>
    </xsl:if>
</xsl:template>
    <!-- endinject -->

    <!-- inject:card.xsl -->
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
        <div class="header"> <!-- NAME -->
            <div> <!-- CUSTOM NAME -->
                <xsl:value-of select="@customName"/>
            </div>
            <div> <!-- POINTS -->
                <xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/> Points
            </div>
        </div>
        <div> <!-- UNIT -->
            <xsl:variable name="models" select="bs:profiles/bs:profile[@typeName='Model']"></xsl:variable>
            <table class="unit">
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
            <table class="weapons">
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
            <xsl:variable name="wargear" select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Wargear']"/>
            <table>
                <xsl:for-each select="$wargear">
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
            <xsl:if test="$specialism">
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
            </xsl:if>
            
        </div>
    </div>
</xsl:template>
    <!-- endinject -->

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