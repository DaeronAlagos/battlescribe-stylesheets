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
			<div>
				<table class="unit" cellspacing="0">
		            <tr>
		                <th>
		                    Name
		                </th>
		                <xsl:apply-templates select="bs:profiles/bs:profile[@typeName='Model']" mode="header"/>
		            </tr>
		            <tr>
		                <td>
		                    <xsl:value-of select="@name"/>
		                </td>
		                <xsl:apply-templates select="bs:profiles/bs:profile[@typeName='Model']" mode="body"/>
		            </tr>
		        </table>
			</div>
			<div> <!-- WEAPONS -->
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
	        <div> <!-- ABILITIES -->
	            <xsl:variable name="wargear" select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Wargear']"/>
	            <table>
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
	        <div> <!-- ABILITIES -->
				<div>
					<h2>Abilities</h2>				
				</div>
	            <xsl:variable name="abilities" select="bs:profiles/bs:profile[@typeName='Ability']"/>
	            <table>
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
	        <div class="specialism">
	            <xsl:variable name="specialism" select="bs:selections/bs:selection[contains($specialisms, @name)]"/>
	            <xsl:if test="$specialism">
					<div>
						<h2>Specialism</h2>				
					</div>
					<div>
						<h2><xsl:value-of select="$specialism/@name"/></h2>
					</div>
	                <table>
	                    <tr>
	                        <td>
	                            <xsl:value-of select="$specialism/bs:selections/bs:selection/bs:profiles/bs:profile/@name"/>
	                        </td>
	                        <td>
	                            <xsl:apply-templates select="$specialism" mode="body"/>
	                            <!-- <xsl:value-of select="$specialism"/>                         -->
	                        </td>
	                    </tr>
	                </table>
	            </xsl:if>
	        </div>
			<div class="campaign">
				<div>Experience: &#9744; &#9744; <font color="red">&#9744; </font> &#9744; &#9744; &#9744; <font color="red">&#9744; </font> &#9744; &#9744; &#9744; &#9744; <font color="red">&#9744;</font></div>
				<div>Flesh Wounds: &#9744; &#9744; &#9744;</div>
				<div>Convalescence: &#9744;</div>
				<div>New Recruit: &#9744;</div>
			</div>
		</div>
	</xsl:template>