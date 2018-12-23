<!-- Card Front -->
<div class="card">
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
    <div id="name">
        <div style="float:left;">
            <xsl:value-of select="@customName"/>
        </div>
        <div style="float:right;">
            <xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/>
            Points
        </div>
    </div>
    <!-- Unit -->
    <div>
        <table>
            <tr class="unit-line">
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
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='M']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='WS']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='BS']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='S']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='T']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='W']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='A']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='Ld']/@value"/>
                </td>
                <td>
                    <xsl:value-of
                            select="bs:profiles/bs:profile[@profileTypeName='Model']/bs:characteristics/bs:characteristic[@name='Sv']/@value"/>
                </td>
            </tr>
        </table>
    </div>
    <!-- /Unit -->
    <!-- Weapons -->
    <div>
        <table>
            <tr class="weapon-line">
                <th>Weapon</th>
                <th>Range</th>
                <th>Type</th>
                <th>S</th>
                <th>AP</th>
                <th>D</th>
                <th class="ability">Abilities</th>
            </tr>
            <xsl:for-each select="bs:selections/bs:selection">
                <xsl:if test="not(contains($specialisms, @name))">
                    <xsl:choose>
                        <xsl:when test="bs:profiles/bs:profile">
                            <xsl:for-each select="bs:profiles/bs:profile">
                                <tr>
                                    <td>
                                        <xsl:value-of select="@name"/>
                                    </td>
                                    <xsl:choose>
                                        <xsl:when test="bs:characteristics/bs:characteristic[@name='Ability']">
                                            <td colspan="6" class="ability">
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='Ability']/@value"/>
                                            </td>
                                        </xsl:when>
                                        <xsl:when test="bs:characteristics/bs:characteristic[@name='Description']">
                                            <td colspan="6" class="ability">
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='Description']/@value"/>
                                            </td>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <td>
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='Range']/@value"/>
                                            </td>
                                            <td>
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='Type']/@value"/>
                                            </td>
                                            <td>
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='S']/@value"/>
                                            </td>
                                            <td>
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='AP']/@value"/>
                                            </td>
                                            <td>
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='D']/@value"/>
                                            </td>
                                            <td class="ability">
                                                <xsl:value-of
                                                        select="bs:characteristics/bs:characteristic[@name='Abilities']/@value"/>
                                            </td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </tr>
                            </xsl:for-each>

                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:for-each select="bs:selections/bs:selection">
                                <xsl:for-each select="bs:profiles/bs:profile">
                                    <tr class="stat-line">
                                        <td>
                                            <xsl:value-of select="@name"/>
                                        </td>
                                        <xsl:choose>
                                            <xsl:when test="bs:characteristics/bs:characteristic[@name='Ability']">
                                                <td colspan="6" class="ability">
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='Ability']/@value"/>
                                                </td>
                                            </xsl:when>
                                            <xsl:when test="bs:characteristics/bs:characteristic[@name='Description']">
                                                <td colspan="6" class="ability">
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='Description']/@value"/>
                                                </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <td>
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='Range']/@value"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='Type']/@value"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='S']/@value"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='AP']/@value"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='D']/@value"/>
                                                </td>
                                                <td class="ability">
                                                    <xsl:value-of
                                                            select="bs:characteristics/bs:characteristic[@name='Abilities']/@value"/>
                                                </td>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </tr>
                                </xsl:for-each>
                            </xsl:for-each>

                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:for-each>
        </table>
    </div>
    <!-- /Weapons -->

    <!-- Abilities -->
    <div>
        <div class="abilities-heading">Abilities:</div>
        <table>
            <xsl:for-each select="bs:profiles/bs:profile">
                <xsl:if test="@profileTypeName='Ability'">
                    <tr>
                        <td>
                            <xsl:value-of select="@name"/>
                        </td>
                        <td class="ability">
                            <xsl:value-of select="bs:characteristics/bs:characteristic/@value"/>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="bs:rules/bs:rule">
                <tr>
                    <td>
                        <xsl:value-of select="@name"/>
                    </td>
                    <td>
                        <xsl:value-of select="bs:description"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </div>
    <!-- /Abilities -->

    <!-- Specialism -->
    <div>
        <xsl:for-each select="bs:selections/bs:selection">
            <xsl:if test="contains($specialisms, @name)">
                <div class="abilities-heading">
                    Specialism:
                    <span class="specialism">
                        <xsl:value-of select="@name"/>
                    </span>
                </div>
                <table>
                    <xsl:for-each select="bs:selections/bs:selection/bs:profiles/bs:profile">
                        <xsl:if test="@profileTypeName='Ability'">
                            <tr>
                                <td>
                                    <xsl:value-of select="@name"/>
                                </td>
                                <td class="ability">
                                    <xsl:value-of select="bs:characteristics/bs:characteristic/@value"/>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>

            </xsl:if>
        </xsl:for-each>
    </div>
    <!-- /Specialism-->

    <!-- Tactics-->
    <xsl:for-each select="bs:selections/bs:selection">
        <xsl:if test="contains($specialisms, @name)">
            <xsl:if test="not(bs:selections/bs:selection/bs:profiles/bs:profile[@profileTypeName='Ability'])">
                <div>
                    <div class="abilities-heading">
                        Tactics:
                    </div>
                    <table>
                        <xsl:for-each select="bs:selections/bs:selection">
                            <xsl:for-each select="bs:profiles/bs:profile">
                                <xsl:if test="not(@profileTypeName='Ability')">
                                    <tr>
                                        <td>
                                            <xsl:value-of select="@name"/>
                                        </td>
                                        <td class="ability">
                                            <xsl:value-of select="bs:characteristics/bs:characteristic[@name='Description']/@value"/>
                                        </td>
                                        <td class="cp-cost">
                                            <xsl:value-of select="bs:characteristics/bs:characteristic[@name='CP']/@value"/>
                                            CP
                                        </td>
                                    </tr>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:for-each>
                    </table>
                </div>
            </xsl:if>
        </xsl:if>
    </xsl:for-each>
    <!-- /Tactics-->

    <!-- Fire Team Advances -->
    <div>
        <xsl:for-each select="../../bs:selections/bs:selection">
            <xsl:if test="@type='upgrade'">
                <xsl:if test="../../@type='unit'">
                    <span class="abilities-heading">Advances:</span>

                </xsl:if>
                <table>

                    <xsl:for-each select="bs:selections/bs:selection">
                        <xsl:if test="contains($advances, @name)">
                            <xsl:for-each select="bs:profiles/bs:profile">
                                <tr>
                                    <td>
                                        <xsl:value-of select="@name"/>
                                    </td>
                                    <td>
                                        <xsl:value-of
                                                select="bs:characteristics/bs:characteristic[@name='Description']/@value"/>
                                    </td>
                                </tr>
                            </xsl:for-each>

                        </xsl:if>
                    </xsl:for-each>
                </table>

            </xsl:if>
        </xsl:for-each>
    </div>
    <!-- /Fire Team Advances -->

    <!-- Experience -->
    <div id="experience">
        <span>Experience: &#9744; &#9744; <font color="red">&#9744;</font> &#9744; &#9744; &#9744; <font color="red">
            &#9744;
        </font> &#9744; &#9744; &#9744; &#9744;
            <font color="red">&#9744;</font>
        </span>
        <span>Flesh Wounds: &#9744; &#9744; &#9744;</span>
        <span>Convalescence: &#9744;</span>
        <span>New Recruit: &#9744;</span>
    </div>
    <!-- /Experience -->

</div>
        <!-- /Card Front -->

        <!-- Card Back -->
        <!--
        <xsl:if test="bs:customNotes">
        <div style="height: document.getElementsByClassName('card').previousElementSibling">
            <div>
                <div>
                    <div>History</div>
                    <div>
                        <xsl:value-of select="bs:customNotes"/>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        </xsl:if>
        -->
        <!-- /Card Back -->