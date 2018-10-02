				<div>
					<section>
						<div>command roster</div>
						<hr/>
					</section>
					<section>
						<table>
							<tr >
								<td>Player Name</td>
								<td></td>
								<td>Resources</td>
								<td>Current Kill Team Force</td>
								<td>Points</td>
							</tr>
							<tr>
								<td>Faction</td>
								<td>
									<xsl:value-of select="@catalogueName" />
								</td>
								<td>Intelligence
									<span>
										<xsl:value-of select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Intelligence']/@number" />
									</span>
								</td>
								<td>Current Kill Team's Name</td>
								<td></td>
							</tr>
							<tr>
								<td>Mission</td>
								<td></td>
								<td>Materiel
									<span>
										<xsl:value-of select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Materiel']/@number" />
									</span>
								</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>Background</td>
								<td></td>
								<td>Morale
									<span>
										<xsl:value-of select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Morale']/@number" />
									</span>
								</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>Squad Quirk</td>
								<td></td>
								<td>Territory
									<span>
										<xsl:value-of select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Territory']/@number" />
									</span>
								</td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</section>
					<br/>
					<section>
						<table>
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
										<td>
											<xsl:value-of select="@customName" />
										</td>
										<td>
											<xsl:value-of select="@name"/>
										</td>
										<td>
											<xsl:for-each select="bs:selections/bs:selection">
												<xsl:if test="not(contains($specialisms, @name))">
													<xsl:value-of select="@name" />, 
												</xsl:if>
											</xsl:for-each>
										</td>
										<td></td>
										<td>
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
												<td>
													<xsl:for-each select="bs:selections/bs:selection">
														<xsl:if test="not(contains($specialisms, @name))">
															<xsl:value-of select="@name" />, 
														</xsl:if>
													</xsl:for-each>
												</td>
												<td></td>
												<td>
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