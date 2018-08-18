<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:bs="http://www.battlescribe.net/schema/rosterSchema">
    <xsl:template match="/bs:roster">
        <html>
            <body>
            <h1>
            	<xsl:value-of select="@gameSystemName"/>
            </h1>
                    <xsl:for-each select="bs:forces/bs:force/bs:selections/bs:selection">
                        <xsl:if test="@type='model'">
                        <div>
                            <table>
                                <tr>
                                    <th>Name</th>
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
                                <tr>
                                    <td>
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
                        <div>
                        	<table>
                        		<tr>
                        			<th>Weapon</th>
                        			<th>Range</th>
                        			<th>Type</th>
                        			<th>S</th>
                        			<th>AP</th>
                        			<th>D</th>
                        			<th>Abilities</th>
                        		</tr>
                        		<xsl:for-each select="bs:selections/bs:selection">
                        		<tr>
                        			<td>
                        				<xsl:value-of select="@name"/>
                        			</td>
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
                        			<td>
                        				<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='Abilities']/@value"/>
                        			</td>
                        		</tr>
                        		</xsl:for-each>
                        	</table>
                        </div>
                        <div>
                        	Abilities:
                        </div>
                        <div>
                        	<xsl:for-each select="bs:profiles/bs:profile">
                        		<span><xsl:value-of select="/@name"/></span>
                        	</xsl:for-each>
                        </div>
                        </xsl:if>
                    </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>