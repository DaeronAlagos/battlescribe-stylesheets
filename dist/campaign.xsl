<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:bs="http://www.battlescribe.net/schema/rosterSchema" xmlns:exslt="http://exslt.org/common" extension-element-prefixes="exslt">
	<xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/bs:roster/bs:forces/bs:force">
		<xsl:variable name="specialisms" select="'Leader|Combat|Zealot|Demolitions|Comms|Veteran|Scout|Heavy|Medic|Sniper|Strength|Strategist'"/>
		<xsl:variable name="advances" select="'1. Fleet|2. Lucky|3. Courageous|4. Skilled|5. Lethal|6. Die-hard'"/>
		<html>
			<head>
				<link href="https://fonts.googleapis.com/css?family=Arvo" rel="stylesheet"/>
				<link href="https://fonts.googleapis.com/css?family=Black+Ops+One" rel="stylesheet"/>
				<style>
					<!-- inject:src/css/style.css -->
					body {
  font-family: 'Arvo', serif;
  font-size: 12px; }

section {
  width: 100%; }

table {
  width: 100%; }

th {
  background-color: #e02626;
  font-size: 8px; }

th:first-child {
  text-align: left;
  padding-left: 3px; }

td {
  background-color: #FFFFFF;
  font-size: 8px;
  text-align: center; }

td:first-child {
  text-align: left;
  padding-left: 3px; }

#roster-title {
  text-align: center;
  text-transform: uppercase;
  font-size: 60px;
  font-family: 'Black Ops One', cursive; }

#roster-title hr {
  margin: 0 0 5px; }

#roster-resources th, #roster-resources td {
  font-size: 12px; }

.resources {
  text-align: left;
  padding: 3px; }

.resources-value {
  float: right; }

#roster-units th, #roster-units td {
  font-size: 9px; }

.roster-cell-heading {
  background-color: #e02626; }

.roster-cell-body {
  background-color: #717171; }

.roster-body {
  background-color: #EFEFEF; }

.card {
  width: 11.5cm;
  min-height: 7.5cm;
  background-color: #EFEFEF;
  padding: 2px;
  border-radius: 8px;
  display: flex;
  flex-direction: column;
  border: 1px solid #CCCCCC; }

.card td:first-child {
  width: 20%; }

#name {
  font-size: 9px;
  margin: 0 2px; }

.unit-line th:first-child {
  width: 20%; }

.unit-line th:not(:first-child) {
  width: 8%; }

.weapon-line th:first-child {
  width: 21%; }

.weapon-line th:not(:first-child) {
  width: 9%; }

.abilities-heading {
  font-size: 8px;
  padding: 0 4px;
  font-weight: bold;
  margin: 2px 0; }

.specialism {
  font-weight: normal; }

th.ability, td.ability {
  width: 99%; }

td.ability {
  font-size: 7px; }

.cp-cost {
  min-width: 25px; }

#experience {
  margin: auto auto 0 auto; }

#experience span {
  font-size: 8px;
  margin: 0 4px; }

@media screen {
  #cards {
    display: flex;
    flex-wrap: wrap; }
  .card {
    margin: 3px; } }

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
				<section id="roster">

					<!-- inject:src/roster.xsl -->
					<div>
    <section id="roster-title">
        <div>command roster</div>
        <hr/>
    </section>
    <section id="roster-resources" class="roster-body">
        <table class="roster">
            <tr>
                <td class="roster-cell-heading">Player Name</td>
                <td></td>
                <td class="roster-cell-heading">Resources</td>
                <td class="roster-cell-heading">Current Kill Team Force</td>
                <td>Points</td>
            </tr>
            <tr>
                <td class="roster-cell-heading">Faction</td>
                <td>
                    <xsl:value-of select="@catalogueName"/>
                </td>
                <td class="resources">
                    Intelligence
                    <span class="resources-value">
                        <xsl:choose>
                            <xsl:when test="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Intelligence']">
                                <xsl:value-of
                                        select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Intelligence']/@number"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of
                                        select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='1x Intelligence']/@number"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </span>
                </td>
                <td class="roster-cell-heading">Current Kill Team's Name</td>
                <td></td>
            </tr>
            <tr>
                <td class="roster-cell-heading">Mission</td>
                <td></td>
                <td class="resources">
                    Materiel
                    <span class="resources-value">
                        <xsl:choose>
                            <xsl:when
                                    test="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Materiel']">
                                <xsl:value-of
                                        select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Materiel']/@number"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of
                                        select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='1x Materiel']/@number"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </span>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td class="roster-cell-heading">Background</td>
                <td></td>
                <td class="resources">
                    Morale
                    <span class="resources-value">
                        <xsl:choose>
                            <xsl:when
                                    test="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Morale']">
                                <xsl:value-of
                                    select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Morale']/@number"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of
                                    select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='1x Morale']/@number"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </span>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td class="roster-cell-heading">Squad Quirk</td>
                <td></td>
                <td class="resources">
                    Territory
                    <span class="resources-value">
                        <xsl:choose>
                            <xsl:when
                                    test="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Territory']">
                                <xsl:value-of
                                    select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Territory']/@number"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of
                                    select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='1x Territory']/@number"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </span>
                </td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </section>
    <br/>
    <section id="roster-units" class="roster-body">
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
            <xsl:for-each select="bs:selections/bs:selection">
                <xsl:choose>
                    <xsl:when test="@type='model'">
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
                        <tr>
                            <!-- Custom Name -->
                            <td>
                                <xsl:value-of select="@customName"/>
                            </td>
                            <!-- Name -->
                            <td>
                                <xsl:value-of select="@name"/>
                            </td>
                            <!-- Wargear -->
                            <td>
                                <xsl:for-each select="bs:selections/bs:selection">
                                    <xsl:if test="not(contains($specialisms, @name))">
                                        <span><xsl:value-of select="@name"/>, </span>
                                    </xsl:if>
                                </xsl:for-each>
                            </td>
                            <!-- Experience -->
                            <td></td>
                            <!-- Specialism/Abilities -->
                            <td>
                                <xsl:for-each select="bs:selections/bs:selection">
                                    <xsl:if test="contains($specialisms, @name)">
                                        <span><xsl:value-of select="@name"/>, </span>
                                    </xsl:if>
                                </xsl:for-each>
                                <xsl:for-each select="bs:rules/bs:rule">
                                    <span><xsl:value-of select="@name"/>, </span>
                                </xsl:for-each>
                                <xsl:for-each select="bs:profiles/bs:profile[@profileTypeName='Ability']">
                                    <span><xsl:value-of select="@name"/>, </span>
                                </xsl:for-each>
                            </td>
                            <!-- Demeanour -->
                            <td></td>
                            <!-- Points -->
                            <td>
                                <xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/>
                            </td>
                        </tr>
                    </xsl:when>
                    <xsl:when test="@type='unit'">
                        <xsl:for-each select="bs:selections/bs:selection[@type='model']">
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
                        <tr>
                            <!-- Custom Name -->
                            <td>
                                <xsl:value-of select="@customName"/>
                            </td>
                            <!-- Name -->
                            <td>
                                <xsl:value-of select="@name"/>
                            </td>
                            <!-- Wargear -->
                            <td>
                                <xsl:for-each select="bs:selections/bs:selection">
                                    <xsl:if test="not(contains($specialisms, @name))">
                                        <span><xsl:value-of select="@name"/>, </span>
                                    </xsl:if>
                                </xsl:for-each>
                            </td>
                            <!-- Experience -->
                            <td></td>
                            <!-- Specialism/Abilities -->
                            <td>
                                <xsl:for-each select="bs:selections/bs:selection">
                                    <xsl:if test="contains($specialisms, @name)">
                                        <span><xsl:value-of select="@name"/>, </span>
                                    </xsl:if>
                                </xsl:for-each>
                                <xsl:for-each select="bs:rules/bs:rule">
                                    <span><xsl:value-of select="@name"/>, </span>
                                </xsl:for-each>
                                <xsl:for-each select="bs:profiles/bs:profile[@profileTypeName='Ability']">
                                    <span><xsl:value-of select="@name"/>, </span>
                                </xsl:for-each>
                            </td>
                            <!-- Demeanour -->
                            <td></td>
                            <!-- Points -->
                            <td>
                                <xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/>
                            </td>
                        </tr>
                        </xsl:for-each>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>

        </table>
    </section>
</div>
					<!-- endinject -->
				
				</section>
				<br/>

				<section id="cards">
					<xsl:for-each select="bs:selections/bs:selection">
						<xsl:choose>
							<xsl:when test="@type='model'">
								<!-- inject:src/card.xsl -->
                                <!-- Card Front -->
<div class="card">
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
    <div id="name">
        <div style="float:left;">
            <xsl:value-of select="@customName"/>
        </div>
        <div style="float:right;">
            <xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/>
            Points
        </div>
    </div>
    <!-- Unit -->
    <div>
        <table>
            <tr class="unit-line">
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
                <td>
                    <xsl:value-of select="@name"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='M']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='WS']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='BS']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='S']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='T']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='W']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='A']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='Ld']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='Sv']/@value"/>
                </td>
            </tr>
        </table>
    </div>
    <!-- /Unit -->
    <!-- Weapons -->
    <div>
        <table>
            <tr class="weapon-line">
                <th>Weapon</th>
                <th>Range</th>
                <th>Type</th>
                <th>S</th>
                <th>AP</th>
                <th>D</th>
                <th class="ability">Abilities</th>
            </tr>
            <xsl:for-each select="bs:selections/bs:selection">
                <xsl:if test="not(contains($specialisms, @name))">
                    <xsl:choose>
                        <xsl:when test="bs:profiles/bs:profile">
                            <xsl:for-each select="bs:profiles/bs:profile">
                                <tr>
                                    <td>
                                        <xsl:value-of select="@name"/>
                                    </td>
                                    <xsl:choose>
                                        <xsl:when test="bs:characteristics/bs:characteristic[@name='Ability']">
                                            <td colspan="6" class="ability">
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='Ability']/@value"/>
                                            </td>
                                        </xsl:when>
                                        <xsl:when test="bs:characteristics/bs:characteristic[@name='Description']">
                                            <td colspan="6" class="ability">
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='Description']/@value"/>
                                            </td>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <td>
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='Range']/@value"/>
                                            </td>
                                            <td>
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='Type']/@value"/>
                                            </td>
                                            <td>
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='S']/@value"/>
                                            </td>
                                            <td>
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='AP']/@value"/>
                                            </td>
                                            <td>
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='D']/@value"/>
                                            </td>
                                            <td class="ability">
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='Abilities']/@value"/>
                                            </td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </tr>
                            </xsl:for-each>

                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:for-each select="bs:selections/bs:selection">
                                <xsl:for-each select="bs:profiles/bs:profile">
                                    <tr class="stat-line">
                                        <td>
                                            <xsl:value-of select="@name"/>
                                        </td>
                                        <xsl:choose>
                                            <xsl:when test="bs:characteristics/bs:characteristic[@name='Ability']">
                                                <td colspan="6" class="ability">
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='Ability']/@value"/>
                                                </td>
                                            </xsl:when>
                                            <xsl:when test="bs:characteristics/bs:characteristic[@name='Description']">
                                                <td colspan="6" class="ability">
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='Description']/@value"/>
                                                </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <td>
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='Range']/@value"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='Type']/@value"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='S']/@value"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='AP']/@value"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='D']/@value"/>
                                                </td>
                                                <td class="ability">
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='Abilities']/@value"/>
                                                </td>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </tr>
                                </xsl:for-each>
                            </xsl:for-each>

                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:for-each>
        </table>
    </div>
    <!-- /Weapons -->

    <!-- Abilities -->
    <div>
        <div class="abilities-heading">Abilities:</div>
        <table>
            <xsl:for-each select="bs:profiles/bs:profile">
                <xsl:if test="@profileTypeName='Ability'">
                    <tr>
                        <td>
                            <xsl:value-of select="@name"/>
                        </td>
                        <td class="ability">
                            <xsl:value-of select="bs:characteristics/bs:characteristic/@value"/>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="bs:rules/bs:rule">
                <tr>
                    <td>
                        <xsl:value-of select="@name"/>
                    </td>
                    <td>
                        <xsl:value-of select="bs:description"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </div>
    <!-- /Abilities -->

    <!-- Specialism -->
    <div>
        <xsl:for-each select="bs:selections/bs:selection">
            <xsl:if test="contains($specialisms, @name)">
                <div class="abilities-heading">
                    Specialism:
                    <span class="specialism">
                        <xsl:value-of select="@name"/>
                    </span>
                </div>
                <table>
                    <xsl:for-each select="bs:selections/bs:selection/bs:profiles/bs:profile">
                        <xsl:if test="@profileTypeName='Ability'">
                            <tr>
                                <td>
                                    <xsl:value-of select="@name"/>
                                </td>
                                <td class="ability">
                                    <xsl:value-of select="bs:characteristics/bs:characteristic/@value"/>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>

            </xsl:if>
        </xsl:for-each>
    </div>
    <!-- /Specialism-->

    <!-- Tactics-->
    <xsl:for-each select="bs:selections/bs:selection">
        <xsl:if test="contains($specialisms, @name)">
            <xsl:if test="not(bs:selections/bs:selection/bs:profiles/bs:profile[@profileTypeName='Ability'])">
                <div>
                    <div class="abilities-heading">
                        Tactics:
                    </div>
                    <table>
                        <xsl:for-each select="bs:selections/bs:selection">
                            <xsl:for-each select="bs:profiles/bs:profile">
                                <xsl:if test="not(@profileTypeName='Ability')">
                                    <tr>
                                        <td>
                                            <xsl:value-of select="@name"/>
                                        </td>
                                        <td class="ability">
                                            <xsl:value-of select="bs:characteristics/bs:characteristic[@name='Description']/@value"/>
                                        </td>
                                        <td class="cp-cost">
                                            <xsl:value-of select="bs:characteristics/bs:characteristic[@name='CP']/@value"/>
                                            CP
                                        </td>
                                    </tr>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:for-each>
                    </table>
                </div>
            </xsl:if>
        </xsl:if>
    </xsl:for-each>
    <!-- /Tactics-->

    <!-- Fire Team Advances -->
    <div>
        <xsl:for-each select="../../bs:selections/bs:selection">
            <xsl:if test="@type='upgrade'">
                <xsl:if test="../../@type='unit'">
                    <span class="abilities-heading">Advances:</span>

                </xsl:if>
                <table>

                    <xsl:for-each select="bs:selections/bs:selection">
                        <xsl:if test="contains($advances, @name)">
                            <xsl:for-each select="bs:profiles/bs:profile">
                                <tr>
                                    <td>
                                        <xsl:value-of select="@name"/>
                                    </td>
                                    <td>
                                        <xsl:value-of
                                                select="bs:characteristics/bs:characteristic[@name='Description']/@value"/>
                                    </td>
                                </tr>
                            </xsl:for-each>

                        </xsl:if>
                    </xsl:for-each>
                </table>

            </xsl:if>
        </xsl:for-each>
    </div>
    <!-- /Fire Team Advances -->

    <!-- Experience -->
    <div id="experience">
        <span>Experience: &#9744; &#9744; <font color="red">&#9744;</font> &#9744; &#9744; &#9744; <font color="red">
            &#9744;
        </font> &#9744; &#9744; &#9744; &#9744;
            <font color="red">&#9744;</font>
        </span>
        <span>Flesh Wounds: &#9744; &#9744; &#9744;</span>
        <span>Convalescence: &#9744;</span>
        <span>New Recruit: &#9744;</span>
    </div>
    <!-- /Experience -->

</div>
        <!-- /Card Front -->

        <!-- Card Back -->
        <!--
        <xsl:if test="bs:customNotes">
        <div style="height: document.getElementsByClassName('card').previousElementSibling">
            <div>
                <div>
                    <div>History</div>
                    <div>
                        <xsl:value-of select="bs:customNotes"/>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        </xsl:if>
        -->
        <!-- /Card Back -->
                                <!-- endinject -->
							</xsl:when>
							<xsl:when test="@type='unit'">
								<xsl:for-each select="bs:selections/bs:selection">
									<xsl:if test="@type='model'">
									<!-- inject:src/card.xsl -->
                                    <!-- Card Front -->
<div class="card">
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
    <div id="name">
        <div style="float:left;">
            <xsl:value-of select="@customName"/>
        </div>
        <div style="float:right;">
            <xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/>
            Points
        </div>
    </div>
    <!-- Unit -->
    <div>
        <table>
            <tr class="unit-line">
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
                <td>
                    <xsl:value-of select="@name"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='M']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='WS']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='BS']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='S']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='T']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='W']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='A']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='Ld']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='Sv']/@value"/>
                </td>
            </tr>
        </table>
    </div>
    <!-- /Unit -->
    <!-- Weapons -->
    <div>
        <table>
            <tr class="weapon-line">
                <th>Weapon</th>
                <th>Range</th>
                <th>Type</th>
                <th>S</th>
                <th>AP</th>
                <th>D</th>
                <th class="ability">Abilities</th>
            </tr>
            <xsl:for-each select="bs:selections/bs:selection">
                <xsl:if test="not(contains($specialisms, @name))">
                    <xsl:choose>
                        <xsl:when test="bs:profiles/bs:profile">
                            <xsl:for-each select="bs:profiles/bs:profile">
                                <tr>
                                    <td>
                                        <xsl:value-of select="@name"/>
                                    </td>
                                    <xsl:choose>
                                        <xsl:when test="bs:characteristics/bs:characteristic[@name='Ability']">
                                            <td colspan="6" class="ability">
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='Ability']/@value"/>
                                            </td>
                                        </xsl:when>
                                        <xsl:when test="bs:characteristics/bs:characteristic[@name='Description']">
                                            <td colspan="6" class="ability">
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='Description']/@value"/>
                                            </td>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <td>
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='Range']/@value"/>
                                            </td>
                                            <td>
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='Type']/@value"/>
                                            </td>
                                            <td>
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='S']/@value"/>
                                            </td>
                                            <td>
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='AP']/@value"/>
                                            </td>
                                            <td>
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='D']/@value"/>
                                            </td>
                                            <td class="ability">
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='Abilities']/@value"/>
                                            </td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </tr>
                            </xsl:for-each>

                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:for-each select="bs:selections/bs:selection">
                                <xsl:for-each select="bs:profiles/bs:profile">
                                    <tr class="stat-line">
                                        <td>
                                            <xsl:value-of select="@name"/>
                                        </td>
                                        <xsl:choose>
                                            <xsl:when test="bs:characteristics/bs:characteristic[@name='Ability']">
                                                <td colspan="6" class="ability">
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='Ability']/@value"/>
                                                </td>
                                            </xsl:when>
                                            <xsl:when test="bs:characteristics/bs:characteristic[@name='Description']">
                                                <td colspan="6" class="ability">
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='Description']/@value"/>
                                                </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <td>
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='Range']/@value"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='Type']/@value"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='S']/@value"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='AP']/@value"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='D']/@value"/>
                                                </td>
                                                <td class="ability">
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='Abilities']/@value"/>
                                                </td>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </tr>
                                </xsl:for-each>
                            </xsl:for-each>

                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:for-each>
        </table>
    </div>
    <!-- /Weapons -->

    <!-- Abilities -->
    <div>
        <div class="abilities-heading">Abilities:</div>
        <table>
            <xsl:for-each select="bs:profiles/bs:profile">
                <xsl:if test="@profileTypeName='Ability'">
                    <tr>
                        <td>
                            <xsl:value-of select="@name"/>
                        </td>
                        <td class="ability">
                            <xsl:value-of select="bs:characteristics/bs:characteristic/@value"/>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="bs:rules/bs:rule">
                <tr>
                    <td>
                        <xsl:value-of select="@name"/>
                    </td>
                    <td>
                        <xsl:value-of select="bs:description"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </div>
    <!-- /Abilities -->

    <!-- Specialism -->
    <div>
        <xsl:for-each select="bs:selections/bs:selection">
            <xsl:if test="contains($specialisms, @name)">
                <div class="abilities-heading">
                    Specialism:
                    <span class="specialism">
                        <xsl:value-of select="@name"/>
                    </span>
                </div>
                <table>
                    <xsl:for-each select="bs:selections/bs:selection/bs:profiles/bs:profile">
                        <xsl:if test="@profileTypeName='Ability'">
                            <tr>
                                <td>
                                    <xsl:value-of select="@name"/>
                                </td>
                                <td class="ability">
                                    <xsl:value-of select="bs:characteristics/bs:characteristic/@value"/>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>

            </xsl:if>
        </xsl:for-each>
    </div>
    <!-- /Specialism-->

    <!-- Tactics-->
    <xsl:for-each select="bs:selections/bs:selection">
        <xsl:if test="contains($specialisms, @name)">
            <xsl:if test="not(bs:selections/bs:selection/bs:profiles/bs:profile[@profileTypeName='Ability'])">
                <div>
                    <div class="abilities-heading">
                        Tactics:
                    </div>
                    <table>
                        <xsl:for-each select="bs:selections/bs:selection">
                            <xsl:for-each select="bs:profiles/bs:profile">
                                <xsl:if test="not(@profileTypeName='Ability')">
                                    <tr>
                                        <td>
                                            <xsl:value-of select="@name"/>
                                        </td>
                                        <td class="ability">
                                            <xsl:value-of select="bs:characteristics/bs:characteristic[@name='Description']/@value"/>
                                        </td>
                                        <td class="cp-cost">
                                            <xsl:value-of select="bs:characteristics/bs:characteristic[@name='CP']/@value"/>
                                            CP
                                        </td>
                                    </tr>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:for-each>
                    </table>
                </div>
            </xsl:if>
        </xsl:if>
    </xsl:for-each>
    <!-- /Tactics-->

    <!-- Fire Team Advances -->
    <div>
        <xsl:for-each select="../../bs:selections/bs:selection">
            <xsl:if test="@type='upgrade'">
                <xsl:if test="../../@type='unit'">
                    <span class="abilities-heading">Advances:</span>

                </xsl:if>
                <table>

                    <xsl:for-each select="bs:selections/bs:selection">
                        <xsl:if test="contains($advances, @name)">
                            <xsl:for-each select="bs:profiles/bs:profile">
                                <tr>
                                    <td>
                                        <xsl:value-of select="@name"/>
                                    </td>
                                    <td>
                                        <xsl:value-of
                                                select="bs:characteristics/bs:characteristic[@name='Description']/@value"/>
                                    </td>
                                </tr>
                            </xsl:for-each>

                        </xsl:if>
                    </xsl:for-each>
                </table>

            </xsl:if>
        </xsl:for-each>
    </div>
    <!-- /Fire Team Advances -->

    <!-- Experience -->
    <div id="experience">
        <span>Experience: &#9744; &#9744; <font color="red">&#9744;</font> &#9744; &#9744; &#9744; <font color="red">
            &#9744;
        </font> &#9744; &#9744; &#9744; &#9744;
            <font color="red">&#9744;</font>
        </span>
        <span>Flesh Wounds: &#9744; &#9744; &#9744;</span>
        <span>Convalescence: &#9744;</span>
        <span>New Recruit: &#9744;</span>
    </div>
    <!-- /Experience -->

</div>
        <!-- /Card Front -->

        <!-- Card Back -->
        <!--
        <xsl:if test="bs:customNotes">
        <div style="height: document.getElementsByClassName('card').previousElementSibling">
            <div>
                <div>
                    <div>History</div>
                    <div>
                        <xsl:value-of select="bs:customNotes"/>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        </xsl:if>
        -->
        <!-- /Card Back -->
                                    <!-- endinject -->
									</xsl:if>
								</xsl:for-each>
							</xsl:when>
							<xsl:when test="@name='Show Tactics'">
								<!-- inject:src/tactics.xsl -->
                                								<div class="card">
									<div style="padding-left: 3px;">Tactics</div>
									<table>
										<th>Name</th>
										<th>Description</th>
										<th>Cost</th>
										<xsl:for-each select="bs:profiles/bs:profile">
									
											<tr>
												<td>
													<xsl:value-of select="@name" />
												</td>
												<td class="ability">
													<xsl:value-of select="bs:characteristics/bs:characteristic[@name='Description']/@value" />
												</td>
												<td class="cp-cost">
													<xsl:value-of select="bs:characteristics/bs:characteristic[@name='CP']/@value" /> CP
												</td>
											</tr>	
										
										</xsl:for-each>
									</table>
								</div>
                                <!-- endinject -->
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
				</section>
				
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
