	<!-- Renders the unit cards -->
	<xsl:template match="bs:selection[@type='model']" mode="card">
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
		<div class="card">
			<div class="header"> <!-- NAME -->
	            <div> <!-- CUSTOM NAME -->
	                <xsl:value-of select="@customName"/>
	            </div>
							<div>  <!-- SUBFACTION -->
								<xsl:value-of select="bs:selections/bs:selection/bs:categories/bs:category/@name"/>
							</div>
	            <div> <!-- POINTS -->
	                <xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/>
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
			<!-- WEAPONS -->
			<div>
	            <xsl:variable name="weapons" select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Weapon']"/>
	            <table class="weapons" cellspacing="0">
	                <tr>
	                    <xsl:for-each select="$weapons[1]">
	                        <th>
	                            <xsl:value-of select="@typeName"/>
	                        </th>
	                        <xsl:apply-templates mode="header"/>                    
	                    </xsl:for-each>
	                </tr>
	                <xsl:for-each select="$weapons">
	                    <tr>
	                        <td>
	                            <xsl:value-of select="@name"/>
	                        </td>
	                        <xsl:apply-templates mode="body"/>                    
	                    </tr>
	                </xsl:for-each>
	            </table>
	        </div>
			<!-- WARGEAR -->
	        <div> 
	            <xsl:variable name="wargear" select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Wargear']"/>
	            <table class="weapons" cellspacing="0">
	                <xsl:for-each select="$wargear">
	                    <tr>
	                        <td>
	                            <xsl:value-of select="@name"/>
	                        </td>
	                        <xsl:apply-templates mode="body"/>
	                    </tr>
	                </xsl:for-each>
	            </table>
	        </div>
			<!-- /WARGEAR -->
			<!-- ABILITIES -->
	        <div class="abilities">
	            <xsl:variable name="abilities" select="bs:profiles/bs:profile[@typeName='Ability']"/>
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
			<div class="exp">
				<div>Experience: <span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span></div>
				<div>Flesh Wounds: &#9744; &#9744; &#9744;</div>
				<div>Convalescence: &#9744;</div>
				<div>New Recruit: &#9744;</div>
			</div>
			<!-- /EXP TRACK -->
		</div>
	</xsl:template>