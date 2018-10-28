								<div class="card">
									<div style="padding-left: 3px;">Tactics</div>
									<table>
										<th>Name</th>
										<th>Description</th>
										<th>Cost</th>
										<xsl:for-each select="bs:profiles/bs:profile">
									
											<tr>
												<td>
													<xsl:value-of select="@name" />
												</td>
												<td class="ability">
													<xsl:value-of select="bs:characteristics/bs:characteristic[@name='Description']/@value" />
												</td>
												<td class="cp-cost">
													<xsl:value-of select="bs:characteristics/bs:characteristic[@name='CP']/@value" /> CP
												</td>
											</tr>	
										
										</xsl:for-each>
									</table>
								</div>