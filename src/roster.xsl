<div>
    <section id="roster-title">
        <div>command roster</div>
        <hr/>
    </section>
    <section id="roster-resources" class="roster-body">
        <table class="roster">
            <tr>
                <td class="roster-cell-heading">Player Name</td>
                <td></td>
                <td class="roster-cell-heading">Resources</td>
                <td class="roster-cell-heading">Current Kill Team Force</td>
                <td>Points</td>
            </tr>
            <tr>
                <td class="roster-cell-heading">Faction</td>
                <td>
                    <xsl:value-of select="@catalogueName"/>
                </td>
                <td>Intelligence
                    <span>
                        <xsl:value-of
                                select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Intelligence']/@number"/>
                    </span>
                </td>
                <td class="roster-cell-heading">Current Kill Team's Name</td>
                <td></td>
            </tr>
            <tr>
                <td class="roster-cell-heading">Mission</td>
                <td></td>
                <td>Materiel
                    <span>
                        <xsl:value-of
                                select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Materiel']/@number"/>
                    </span>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td class="roster-cell-heading">Background</td>
                <td></td>
                <td>Morale
                    <span>
                        <xsl:value-of
                                select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Morale']/@number"/>
                    </span>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td class="roster-cell-heading">Squad Quirk</td>
                <td></td>
                <td>Territory
                    <span>
                        <xsl:value-of
                                select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='1x Territory']/@number"/>
                    </span>
                </td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </section>
    <br/>
    <section id="roster-units" class="roster-body">
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
            <!-- Unit -->
            <xsl:for-each select="bs:selections/bs:selection">
                <xsl:choose>
                    <xsl:when test="@type='model'">
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
                        <tr>
                            <td>
                                <xsl:value-of select="@customName"/>
                            </td>
                            <td>
                                <xsl:value-of select="@name"/>
                            </td>
                            <td>
                                <xsl:for-each select="bs:selections/bs:selection">
                                    <xsl:if test="not(contains($specialisms, @name))">
                                        <xsl:value-of select="@name"/>,
                                    </xsl:if>
                                </xsl:for-each>
                            </td>
                            <td></td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="bs:rules/bs:rule">
                                        <xsl:for-each select="bs:rules/bs:rule">
                                                <xsl:value-of select="@name"/>,
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:for-each select="bs:profiles/bs:profile">
                                                <xsl:if test="@profileTypeName='Ability'">
                                                    <xsl:value-of select="@name"/>,
                                                </xsl:if>
                                        </xsl:for-each>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td></td>
                            <td>
                                <xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/>
                            </td>
                        </tr>

                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="bs:selections/bs:selection">
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
                            <xsl:if test="@type='model'">
                                <tr>
                                    <td></td>
                                    <td>
                                        <xsl:value-of select="@name"/>
                                    </td>
                                    <td>
                                        <xsl:for-each select="bs:selections/bs:selection">
                                            <xsl:if test="not(contains($specialisms, @name))">
                                                <xsl:value-of select="@name"/>,
                                            </xsl:if>
                                        </xsl:for-each>
                                    </td>
                                    <td></td>
                                    <td>
                                        <xsl:for-each select="bs:profiles/bs:profile">
                                            <xsl:if test="@profileTypeName='Ability'">
                                                <xsl:value-of select="@name"/>,
                                            </xsl:if>
                                        </xsl:for-each>
                                    </td>
                                    <td></td>
                                    <td>
                                        <xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/>
                                    </td>
                                </tr>
                            </xsl:if>
                        </xsl:for-each>

                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <!-- /Unit -->

        </table>
    </section>
</div>