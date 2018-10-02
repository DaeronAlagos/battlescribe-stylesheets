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
					<!-- inject:src/css/common.css -->
					body {
  font-family: 'Quicksand', sans-serif;
  font-size: 12px; }

section {
  width: 100%; }

table {
  width: 100%; }

th {
  background-color: #FF0000;
  font-size: 9px; }

th:first-child {
  text-align: left;
  padding-left: 3px; }

.stat-line th, td {
  width: 10px; }

td {
  background-color: #FFFFFF;
  font-size: 9px;
  text-align: center; }

td:first-child {
  text-align: left;
  padding-left: 3px;
  width: 20%; }

.card {
  width: 11.5cm;
  min-height: 7.5cm;
  background-color: #EFEFEF;
  padding: 2px;
  border-radius: 8px;
  display: flex;
  flex-direction: column;
  border: 1px solid #CCCCCC; }

#name {
  font-size: 9px;
  margin: 0 2px; }

.ability-heading {
  font-size: 9px;
  font-weight: bold;
  padding-left: 3px; }

.ability {
  font-size: 8px; }

.cp-cost {
  width: 5%; }

#experience {
  margin: auto auto 0 auto; }

#experience span {
  font-size: 9px;
  margin: 0 4px; }

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
										<xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/> Points
									</div>
								</div>
								<!-- Unit -->
								<div>
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
											<td>
												<xsl:value-of select="@name"/>
											</td>
											<td>
												<xsl:value-of select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='M']/@value"/>
											</td>
											<td>
												<xsl:value-of select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='WS']/@value"/>
											</td>
											<td>
												<xsl:value-of select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='BS']/@value"/>
											</td>
											<td>
												<xsl:value-of select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='S']/@value"/>
											</td>
											<td>
												<xsl:value-of select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='T']/@value"/>
											</td>
											<td>
												<xsl:value-of select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='W']/@value"/>
											</td>
											<td>
												<xsl:value-of select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='A']/@value"/>
											</td>
											<td>
												<xsl:value-of select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='Ld']/@value"/>
											</td>
											<td>
												<xsl:value-of select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='Sv']/@value"/>
											</td>
										</tr>
									</table>
								</div>
								<!-- /Unit -->
								<!-- Weapons -->
								<div>
									<table>
										<tr class="stat-line">
											<th>Weapon</th>
											<th style="width:10%;">Range</th>
											<th style="width:10%;">Type</th>
											<th>S</th>
											<th>AP</th>
											<th>D</th>
											<th>Abilities</th>
										</tr>
										<xsl:for-each select="bs:selections/bs:selection">
											<xsl:if test="not(contains($specialisms, @name))">
												<xsl:for-each select="bs:profiles/bs:profile">
													<tr class="stat-line">
														<td>
															<xsl:value-of select="@name"/>
														</td>
														<xsl:choose>
															<xsl:when test="bs:characteristics/bs:characteristic[@name='Ability']">
																<td colspan="6" class="ability">
																	<xsl:value-of select="bs:characteristics/bs:characteristic[@name='Ability']/@value"/>
																</td>
															</xsl:when>
															<xsl:when test="bs:characteristics/bs:characteristic[@name='Description']">
																<td colspan="6" class="ability">
																	<xsl:value-of select="bs:characteristics/bs:characteristic[@name='Description']/@value"/>
																</td>
															</xsl:when>
															<xsl:otherwise>
																<td>
																	<xsl:value-of select="bs:characteristics/bs:characteristic[@name='Range']/@value"/>
																</td>
																<td>
																	<xsl:value-of select="bs:characteristics/bs:characteristic[@name='Type']/@value"/>
																</td>
																<td>
																	<xsl:value-of select="bs:characteristics/bs:characteristic[@name='S']/@value"/>
																</td>
																<td>
																	<xsl:value-of select="bs:characteristics/bs:characteristic[@name='AP']/@value"/>
																</td>
																<td>
																	<xsl:value-of select="bs:characteristics/bs:characteristic[@name='D']/@value"/>
																</td>
																<td class="ability">
																	<xsl:value-of select="bs:characteristics/bs:characteristic[@name='Abilities']/@value"/>
																</td>
															</xsl:otherwise>
														</xsl:choose>
													</tr>
												</xsl:for-each>
											</xsl:if>
										</xsl:for-each>
									</table>
								</div>
								<!-- /Weapons -->

								<!-- Abilities -->
								<div>
									<span class="ability-heading">Abilities:</span>
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
											<span class="ability-heading">Specialism: </span><xsl:value-of select="@name"/>
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
											<span class="ability-heading">Tactics:</span>
											<table>
												<xsl:for-each select="bs:selections/bs:selection/bs:profiles/bs:profile">
													<xsl:if test="not(@profileTypeName='Ability')">
														<tr>
															<td>
																<xsl:value-of select="@name"/>
															</td>
															<td class="ability">
																<xsl:value-of select="bs:characteristics/bs:characteristic[@name='Description']/@value"/>
															</td>
															<td class="cp-cost">
																<xsl:value-of select="bs:characteristics/bs:characteristic[@name='CP']/@value"/> CP
															</td>
														</tr>
													</xsl:if>
												</xsl:for-each>
											</table>
										</xsl:if>
									</xsl:for-each>
								</div>

								<!-- Fire Team Advances -->
								<div>
									<xsl:for-each select="../../bs:selections/bs:selection">
										<xsl:if test="@type='upgrade'">
											<xsl:if test="../../@type='unit'">
												<span class="ability-heading">Advances:</span>

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
																	<xsl:value-of select="bs:characteristics/bs:characteristic[@name='Description']/@value"/>
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
									<span>Experience: &#9744; &#9744; <font color="red">&#9744; </font> &#9744; &#9744; &#9744; <font color="red">&#9744; </font> &#9744; &#9744; &#9744; &#9744; <font color="red">&#9744;</font></span>
									<span>Flesh Wounds: &#9744; &#9744; &#9744;</span>
									<span>Convalescence: &#9744;</span>
									<span>New Recruit: &#9744;</span>
								</div>
								<!-- /Experience -->

							</div>
							<!-- /Card Front -->

							<!-- Card Back -->
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
							<!-- /Card Back -->
							<!-- endinject -->

						</xsl:if>
					</xsl:for-each>
				</section>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
