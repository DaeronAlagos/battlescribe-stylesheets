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
                        <xsl:choose>
                            <xsl:when test="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Intelligence']">
                                <xsl:value-of
                                        select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Intelligence']/@number"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of
                                        select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Intelligence']"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </span>
                </td>
                <td class="roster-cell-heading">Current Kill Team's Name</td>
                <td></td>
            </tr>
            <tr>
                <td class="roster-cell-heading">Mission</td>
                <td></td>
                <td>Materiel
                    <xsl:choose>
                        <xsl:when
                                test="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='1x Material']">
                            <xsl:value-of
                                    select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='1x Materiel']/@number"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of
                                    select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Materiel']/@number"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td class="roster-cell-heading">Background</td>
                <td></td>
                <td>Morale
                    <xsl:choose>
                        <xsl:when
                                test="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='1x Morale']">
                            <xsl:value-of
                                select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='1x Morale']/@number"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of
                                select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Morale']/@number"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td class="roster-cell-heading">Squad Quirk</td>
                <td></td>
                <td>Territory
                    <xsl:choose>
                        <xsl:when
                                test="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='1x Territory']">
                            <xsl:value-of
                                select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='1x Territory']/@number"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of
                                select="bs:selections/bs:selection[@name='Resources']/bs:selections/bs:selection[@name='Territory']/@number"/>
                        </xsl:otherwise>
                    </xsl:choose>
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
                            <!-- Custom Name -->
                            <td>
                                <xsl:value-of select="@customName"/>
                            </td>
                            <!-- Name -->
                            <td>
                                <xsl:value-of select="@name"/>
                            </td>
                            <!-- Wargear -->
                            <td>
                                <xsl:for-each select="bs:selections/bs:selection">
                                    <xsl:if test="not(contains($specialisms, @name))">
                                        <xsl:value-of select="@name"/>
                                    </xsl:if>
                                </xsl:for-each>
                            </td>
                            <!-- Experience -->
                            <td></td>
                            <!-- Specialism/Abilities -->
                            <td>
                                <xsl:for-each select="bs:selections/bs:selection">
                                    <xsl:if test="contains($specialisms, @name)">
                                        <span><xsl:value-of select="@name"/>, </span>
                                    </xsl:if>
                                </xsl:for-each>
                                <xsl:for-each select="bs:rules/bs:rule">
                                    <span><xsl:value-of select="@name"/>, </span>
                                </xsl:for-each>
                                <xsl:for-each select="bs:profiles/bs:profile[@profileTypeName='Ability']">
                                    <span><xsl:value-of select="@name"/>, </span>
                                </xsl:for-each>
                            </td>
                            <!-- Demeanour -->
                            <td></td>
                            <!-- Points -->
                            <td>
                                <xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/>
                            </td>
                        </tr>
                    </xsl:when>
                    <xsl:when test="@type='unit'">
                        <xsl:for-each select="bs:selections/bs:selection[@type='model']">
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
                            <!-- Custom Name -->
                            <td>
                                <xsl:value-of select="@customName"/>
                            </td>
                            <!-- Name -->
                            <td>
                                <xsl:value-of select="@name"/>
                            </td>
                            <!-- Wargear -->
                            <td>
                                <xsl:for-each select="bs:selections/bs:selection">
                                    <xsl:if test="not(contains($specialisms, @name))">
                                        <span><xsl:value-of select="@name"/>, </span>
                                    </xsl:if>
                                </xsl:for-each>
                            </td>
                            <!-- Experience -->
                            <td></td>
                            <!-- Specialism/Abilities -->
                            <td>
                                <xsl:for-each select="bs:selections/bs:selection">
                                    <xsl:if test="contains($specialisms, @name)">
                                        <span><xsl:value-of select="@name"/>, </span>
                                    </xsl:if>
                                </xsl:for-each>
                                <xsl:for-each select="bs:rules/bs:rule">
                                    <span><xsl:value-of select="@name"/>, </span>
                                </xsl:for-each>
                                <xsl:for-each select="bs:profiles/bs:profile[@profileTypeName='Ability']">
                                    <span><xsl:value-of select="@name"/>, </span>
                                </xsl:for-each>
                            </td>
                            <!-- Demeanour -->
                            <td></td>
                            <!-- Points -->
                            <td>
                                <xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/>
                            </td>
                        </tr>
                        </xsl:for-each>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>

        </table>
    </section>
</div>