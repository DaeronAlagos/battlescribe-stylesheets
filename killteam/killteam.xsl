<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:bs="http://www.battlescribe.net/schema/rosterSchema">
	
    <xsl:template match="/bs:roster">
    <xsl:variable name="specialisms" select="'Leader|Combat|Zealot|Demolitions'"/>
        <html>
	        <head>
	        	<style>
	        		#card {background-color: #EEEEEE; width:11cm;height:7.5cm;}
	        		table {width: 100%;}
	        		tr.header {background-color: red;}
	        		tr.body {background-color: #FFFFFF;}
	        		th {font-size: 10px; text-align:center;width:7%;}
	        		th.first {text-align: left;width:25%;}
	        		td {font-size: 10px; text-align:center;}
	        		td.first {text-align: left;width:25%;}
	        		.extra {font-size: 12px; margin:0 3px; line-height:18px;}
	        		.abilities {font-size:8px;}
	        	</style>
	        </head>
            <body>
            <h1>
            	<xsl:value-of select="@name"/>
            </h1>
                    <xsl:for-each select="bs:forces/bs:force/bs:selections/bs:selection">
                        <xsl:if test="@type='model'">
                        
                        <!-- Card -->
                        <div id="card">
                        
                        <!-- Unit -->
                        <div>
                            <table>
                                <tr class="header">
                                    <th class="first">Name</th>
                                    <th>M</th>
                                    <th>WS</th>
                                    <th>BS</th>
                                    <th>S</th>
                                    <th>T</th>
                                    <th>W</th>
                                    <th>A</th>
                                    <th>Ld</th>
                                    <th>Sv</th>
                                </tr>
                                <tr class="body">
                                    <td class="first">
                                    	<xsl:value-of select="@name"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='M']/@value"/>
                                    </td>
                                    <td>
                                    	<xsl:value-of select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='WS']/@value"/>
                                    </td>
                                    <td>
                                    	<xsl:value-of select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='BS']/@value"/>
                                    </td>
                                    <td>
                                    	<xsl:value-of select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='S']/@value"/>
                                    </td>
                                    <td>
                                    	<xsl:value-of select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='T']/@value"/>
                                    </td>
                                    <td>
                                    	<xsl:value-of select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='W']/@value"/>
                                    </td>
                                    <td>
                                    	<xsl:value-of select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='A']/@value"/>
                                    </td>
                                    <td>
                                    	<xsl:value-of select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='Ld']/@value"/>
                                    </td>
                                    <td>
                                    	<xsl:value-of select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='Sv']/@value"/>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        
                        <!-- Weapons -->
                        <div>
                        	<table>
                        		<tr class="header">
                        			<th class="first">Weapon</th>
                        			<th>Range</th>
                        			<th>Type</th>
                        			<th>S</th>
                        			<th>AP</th>
                        			<th>D</th>
                        			<th>Abilities</th>
                        		</tr>
                        		<xsl:for-each select="bs:selections/bs:selection">
                        		<xsl:if test="not(contains($specialisms, @name))">
                        		<tr class="body">
                        			<td class="first">
                        				<xsl:value-of select="@name"/>
                        			</td>
                        			<xsl:choose>
                        				<xsl:when test="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='Ability']">
                        					<td colspan="6" class="abilities">
                        						<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='Ability']/@value"/>
                        					</td>
                        				</xsl:when>
                        				<xsl:when test="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='Description']">
                        					<td colspan="6" class="abilities">
                        						<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='Description']/@value"/>
                        					</td>
                        				</xsl:when>
                        				<xsl:otherwise>
                        					<td>
		                        				<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='Range']/@value"/>
		                        			</td>
		                        			<td>
		                        				<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='Type']/@value"/>
		                        			</td>
		                        			<td>
		                        				<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='S']/@value"/>
		                        			</td>
		                        			<td>
		                        				<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='AP']/@value"/>
		                        			</td>
		                        			<td>
		                        				<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='D']/@value"/>
		                        			</td>
		                        			<td class="abilities">
		                        				<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='Abilities']/@value"/>
		                        			</td>
                        				</xsl:otherwise>
                        			</xsl:choose>
                        			
                        			<!-- <td>
                        			<xsl:choose>
                        				<xsl:when test="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='Description']">
                        					<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='Description']/@value"/>
                        				</xsl:when>
                        				<xsl:when test="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='Ability']">
                        					<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='Ability']/@value"/>
                        				</xsl:when>
                        				<xsl:otherwise>
	                        				<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='Abilities']/@description"/>                        				
                        				</xsl:otherwise>
                        			</xsl:choose>
                        			<xsl:if test="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='Abilities']/@description">
                        			</xsl:if>
                        				<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='Abilities']/@value"/>
                        			</td> -->
                        		</tr>
                        		</xsl:if>
                        		</xsl:for-each>
                        	</table>
                        </div>
                        
                        <!-- Abilities -->
                        <div>
                        	<table>
	                        	<tr>
	                        		<th colspan="2" class="first">Abilities:</th>
	                        	</tr>
	                        	<xsl:for-each select="bs:profiles/bs:profile">
	                        		<xsl:if test="@profileTypeName='Ability'">
	                        			<tr class="body">
	                        				<td class="first">
	                        					<xsl:value-of select="@name"/>
	                       					</td>
	                        				<td class="abilities">
	                        					<xsl:value-of select="bs:characteristics/bs:characteristic/@value"/>
	                        				</td>
	                        			</tr>
	                        		</xsl:if>
	                        	</xsl:for-each>
                        	</table>
                        </div>
                        
                        
                        <!-- Specialism -->
                        <div>
	                        <div class="extra" style="float:left; width:250px;">
	                        	Specialism:
	                        	<xsl:for-each select="bs:selections/bs:selection">
	                        		<xsl:if test="contains($specialisms, @name)">
	                        			<xsl:value-of select="@name"/>
	                        		</xsl:if>
	                        	</xsl:for-each>
	                        </div>
	                        <div class="extra">
	                        	Demeanour:
	                        </div>
                        </div>
                        <div class="extra">
                        	Experience:
                        	<xsl:element name="input">
                        		<xsl:attribute name="type">checkbox</xsl:attribute>
                        	</xsl:element>
                        	<xsl:element name="input">
                        		<xsl:attribute name="type">checkbox</xsl:attribute>
                        	</xsl:element>
                        	<xsl:element name="input">
                        		<xsl:attribute name="type">checkbox</xsl:attribute>
                        	</xsl:element>
                        	<xsl:element name="input">
                        		<xsl:attribute name="type">checkbox</xsl:attribute>
                        	</xsl:element>
                        	<xsl:element name="input">
                        		<xsl:attribute name="type">checkbox</xsl:attribute>
                        	</xsl:element>
                        	<xsl:element name="input">
                        		<xsl:attribute name="type">checkbox</xsl:attribute>
                        	</xsl:element>
                        	<xsl:element name="input">
                        		<xsl:attribute name="type">checkbox</xsl:attribute>
                        	</xsl:element>
                        	<xsl:element name="input">
                        		<xsl:attribute name="type">checkbox</xsl:attribute>
                        	</xsl:element>
                        	<xsl:element name="input">
                        		<xsl:attribute name="type">checkbox</xsl:attribute>
                        	</xsl:element>
                        	<xsl:element name="input">
                        		<xsl:attribute name="type">checkbox</xsl:attribute>
                        	</xsl:element>
                        	<xsl:element name="input">
                        		<xsl:attribute name="type">checkbox</xsl:attribute>
                        	</xsl:element>
                        	<xsl:element name="input">
                        		<xsl:attribute name="type">checkbox</xsl:attribute>
                        	</xsl:element>
                        </div>
                        <div class="extra" style="float:left;">
                        	Flesh Wounds:
                        	<xsl:element name="input">
                        		<xsl:attribute name="type">checkbox</xsl:attribute>
                        	</xsl:element>
                        	<xsl:element name="input">
                        		<xsl:attribute name="type">checkbox</xsl:attribute>
                        	</xsl:element>
                        	<xsl:element name="input">
                        		<xsl:attribute name="type">checkbox</xsl:attribute>
                        	</xsl:element>
                        </div>
                        <div class="extra" style="float: left;">
                        	Convalescence:
                        	<xsl:element name="input">
                        		<xsl:attribute name="type">checkbox</xsl:attribute>
                        	</xsl:element>
                        </div>
                        <div class="extra">
                        	New Recruit:
                        	<xsl:element name="input">
                        		<xsl:attribute name="type">checkbox</xsl:attribute>
                        	</xsl:element>
                        </div>
                        
						<!-- End Card -->
                        </div>
                        <br/>
                        </xsl:if>
                        

                    </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>