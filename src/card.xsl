							<!-- Card Front -->
							<div class="card">
								<xsl:variable name="nodePoints">
									<xsl:for-each select="bs:selections/bs:selection/bs:costs/bs:cost">
										<ItemCost>
											<xsl:value-of select="@value"/>
										</ItemCost>
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
											<!-- <span class="f9">
												<xsl:value-of select="@name"/>
											</span>
											<table>
												<xsl:for-each select="bs:selections/bs:selection">
													<tr class="body">
														<td class="first f8">
															<xsl:value-of select="@name"/>
														</td>
														<td class="f8">
															<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='Description']/@value"/>
														</td>
													</tr>
												</xsl:for-each>
											</table>
										</xsl:if>
									</xsl:for-each>
								</div>
								<!-- /Specialism -->

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