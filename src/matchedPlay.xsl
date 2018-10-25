<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:bs="http://www.battlescribe.net/schema/rosterSchema" xmlns:exslt="http://exslt.org/common" extension-element-prefixes="exslt">
	<xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/bs:roster/bs:forces/bs:force">
		<xsl:variable name="specialisms" select="'Leader|Combat|Zealot|Demolitions|Comms|Veteran|Scout|Heavy|Medic|Sniper|Strength|Strategist'"/>
		<xsl:variable name="advances" select="'1. Fleet|2. Lucky|3. Courageous|4. Skilled|5. Lethal|6. Die-hard'"/>
		<html>
			<head>
				<link href="https://fonts.googleapis.com/css?family=Arvo" rel="stylesheet"/>
				<style>
					<!-- inject:src/css/style.css -->
					<!-- contents of html partials will be injected here -->
					<!-- endinject -->
				</style>
			</head>
			<body>
				<h1>
					<xsl:value-of select="@name"/>
				</h1>
				<section id="cards">
					<xsl:for-each select="bs:selections/bs:selection">
						<xsl:choose>
							<xsl:when test="@type='model'">
								<!-- inject:src/card.xsl -->
                                <!-- contents of html partials will be injected here -->
                                <!-- endinject -->
							</xsl:when>
							<xsl:when test="@name='Show Tactics'">
								<!-- inject:src/tactics.xsl -->
                                <!-- contents of html partials will be injected here -->
                                <!-- endinject -->
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
				</section>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
