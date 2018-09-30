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
									<xsl:for-each select="bs:selections/bs:selection/bs:costs/bs:cost">
										<ItemCost>
											<xsl:value-of select="@value"/>
										</ItemCost>
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
											<xsl:for-each select="bs:selections/bs:selection/bs:costs/bs:cost">
												<ItemCost>
													<xsl:value-of select="@value"/>
												</ItemCost>
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