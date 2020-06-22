	<!-- Renders the unit cards -->
	<xsl:template match="bs:selection[@type='model']" mode="card">
		<xsl:variable name="nodePoints">
			<xsl:apply-templates mode="points"/>
		</xsl:variable>
		<xsl:variable name="PointsSet" select="exslt:node-set($nodePoints)"/>
		<div class="card">
			<div class="header"> <!-- NAME -->
				<div> <!-- CUSTOM NAME -->
						<xsl:value-of select="@customName"/>
				</div>
				<div>  <!-- SUBFACTION -->
					<xsl:value-of select="bs:selections/bs:selection/bs:categories/bs:category/@name"/>
				</div>
				<div> <!-- POINTS -->
						<!-- <xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/> -->
							<xsl:value-of select="sum($PointsSet/points)"/>
							Points
				</div>
			</div>
			<!-- UNIT PROFILES -->
			<div> 
				<xsl:variable name="profiles" select="bs:profiles/bs:profile[@typeName='Model']"/>
				<table class="unit" cellspacing="0">
					<tr>
						<th>
							Name
						</th>
						<xsl:apply-templates select="$profiles[1]" mode="header"/>
					</tr>
					<xsl:for-each select="$profiles">
						<tr>
							<td>
								<xsl:value-of select="@name"/>
							</td>
							<xsl:apply-templates mode="body"/>
						</tr>
					</xsl:for-each>
		        </table>
			</div>
			<!-- /UNIT PROFILES -->
			<!-- WARGEAR AND WEAPONS -->
			<div>
				<table class="weapons" cellspacing="0">
					<tr>
						<xsl:for-each select="bs:selections/bs:selection[@type='upgrade'][1]/bs:profiles/bs:profile[@typeName='Weapon'][1]">
							<th>
								<xsl:value-of select="@typeName"/>
							</th>
							<xsl:apply-templates mode="header"/>
						</xsl:for-each>
					</tr>
				</table>
				<xsl:apply-templates select="bs:selections/bs:selection[@type='upgrade']" mode="card-weapon"/>
			</div>
			<!-- /WARGEAR & WEAPONS -->
			<!-- ABILITIES -->
			<xsl:variable name="abilities" select="bs:profiles/bs:profile[@typeName='Ability']"/>
			<xsl:if test="$abilities">
				<div class="abilities">
						<table cellspacing="0">
							<tr>
								<td>Abilities:</td>
								<td></td>
							</tr>
							<xsl:for-each select="$abilities">
									<tr>
											<td>
													<xsl:value-of select="@name"/>
											</td>
											<xsl:apply-templates mode="body"/>
									</tr>
							</xsl:for-each>
						</table>
				</div>
			</xsl:if>
			<!-- /ABILITIES -->

			<!-- PSYCHIC POWERS -->
			<xsl:variable name="psyker" select="bs:profiles/bs:profile[@typeName='Psyker']"/>
			<xsl:variable name="psy-powers" select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Psychic Power']"/>
			<xsl:if test="$psy-powers">
				<div class="psyker">
					<table cellspacing="0">
						<tr>
							<td>Psyker:</td>
							<td>
								Manifest <xsl:value-of select="$psyker/bs:characteristics/bs:characteristic[@name='Manifest']"/> | Deny <xsl:value-of select="$psyker/bs:characteristics/bs:characteristic[@name='Deny']"/>
							</td>
						</tr>
						<xsl:for-each select="$psy-powers">
							<tr>
								<td>
									<xsl:value-of select="@name"/>
								</td>
								<xsl:apply-templates mode="body"/>
							</tr>
						</xsl:for-each>
					</table>
				</div>
			</xsl:if>
			<!-- /PSYCHIC POWERS -->

			<!-- SPECIALISM -->
			<xsl:variable name="specialism" select="bs:selections/bs:selection[contains($specialisms, @name)]"/>
			<xsl:if test="$specialism">
				<div class="specialism">
					<table cellspacing="0">
						<tr>
							<td>Specialism:	</td>
							<td><xsl:value-of select="$specialism/@name"/></td>
						</tr>
						<tr>
							<td>
								<xsl:value-of select="$specialism/bs:selections/bs:selection/bs:profiles/bs:profile/@name"/>
							</td>
								<xsl:apply-templates select="$specialism" mode="body"/>
						</tr>
					</table>
				</div>
			</xsl:if>
			<!-- /SPECIALISM -->

			<!-- EXP TRACK -->
			<div class="card-footer">
				<div class="exp">
					<div>Experience: <span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span></div>
					<div>Flesh Wounds: &#9744; &#9744; &#9744;</div>
					<div>Convalescence: &#9744;</div>
					<div>New Recruit: &#9744;</div>
				</div>
			</div>
			<!-- /EXP TRACK -->
		</div>
	</xsl:template>
