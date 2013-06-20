<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0" xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0" xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0" xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0" xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0" xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0" xmlns:config="urn:oasis:names:tc:opendocument:xmlns:config:1.0" xmlns:ooo="http://openoffice.org/2004/office" xmlns:ooow="http://openoffice.org/2004/writer" xmlns:oooc="http://openoffice.org/2004/calc" xmlns:dom="http://www.w3.org/2001/xml-events" xmlns:xforms="http://www.w3.org/2002/xforms" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rpt="http://openoffice.org/2005/report" xmlns:of="urn:oasis:names:tc:opendocument:xmlns:of:1.2" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:grddl="http://www.w3.org/2003/g/data-view#" xmlns:field="urn:openoffice:names:experimental:ooo-ms-interop:xmlns:field:1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="office style text fo dc meta number svg chart dr3d math form script config ooo ooow oooc dom xforms xsd rpt of xhtml grddl field draw table xsi">
	<xsl:output method="xml" encoding="utf-8"/>
	<xsl:variable name="intitule" select="/office:document/office:body/office:text/office:forms/form:form/form:textarea[@form:name='intitule']/@form:current-value"/>
	<xsl:variable name="resume" select="/office:document/office:body/office:text/office:forms/form:form/form:textarea[@form:name='resume']/@form:current-value"/>
	<xsl:variable name="categorieISO" select="/office:document/office:body/office:text/office:forms/form:form/form:listbox[@form:name='categorieISO']/form:option[@form:current-selected]/@form:label"/>
	<xsl:variable name="themeInspire" select="/office:document/office:body/office:text/office:forms/form:form/form:listbox[@form:name='themeInspire']/form:option[@form:current-selected]/@form:label"/>
	<xsl:variable name="dateDebut" select="/office:document/office:body/office:text/office:forms/form:form/form:formatted-text[@form:name='etendueTempDateDebut']/@form:current-value"/>
	<xsl:variable name="dateFin" select="/office:document/office:body/office:text/office:forms/form:form/form:formatted-text[@form:name='etendueTempDateFin']/@form:current-value"/>
	<xsl:variable name="dateRevision" select="/office:document/office:body/office:text/office:forms/form:form/form:formatted-text[@form:name='dateRevision']/@form:current-value"/>
	<xsl:variable name="dateCreation" select="/office:document/office:body/office:text/office:forms/form:form/form:formatted-text[@form:name='dateCreation']/@form:current-value"/>
	<xsl:variable name="genealogie" select="/office:document/office:body/office:text/office:forms/form:form/form:textarea[@form:name='genealogie']/@form:current-value"/>
	<xsl:variable name="conditionsUsage" select="/office:document/office:body/office:text/office:forms/form:form/form:textarea[@form:name='conditionsUsage']/@form:current-value"/>
	<xsl:variable name="restrictionsAccesInspire" select="/office:document/office:body/office:text/office:forms/form:form/form:listbox[@form:name='restrictionsAccesInspire']/form:option[@form:current-selected='true']/@form:label"/>
	<xsl:variable name="restrictionsAccesInspireTexteLibre" select="/office:document/office:body/office:text/office:forms/form:form/form:textarea[@form:name='restrictionAccesInspireTexteLibre']/@form:current-value"/>
	<xsl:variable name="contrainteLegale" select="/office:document/office:body/office:text/office:forms/form:form/form:listbox[@form:name='contrainteLegale']/form:option[@form:current-selected]/@form:label"/>
	<xsl:variable name="contrainteSecurite" select="/office:document/office:body/office:text/office:forms/form:form/form:listbox[@form:name='contrainteSecurite']/form:option[@form:current-selected]/@form:label"/>
	<xsl:variable name="contrainteSecuriteTexteLibre" select="/office:document/office:body/office:text/office:forms/form:form/form:textarea[@form:name='contrainteSecuriteTexteLibre']/@form:current-value"/>
	<xsl:variable name="contactNom" select="/office:document/office:body/office:text/office:forms/form:form/form:textarea[@form:name='contactNom']/@form:current-value"/>
	<xsl:variable name="contactEmail" select="/office:document/office:body/office:text/office:forms/form:form/form:textarea[@form:name='contactEmail']/@form:current-value"/>
	<xsl:template match="/office:document">
		<gmd:MD_Metadata xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<gmd:language>
				<gmd:LanguageCode codeListValue="fre" codeList="http://www.loc.gov/standards/iso639-2/"/>
			</gmd:language>
			<gmd:hierarchyLevel>
				<gmd:MD_ScopeCode codeListValue="dataset" codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#MD_ScopeCode"/>
			</gmd:hierarchyLevel>
			<gmd:contact/>
			<gmd:dateStamp/>
			<gmd:identificationInfo>
				<gmd:MD_DataIdentification>
					<gmd:citation>
						<gmd:CI_Citation>
							<xsl:choose>
								<xsl:when test="count($intitule) = 0">
									<gmd:title/>
								</xsl:when>
								<xsl:otherwise>
									<gmd:title>
										<gco:CharacterString>
											<xsl:value-of select="$intitule"/>
										</gco:CharacterString>
									</gmd:title>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="count($dateCreation) = 0 and count($dateRevision) = 0">
								<gmd:date/>
							</xsl:if>
							<xsl:if test="count($dateRevision) > 0">
								<gmd:date>
									<gmd:CI_Date>
										<gmd:date>
											<gco:Date>
												<xsl:value-of select="concat(substring($dateRevision,1,4),'-',substring($dateRevision,5,2),'-',substring($dateRevision,7,2))"/>
											</gco:Date>
										</gmd:date>
										<gmd:dateType>
											<gmd:CI_DateTypeCode codeListValue="revision" codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode">revision</gmd:CI_DateTypeCode>
										</gmd:dateType>
									</gmd:CI_Date>
								</gmd:date>
							</xsl:if>
							<xsl:if test="count($dateCreation) > 0">
								<gmd:date>
									<gmd:CI_Date>
										<gmd:date>
											<gco:Date>
												<xsl:value-of select="concat(substring($dateCreation,1,4),'-',substring($dateCreation,5,2),'-',substring($dateCreation,7,2))"/>
											</gco:Date>
										</gmd:date>
										<gmd:dateType>
											<gmd:CI_DateTypeCode codeListValue="creation" codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode">creation</gmd:CI_DateTypeCode>
										</gmd:dateType>
									</gmd:CI_Date>
								</gmd:date>
							</xsl:if>
						</gmd:CI_Citation>
					</gmd:citation>
					<xsl:choose>
						<xsl:when test="count($resume) = 0">
							<gmd:abstract/>
						</xsl:when>
						<xsl:otherwise>
							<gmd:abstract>
								<gco:CharacterString>
									<xsl:value-of select="$resume"/>
								</gco:CharacterString>
							</gmd:abstract>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="count($contactNom) > 0 or count($contactEmail) > 0">
						<gmd:pointOfContact>
							<gmd:CI_ResponsibleParty>
								<xsl:if test="count($contactNom) > 0">
									<gmd:organisationName>
										<gco:CharacterString>
											<xsl:value-of select="$contactNom"/>
										</gco:CharacterString>
									</gmd:organisationName>
								</xsl:if>
								<xsl:if test="count($contactEmail) > 0">
									<gmd:contactInfo>
										<gmd:CI_Contact>
											<gmd:address>
												<gmd:CI_Address>
													<gmd:electronicMailAddress>
														<gco:CharacterString>
															<xsl:value-of select="$contactEmail"/>
														</gco:CharacterString>
													</gmd:electronicMailAddress>
												</gmd:CI_Address>
											</gmd:address>
										</gmd:CI_Contact>
									</gmd:contactInfo>
								</xsl:if>
								<gmd:role>
									<gmd:CI_RoleCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_RoleCode" codeListValue="originator"/>
								</gmd:role>
							</gmd:CI_ResponsibleParty>
						</gmd:pointOfContact>
					</xsl:if>
					<xsl:if test="count($themeInspire) > 1 or $themeInspire != '--- Sélectionner un ou plusieurs thèmes (utiliser la touche MAJ ou CTRL) ---'">
						<gmd:descriptiveKeywords>
							<gmd:MD_Keywords>
								<xsl:for-each select="$themeInspire">
									<xsl:if test="current() != '--- Sélectionner un ou plusieurs thèmes (utiliser la touche MAJ ou CTRL) ---'">
										<gmd:keyword>
											<gco:CharacterString>
												<xsl:value-of select="current()"/>
											</gco:CharacterString>
										</gmd:keyword>
									</xsl:if>
								</xsl:for-each>
								<gmd:thesaurusName>
									<gmd:CI_Citation>
										<gmd:title>
											<gco:CharacterString>GEMET - INSPIRE themes, version 1.0</gco:CharacterString>
										</gmd:title>
										<gmd:date>
											<gmd:CI_Date>
												<gmd:date>
													<gco:Date>2008-06-01</gco:Date>
												</gmd:date>
												<gmd:dateType>
													<gmd:CI_DateTypeCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode" codeListValue="publication">publication</gmd:CI_DateTypeCode>
												</gmd:dateType>
											</gmd:CI_Date>
										</gmd:date>
									</gmd:CI_Citation>
								</gmd:thesaurusName>
							</gmd:MD_Keywords>
						</gmd:descriptiveKeywords>
					</xsl:if>
					<xsl:if test="count($conditionsUsage) > 0">
						<gmd:resourceConstraints>
							<gmd:MD_Constraints>
								<gmd:useLimitation>
									<gco:CharacterString>
										<xsl:value-of select="$conditionsUsage"/>
									</gco:CharacterString>
								</gmd:useLimitation>
							</gmd:MD_Constraints>
						</gmd:resourceConstraints>
					</xsl:if>
					<gmd:resourceConstraints>
						<gmd:MD_LegalConstraints>
							<gmd:useLimitation>
								<gco:CharacterString>
									<xsl:choose>
										<xsl:when test="$restrictionsAccesInspire = '--- Sélectionner une ou plusieurs restrictions (utiliser la touche MAJ ou CTRL) ---' or $restrictionsAccesInspire = 'Pas de restriction d’accès public selon INSPIRE'">
											<xsl:text>aucune condition ne s'applique</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="$restrictionsAccesInspireTexteLibre"/>
										</xsl:otherwise>
									</xsl:choose>
								</gco:CharacterString>
							</gmd:useLimitation>
							<xsl:if test="$restrictionsAccesInspire != '--- Sélectionner une ou plusieurs restrictions (utiliser la touche MAJ ou CTRL) ---' and $restrictionsAccesInspire != 'Pas de restriction d’accès public selon INSPIRE'">
								<gmd:accessConstraints>
									<gmd:MD_RestrictionCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#MD_RestrictionCode" codeListValue="otherRestrictions"/>
								</gmd:accessConstraints>
								<gmd:accessConstraints>
									<gmd:MD_RestrictionCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#MD_RestrictionCode" codeListValue="restricted"/>
								</gmd:accessConstraints>
							</xsl:if>
							<xsl:if test="$contrainteLegale != '--- Sélectionner une ou plusieurs contrainte(s) (utiliser la touche MAJ ou CTRL) ---'">
								<xsl:for-each select="$contrainteLegale">
									<gmd:useConstraints>
										<gmd:MD_RestrictionCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#MD_RestrictionCode">
											<xsl:attribute name="codeListValue"><xsl:choose><xsl:when test="current() = 'copyright'"><xsl:text>copyright</xsl:text></xsl:when><xsl:when test="current() = 'brevet'"><xsl:text>patent</xsl:text></xsl:when><xsl:when test="current() = 'brevet en cours'"><xsl:text>patentPending</xsl:text></xsl:when><xsl:when test="current() = 'marque déposée'"><xsl:text>trademark</xsl:text></xsl:when><xsl:when test="current() = 'licence'"><xsl:text>license</xsl:text></xsl:when><xsl:when test="current() ='droit de propriété intellectuelle'"><xsl:text>intellectualPropertyRights</xsl:text></xsl:when></xsl:choose></xsl:attribute>
										</gmd:MD_RestrictionCode>
									</gmd:useConstraints>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="$restrictionsAccesInspire != '--- Sélectionner une ou plusieurs restrictions (utiliser la touche MAJ ou CTRL) ---' and $restrictionsAccesInspire != 'Pas de restriction d’accès public selon INSPIRE'">
								<xsl:for-each select="$restrictionsAccesInspire">
									<gmd:otherConstraints>
										<gco:CharacterString>
											<xsl:value-of select="current()"/>
										</gco:CharacterString>
									</gmd:otherConstraints>
								</xsl:for-each>
							</xsl:if>
						</gmd:MD_LegalConstraints>
					</gmd:resourceConstraints>
					<xsl:if test="$contrainteSecurite != '--- Sélectionner une contrainte ---'">
						<gmd:resourceConstraints>
							<gmd:MD_SecurityConstraints>
								<xsl:if test="$contrainteSecuriteTexteLibre != ''">
									<gmd:useLimitation>
										<gco:CharacterString>
											<xsl:value-of select="$contrainteSecuriteTexteLibre"/>
										</gco:CharacterString>
									</gmd:useLimitation>
								</xsl:if>
								<gmd:classification>
									<gmd:MD_ClassificationCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#MD_ClassificationCode">
										<xsl:attribute name="codeListValue"><xsl:choose><xsl:when test="$contrainteSecurite = '--- Sélectionner une contrainte ---' or $contrainteSecurite = 'pas de contrainte'"><xsl:text>unclassified</xsl:text></xsl:when><xsl:when test="$contrainteSecurite = 'restreint'"><xsl:text>restricted</xsl:text></xsl:when><xsl:when test="$contrainteSecurite = 'confidentiel'"><xsl:text>confidential</xsl:text></xsl:when><xsl:when test="$contrainteSecurite = 'secret'"><xsl:text>secret</xsl:text></xsl:when><xsl:when test="$contrainteSecurite = 'top secret'"><xsl:text>topSecret</xsl:text></xsl:when></xsl:choose></xsl:attribute>
									</gmd:MD_ClassificationCode>
								</gmd:classification>
							</gmd:MD_SecurityConstraints>
						</gmd:resourceConstraints>
					</xsl:if>
					<gmd:language/>
					<xsl:if test="$categorieISO != '--- Sélectionner un ou plusieurs catégories (utiliser la touche MAJ ou CTRL) ---'">
						<xsl:for-each select="$categorieISO">
							<xsl:if test="current() != '--- Sélectionner un ou plusieurs catégories (utiliser la touche MAJ ou CTRL) ---'">
								<gmd:topicCategory>
									<gmd:MD_TopicCategoryCode>
										<xsl:choose>
											<xsl:when test="current() = 'Agriculture'">
												<xsl:text>farming</xsl:text>
											</xsl:when>
											<xsl:when test="current() = 'Altitude'">
												<xsl:text>elevation</xsl:text>
											</xsl:when>
											<xsl:when test="current() = 'Cartes de base'">
												<xsl:text>imageryBaseMapsEarthCover</xsl:text>
											</xsl:when>
											<xsl:when test="current() = 'Climatologie, Météorologie, Atmosphère'">
												<xsl:text>climatologyMeteorologyAtmosphere</xsl:text>
											</xsl:when>
											<xsl:when test="current() = 'Communication'">
												<xsl:text>utilitiesCommunication</xsl:text>
											</xsl:when>
											<xsl:when test="current() = 'Constructions'">
												<xsl:text>structure</xsl:text>
											</xsl:when>
											<xsl:when test="current() = 'Eaux continentales'">
												<xsl:text>inlandWaters</xsl:text>
											</xsl:when>
											<xsl:when test="current() = 'Economie'">
												<xsl:text>economy</xsl:text>
											</xsl:when>
											<xsl:when test="current() = 'Environnement'">
												<xsl:text>environment</xsl:text>
											</xsl:when>
											<xsl:when test="current() = 'Faune et flore'">
												<xsl:text>biota</xsl:text>
											</xsl:when>
											<xsl:when test="current() = 'Frontières, limites administratives'">
												<xsl:text>boundaries</xsl:text>
											</xsl:when>
											<xsl:when test="current() = 'Information géo-scientifique'">
												<xsl:text>geoscientificInformation</xsl:text>
											</xsl:when>
											<xsl:when test="current() = 'Installations militaires'">
												<xsl:text>intelligenceMilitary</xsl:text>
											</xsl:when>
											<xsl:when test="current() = 'Localisation'">
												<xsl:text>location</xsl:text>
											</xsl:when>
											<xsl:when test="current() = 'Océans'">
												<xsl:text>oceans</xsl:text>
											</xsl:when>
											<xsl:when test="current() = 'Santé'">
												<xsl:text>health</xsl:text>
											</xsl:when>
											<xsl:when test="current() = 'Société'">
												<xsl:text>society</xsl:text>
											</xsl:when>
											<xsl:when test="current() = 'Transport'">
												<xsl:text>transportation</xsl:text>
											</xsl:when>
											<xsl:when test="current() = 'Utilisation des sols'">
												<xsl:text>planningCadastre</xsl:text>
											</xsl:when>
										</xsl:choose>
									</gmd:MD_TopicCategoryCode>
								</gmd:topicCategory>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="$dateDebut !='' or $dateFin !=''">
						<gmd:extent>
							<gmd:EX_Extent>
								<gmd:temporalElement>
									<gmd:EX_TemporalExtent>
										<gmd:extent>
											<gml:TimePeriod xmlns:gml="http://www.opengis.net/gml" gml:id="id">
												<gml:beginPosition>
													<xsl:if test="$dateDebut != ''">
														<xsl:value-of select="concat(substring($dateDebut,1,4),'-',substring($dateDebut,5,2),'-',substring($dateDebut,7,2))"/>
													</xsl:if>
												</gml:beginPosition>
												<gml:endPosition>
													<xsl:if test="$dateFin !=''">
														<xsl:value-of select="concat(substring($dateFin,1,4),'-',substring($dateFin,5,2),'-',substring($dateFin,7,2))"/>
													</xsl:if>
												</gml:endPosition>
											</gml:TimePeriod>
										</gmd:extent>
									</gmd:EX_TemporalExtent>
								</gmd:temporalElement>
							</gmd:EX_Extent>
						</gmd:extent>
					</xsl:if>
				</gmd:MD_DataIdentification>
			</gmd:identificationInfo>
			<xsl:if test="$genealogie != ''">
				<gmd:dataQualityInfo>
					<gmd:DQ_DataQuality>
						<gmd:scope/>
						<gmd:lineage>
							<gmd:LI_Lineage>
								<gmd:statement>
									<gco:CharacterString>
										<xsl:value-of select="$genealogie"/>
									</gco:CharacterString>
								</gmd:statement>
							</gmd:LI_Lineage>
						</gmd:lineage>
					</gmd:DQ_DataQuality>
				</gmd:dataQualityInfo>
			</xsl:if>
		</gmd:MD_Metadata>
	</xsl:template>
</xsl:stylesheet>
