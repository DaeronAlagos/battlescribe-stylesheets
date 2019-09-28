<xsl:template match="bs:selections/bs:selection/bs:selections/bs:selection">
    <xsl:if test="contains(@name, 'Command Roster')">
        <section>
            <div id="page-heading">command roster</div>
            <hr/>
        </section>
        <section id="roster">
            <table class="roster">
                <tr>
                    <th>Name</th>
                    <th>Model Type</th>
                    <th>Wargear</th>
                    <th>Exp</th>
                    <th>Specialism/Abilities</th>
                    <th>Demeanour</th>
                    <th>Pts</th>
                </tr>
                <xsl:variable name="units" select="../../../.."/>
                <xsl:for-each select="$units/bs:selections/bs:selection[@type='model']">
                    <xsl:call-template name="unit"/>
                </xsl:for-each>
                <xsl:for-each select="$units/bs:selections/bs:selection[@type='unit']/bs:selections/bs:selection[@type='model']">
                    <xsl:call-template name="unit"/>
                </xsl:for-each>
            </table>
        </section>
    </xsl:if>
</xsl:template>

<xsl:template name="unit">
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
        <td></td>
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
            <xsl:for-each select="bs:selections/bs:selection/bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Ability']">
                <xsl:value-of select="@name"/>,                                 
            </xsl:for-each>
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