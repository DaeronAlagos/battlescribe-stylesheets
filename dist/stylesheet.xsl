<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:bs="http://www.battlescribe.net/schema/rosterSchema" 
                xmlns:exslt="http://exslt.org/common" 
                extension-element-prefixes="exslt">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:variable name="specialisms" select="'Leader|Combat|Zealot|Demolitions|Comms|Veteran|Scout|Heavy|Medic|Sniper|Strength|Strategist'"/>
    <xsl:variable name="advances" select="'1. Fleet|2. Lucky|3. Courageous|4. Skilled|5. Lethal|6. Die-hard'"/>

	<xsl:template match="bs:roster/bs:forces/bs:force">
		<html>
		<head>
			<style>
					<!-- inject:../build/style.css -->
					@import url("https://fonts.googleapis.com/css?family=Oswald:600|EB+Garamond:400,400i,700");
body {
  font-family: "EB Garamond", serif; }

th {
  background-color: #E1501E;
  padding: 1pt;
  font-family: "Oswald", sans-serif; }

h1 {
  text-align: center;
  font-size: 42pt;
  text-transform: uppercase;
  font-family: "Oswald", sans-serif;
  font-weight: bold;
  margin: 0; }

h2 {
  font-size: 24pt;
  font-family: "Oswald", sans-serif;
  margin: 0;
  padding-left: 0.1cm; }

#resources {
  margin-bottom: 0.5cm; }

table.campaign {
  width: 100%; }
  table.campaign th, table.campaign td {
    width: 20%; }
  table.campaign tr > th:first-child {
    text-align: left;
    padding-left: 0.2cm; }
  table.campaign tr > td:last-child {
    width: 10%;
    text-align: center; }
  table.campaign td {
    border: 1px solid #666666;
    padding-left: 5px; }
  table.campaign table.resource {
    width: 100%; }
    table.campaign table.resource td {
      border: none;
      padding-left: 0px; }
    table.campaign table.resource td:last-child {
      text-align: right;
      width: 50%;
      padding-right: 0.5cm; }

#roster-header > table {
  width: 100%;
  margin-bottom: 0.5cm; }
  #roster-header > table th, #roster-header > table td {
    width: 25%; }
  #roster-header > table th {
    text-transform: uppercase; }
  #roster-header > table td {
    border: 1px solid #666666;
    font-weight: 600;
    font-size: 14pt;
    text-align: center; }

table.roster {
  width: 100%;
  background-color: #FFFFFF; }
  table.roster th {
    width: 14.28571%;
    font-size: 12pt;
    font-family: 'Oswald', sans-serif;
    text-transform: uppercase; }
  table.roster td {
    background-color: #dfdfdf;
    text-align: center;
    font-size: 10pt; }
    table.roster td > div {
      font-size: 6pt;
      font-style: italic; }

.card {
  width: 11.3cm;
  height: 7.3cm;
  background-color: #FFFFFF;
  border-radius: 8px;
  padding: 0.2cm;
  font-size: 10pt;
  border: 1px solid #bbbbbb;
  display: table; }
  .card .header {
    display: table; }
    .card .header > div {
      display: table-cell;
      width: 3.76667cm; }
      .card .header > div:nth-child(2) {
        text-align: center; }
      .card .header > div:nth-child(3) {
        text-align: right;
        font-weight: bold; }
  .card table {
    width: 100%;
    font-size: 8pt;
    text-align: center;
    text-transform: uppercase; }
  .card th {
    border-top: 1px solid #222E33;
    border-bottom: 1px solid #222E33; }
    .card th:first-child {
      text-align: left;
      min-width: 2cm;
      padding-left: 0.1cm; }
  .card td {
    background-color: #dfdfdf;
    border-left: 1px solid #FFFFFF;
    border-right: 1px solid #FFFFFF;
    border-bottom: 2px solid #FFFFFF;
    text-transform: none; }
    .card td:first-child {
      text-align: left;
      min-width: 2cm;
      width: 2cm;
      padding-left: 0.1cm;
      border-left: none; }
    .card td:last-child {
      border-right: none; }
    .card td.sub-header {
      background-color: transparent;
      font-weight: bold;
      font-family: "Oswald", sans-serif; }
    .card td.sub-body {
      background-color: transparent;
      font-weight: bold;
      text-align: left;
      padding-left: 0.1cm; }

.unit th, .unit td {
  font-weight: bold; }
  .unit th:not(:first-child), .unit td:not(:first-child) {
    width: 0.91cm; }

.unit td {
  font-size: 10pt; }

.weapons th:not(:first-child):not(:last-child), .weapons td:not(:first-child):not(:last-child) {
  width: 1.22cm; }

.weapons th:last-child, .weapons td:last-child {
  min-width: 3cm; }

.weapons td {
  border-bottom: 2px solid #FFFFFF; }

.weapon-divider {
  margin: 0px; }

.specialism > div, .psyker > div, .abilities > div {
  float: left; }

.specialism tr:first-child > td, .psyker tr:first-child > td, .abilities tr:first-child > td {
  background-color: #FFFFFF;
  font-family: "Oswald", sans-serif;
  font-size: 10pt; }

.specialism tr:first-child > td:last-child, .psyker tr:first-child > td:last-child, .abilities tr:first-child > td:last-child {
  text-align: left; }

.card-footer {
  display: table-footer-group; }

.exp {
  font-size: 0.8em;
  display: table;
  width: 11.3cm; }
  .exp > div {
    display: table-cell; }
    .exp > div > span:nth-child(3), .exp > div span:nth-child(7), .exp > div span:nth-child(12) {
      color: #E1501E; }

@media screen {
  #cards {
    display: flex;
    flex-wrap: wrap; }
    #cards .card {
      margin: 0.2cm; } }

@media print {
  #roster {
    page-break-after: always; }
  .card {
    page-break-inside: avoid; } }

					<!-- endinject -->
			</style>
		</head>
		<body>
			<xsl:apply-templates select="bs:selections/bs:selection[@name='List Configuration']" mode="list-configuration"/>
			<section id="cards">
				<xsl:apply-templates select="bs:selections/bs:selection[@type='model']" mode="card"/>
				<xsl:apply-templates select="bs:selections/bs:selection[@type='unit']/bs:selections/bs:selection[@type='model']" mode="card"/>
			</section>
		</body>
		</html>
	</xsl:template>
	
    <xsl:template match="bs:selection/bs:selections/bs:selection" mode="list-configuration">
        <xsl:if test="contains(@name, 'Campaign') or contains(@name, 'Roster')">
            <section>
                <div>
                    <h1>command roster</h1>
                </div>
            </section>
        </xsl:if>
		<xsl:if test="contains(@name, 'Campaign')">
			<section id="resources">
				<xsl:call-template name="campaign">
					<xsl:with-param name="resources" select="../../../bs:selection[@name='Resources']"/>
				</xsl:call-template>
			</section>
		</xsl:if>
		<xsl:if test="contains(@name, 'Roster')">
			<xsl:if test="not(contains(@name, 'Campaign'))">
				<section id="roster-header">
					<table>
						<tr>
							<th>Player Name</th>
							<td></td>
							<th>Faction</th>
							<td>
				                <xsl:value-of select="../../../../../../bs:forces/bs:force/@catalogueName"></xsl:value-of>
							</td>
						</tr>
					</table>
				</section>
			</xsl:if>
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
					<xsl:apply-templates select="../../../bs:selection[@type='model']" mode="roster"/>
					<xsl:apply-templates select="../../../bs:selection[@type='unit']/bs:selections/bs:selection[@type='model']" mode="roster"/>
				</table>
			</section>
		</xsl:if>
	</xsl:template>
	
    <!-- inject:campaign.xsl -->
    <xsl:template name="campaign">
    <xsl:param name="resources"/>
    <table class="campaign">
        <tr>
            <th>Player Name</th>
            <td></td>
            <th>Resources</th>
            <th>Current Kill Team Force</th>
            <td>
                <xsl:value-of select="round(../../../../../../bs:costs/bs:cost[@name='pts']/@value)"></xsl:value-of>
                 Points</td>
        </tr>
        <tr>
            <th>Faction</th>
            <td>
                <xsl:value-of select="../../../../../../bs:forces/bs:force/@catalogueName"></xsl:value-of>
            </td>
            <td>
                <table class="resource">
                    <tr>
                        <td>
                            <xsl:value-of select="$resources/bs:selections/bs:selection[@name='Intelligence']/@name"/>
                        </td>
                        <td>
                            <xsl:value-of select="$resources/bs:selections/bs:selection[@name='Intelligence']/@number"/>
                        </td>
                    </tr>
                </table>
            </td>
            <th>Current Kill Team's Name</th>
            <td></td>
        </tr>
        <tr>
            <th>Mission</th>
            <td></td>
            <td>
                <table class="resource">
                    <tr>
                        <td>
                            <xsl:value-of select="$resources/bs:selections/bs:selection[@name='Materiel']/@name"/>
                        </td>
                        <td>
                            <xsl:value-of select="$resources/bs:selections/bs:selection[@name='Materiel']/@number"/>
                        </td>
                    </tr>
                </table>
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <th>Background</th>
            <td></td>
            <td>
                <table class="resource">
                    <tr>
                        <td>
                            <xsl:value-of select="$resources/bs:selections/bs:selection[@name='Morale']/@name"/>
                        </td>
                        <td>
                            <xsl:value-of select="$resources/bs:selections/bs:selection[@name='Morale']/@number"/>
                        </td>
                    </tr>
                </table>
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <th>Squad Quirk</th>
            <td></td>
            <td>
                <table class="resource">
                    <tr>
                        <td>
                            <xsl:value-of select="$resources/bs:selections/bs:selection[@name='Territory']/@name"/>
                        </td>
                        <td>
                            <xsl:value-of select="$resources/bs:selections/bs:selection[@name='Territory']/@number"/>
                        </td>
                    </tr>
                </table>
            </td>
            <td></td>
            <td></td>
        </tr>
    </table>
</xsl:template>

    <!-- endinject -->

    <!-- inject:roster.xsl -->
    	
	<!-- Renders the rows of the units in the roster table -->
	<xsl:template match="bs:selection[@type='model']" mode="roster">
		<xsl:variable name="nodePoints">
			<xsl:apply-templates mode="points"/>
		</xsl:variable>
		<xsl:variable name="PointsSet" select="exslt:node-set($nodePoints)"/>
	    <tr>
				<!-- Custom Name (BS Pro Only) -->
				<td>
					<xsl:value-of select="@customName"/>
					<div><xsl:value-of select="bs:customNotes/."></xsl:value-of></div>
				</td>
				<!-- /Custom Name (BS Pro Only) -->
				<!-- Unit Name -->
				<td>
						<xsl:value-of select="@name"/>
				</td>
				<!-- /Unit Name -->
				<!-- Weapons and Wargear -->
				<td>
					<xsl:apply-templates select="bs:selections/bs:selection[@type='upgrade']" mode="roster-wargear"/>
				</td>
				<!-- /Weapons and Wargear -->
				<!-- Experience -->
					<td></td>
				<!-- /Experience -->
				<!-- Specialism, Subfaction and Abilities -->
				<td>
					<xsl:for-each select="bs:selections/bs:selection">
						<xsl:if test="contains($specialisms, @name)">
							<xsl:value-of select="@name"/>, 
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="bs:selections/bs:selection/bs:categories/bs:category">
						<xsl:value-of select="bs:selections/bs:selection/bs:categories/bs:category/@name"/>, 							
					</xsl:if>
					<xsl:for-each select="bs:profiles/bs:profile[@typeName='Ability']">
							<xsl:value-of select="@name"/>,                                 
					</xsl:for-each>
	        </td>
					<!-- /Specialism, Subfaction and Abilities -->
					<!-- Demeanour -->
					<td></td>
					<!-- /Demeanour -->
					<!-- Unit cost including weapons/wargear -->
					<td>
						<xsl:value-of select="sum($PointsSet/points)"/>
					</td>
					<!-- /Unit cost including weapons/wargear -->
	    </tr>
	</xsl:template>
    <!-- endinject -->

    <!-- inject:card.xsl -->
    	<!-- Renders the unit cards -->
	<xsl:template match="bs:selection[@type='model']" mode="card">
		<xsl:variable name="nodePoints">
			<xsl:apply-templates mode="points"/>
		</xsl:variable>
		<xsl:variable name="PointsSet" select="exslt:node-set($nodePoints)"/>
		<div class="card">
			<div class="header"> <!-- NAME -->
				<div> <!-- CUSTOM NAME -->
						<xsl:value-of select="@customName"/>
				</div>
				<div>  <!-- SUBFACTION -->
					<xsl:value-of select="bs:selections/bs:selection/bs:categories/bs:category/@name"/>
				</div>
				<div> <!-- POINTS -->
						<!-- <xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/> -->
							<xsl:value-of select="sum($PointsSet/points)"/>
							Points
				</div>
			</div>
			<!-- UNIT PROFILES -->
			<div> 
				<xsl:variable name="profiles" select="bs:profiles/bs:profile[@typeName='Model']"/>
				<table class="unit" cellspacing="0">
					<tr>
						<th>
							Name
						</th>
						<xsl:apply-templates select="$profiles[1]" mode="header"/>
					</tr>
					<xsl:for-each select="$profiles">
						<tr>
							<td>
								<xsl:value-of select="@name"/>
							</td>
							<xsl:apply-templates mode="body"/>
						</tr>
					</xsl:for-each>
		        </table>
			</div>
			<!-- /UNIT PROFILES -->
			<!-- WARGEAR AND WEAPONS -->
			<div>
				<table class="weapons" cellspacing="0">
					<tr>
						<xsl:for-each select="bs:selections/bs:selection[@type='upgrade'][1]/bs:profiles/bs:profile[@typeName='Weapon'][1]">
							<th>
								<xsl:value-of select="@typeName"/>
							</th>
							<xsl:apply-templates mode="header"/>
						</xsl:for-each>
					</tr>
				</table>
				<xsl:apply-templates select="bs:selections/bs:selection[@type='upgrade']" mode="card-weapon"/>
			</div>
			<!-- /WARGEAR & WEAPONS -->
			<!-- ABILITIES -->
			<xsl:variable name="abilities" select="bs:profiles/bs:profile[@typeName='Ability']"/>
			<xsl:if test="$abilities">
				<div class="abilities">
						<table cellspacing="0">
							<tr>
								<td>Abilities:</td>
								<td></td>
							</tr>
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
			</xsl:if>
			<!-- /ABILITIES -->

			<!-- PSYCHIC POWERS -->
			<xsl:variable name="psyker" select="bs:profiles/bs:profile[@typeName='Psyker']"/>
			<xsl:variable name="psy-powers" select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Psychic Power']"/>
			<xsl:if test="$psy-powers">
				<div class="psyker">
					<table cellspacing="0">
						<tr>
							<td>Psyker:</td>
							<td>
								Manifest <xsl:value-of select="$psyker/bs:characteristics/bs:characteristic[@name='Manifest']"/> | Deny <xsl:value-of select="$psyker/bs:characteristics/bs:characteristic[@name='Deny']"/>
							</td>
						</tr>
						<xsl:for-each select="$psy-powers">
							<tr>
								<td>
									<xsl:value-of select="@name"/>
								</td>
								<xsl:apply-templates mode="body"/>
							</tr>
						</xsl:for-each>
					</table>
				</div>
			</xsl:if>
			<!-- /PSYCHIC POWERS -->

			<!-- SPECIALISM -->
			<xsl:variable name="specialism" select="bs:selections/bs:selection[contains($specialisms, @name)]"/>
			<xsl:if test="$specialism">
				<div class="specialism">
					<table cellspacing="0">
						<tr>
							<td>Specialism:	</td>
							<td><xsl:value-of select="$specialism/@name"/></td>
						</tr>
						<tr>
							<td>
								<xsl:value-of select="$specialism/bs:selections/bs:selection/bs:profiles/bs:profile/@name"/>
							</td>
								<xsl:apply-templates select="$specialism" mode="body"/>
						</tr>
					</table>
				</div>
			</xsl:if>
			<!-- /SPECIALISM -->

			<!-- EXP TRACK -->
			<div class="card-footer">
				<div class="exp">
					<div>Experience: <span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span></div>
					<div>Flesh Wounds: &#9744; &#9744; &#9744;</div>
					<div>Convalescence: &#9744;</div>
					<div>New Recruit: &#9744;</div>
				</div>
			</div>
			<!-- /EXP TRACK -->
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
	<xsl:template match="bs:cost[@name='pts']" mode="points">
		<points>
			<xsl:value-of select="@value"/>
		</points>
	</xsl:template>
	<xsl:template match="bs:profiles" mode="card-weapon">
		<xsl:for-each select="bs:profile[@typeName='Weapon' or @typeName='Wargear' or @typeName='Special Issue Ammunition']">
			<xsl:sort select="not(@typeName='Weapon' or @typeName='Wargear')"/>
			<xsl:sort select="@typeName"/>
			<table class="weapons" cellspacing="0">
				<tr>
					<td>
						<xsl:if test="../../@number > 1">
							<xsl:value-of select="../../@number"/>x
						</xsl:if>
						<xsl:value-of select="@name"/>
					</td>
					<xsl:apply-templates mode="body"/>
				</tr>			
			</table>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="bs:profiles" mode="roster-wargear">
		<xsl:for-each select="bs:profile[@typeName='Weapon' or @typeName='Wargear']">
			<xsl:if test="../../@number > 1">
				<xsl:value-of select="../../@number"/>x
			</xsl:if>
			<xsl:value-of select="@name"/>,
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>