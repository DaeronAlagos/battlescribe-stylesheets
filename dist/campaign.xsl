<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:bs="http://www.battlescribe.net/schema/rosterSchema" xmlns:exslt="http://exslt.org/common" extension-element-prefixes="exslt">
	<xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/bs:roster/bs:forces/bs:force">
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
					.resource{float:right;}
					table#rosterUnits td {background-color:#FFFFFF;}
					.f6 {font-size:6px;}
				</style>
			</head>
			<body>
				<section>

					<!-- inject:src/roster.xsl -->
									<div class="container">
					<section>
						<div class="pageTitle">command roster</div>
						<hr/>
					</section>
					<section>
						<table>
							<tr class="rosterHeader">
								<td class="rosterFirst rosterType">Player Name</td>
								<td class="rosterValue"></td>
								<td class="rosterType">Resources</td>
								<td class="rosterType">Current Kill Team Force</td>
								<td class="rosterValue" style="text-align:right;">Points</td>
							</tr>
							<tr class="rosterHeader">
								<td class="rosterFirst rosterType">Faction</td>
								<td class="rosterValue">
									<xsl:value-of select="@catalogueName" />
								</td>
								<td class="rosterValue">Intelligence
									<span class="resource">
										<xsl:value-of select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Intelligence']/@number" />
									</span>
								</td>
								<td class="rosterType">Current Kill Team's Name</td>
								<td class="rosterValue"></td>
							</tr>
							<tr class="rosterHeader">
								<td class="rosterFirst rosterType">Mission</td>
								<td class="rosterValue"></td>
								<td class="rosterValue">Materiel
									<span class="resource">
										<xsl:value-of select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Materiel']/@number" />
									</span>
								</td>
								<td class="rosterValue"></td>
								<td class="rosterValue"></td>
							</tr>
							<tr class="rosterHeader">
								<td class="rosterFirst rosterType">Background</td>
								<td class="rosterValue"></td>
								<td class="rosterValue">Morale
									<span class="resource">
										<xsl:value-of select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Morale']/@number" />
									</span>
								</td>
								<td class="rosterValue"></td>
								<td class="rosterValue"></td>
							</tr>
							<tr class="rosterHeader">
								<td class="rosterFirst rosterType">Squad Quirk</td>
								<td class="rosterValue"></td>
								<td class="rosterValue">Territory
									<span class="resource">
										<xsl:value-of select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Territory']/@number" />
									</span>
								</td>
								<td class="rosterValue"></td>
								<td class="rosterValue"></td>
							</tr>
						</table>
					</section>
					<br/>
					<section>
						<table id="rosterUnits">
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
								<xsl:if test="@type='model'">
									<tr>
										<td></td>
										<td>
											<xsl:value-of select="@name"/>
										</td>
										<td class="f8">
											<xsl:for-each select="bs:selections/bs:selection">
												<xsl:if test="not(contains($specialisms, @name))">
													<xsl:value-of select="@name" />, 
												</xsl:if>
											</xsl:for-each>
										</td>
										<td></td>
										<td class="f8">
											<xsl:for-each select="bs:profiles/bs:profile">
												<xsl:if test="@profileTypeName='Ability'">
													<xsl:value-of select="@name"/>, 
												</xsl:if>
											</xsl:for-each>
										</td>
										<td></td>
										<td>
											<xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="bs:selections/bs:selection">
								<xsl:if test="@type='unit'">
									<xsl:for-each select="bs:selections/bs:selection">
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
										<xsl:if test="@type='model'">
											<tr>
												<td></td>
												<td>
													<xsl:value-of select="@name"/>
												</td>
												<td class="f8">
													<xsl:for-each select="bs:selections/bs:selection">
														<xsl:if test="not(contains($specialisms, @name))">
															<xsl:value-of select="@name" />, 
														</xsl:if>
													</xsl:for-each>
												</td>
												<td></td>
												<td class="f8">
													<xsl:for-each select="bs:profiles/bs:profile">
														<xsl:if test="@profileTypeName='Ability'">
															<xsl:value-of select="@name"/>, 
														</xsl:if>
													</xsl:for-each>
												</td>
												<td></td>
												<td>
													<xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
							</xsl:for-each>
						</table>
					</section>
				</div>
					<!-- endinject -->
				
				</section>
				<br/>
				
				<section>
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
								<div class="extra">
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
										<tr class="statHeader">
											<th class="first">Name</th>
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
										<tr class="body">
											<td class="first">
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
										<tr class="statHeader">
											<th class="first">Weapon</th>
											<th style="width:10%;">Range</th>
											<th style="width:10%;">Type</th>
											<th class="weaponStat">S</th>
											<th class="weaponStat">AP</th>
											<th class="weaponStat">D</th>
											<th>Abilities</th>
										</tr>
										<xsl:for-each select="bs:selections/bs:selection">
											<xsl:if test="not(contains($specialisms, @name))">
												<xsl:for-each select="bs:profiles/bs:profile">
													<tr class="body">
														<td class="first">
															<xsl:value-of select="@name"/>
														</td>
														<xsl:choose>
															<xsl:when test="bs:characteristics/bs:characteristic[@name='Ability']">
																<td colspan="6" class="f8">
																	<xsl:value-of select="bs:characteristics/bs:characteristic[@name='Ability']/@value"/>
																</td>
															</xsl:when>
															<xsl:when test="bs:characteristics/bs:characteristic[@name='Description']">
																<td colspan="6" class="f8">
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
																<td class="f8">
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
									<table>
										<tr>
											<th colspan="2" class="first statHeader">Abilities:</th>
										</tr>
										<xsl:for-each select="bs:profiles/bs:profile">
											<xsl:if test="@profileTypeName='Ability'">
												<tr class="body">
													<td class="first f8">
														<xsl:value-of select="@name"/>
													</td>
													<td class="f8">
														<xsl:value-of select="bs:characteristics/bs:characteristic/@value"/>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="bs:rules/bs:rule">
											<tr class="body">
												<td class="first">
													<xsl:value-of select="@name"/>
												</td>
												<td class="f8">
													<xsl:value-of select="bs:description"/>
												</td>
											</tr>
										</xsl:for-each>
									</table>
								</div>
								<!-- /Abilities -->

								<!-- Specialism -->
								<div class="extra">
									<xsl:for-each select="bs:selections/bs:selection">
										<xsl:if test="contains($specialisms, @name)">
											<span style="font-weight: bold;" class="f9">Specialism: </span>
											<table>
												<xsl:for-each select="bs:selections/bs:selection/bs:profiles/bs:profile">
													<xsl:if test="@profileTypeName='Ability'">
														<tr class="body">
															<td class="first f8">
																<xsl:value-of select="@name"/>
															</td>
															<td class="f8">
																<xsl:value-of select="bs:characteristics/bs:characteristic/@value"/>
															</td>
														</tr>
													</xsl:if>
												</xsl:for-each>
											</table>
											<span style="font-weight: bold;" class="f9">Tactics: </span>
											<table>
												<xsl:for-each select="bs:selections/bs:selection/bs:profiles/bs:profile">
													<xsl:if test="not(@profileTypeName='Ability')">
														<tr class="body">
															<td class="first f8">
																<xsl:value-of select="@name"/>
															</td>
															<td class="f8">
																<xsl:value-of select="bs:characteristics/bs:characteristic[@name='Description']/@value"/>
															</td>
															<td>
																<xsl:value-of select="bs:characteristics/bs:characteristic[@name='CP']/@value"/>
															</td>
														</tr>
													</xsl:if>
												</xsl:for-each>
											</table>
										</xsl:if>
									</xsl:for-each>
								</div>

								<!-- Fire Team Advances -->
								<div class="extra">
									<xsl:for-each select="../../bs:selections/bs:selection">
										<xsl:if test="@type='upgrade'">
											<xsl:if test="../../@type='unit'">
												<span style="font-weight: bold;" class="f9">Advances: </span>

											</xsl:if>
													<table>

											<xsl:for-each select="bs:selections/bs:selection">
												<xsl:if test="contains($advances, @name)">
														<xsl:for-each select="bs:profiles/bs:profile">
															<tr class="body">
																<td class="first f8">
																	<xsl:value-of select="@name"/>
																</td>
																<td class="f8">
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
								<div class="campaign f8">
									<div class="extra">Experience: &#9744; &#9744; <font color="red">&#9744; </font> &#9744; &#9744; &#9744; <font color="red">&#9744; </font> &#9744; &#9744; &#9744; &#9744; <font color="red">&#9744;</font></div>
									<div class="extra">Flesh Wounds: &#9744; &#9744; &#9744;</div>
									<div class="extra">Convalescence: &#9744;</div>
									<div class="extra">New Recruit: &#9744;</div>
								</div>
								<!-- /Experience -->

							</div>
							<!-- /Card Front -->

							<!-- Card Back -->
							<xsl:if test="bs:customNotes">
								<div class="card" style="height: document.getElementsByClassName('card').previousElementSibling">
									<div class="customNotes">
										<div class="history">
											<div class="historyTitle">History</div>
											<div class="historyText">
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
					<xsl:for-each select="bs:selections/bs:selection">
						<xsl:if test="@type='unit'">
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
								<div class="extra">
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
										<tr class="statHeader">
											<th class="first">Name</th>
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
										<tr class="body">
											<td class="first">
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
										<tr class="statHeader">
											<th class="first">Weapon</th>
											<th style="width:10%;">Range</th>
											<th style="width:10%;">Type</th>
											<th class="weaponStat">S</th>
											<th class="weaponStat">AP</th>
											<th class="weaponStat">D</th>
											<th>Abilities</th>
										</tr>
										<xsl:for-each select="bs:selections/bs:selection">
											<xsl:if test="not(contains($specialisms, @name))">
												<xsl:for-each select="bs:profiles/bs:profile">
													<tr class="body">
														<td class="first">
															<xsl:value-of select="@name"/>
														</td>
														<xsl:choose>
															<xsl:when test="bs:characteristics/bs:characteristic[@name='Ability']">
																<td colspan="6" class="f8">
																	<xsl:value-of select="bs:characteristics/bs:characteristic[@name='Ability']/@value"/>
																</td>
															</xsl:when>
															<xsl:when test="bs:characteristics/bs:characteristic[@name='Description']">
																<td colspan="6" class="f8">
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
																<td class="f8">
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
									<table>
										<tr>
											<th colspan="2" class="first statHeader">Abilities:</th>
										</tr>
										<xsl:for-each select="bs:profiles/bs:profile">
											<xsl:if test="@profileTypeName='Ability'">
												<tr class="body">
													<td class="first f8">
														<xsl:value-of select="@name"/>
													</td>
													<td class="f8">
														<xsl:value-of select="bs:characteristics/bs:characteristic/@value"/>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="bs:rules/bs:rule">
											<tr class="body">
												<td class="first">
													<xsl:value-of select="@name"/>
												</td>
												<td class="f8">
													<xsl:value-of select="bs:description"/>
												</td>
											</tr>
										</xsl:for-each>
									</table>
								</div>
								<!-- /Abilities -->

								<!-- Specialism -->
								<div class="extra">
									<xsl:for-each select="bs:selections/bs:selection">
										<xsl:if test="contains($specialisms, @name)">
											<span style="font-weight: bold;" class="f9">Specialism: </span>
											<table>
												<xsl:for-each select="bs:selections/bs:selection/bs:profiles/bs:profile">
													<xsl:if test="@profileTypeName='Ability'">
														<tr class="body">
															<td class="first f8">
																<xsl:value-of select="@name"/>
															</td>
															<td class="f8">
																<xsl:value-of select="bs:characteristics/bs:characteristic/@value"/>
															</td>
														</tr>
													</xsl:if>
												</xsl:for-each>
											</table>
											<span style="font-weight: bold;" class="f9">Tactics: </span>
											<table>
												<xsl:for-each select="bs:selections/bs:selection/bs:profiles/bs:profile">
													<xsl:if test="not(@profileTypeName='Ability')">
														<tr class="body">
															<td class="first f8">
																<xsl:value-of select="@name"/>
															</td>
															<td class="f8">
																<xsl:value-of select="bs:characteristics/bs:characteristic[@name='Description']/@value"/>
															</td>
															<td>
																<xsl:value-of select="bs:characteristics/bs:characteristic[@name='CP']/@value"/>
															</td>
														</tr>
													</xsl:if>
												</xsl:for-each>
											</table>
										</xsl:if>
									</xsl:for-each>
								</div>

								<!-- Fire Team Advances -->
								<div class="extra">
									<xsl:for-each select="../../bs:selections/bs:selection">
										<xsl:if test="@type='upgrade'">
											<xsl:if test="../../@type='unit'">
												<span style="font-weight: bold;" class="f9">Advances: </span>

											</xsl:if>
													<table>

											<xsl:for-each select="bs:selections/bs:selection">
												<xsl:if test="contains($advances, @name)">
														<xsl:for-each select="bs:profiles/bs:profile">
															<tr class="body">
																<td class="first f8">
																	<xsl:value-of select="@name"/>
																</td>
																<td class="f8">
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
								<div class="campaign f8">
									<div class="extra">Experience: &#9744; &#9744; <font color="red">&#9744; </font> &#9744; &#9744; &#9744; <font color="red">&#9744; </font> &#9744; &#9744; &#9744; &#9744; <font color="red">&#9744;</font></div>
									<div class="extra">Flesh Wounds: &#9744; &#9744; &#9744;</div>
									<div class="extra">Convalescence: &#9744;</div>
									<div class="extra">New Recruit: &#9744;</div>
								</div>
								<!-- /Experience -->

							</div>
							<!-- /Card Front -->

							<!-- Card Back -->
							<xsl:if test="bs:customNotes">
								<div class="card" style="height: document.getElementsByClassName('card').previousElementSibling">
									<div class="customNotes">
										<div class="history">
											<div class="historyTitle">History</div>
											<div class="historyText">
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
						</xsl:if>
					</xsl:for-each>

				</section>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
