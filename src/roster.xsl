	
	<!-- Renders the rows of the units in the roster table -->
	<xsl:template match="bs:selection[@type='model']" mode="roster">
		<xsl:variable name="nodePoints">
			<xsl:apply-templates mode="points"/>
		</xsl:variable>
		<xsl:variable name="PointsSet" select="exslt:node-set($nodePoints)"/>
	    <tr>
				<td>
					<!-- Custom Name (BS Pro Only) -->
					<xsl:value-of select="@customName"/>
					<div><xsl:value-of select="bs:customNotes/."></xsl:value-of></div>
				</td>
				<!-- /Custom Name (BS Pro Only) -->
	        <td>
				<!-- Unit Name -->
	            <xsl:value-of select="@name"/>
				<!-- /Unit Name -->
	        </td>
	        <td>
				<!-- Weapons -->
	            <xsl:for-each select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Weapon']">
	                <xsl:value-of select="@name"/>, 
	            </xsl:for-each>
				<!-- /Weapons -->

				<!-- Wargear -->
	            <xsl:for-each select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Wargear']">
	                <xsl:value-of select="@name"/>, 
							</xsl:for-each>
							<xsl:for-each select="bs:selections/bs:selection/bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Wargear']">
									<xsl:value-of select="@name"/>, 
							</xsl:for-each>
				<!-- /Wargear -->
	        </td>
	        <td></td>
	        <td>
				<!-- Specialism -->
				<xsl:for-each select="bs:selections/bs:selection">
					<xsl:if test="contains($specialisms, @name)">
						<xsl:value-of select="@name"/>, 
					</xsl:if>
				</xsl:for-each>
				<!-- /Specialism -->

				<!-- Subfaction -->
				<xsl:if test="bs:selections/bs:selection/bs:categories/bs:category">
					<xsl:value-of select="bs:selections/bs:selection/bs:categories/bs:category/@name"/>, 							
				</xsl:if>
				<!-- /Subfation -->

				<!-- Abilities -->
	            <xsl:for-each select="bs:profiles/bs:profile[@typeName='Ability']">
	                <xsl:value-of select="@name"/>,                                 
	            </xsl:for-each>
				<!-- /Abilities -->
	        </td>
	        <td></td>
	        <td>
				<!-- Unit cost including weapons/wargear -->
					<xsl:value-of select="sum($PointsSet/points)"/>
	            <!-- <xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/> -->
				<!-- /Unit cost including weapons/wargear -->
	        </td>
	    </tr>
	</xsl:template>