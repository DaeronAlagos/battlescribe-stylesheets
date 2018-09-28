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
								<td class="rosterValue"></td>
								<td class="rosterValue">Intelligence</td>
								<td class="rosterType">Current Kill Team's Name</td>
								<td class="rosterValue"></td>
							</tr>
							<tr class="rosterHeader">
								<td class="rosterFirst rosterType">Mission</td>
								<td class="rosterValue"></td>
								<td class="rosterValue">Materiel</td>
								<td class="rosterValue"></td>
								<td class="rosterValue"></td>
							</tr>
							<tr class="rosterHeader">
								<td class="rosterFirst rosterType">Background</td>
								<td class="rosterValue"></td>
								<td class="rosterValue">Morale</td>
								<td class="rosterValue"></td>
								<td class="rosterValue"></td>
							</tr>
							<tr class="rosterHeader">
								<td class="rosterFirst rosterType">Squad Quirk</td>
								<td class="rosterValue"></td>
								<td class="rosterValue">Territory</td>
								<td class="rosterValue"></td>
								<td class="rosterValue"></td>
							</tr>
						</table>
					</section>
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
							<xsl:for-each select="bs:forces/bs:force/bs:selections/bs:selection">
								<xsl:if test="@type='model'">
									<tr>
										<td></td>
										<td>
											<xsl:value-of select="@name"/>
										</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</xsl:if>
							</xsl:for-each>
						</table>
					</section>
				</div>