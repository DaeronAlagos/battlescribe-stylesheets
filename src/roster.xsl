	
	<!-- Renders the rows of the units in the roster table -->
	<xsl:template match="bs:selection[@type='model']" mode="roster">
		<xsl:variable name="rosterPoints">
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
	    <xsl:variable name="subTotal" select="exslt:node-set($rosterPoints)"/>
	    <tr>
	        <td>
				<xsl:value-of select="@customName"/>
			</td>
	        <td>
	            <xsl:value-of select="@name"/>
	        </td>
	        <td>
	            <xsl:for-each select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Weapon']">
	                <xsl:value-of select="@name"/>, 
	            </xsl:for-each>
	            <xsl:for-each select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Wargear']">
	                <xsl:value-of select="@name"/>, 
	            </xsl:for-each>
	        </td>
	        <td></td>
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
	        <td></td>
	        <td>
	            <xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/>
	        </td>
	    </tr>
	</xsl:template>