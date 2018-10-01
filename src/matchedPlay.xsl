<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:bs="http://www.battlescribe.net/schema/rosterSchema" xmlns:exslt="http://exslt.org/common" extension-element-prefixes="exslt">
	<xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/bs:roster">
		<xsl:variable name="specialisms" select="'Leader|Combat|Zealot|Demolitions|Comms|Veteran|Scout|Heavy|Medic|Sniper|Strength|Strategist'"/>
		<xsl:variable name="advances" select="'1. Fleet|2. Lucky|3. Courageous|4. Skilled|5. Lethal|6. Die-hard'"/>
		<html>
			<head>
				<link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet"/>
				<style>
					<!-- inject:src/css/styles.css -->
					<!-- contents of html partials will be injected here -->
					<!-- endinject -->
				</style>
			</head>
			<body>
				<h1>
					<xsl:value-of select="@name"/>
				</h1>
				<section>
					<xsl:for-each select="bs:forces/bs:force/bs:selections/bs:selection">
						<xsl:if test="@type='model'">
							
							<!-- inject:src/card.xsl -->
							<!-- contents of html partials will be injected here -->
							<!-- endinject -->

						</xsl:if>
					</xsl:for-each>
				</section>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
