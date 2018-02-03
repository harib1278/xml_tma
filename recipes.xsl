<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />
	<xsl:template match="/">
		<html>
			<head>
				<title>Example</title>
				<link href="recipes.css" rel="stylesheet" type="text/css"/>
			</head>
			<body>
				<h2>Recipes</h2>
				<xsl:for-each select="//recipe">
					<xsl:sort select="./recipe_header/additional_info/cook_time"/>
					<xsl:sort select="./recipe_header/title"/>
					<table>
						<xsl:for-each select="./recipe_header">
							<tr>
								<td class="header">

								</td>
								<td class="title">
									<b>
										<xsl:value-of select="title" />
									</b>
								</td>
							</tr>
							<tr>
								<td class="header">
								Preperation Time:
								</td>
								<td>
									<xsl:for-each select="./additional_info">
										<xsl:value-of select="prep_time" />	Mins
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="header">
								Cooking Time:
								</td>
								<td>
									<xsl:for-each select="./additional_info">
										<xsl:value-of select="cook_time" />	Mins
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="header">
								Difficulty:
								</td>
								<td>
									<xsl:for-each select="./additional_info">
										<xsl:value-of select="difficulty" />
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="header">
								Serves:
								</td>
								<td>
									<xsl:for-each select="./additional_info">
										<xsl:value-of select="serves" />
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="header">
								Description:
								</td>
								<td>
									<xsl:value-of select="description" />
								</td>
							</tr>
						</xsl:for-each>
						<xsl:for-each select="./recipe_ingredients">
							<tr>
								<td class="header">
								Ingredients:
								</td>
								<td>
									<xsl:for-each select="./ingredient_list">
										<xsl:for-each select="./ingredient">
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
								</td>
							</tr>
						</xsl:for-each>
						<xsl:for-each select="./recipe_header">
							<tr>
								<td class="header">

								</td>
								<td>
									<xsl:variable name="CookTime" select="./additional_info/cook_time"/>
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
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>