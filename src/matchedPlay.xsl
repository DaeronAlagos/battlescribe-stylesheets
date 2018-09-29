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
					<!-- body {background-color: #000000;} -->
					hr {margin:5px;} .container {background-color: #EFEFEF;border:1px solid #FF0000;padding:5px;width:20cm;} .pageTitle {text-align:center;text-transform:uppercase;font-size:30px;color:#FF0000;} .rosterFirst {background-color:#FF0000;text-transform:uppercase;} td.rosterValue {background-color:white;text-align:left;padding:0 3px;width:20%;} body {font-family: 'Quicksand', sans-serif; font-size:9px;} #container {display:flex;flex-wrap:wrap;width:21cm;} td.rosterType {background-color: red;width:12%;font-size:12px;} .card {background-color: #EEEEEE;width:11cm;min-height:7.5cm;display:flex;flex-direction:column;border-radius:8px;border:1px solid #CCCCCC} tr.statHeader {background-color:red;} table {width: 100%;} 
					<!-- tr {background-color: red;} -->
					tr.body {background-color: #FFFFFF;} th {text-align:center;font-size:9px;} th.weaponStat {width:5%;} th.first {text-align: left;width:20%;} td {text-align:center;font-size:9px;} td.first {text-align: left;width:20%;} .extra {margin:0 3px; line-height:18px; float:left;} div.campaign {margin:auto auto 0 auto;} .f8 {font-size:8px;} .customNotes {margin:5px;} .history {margin-bottom:5px;} .historyTitle {font-size:12px; font-weight: bold;} .historyText {background-color:#FFFFFF;margin-top:5px;padding:3px;min-height:3cm;} 
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
