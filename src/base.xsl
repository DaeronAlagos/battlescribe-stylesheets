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
					<!-- contents of html partials will be injected here -->
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
    <!-- contents of html partials will be injected here -->
    <!-- endinject -->

    <!-- inject:roster.xsl -->
    <!-- contents of html partials will be injected here -->
    <!-- endinject -->

    <!-- inject:card.xsl -->
    <!-- contents of html partials will be injected here -->
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