<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/recipe">
		<html>
			<body>
				<h2>Recipes</h2>
				<table border="1">
					<xsl:for-each select="//recipe_header">
						<tr>
							<td>

							</td>
							<td>
								<b>
									<xsl:value-of select="title" />
								</b>
							</td>
						</tr>
						<tr>
							<td>
								Preperation Time:
							</td>
							<td>
								<xsl:for-each select="//additional_info">
									<xsl:value-of select="prep_time" />	Mins
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td>
								Cooking Time:
							</td>
							<td>
								<xsl:for-each select="//additional_info">
									<xsl:value-of select="cook_time" />	Mins
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td>
								Difficulty:
							</td>
							<td>
								<xsl:for-each select="//additional_info">
									<xsl:value-of select="difficulty" />
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td>
								Serves:
							</td>
							<td>
								<xsl:for-each select="//additional_info">
									<xsl:value-of select="serves" />
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td>
								Description:
							</td>
							<td>
								<xsl:value-of select="description" />
							</td>
						</tr>
						<tr>
							<td>
								Ingredients:
							</td>
							<td>
								<xsl:for-each select="//recipe_ingredients">
									<xsl:for-each select="//ingredient_list">
										<xsl:for-each select="//ingredient">
											<ul>
												<li>
													<xsl:if test="quantity != ''">													
														<xsl:value-of select="quantity" />
														<xsl:value-of select="//quantity/@unit"/>
													</xsl:if>
													<xsl:value-of select="item" />
													<xsl:if test="more_info != ''">
														<xsl:value-of select="more_info"/>
													</xsl:if>	
												</li>
											</ul>
										</xsl:for-each>								
									</xsl:for-each>								
								</xsl:for-each>								
							</td>
						</tr>
						<tr>
							<td>

							</td>
							<td>
								<xsl:variable name="CookTime" select="//additional_info/cook_time"/>
								<xsl:variable name="MediumLimit" select="60" />
								<xsl:variable name="QuickLimit" select="30" />
								<xsl:choose>
									<xsl:when test="$CookTime &gt; $MediumLimit">
										<h4>Slow burner</h4>
									</xsl:when>
									<xsl:when test="$CookTime &lt;= $MediumLimit and $CookTime &gt;= $QuickLimit">
										<h4>Medium burner</h4>
									</xsl:when>
									<xsl:otherwise>
										<h4>Quick and easy</h4>
									</xsl:otherwise>
								</xsl:choose>
								
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>