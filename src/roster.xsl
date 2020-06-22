	
	<!-- Renders the rows of the units in the roster table -->
	<xsl:template match="bs:selection[@type='model']" mode="roster">
		<xsl:variable name="nodePoints">
			<xsl:apply-templates mode="points"/>
		</xsl:variable>
		<xsl:variable name="PointsSet" select="exslt:node-set($nodePoints)"/>
	    <tr>
				<!-- Custom Name (BS Pro Only) -->
				<td>
					<xsl:value-of select="@customName"/>
					<div><xsl:value-of select="bs:customNotes/."></xsl:value-of></div>
				</td>
				<!-- /Custom Name (BS Pro Only) -->
				<!-- Unit Name -->
				<td>
						<xsl:value-of select="@name"/>
				</td>
				<!-- /Unit Name -->
				<!-- Weapons and Wargear -->
				<td>
					<xsl:apply-templates select="bs:selections/bs:selection[@type='upgrade']" mode="roster-wargear"/>
				</td>
				<!-- /Weapons and Wargear -->
				<!-- Experience -->
					<td></td>
				<!-- /Experience -->
				<!-- Specialism, Subfaction and Abilities -->
				<td>
					<xsl:for-each select="bs:selections/bs:selection">
						<xsl:if test="contains($specialisms, @name)">
							<xsl:value-of select="@name"/>, 
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="bs:selections/bs:selection/bs:categories/bs:category">
						<xsl:value-of select="bs:selections/bs:selection/bs:categories/bs:category/@name"/>, 							
					</xsl:if>
					<xsl:for-each select="bs:profiles/bs:profile[@typeName='Ability']">
							<xsl:value-of select="@name"/>,                                 
					</xsl:for-each>
	        </td>
					<!-- /Specialism, Subfaction and Abilities -->
					<!-- Demeanour -->
					<td></td>
					<!-- /Demeanour -->
					<!-- Unit cost including weapons/wargear -->
					<td>
						<xsl:value-of select="sum($PointsSet/points)"/>
					</td>
					<!-- /Unit cost including weapons/wargear -->
	    </tr>
	</xsl:template>