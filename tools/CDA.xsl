<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:hl7="urn:hl7-org:v3"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns:exslt="http://exslt.org/common"
    xmlns:sdtc="urn:hl7-org:sdtc"
    xmlns:my="my:my"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xd hl7 xsi xhtml exslt sdtc">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Title:</xd:b> CDA R2 StyleSheet</xd:p>
            <xd:p><xd:b>Version:</xd:b> 4.0.2 beta 4</xd:p>
            <xd:p><xd:b>Maintained by:</xd:b> HL7 <xd:a href="https://confluence.hl7.org/display/SD/Structured+Documents">Structured Documents Work Group</xd:a></xd:p>
            <xd:p><xd:b>Purpose:</xd:b> Provides general purpose display of CDA release 2.0 and 2.1 (Specification: ANSI/HL7 CDAR2) and CDA release 3 (Specification was pulled after ballot) documents. It may also be a starting point for people interested in extending the display. This stylesheet displays all section content, but does not try to render each and every header attribute. For header attributes it tries to be smart in displaying essentials, which is still a lot.</xd:p>
            <xd:p><xd:b>License:</xd:b> Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at <a href="http://www.apache.org/licenses/LICENSE-2.0">http://www.apache.org/licenses/LICENSE-2.0</a></xd:p>
            <xd:p><xd:b>Download link:</xd:b> <xd:a href="https://github.com/HL7/cda-core-xsl">https://github.com/HL7/cda-core-xsl</xd:a></xd:p>
            <xd:p><xd:b>Documentation/manual:</xd:b> <xd:a href="https://confluence.hl7.org/display/SD/CDA+R2+Stylesheet">https://confluence.hl7.org/display/SD/CDA+R2+Stylesheet</xd:a></xd:p>
            <xd:p><xd:b>History:</xd:b> This stylesheet stands on the shoulders of giants. The stylesheet is the cumulative work of several developers; the most significant prior milestones were the foundation work from HL7 Germany and Finland (Tyylitiedosto) and HL7 US (Calvin Beebe), and the presentation approach from Tony Schaller, medshare GmbH provided at IHIC 2009. The stylesheet has subsequently been maintained/updated by Lantana Group (US) and Nictiz (NL).</xd:p>
            <xd:p><xd:b>Known issues</xd:b>
                <xd:ul>
                    <!--<xd:li>Remove any temporary cruft from the CDAr3 ballot that does not make it into the final version</xd:li>-->
                    <xd:li>Fix for Mobile Safari (iOS 6): doesn't support opening the table of contents</xd:li>
                    <xd:li>Check additional structural vocabulary for CDA 2.1 (RIM 2.35) - NullFlavors already done</xd:li>
                    <xd:li>Fix a problem where the footer div will not be rendered by browsers when an iframe exists (pdf usually)</xd:li>
                </xd:ul>
            </xd:p>
            <xd:p>
                <xd:b>Revisions</xd:b>
                <xd:ul>
                    <xd:li>
                        <xd:b>05/01/2020, AH, v4.0.2 beta 4</xd:b>
                        <xd:ul>
                            <xd:li>Improved performance of label retrieval by using xsl:key</xd:li>
                            <xd:li>Improved graceful fallback for label retrieval when default language is not en-us</xd:li>
                            <xd:li>Added various strings gathered through other uses of the same localization file</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>12/01/2019, AH, v4.0.2 beta 3</xd:b>
                        <xd:ul>
                            <xd:li>Improved rendering of ClinicalDocument.confidentiality so the lock icon matches the font size</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>10/23/2019, AH, v4.0.2 beta 2</xd:b>
                        <xd:ul>
                            <xd:li>Previous beta only supported authenticator. Support for legalAuthenticator has been added</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>06/19/2019, AH, v4.0.2 beta 1</xd:b>
                        <xd:ul>
                            <xd:li>Circumvention for a warning from XSL 1.0 processors: "Non-text output nodes are ignored when writing an attribute, comment or PI."</xd:li>
                            <xd:li>Added support for (legal) authenticator sdtc:signatureText. This renders a small signature icon with mouse over text that reads that a signature is present, but that this signature has not been verified. If a thumbnail is present is will trail that title.</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>01/17/2019 AH, v4.0.1</xd:b>
                        <xd:p>Approved all changes in beta 1 and beta 2 as-is except for the addition of IHE PCC MCV. The StrucDoc WG feels that this addition needs some more thought before a decision on re-adding it can be made.</xd:p>
                        <xd:ul>
                            <xd:li>Added support for patient/languageCommunication</xd:li>
                            <xd:li>Added support for patientRole/providerOrganization</xd:li>
                            <xd:li>Added support for informationRecipient/intendedRecipient/receivedOrganization</xd:li>
                            <xd:li>Updated rendering of nonXMLBody and observationMedia to check for Base64 content before checking text/plain. This fixes support for Base64 encoded text/plain.</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>01/14/2019 AH, v4.0.1 beta 2</xd:b>
                        <xd:ul>
                            <xd:li>As requested per <xd:a href="https://gforge.hl7.org/gf/project/strucdoc/tracker/?action=TrackerItemEdit&amp;tracker_item_id=20000">GForge#20000</xd:a>, added support for <xd:a href="https://www.ihe.net/uploadedFiles/Documents/PCC/IHE_PCC_Suppl_MCV.pdf">IHE PCC MCV, Revision 1.2, Trial Implementation, November 2, 2018</xd:a>. Implementation coverage is based on AllScripts stylesheet implementation (license Apache License, Version 2.0): <table>
                                    <caption>Table 5.1.X-1: styleCode</caption>
                                    <thead>
                                        <tr>
                                            <th>Covered?</th>
                                            <th>styleCode</th>
                                            <th>Description</th>
                                            <th>Suggested Rendering (Hints)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xEmptySection</td>
                                            <td>Section is empty</td>
                                            <td>When showing other than complete content, do something special to show that the entire section is empty. See Section 3.1.5.3.1 for an example. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xHistoric</td>
                                            <td>Content is Historic When showing content that was assessed, these data should be hidden. See Section 3.1.5.3.2 for an example. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xAssessed</td>
                                            <td>Content Assessed/Discussed this visit</td>
                                            <td>When showing content that was assessed, these data shall be shown. See Section 3.1.5.3.2 for an example. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xDetail</td>
                                            <td>Extra Detail – not necessarily for Patients</td>
                                            <td>When showing patient related views, this content may be omitted. See Section 3.1.5.3.3 for an example. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xDate</td>
                                            <td>Content is a Date</td>
                                            <td>Show as a date. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xDateTime</td>
                                            <td>Content is a Date with Time</td>
                                            <td>Show as a date with time. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xCode</td>
                                            <td>Content is a code from some code system.</td>
                                            <td>Show as a code. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xPhone</td>
                                            <td>Content is a telephone number</td>
                                            <td>Show as a phone number. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xEmail</td>
                                            <td>Content is an email address</td>
                                            <td>Show as an email address. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xAddress</td>
                                            <td>Content is a Street Address</td>
                                            <td>Shows an address. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xPersonName</td>
                                            <td>Content is a person name</td>
                                            <td>Show as the name of a person. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xIdentifier</td>
                                            <td>Content is an identifier</td>
                                            <td>Show as an identifier. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. Rendered with red font color</td>
                                            <td>xAlert</td>
                                            <td>The content contains information of importance that needs to be used to alert the reader, for example level of severity considered life threatening.</td>
                                            <td>Show in some manner to indicate an Alert. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. Rendered with red font color</td>
                                            <td>xAbnormal</td>
                                            <td>The content contains information that may be considered to be not within what are considered to be normal values.</td>
                                            <td>Show in some manner to indicate a value that is not normal. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How? Just display:none or with javascript for unhide?</td>
                                            <td>xHidden</td>
                                            <td>Content may typically be repetitive and unnecessary to display.</td>
                                            <td>Hide the content. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. Rendered in italics</td>
                                            <td>xLabel</td>
                                            <td>The content is a label of some data, e.g., Refills:</td>
                                            <td>Show content as a label. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. No specifics</td>
                                            <td>xValue</td>
                                            <td>The content contains a data that is a value, e.g., 98.6</td>
                                            <td>Show content as a clinical item status value. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. No specifics</td>
                                            <td>xReaction</td>
                                            <td>The content represents text about a reaction.</td>
                                            <td>Show content as a reaction. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. No specifics</td>
                                            <td>xComment</td>
                                            <td>The content is comment text.</td>
                                            <td>Show as a comment. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. text-align: center</td>
                                            <td>xCenter</td>
                                            <td>Text to be centered</td>
                                            <td>Alignment should be centered. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. text-align: right</td>
                                            <td>xRight</td>
                                            <td>Text to be right justified</td>
                                            <td>Alignment should be right. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. text-align:left</td>
                                            <td>xLeft</td>
                                            <td>Text to be left justified</td>
                                            <td>Alignment should be left. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. font-family: monospace</td>
                                            <td>xMono</td>
                                            <td>Text to be output in a monospace font</td>
                                            <td>Render in a monospace font. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. background-color: yellow; color: black;</td>
                                            <td>xHighlight</td>
                                            <td>Text to be highlighted</td>
                                            <td>Render with highlight. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. render an hr element</td>
                                            <td>xHR</td>
                                            <td>A horizontal line is to be drawn</td>
                                            <td>Render a horizontal line. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes</td>
                                            <td>xRowNormal</td>
                                            <td>For example, to indicate an odd numbered row of a table.</td>
                                            <td>Render table row as normal. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes</td>
                                            <td>xRowAlt</td>
                                            <td>For example, to indicate an even numbered row of a table.</td>
                                            <td>Render table row as alternate. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes</td>
                                            <td>xIndent</td>
                                            <td>Render content indented.</td>
                                            <td> </td>
                                        </tr>
                                        <tr>
                                            <td>Yes</td>
                                            <td>xSecondary</td>
                                            <td>This content is of secondary importance.</td>
                                            <td>Render in some manner to indicate this content is of secondary importance, for example in a lighter font color. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes</td>
                                            <td>xRowGroup</td>
                                            <td>This is used on table rows to show that children and parent objects are related</td>
                                            <td>Keep lines from appearing between child objects and their parents in a table together </td>
                                        </tr>
                                        <tr>
                                            <td>Yes</td>
                                            <td>xContentWrapping</td>
                                            <td>This is used to keep the text in the first column from wrapping under the bullets that appear for child objects inside of a table</td>
                                            <td>Prevent text from wrapping under child objects</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </xd:li>
                            <xd:li>Added support for patient/languageCommunication</xd:li>
                            <xd:li>Added support for patientRole/providerOrganization</xd:li>
                            <xd:li>Added support for informationRecipient/intendedRecipient/receivedOrganization</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>11/13/2018 AH, v4.0.1 beta 1</xd:b> 
                        Updated rendering of nonXMLBody and observationMedia to check for Base64 content before checking text/plain. This fixes support for Base64 encoded text/plain.
                    </xd:li>
                    <xd:li>
                        <xd:b>10/02/2018 AH, v4.0.0</xd:b> 
                        Administrative rename to final product after StrucDoc committee approval
                    </xd:li>
                    <xd:li>
                        <xd:b>09/26/2018 AH, v4.0.0 beta 8</xd:b>
                        <xd:ul>
                            <xd:li>Fixed an issue that for certain ids would cause a warning "Non-text output nodes are ignored when writing an attribute, comment, or PI" and/or "Cannot write an attribute node when no element start tag is open"</xd:li>
                            <xd:li>Fixed an issue for caption elements under anything but a table, e.g. a list, where the text content would be duplicated</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>08/31/2018 AH, v4.0.0 beta 7</xd:b>
                        <xd:ul>
                            <xd:li>Consistency update. Changed all US English label names to use Camel Casing</xd:li>
                            <xd:li>Added OID labels for SNOMED CT, ICD-10-NL, ICD-10-DE, ICD-10-CM</xd:li>
                            <xd:li>Added support for originalText and translation rendering on coded elements, regardless of nullFlavor status</xd:li>
                            <xd:li>Fixed a bug that would occur when AD.useablePeriod exists and added rendering support when it does</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>08/27/2018 AH, v4.0.0 beta 6</xd:b>
                        <xd:ul>
                            <xd:li>Improved rendering of empty (sub)sections</xd:li>
                            <xd:li>Added various more OID translations like the NHS Number</xd:li>
                            <xd:li>Extended the l10.xsd to include an enumeration for language, and made attributes required</xd:li>
                            <xd:li>Fixed all uppercase language codes in l10n file</xd:li>
                            <xd:li>Improved rendering of confidentialityCode in the title when the code is not from x_BasicConfidentialityKind</xd:li>
                            <xd:li>Removed illegal css instruction "float: top;" on documentheader, documentbody and documentfooter</xd:li>
                            <xd:li>Hide expand/collapse triangle for sections upon print</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>08/16/2018 AH, v4.0.0 beta 5</xd:b>
                        <xd:ul>
                            <xd:li>Added support to switch <xd:ref name="sectionNumbering" type="parameter">sectionNumbering</xd:ref> on or off (default)</xd:li>
                            <xd:li>Added support for collapsing/expanding all or selected (sub) sections</xd:li>
                            <xd:li>Fix for empty elements causing XHTML grief</xd:li>
                            <xd:li>Improved rendered warning for potential malicious contents</xd:li>
                            <xd:li>Improved rendering of inFulFillment</xd:li>
                            <xd:li>Improved rendering of names by eliminating leading/trailing spaces, and by rendering only the first name in the header. All names are in the footer.</xd:li>
                            <xd:li>Improved rendering of addresses by pulling buildingNumberSuffix into the address line</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>08/05/2018 AH, v4.0.0 beta 4</xd:b>
                        <xd:ul>
                            <xd:li>Added support to <xd:ref name="mask-ids" type="parameter">mask</xd:ref> or <xd:ref name="skip-ids" type="parameter">skip</xd:ref> patient ids based on a comma separated list of @root values. Masking will cause xxx-xxx-xxx to appear with a mouse over that states "masked"</xd:li>
                            <xd:li>Now renders subsection almost the same way as top level sections including any overriding authors/informants/subjects, section numbering. The difference lies in increasing left indenting for every subsection</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>06/19/2018 AH, v4.0.0 beta 3</xd:b>
                        <xd:ul>
                            <xd:li>Fixed a bug in rendering ClinicalDocument/confidentialityCode causing it not to get rendered</xd:li>
                            <xd:li>Based on physician feedback: header labels are now all bold (was normal), header values are now all normal (was italic). This leads to more focus on what's important</xd:li>
                            <xd:li>Based on physician feedback: Patient-IDs now all go on a new line when the view becomes too small to be on one line (was: line wrapped). This is always true for print</xd:li>
                            <xd:li>Based on physician feedback: More space between Patient header parts</xd:li>
                            <xd:li>Based on physician feedback: Updated encounter/code label from "Code" to "Type" as it caused confusion</xd:li>
                            <xd:li>Smarter interval of time rendering: when both low/high are on the same date, renders date only once, so "January 12, 2018 10AM -0500 - 11PM -0500" instead of "from January 12, 2018 10AM -0500 to January 12, 2018 11PM -0500"</xd:li>
                            <xd:li>Now renders id/@assigningAuthorityName as title on an id. This was not rendered at all before. May need better solutions for that info in future update</xd:li>
                            <xd:li>Smart rendering of addresses. Now skips rendering of streetName, houseNumber, houseNumberNumeric when there is a streetAddressLine. Now renders postalCode next to city (leading/trailing depending on CDA order)</xd:li>
                            <xd:li>Fixed rendering issue in outlining of authenticator and legalAuthenticator in the footer</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/23/2018 AH, v4.0.0 beta 2</xd:b>
                        <xd:ul>
                            <xd:li>Rerouted rendering of narrative block renderMultiMedia to rendering of nonXMLBody so there's now one block of logic and security checks on that. At the same time this extends the support for types of renderMultiMedia as originally only gif and jpeg were supported. At least some ELGA examples now render their PDF contents correctly.</xd:li>
                            <xd:li>Fixed rendering of caption elements when not under a table</xd:li>
                            <xd:li>Fixed duplicate rendering of ids for footnotes</xd:li>
                            <xd:li>Updated all @name based anchors to @id based anchors for xhtml alignment</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/09/2018 AH, v4.0.0 beta 1</xd:b>
                        <xd:ul>
                            <xd:li>Updates to the color scheme and a few other visual aids for accessibility alignment with <xd:a href="http://www.afb.org/info/programs-and-services/public-policy-center/technology-and-information-accessibility/section-508-key-links/1235">American Foundation for the Blind Section 508</xd:a></xd:li>
                            <xd:li>Added new parameters for color: <xd:ref name="bgcolor-th" type="parameter">bgcolor-th</xd:ref> and <xd:ref name="bgcolor-td" type="parameter">bgcolor-td</xd:ref></xd:li>
                            <xd:li>Added new parameters for skipping the rendering of the CDA header info at the top of the document (<xd:ref name="dohtmlheader" type="parameter">dohtmlheader</xd:ref>) and/or footer (<xd:ref name="dohtmlfooter" type="parameter">dohtmlfooter</xd:ref>)</xd:li>
                            <xd:li>Fix for visibility in the TOC of empty sections as specified by the StrucDoc WG with section/@nullFlavor</xd:li>
                            <xd:li>Fix in documentationOf: don't render @classCode if ACT as that doesn't hold information, and improved serviceEvent/performer contact detail rendering</xd:li>
                            <xd:li>Fix for missing space in rendering of time intervals</xd:li>
                            <xd:li>Update localization function for the compressed l10n structure</xd:li>
                            <xd:li>Update menu behavior. Now only expands sublevels (if any) when hovering the parent</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>04/11/2018 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Updated rendering of documentationOf/serviceEvent/@classCode so it does not render if it is 'ACT'</xd:li>
                            <xd:li>Fixed a bug in rendering documentationOf/serviceEvent/code (it was inadvertently not rendered)</xd:li>
                            <xd:li>Added rendering of documentationOf/serviceEvent/performer name in the document header</xd:li>
                            <xd:li>Added rendering of documentationOf/serviceEvent/performer contact details in the document footer</xd:li>
                            <xd:li>Fixed l10n for keys typeCode-PRP, typeCode-PPRP and typeCode-SPRP. Each last P should have been an F.</xd:li>
                            <xd:li>Little tweak to author to avoid rendering of additional commas when certain content is missing</xd:li>
                            <xd:li>Skip timestamp seconds when they are 00. Skip minutes and seconds when they are 00:00. Both for readability.</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>03/24/2018 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Added parameter menu-depth with min 1, max 3, default 1 (the way it always has been) -- temporarily left on 3 for browser testing</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>02/16/2018 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Moved header authenticator so it is right above legalAuthenticator instead of just under participant</xd:li>
                            <xd:li>Improved readability. Moved contact details for all header participants (recordTarget, author, informant, authenticator, legalAuthenticator, ...) to the right instead of underneath the participant name.</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>02/15/2018 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Fixed rendering of serviceEvent/code, location/healthCareFacility/id, order/code, order/priorityCode, consent/code, consent/statusCode</xd:li>
                            <xd:li>Fixed casing of "inFulfillmentOf" and added call to it under documentationOf (GForge#3169)</xd:li>
                            <xd:li>Render recordTarget regardless of nullFlavor in id. (GForge#3590)</xd:li>
                            <xd:li>Added support for encompassingEncounter dischargeDispositionCode, sdtc:admissionReferralSourceCode, encounterParticipant</xd:li>
                            <xd:li>Added support for ClinicalDocument/versionNumber, ClinicalDocument/setId, and relatedDocument (it was not called)</xd:li>
                            <xd:li>(CDA R2.1) Added support for hl7:admissionReferralSourceCode</xd:li>
                            <xd:li>(CDA R2.1) Added support for Person/desc as div under name</xd:li>
                            <xd:li>(CDA R2.1) Added support for Person/birthTime</xd:li>
                            <xd:li>(CDA R2.1) Added support for relatedDocument/@inversionInd</xd:li>
                            <xd:li>(CDA R2.1) Added support for serviceEvent/statusCode</xd:li>
                            <xd:li>(CDA R2.1) Added support for section subject/relatedSubject/subject/birthTime | deceasedTime | deceasedInd | multipleBirthInd | multipleBirthOrderNumber | raceCode | ehtnicGroupCode</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>12/15/2017 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Reimplemented security fix from Rick Geimer, Lantana, that does full checking on narrative table components</xd:li>
                            <xd:li>Fixed capitals in iframe properties WIDTH and HEIGHT</xd:li>
                            <xd:li>Added support for looking up an author organization name based on orgsanization id</xd:li>
                            <xd:li>Fixed getting the relatedDocument/parentDocument/id</xd:li>
                            <xd:li>Enhanced rendering of date/time. Now renders with AM/PM in English and with h or u on 24h clock otherwise if at least hours are present.</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>10/20/2014 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Fixed support for recordTarget/patient extensions deceasedInd/deceasedTime and multipleBirthInd/multipleBirthOrderNumber. They were inadvertently called in the HL7 namespace.</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>10/13/2014 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Fixed @ID by adding it to whatever in scope element (div, sup, sub, a, etc.) as @id. To this end the separate calls were replaced by a central call in mode 'handleSectionTextAttributes'.</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>10/02/2014 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Fixed linkHtml support as it was calling the wrong named template and thus would not render at all.</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>08/28/2014 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Adjusted time zone in <xd:ref name="formatDateTime" type="template">formatDateTime</xd:ref> representation so it just displays as-is when available. The number2name conversion, e.g. PST or CET, would fail part of the year due to daylight savings</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>17/04/2014 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Implemented mitigation for the <a href="http://smartplatforms.org/2014/04/security-vulnerabilities-in-ccda-display/">security risk</a> in rendering iframes for an arbritrary reference/@value based on work done in <a href="http://gforge.hl7.org/gf/project/strucdoc/frs/">SampleCDAStyleSheet v3.0.0</a></xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>09/04/2014 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Implemented minimal mitigation for the <a href="http://smartplatforms.org/2014/04/security-vulnerabilities-in-ccda-display/">security risk</a> in rendering iframes for an arbritrary reference/@value</xd:li>
                            <xd:li>Note that this cda.xsl does not copy arbritrary attributes from section text. The noted risk on calling external images thereby sending HTTP Referer URL is <xd:b>not</xd:b> mitigated</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/30/2013 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Made parameters out of font-family and font-sizes for the main font, h1-h6, and footers</xd:li>
                            <xd:li>Font-sizes are now all in points rather than pixels and points so more reliable in rendering</xd:li>
                            <xd:li>Fixed <xd:ref name="getLocalizedString" type="template">getLocalizedString</xd:ref> so it now does a lowercase comparison of the language</xd:li>
                            <xd:li>Fixed <xd:ref name="getLocalizedString" type="template">getLocalizedString</xd:ref> for language only situations (without region)</xd:li>
                            <xd:li>Added German translations for Table of Contents and Show/Hide revisions</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/29/2013 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Internet Explorer update: disabled the use of <xd:ref name="textEncoding" type="parameter">textEncoding</xd:ref>, otherwise it would not render</xd:li>
                            <xd:li>Fixed font-size problem for Internet Explorer 8 - it doesn't inherit size in td tags</xd:li>
                            <xd:li>Fixed table of contents problem for Internet Explorer 8 - wouldn't open</xd:li>
                            <xd:li>Fixed #documentfooter style</xd:li>
                            <xd:li>Pulled bgcolor in the header and footer part into CSS so it may be overridden</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/28/2013 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Redesigned the setup. Now has three main divs. <xd:ul>
                                    <xd:li>#documentheader contains basic Patient and Author info</xd:li>
                                    <xd:li>#documentbody contains section content</xd:li>
                                    <xd:li>#documentfooter contains all relevant CDA header info</xd:li>
                                </xd:ul></xd:li>
                            <xd:li>Updated for CDA release 3 as of Ballot May 2013. Includes datatypes awareness in alle relevant places This update is largely about feature parity</xd:li>
                            <xd:li>Added &lt;oXygen/&gt; style documentation tags to facilitate HTML documentation</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/22/2013 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Added parameter for external css if so desired</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>06/28/2011 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Improved show-id by diplaying nullFlavor where applicable</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/31/2011 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Improved show-code to return translated codes, and finally the original code if originalText and @displayName fail</xd:li>
                            <xd:li>Improved label on bottom participant to include translated assignedEntity/code if available</xd:li>
                            <xd:li>Improved readability of participant/assignedEntity</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/30/2011 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Participant codes are now displayed by default instead of only when the name is omitted</xd:li>
                            <xd:li>Fixed translation of patientIdLong, by using the literal string instead treating it as a node</xd:li>
                            <xd:li>Improved title on ids in fixed top header by adding a newline between multiple ids</xd:li>
                            <xd:li>Changed behavior of "Waarschuwingen" and "Behandelaanwijzigingen" to display "Er zijn geen ..." if they are not applicable, instead of showing nothing</xd:li>
                            <xd:li>Changed "Behandelaanwijzingen into "Behandelrestricties"</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/03/2011 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Added language file and a template getLocalizedString to deal with it</xd:li>
                            <xd:li>Added parameter textLang to feed the desired language. Does not work with just a browser, so textLang needs to be set in any environment</xd:li>
                            <xd:li>Replaced all current text in the stylesheet with calls to getLocalizedString</xd:li>
                            <xd:li>Improved layout of page so there's now a fixed header. Shrunk the TOC into a button with hover to open so it doesn't always take up all screen space. The layout is enforced using div with an id To avoid lots of scrolling in the header area this part needed to be predictable and small. All header info except recordTarget is now to the bottom of the document Also the document title was made less big</xd:li>
                            <xd:li>Added support for every styleCode in CDA release 2, not just bold/italics/underline, but also all list styles and e.g. Botrule</xd:li>
                            <xd:li>Added support for footnotes/footnoteRefs</xd:li>
                            <xd:li>Added support for multiple section authors (used to be just one, and support was bugged)</xd:li>
                            <xd:li>Added support for (multiple) section informants</xd:li>
                            <xd:li>Added support for section subject</xd:li>
                            <xd:li>Added support for @ID, @IDREF, @language, and all other style properties from CDA release 2</xd:li>
                            <xd:li>Added support for the display of nonXMLBody with text/plain content</xd:li>
                            <xd:li>Added support for Narrative block &lt;linkHtml/&gt;</xd:li>
                            <xd:li>Added support for revisions. Deletions will get a strikethrough, Insertions an underline and overline Both get a title saying 'delete' or 'insert'. This feature is off by default, but above the TOC there's a toggle to switch revisions marks on or off. A little Javascript was used for that.</xd:li>
                            <xd:li>Added confidentiality to the title of the document if present and other than N (Normal). If someone took the effort to send the confidentiality it should be 'in your face' as recipient.</xd:li>
                            <xd:li>Added support for multiple section authors (used to be just one, and support was bugged)</xd:li>
                            <xd:li>Added support for (multiple) section informants</xd:li>
                            <xd:li>Added support for section subject</xd:li>
                            <xd:li>Added a switch to diable Javascript in case the environment requires that</xd:li>
                            <xd:li>Improved support for data type II when there's only a root and no extension</xd:li>
                            <xd:li>Improved support for the author organization which not displayed</xd:li>
                            <xd:li>Improved support for telecom and addr use codes. Now supports multiples</xd:li>
                            <xd:li>Improved support for names. Now gets out every node, supporting mixed mode too.</xd:li>
                            <xd:li>Improved readability for the support for lists by combining the two templates</xd:li>
                            <xd:li>Improved support for observationMedia by removing the limitation of just gif and jpeg. If the browser does not support a given type, then at least a question mark is displayed. Before there was nothing</xd:li>
                            <xd:li>Improved support for observationMedia by adding the id (if available) to the alt and title of the image</xd:li>
                            <xd:li>Added support for inline base64 images. HTML actually can deal with that too</xd:li>
                            <xd:li>Improved handling of addresses so it now walks through all nodes, support mixed content. Also, the elements are now handled in the order of the instance and not just US order</xd:li>
                            <xd:li>Improved support for dates by including a language switch. Now just handles en-US and nl-NL, but could handle more Likely more sophisticated support is in order, but this works for our purposes while leaving US conventions intact</xd:li>
                            <xd:li>Improved handling of names, addresses and telecom. The templates gave incorrect results for multiples of these, mixing the contents of the latter with the first. Added name use code to the display of names if available.</xd:li>
                            <xd:li>Fixed the author string in the main document info. It used to '-', but is now "Author" in any supported language</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:pre>---------------------------------------------------</xd:pre>
                        <xd:p>Below is here the list of changes in the versions of the stylesheet up to version 3.1.1. This version of the stylesheet implements all changes done up to version 3.1.1.</xd:p>
                        <xd:pre>---------------------------------------------------</xd:pre>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/14/2018 Alexander Henket</xd:b> Better use of variables (GForge#15683)</xd:li>
                    <xd:li>
                        <xd:b>02/15/2018 Alexander Henket</xd:b> Render recordTarget regardless of nullFlavor in id. Updated rendering of ids with nullFlavors (GForge#3590)</xd:li>
                    <xd:li>
                        <xd:b>02/15/2018 Alexander Henket</xd:b> Minor formatting fix to table/caption and ul captions. (GForge#3185)</xd:li>
                    <xd:li>
                        <xd:b>02/15/2018 Alexander Henket</xd:b> Fixed casing of "inFulfillmentOf" and added call to it under documentationOf (GForge#3169)</xd:li>
                    <xd:li>
                        <xd:b>09/19/2016 Rick Geimer</xd:b> Fixed some iframe issues (attribute typos). Added datauri support for nonXMLBody docs with B64 PDFs (does not work in IE or Edge as of this time, but does work in Chrome and FireFox).</xd:li>
                    <xd:li>
                        <xd:b>11/12/2014 Rick Geimer</xd:b> Minor formatting fix to authenticator. </xd:li>
                    <xd:li>
                        <xd:b>04/13/2014 Rick Geimer</xd:b> more security fixes. Added sandbox attribute to iframe. Added td to the list of elements with restricted table attributes (missed that one previously). Fixed some typos. Cleaned up CSS styles. Merged the table templates since they all use the same code. Fixed a bug with styleCode processing that could result in lost data. Added external-image-whitelist param.</xd:li>
                    <xd:li>
                        <xd:b>04/07/2014 Rick Geimer</xd:b> more security fixes. Limited copy of only legal CDA table attributes to XHTML output.</xd:li>
                    <xd:li>
                        <xd:b>04/07/2014 Rick Geimer</xd:b> more security fixes. Fixed some bugs from the hot fix on 4/6 ($uc and $lc swapped during some translates). Added limit-external-images param that defaults to yes. When set to yes, no URIs with colons (protocol URLs) or beginning with double slashes (protocol relative URLs) are allowed in observation media. I'll revise later to add a whitelist capability.</xd:li>
                    <xd:li>
                        <xd:b>04/06/2014 Rick Geimer</xd:b> security hot fixes: Addressed javascript in nonXMLBody/text/reference/@value and non-sanitized copy of all table attributes.</xd:li>
                    <xd:li>
                        <xd:b>01/05/2011 Jingdong Li</xd:b> updated.</xd:li>
                    <xd:li>
                        <xd:b>09/17/2010 Jingdong Li</xd:b> updated.</xd:li>
                    <xd:li>
                        <xd:b>08/25/2010 Jingdong Li</xd:b> updated.</xd:li>
                    <xd:li>
                        <xd:b>03/30/2010 Jingdong Li</xd:b> updated.</xd:li>
                    <xd:li>
                        <xd:b>12/11/2009 Kai Heitmann</xd:b> updated.</xd:li>
                    <xd:li>
                        <xd:b>08/12/2008 Jingdong Li</xd:b> updated.</xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>
            <xd:p>XSLT 1.0 does not have date function, so we need something to compare against e.g. to get someones age</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="currentDate" select="(/hl7:ClinicalDocument/hl7:effectiveTime/@value)[1]"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Vocabulary file containing language dependant strings such as labels</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="vocFile" select="'http://localhost:3000/cda_l10n.xml'"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Cache language dependant strings</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="vocMessages" select="document('')"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Default language for retrieval of language dependant strings such as labels, e.g. 'en-US'. This is the fallback language in case the string is not available in the actual language. See also <xd:ref name="textLang" type="parameter">textLang</xd:ref>.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="textlangDefault" select="'en-US'"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Actual language for retrieval of language dependant strings such as labels, e.g. 'en-US'. Unless supplied, this is taken from the ClinicalDocument/language/@code attribute, or in case that is not present from <xd:ref name="textlangDefault" type="parameter">textlangDefault</xd:ref>.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="textLang">
        <xsl:choose>
            <xsl:when test="/hl7:ClinicalDocument/hl7:languageCode/@code">
                <xsl:value-of select="/hl7:ClinicalDocument/hl7:languageCode/@code"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$textlangDefault"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:param>

    <xd:doc>
        <xd:desc>
            <xd:p>Currently unused. Unsupported by Internet Explorer. Text encoding to render the output in. Defaults to UTF-8 which is fine for most environments. Could change into more localized encodings such as cp-1252 (Windows Latin 1), iso-8859-1 (Latin 1), or shift-jis (Japanese Kanji table))</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="textEncoding" select="'utf-8'"/>

    <xd:doc>
        <xd:desc>
            <xd:p>Boolean value for whether the result document may contain JavaScript. Some environments forbid the use of JavaScript. Without JavaScript, certain more dynamic features may not work.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="useJavascript" select="'true'"/>

    <xd:doc>
        <xd:desc>
            <xd:p>Absolute or relative URI to an external Cascading Stylesheet (CSS) file that contains style attributes for custom markup, e.g. in the @styleCode attribute in Section.text</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="externalCss"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the font family for the whole document unless overruled somewhere</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="font-family" select="'Verdana, Tahoma, sans-serif'"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the font size for all text unless otherwise specified, and is the base value for other font sizes</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="font-size-main" select="'9pt'"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the font size for text in the h1 tag, defaults to <xd:ref name="font-size-main" type="parameter">font-size-main</xd:ref> + 3</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="font-size-h1">
        <xsl:call-template name="raiseFontSize">
            <xsl:with-param name="with" select="3"/>
        </xsl:call-template>
    </xsl:param>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the font size for text in the h2 tag, defaults to <xd:ref name="font-size-main" type="parameter">font-size-main</xd:ref> + 2</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="font-size-h2">
        <xsl:call-template name="raiseFontSize">
            <xsl:with-param name="with" select="2"/>
        </xsl:call-template>
    </xsl:param>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the font size for text in the h3 tag, defaults to <xd:ref name="font-size-main" type="parameter">font-size-main</xd:ref> + 1</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="font-size-h3">
        <xsl:call-template name="raiseFontSize">
            <xsl:with-param name="with" select="1"/>
        </xsl:call-template>
    </xsl:param>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the font size for text in the h4 tag, defaults to <xd:ref name="font-size-main" type="parameter">font-size-main</xd:ref></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="font-size-h4" select="$font-size-main"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the font size for text in the h5 tag, defaults to <xd:ref name="font-size-main" type="parameter">font-size-main</xd:ref></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="font-size-h5" select="$font-size-main"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the font size for text in the h6 tag, defaults to <xd:ref name="font-size-main" type="parameter">font-size-main</xd:ref></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="font-size-h6" select="$font-size-main"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the font size for footnote text, defaults to <xd:ref name="font-size-main" type="parameter">font-size-main</xd:ref> - 1</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="font-size-footnote">
        <xsl:call-template name="raiseFontSize">
            <xsl:with-param name="with" select="-1"/>
        </xsl:call-template>
    </xsl:param>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the font color.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="font-color">#003366</xsl:param>

    <xd:doc>
        <xd:desc>
            <xd:p>Determines the background-color, as any legal hex, rgb or named color, for header like table elements, e.g. th tags, defaults to "LightGrey".</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="bgcolor-body">white</xsl:param>

    <xd:doc>
        <xd:desc>
            <xd:p>Determines the background-color, as any legal hex, rgb or named color, for header like table elements, e.g. th tags, defaults to "LightGrey".</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="bgcolor-th">LightGrey</xsl:param>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the background-color, as any legal hex, rgb or named color, for body like table elements, e.g. td tags, defaults to "#f2f2f2".</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="bgcolor-td">#f2f2f2</xsl:param>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines if the document title and top level summary of header information (patient/guardian/author/encounter/documentationOf, inFulfillmentOf) should be rendered. Defaults to "true", any other value is interpreted as "do not render". Some systems may have a context around the rendering of the document that would make rendering the header superfluous. Note that the footer, which may be switched off separately contains everything that the header does and more.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="dohtmlheader">true</xsl:param>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines if the document footer containing a listing of everything in the CDA Header should be rendered. Defaults to "true", any other value is interpreted as "do not render". Some systems may have a context around the rendering of the document that would make rendering the footer superfluous, or just want to concentrate on document contents.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="dohtmlfooter">true</xsl:param>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Security parameter. May contain a vertical bar separated list of URI prefixes, such as "http://www.example.com|https://www.example.com". See parameter <xd:ref name="limit-external-images" type="parameter">limit-external-images</xd:ref> for more detail.</xd:p>
        </xd:desc>
    </xd:doc> 
    <xsl:param name="external-image-whitelist"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Security parameter. When set to 'yes' limits the URIs to images (if any) to locally attached images and/or images that are on the <xd:ref name="external-image-whitelist" type="parameter">external-image-whitelist</xd:ref>. When set to anything other than 'yes' also allows for arbitrary external images (e.g. through http:// or https://). Default value is 'yes' which is considered defensive against potential security risks that could stem from resources loaded from arbitrary source.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="limit-external-images" select="'yes'"/>
    
    <xd:doc>
        <xd:desc>Determines depth of menu at the top of the document. Default is 1, which means just head section. Max is 3 which is head section + 2 levels (if any)</xd:desc>
    </xd:doc>
    <xsl:param name="menu-depth" select="3"/>
    
    <xd:doc>
        <xd:desc>Privacy parameter. Accepts a comma separated list of patient ID root values (normally OID's). When a patient ID is encountered with a root value in this list, then the rendering of the extension will be xxx-xxx-xxx regardless of what the actual value is. This is useful to prevent public display of for example the US SSN. Default is to render any ID as it occurs in the document. Note that this setting only affects human rendering and that it does not affect automated processing of the underlying document. If the same value also occurs in the <xd:ref name="skip-ids" type="parameter">skip-ids</xd:ref> list, then that takes precedence.</xd:desc>
    </xd:doc>
    <xsl:param name="skip-ids"/>
    <xsl:variable name="skip-ids-var" select="concat(',',$skip-ids,',')"/>
    
    <xd:doc>
        <xd:desc>Privacy parameter. Accepts a comma separated list of patient ID root values (normally OID's). When a patient ID is encountered with a root value in this list, then the rendering of this ID will be skipped. This is useful to prevent public display of for example the US SSN. Default is to render any ID as it occurs in the document. Note that this setting only affects human rendering and that it does not affect automated processing of the underlying document.</xd:desc>
    </xd:doc>
    <xsl:param name="mask-ids"/>
    <xsl:variable name="mask-ids-var" select="concat(',',$mask-ids,',')"/>
    
    <xd:doc>
        <xd:desc>Determines if sections will receive numbering according to ClinicalDocument order. Value 'true' activates numbering. Top level sections are 1, 2, 3, 4, sub level sections are 1.1, 1.2, 1.2.1, 1.2.2 etc.</xd:desc>
    </xd:doc>
    <xsl:param name="dosectionnumbering" select="'false'"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Do lowercase compare of language+region</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="textLangLowerCase">
        <xsl:call-template name="caseDown">
            <xsl:with-param name="data" select="$textLang"/>
        </xsl:call-template>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Do lowercase compare of language (assume alpha2 not alpha3)</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="textLangPartLowerCase" select="substring($textLangLowerCase,1,2)"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Do lowercase compare of default language+region</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="textLangDefaultLowerCase">
        <xsl:call-template name="caseDown">
            <xsl:with-param name="data" select="$textlangDefault"/>
        </xsl:call-template>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Do lowercase compare of default language (assume alpha2 not alpha3)</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="textLangDefaultPartLowerCase" select="substring($textLangDefaultLowerCase,1,2)"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>String processing variable. Lower-case alphabet</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="lc" select="'abcdefghijklmnopqrstuvwxyz'" />
    
    <xd:doc>
        <xd:desc>
            <xd:p>String processing variable. Upper-case alphabet</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="uc" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
    
    <xd:doc>
        <xd:desc>
            <xd:p>String processing variable. Removes the following characters, in addition to line breaks "':;?`{}“”„‚’</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="simple-sanitizer-match"><xsl:text>&#10;&#13;&#34;&#39;&#58;&#59;&#63;&#96;&#123;&#125;&#8220;&#8221;&#8222;&#8218;&#8217;</xsl:text></xsl:variable>
    
    <xd:doc>
        <xd:desc>
            <xd:p>String processing variable.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="simple-sanitizer-replace" select="'***************'"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Use XHTML 1.0 Strict with UTF-8 encoding. CDAr3 specifies an XHTML subset of tags in Section.text so that makes mapping easier.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output indent="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

    <xd:doc>
        <xd:desc>
            <xd:p>Main template. Triggers on all top level ClinicalDocument elements</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:apply-templates select="/hl7:ClinicalDocument"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Starts an HTML document containing a rendering of the ClinicalDocument</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:ClinicalDocument[not(ancestor::hl7:ClinicalDocument)]">
        <xsl:comment> Do NOT edit this HTML directly: it was generated via an XSLT transformation from a CDA Release 2 or 3 XML document. </xsl:comment>
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{substring($textLangLowerCase,1,2)}">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <title>
                    <xsl:call-template name="show-title"/>
                </title>
                <xsl:comment> General CSS </xsl:comment>
                <style type="text/css" media="all">
                    *{
                        font-family: <xsl:value-of select="$font-family"/>;
                        font-size: <xsl:value-of select="$font-size-main"/>;
                    }
                    body{
                        padding: 2px;
                        color: <xsl:value-of select="$font-color"/>;
                        background-color: <xsl:value-of select="$bgcolor-body"/>;
                        font-size: <xsl:value-of select="$font-size-main"/>;
                    }
                    #documentheader,
                    #documentbody,
                    #documentfooter{
                        width: 100%;
                    }
                    #documentheader{
                        border-bottom: 1px solid grey;
                        margin-bottom: 1em;
                    }
                    #documentfooter{
                        border-top: 1px solid grey;
                        margin-top: 1em;
                    }
                    a{
                        color: <xsl:value-of select="$font-color"/>;
                        background-color: <xsl:value-of select="$bgcolor-body"/>;

                    }
                    h1{
                        font-size: <xsl:value-of select="$font-size-h1"/>;
                        font-weight: bold;
                    }
                    h1.title{
                        text-align: center;
                    }
                    h2{
                        font-size: <xsl:value-of select="$font-size-h2"/>;
                        font-weight: bold;
                    }
                    h3{
                        font-size: <xsl:value-of select="$font-size-h3"/>;
                        font-weight: bold;
                    }
                    h4{
                        font-size: <xsl:value-of select="$font-size-h4"/>;
                        font-weight: bold;
                    }
                    h5{
                        font-size: <xsl:value-of select="$font-size-h5"/>;
                        font-weight: bold;
                    }
                    h6{
                        font-size: <xsl:value-of select="$font-size-h6"/>;
                        font-weight: bold;
                    }
                    hr{
                        width: 100%;
                    }
                    span {
                        font-size: <xsl:value-of select="$font-size-main"/>; /* IE8 hack: doesn't understand inheritance */
                        display: inline; /* IE8 hack: would go to next line otherwise */
                    }
                    table{
                        line-height: 10pt;
                        width: 100%;
                    }
                    thead tr, th{
                        background-color: <xsl:value-of select="$bgcolor-th"/>;
                    }
                    tbody tr{
                        background-color: <xsl:value-of select="$bgcolor-td"/>;
                    }
                    td{
                        font-size: <xsl:value-of select="$font-size-main"/>; /* IE8 hack: doesn't understand inheritance */
                        padding: 0.1cm 0.2cm;
                        vertical-align: top;
                    }
                    .table_simple{
                        width: auto;
                        color: inherit;
                        background-color: inherit;
                    }
                    .table_simple td{
                        padding: 0;
                    }
                    .table_simple td.td_label{
                        font-size: <xsl:value-of select="$font-size-main"/>; /* IE8 hack: doesn't understand inheritance */
                        font-weight: inherit;
                        font-style: italic;
                        padding-right: 0.2cm;
                    }
                    .header_table{
                        //border: 1pt solid #00008b;
                    }
                    .narr_table{
                        width: 100%;
                        margin: 0.3em 0;
                    }
                    .narr_tr{
                        //background-color: #ffffcc;
                    }
                    .narr_th{
                        background-color: <xsl:value-of select="$bgcolor-th"/>;
                        font-size: <xsl:value-of select="$font-size-main"/>; /* IE8 hack: doesn't understand inheritance */
                    }
                    .narr_footnote{
                        font-size: <xsl:value-of select="$font-size-footnote"/>;
                        font-style: italic;
                    }
                    .td_label{
                        font-size: <xsl:value-of select="$font-size-main"/>; /* IE8 hack: doesn't understand inheritance */
                        font-weight: bold;
                        background-color: <xsl:value-of select="$bgcolor-th"/>;
                    }
                    .td_label_width{
                        width: 20%;
                    }
                    .span_label{
                        font-size: <xsl:value-of select="$font-size-main"/>; /* IE8 hack: doesn't understand inheritance */
                        font-weight: bold;
                        padding-right: 5px;
                    }
                    .span_value{
                        font-size: <xsl:value-of select="$font-size-main"/>; /* IE8 hack: doesn't understand inheritance */
                        font-weight: normal;
                    }
                    .revision_insert{
                        text-decoration: underline overline;
                    }
                    .revision_insert_final{
                    }
                    .revision_delete{
                        text-decoration: line-through;
                    }
                    .revision_delete_final{
                        display: none;
                    }
                    .span_button {
                        display: table-cell;
                        cursor: pointer;
                        border: 2pt solid #585858;
                        border-radius: 15px;
                        -moz-border-radius: 15px;
                        padding: 0.1cm 0.2cm;
                        background-color: <xsl:value-of select="$bgcolor-td"/>;
                        font-weight: bold;
                        vertical-align: baseline;
                        width: 150px;
                    }
                    div.separator {
                        height: 1em;
                    }
                    div.caption {
                        font-weight: bold;
                        text-align: center;
                    }
                </style>
                <xsl:comment> Stylecode CSS </xsl:comment>
                <style type="text/css" media="all">
                    .Bold{
                        font-weight: bold;
                    }
                    .Italics{
                        font-style: italic;
                    }
                    .Underline{
                        text-decoration: underline;
                    }
                    .Emphasis{
                        font-weight: bold;
                        font-style: italic;
                    }
                    .Lrule{
                        border-left-width: 2px;
                        border-left-style: solid;
                    }
                    .Rrule{
                        border-right-width: 2px;
                        border-right-style: solid;
                    }
                    .Toprule{
                        border-top-width: 2px;
                        border-top-style: solid;
                    }
                    .Botrule{
                        border-bottom-width: 2px;
                        border-bottom-style: solid;
                    }
                    .Arabic{
                        list-style: arabic;
                    }
                    .LittleRoman{
                        list-style: lower-roman;
                    }
                    .BigRoman{
                        list-style: upper-roman;
                    }
                    .LittleAlpha{
                        list-style: lower-alpha;
                    }
                    .BigAlpha{
                        list-style: upper-alpha
                    }
                    .Disc{
                        list-style: disc;
                    }
                    .Circle{
                        list-style: circle;
                    }
                    .Square{
                        list-style: square;
                    }</style>
                <!--<xsl:comment> Stylecode CSS IHE PCC MCV, Revision 1.2, Trial Implementation, November 2, 2018</xsl:comment>
                <style type="text/css" media="all">
                    .xOrganizerRow > td, .organizer-row > td {
                        padding-bottom: 4px;
                    }
                    .xOrganizerRow, .organizer-row {
                        border-bottom: none;
                    }
                    .xWhitespace {
                        padding-left: 4px;
                    }
                    .xContentSpacing {
                        padding-left: 2.5em;
                    }
                    .xRowGroup > tr {
                        border-bottom: none;
                    }
                    table:first-of-type > tbody:first-of-type {
                        border-top: none;
                    }           
                    .xRowGroup {
                        border-top: 1px dotted #222;
                    }
                    .xSectionComments {
                        text-decoration: underline;
                    }
                    .xSectionComments, .xReconciliation {
                        margin-top: 15px;
                    }
                    .xLabel {
                        font-style:italic;
                    }
                    .xAlert, .xReaction{
                        color: red;
                    }
                    tr.xAlert {
                        background-color: #FDE7EC
                    }
                    tr.xAlert > td:first-of-type:before {
                        content: "\25B2";
                    } 
                    .xContentWrapping {
                        display: table-cell;
                        padding-left: 5px;
                    }
                    .xIndent, .xIndention{
                        white-space: pre;
                        vertical-align: top;
                        display: table-cell;
                    }
                    .xlistForTable {
                        list-style: none;
                        padding: 0;
                    }
                    .xtableWithinTable > tr > td {
                        margin: 0;
                        padding: 0;
                    }
                    xCenter {
                        text-align: center;
                    }
                    xRight {
                        text-align: right;
                    }
                    xLeft {
                        text-align: left;
                    }
                    xMono {
                        font-family: monospace;
                    }
                    xHighlight {
                        background-color: yellow;
                        color: black;
                    }
                </style>-->
                <xsl:comment> Section Button Toggle CSS </xsl:comment>
                <style type="text/css" media="screen">
                    div.button.expandCollapse {
                        float: left;
                        margin-right: 10px;
                        cursor: pointer;
                    }
                </style>
                <xsl:comment> Revision Toggle CSS </xsl:comment>
                <style type="text/css" media="print">
                    button, 
                    div.button,
                    #buttontable {
                        display: none;
                    }
                    div.section-content {
                        display: block !important;
                    }
                    .print_visible {
                        display: block;
                        float: none;
                        margin-right: 0;
                    }
                </style>
                <xsl:comment> Table of Contents CSS </xsl:comment>
                <style type="text/css" media="screen">
                    <xsl:text disable-output-escaping="yes">
                    #nav, #nav ul {
                        padding: 0;
                        margin: 0;
                        list-style: none;
                    }
                    
                    #nav li {
                        float: left;
                        width: 300px;
                    }
                    #nav ul {
                        position: absolute;
                        width: 300px;
                        left: -1000px;
                    }
                    #nav li ul li ul {
                        display: none;
                    }
                    
                    #nav li ul li:hover > ul {
                        display: block;
                        position: absolute;
                        left: 50px !important;
                    }
                    #nav li ul li:hover > ul > li > a {
                        border: 1px solid #585858;
                    }
                    
                    #nav li:hover ul, #nav li.ie_does_hover ul {
                        left: auto;
                        background-position: 0 0;
                    }
                    
                    #nav * a {
                        display: block;
                        padding: 2px 8px;
                        text-decoration: none;
                        font-weight: bold;
                        font-size: 11px;
                    }
                    </xsl:text>
                    #nav ul * a {
                        font-weight: bold;
                        color: #585858;
                        background-color: <xsl:value-of select="$bgcolor-td"/>;
                        cursor: pointer;
                    }
                    
                    #nav ul ul a:link, #nav ul ul a:visited {
                        font-weight: normal;
                        color: #585858;
                        background-color: <xsl:value-of select="$bgcolor-td"/>;
                        cursor: pointer;
                    }
                    
                    #nav * li a:hover, #nav * li a:active,
                    #nav * li * li a:hover, #nav * li * li a:active {
                        /*font-weight: normal;*/
                        color: white;
                        background-color: #585858;
                        cursor: pointer;
                    }
                    
                    #nav * li {
                        border-left: 2px solid white;
                    }
                    
                    #nav * ul li {
                        border-top: 2px solid white;
                        border-left: 0;
                    }
                    
                    /* IE only hack */
                    * html ul li, * html ul ul li{
                        border-bottom: 2px solid white;
                    }
                    
                    * html ul ul li{
                        border-top: 0;
                    }
                    /* End IE only hack */
                </style>
                <xsl:if test="string-length($externalCss)>0">
                    <xsl:comment> External CSS </xsl:comment>
                    <link type="text/css" rel="stylesheet" href="{$externalCss}"/>
                </xsl:if>
                
                <xsl:if test="string($useJavascript)='true'">
                    <xsl:comment> Javascript for Revisions switch </xsl:comment>
                    <script type="text/javascript">
                        <xsl:text>var gStringCollapse = "</xsl:text>
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="'Collapse'"/>
                        </xsl:call-template>
                        <xsl:text>"; </xsl:text>
                        <xsl:text>var gStringExpand = "</xsl:text>
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="'Expand'"/>
                        </xsl:call-template>
                        <xsl:text>";</xsl:text>
                        <xsl:text>
                        function expandAllSections() {
                            var toggleButtons = document.getElementsByClassName("expandCollapse");
                            if (toggleButtons != null) {
                                var i = 0;
                                while (i != toggleButtons.length) {
                                    expandSection(toggleButtons[i]);
                                    i++;
                                }
                            }
                            toggle('sectionsToggleExpand');
                            toggle('sectionsToggleCollapse');
                        }
                        function expandSection(sectionTitleButton) {
                            sectionTitleButton.title = gStringCollapse;
                            sectionTitleButton.innerText = '▼';
                            sectionTitleButton.onclick = function (){collapseSection(this);};
                            var sectionContent = sectionTitleButton.parentElement.parentElement.children[1]
                            if (sectionContent != null) {
                                sectionContent.style.display = '';
                            }
                        }
                        function collapseAllSections() {
                            var toggleButtons = document.getElementsByClassName("expandCollapse");
                            if (toggleButtons != null) {
                                var i = 0;
                                while (i != toggleButtons.length) {
                                    collapseSection(toggleButtons[i]);
                                    i++;
                                }
                            }
                            toggle('sectionsToggleExpand');
                            toggle('sectionsToggleCollapse');
                        }
                        function collapseSection(sectionTitleButton) {
                            sectionTitleButton.title = gStringExpand;
                            sectionTitleButton.innerText = '▶';
                            sectionTitleButton.onclick = function (){expandSection(this);};
                            var sectionContent = sectionTitleButton.parentElement.parentElement.children[1]
                            if (sectionContent != null) {
                                sectionContent.style.display = 'none';
                            }
                        }
                        function showReviewMarks() {
                            var allHTMLTags=document.getElementsByTagName("*");
                            for (i in allHTMLTags) {
                                //Get all tags with the specified class name.
                                if (allHTMLTags[i].className=='revision_insert_final') {
                                    allHTMLTags[i].className = 'revision_insert';
                                }
                                if (allHTMLTags[i].className=='revision_delete_final') {
                                    allHTMLTags[i].className = 'revision_delete';
                                }
                            }
                            toggle('revisionToggleOn');
                            toggle('revisionToggleOff');
                        }
                        function hideReviewMarks() {
                            var allHTMLTags=document.getElementsByTagName("*");
                            for (i in allHTMLTags) {
                                //Get all tags with the specified class name.
                                if (allHTMLTags[i].className=='revision_insert') {
                                    allHTMLTags[i].className = 'revision_insert_final';
                                }
                                if (allHTMLTags[i].className=='revision_delete') {
                                    allHTMLTags[i].className = 'revision_delete_final';
                                }
                            }
                            toggle('revisionToggleOn');
                            toggle('revisionToggleOff');
                        }
                        function toggle(obj) {
                            var el = document.getElementById(obj);
                            el.style.display = (el.style.display != 'none' ? 'none' : '' );
                        }
                        </xsl:text>
                    </script>
                    <xsl:comment> Javascript for Table of Contents menu </xsl:comment>
                    <script type="text/javascript">
                        sfHover = function() {
                            var sfEls = document.getElementById("nav").getElementsByTagName("li");
                            for (i in sfEls) {
                                sfEls[i].onmouseover=function() {
                                    this.className+=" ie_does_hover";
                                }
                                sfEls[i].onmouseout=function() {
                                    this.className=this.className.replace(new RegExp(" ie_does_hover"), "");
                                }
                            }
                        }
                        if (window.attachEvent) window.attachEvent("onload", sfHover);
                    </script>
                </xsl:if>
            </head>
            <body>
                <div id="documentheader">
                    <a id="_toc">&#160;</a>
                    <xsl:if test="$dohtmlheader = 'true'">
                        <h1 class="title">
                            <xsl:call-template name="show-title"/>
                        </h1>
                        <xsl:call-template name="show-header"/>
                    </xsl:if>
                    <!-- START TOC and Revision toggle -->
                    <xsl:if test="string($useJavascript)='true'">
                        <xsl:if test="//hl7:content[@revised] or count(hl7:component/hl7:structuredBody/hl7:component[hl7:section]) &gt; 1">
                            <div id="buttontable">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tbody>
                                        <tr>
                                            <xsl:call-template name="make-tableofcontents"/>
                                            <xsl:call-template name="make-revisiontoggle"/>
                                            <xsl:call-template name="make-sectiontoggle"/>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </xsl:if>
                    </xsl:if>
                    <!-- END TOC and Revision toggle -->
                </div>
                <div id="documentbody">
                    <xsl:apply-templates select="hl7:component/hl7:structuredBody | hl7:component/hl7:nonXMLBody"/>
                </div>
                <xsl:if test="$dohtmlfooter = 'true'">
                    <div id="documentfooter">
                        <xsl:call-template name="documentGeneral"/>
                        <xsl:call-template name="relatedDocument"/>
                        <xsl:call-template name="custodian"/>
                        <div class="separator">&#160;</div>
                        <xsl:call-template name="recordTarget"/>
                        <xsl:call-template name="authorization"/>
                        <div class="separator">&#160;</div>
                        <xsl:call-template name="documentationOf"/>
                        <xsl:call-template name="inFulfillmentOf"/>
                        <xsl:call-template name="componentOf"/>
                        <div class="separator">&#160;</div>
                        <xsl:call-template name="author"/>
                        <xsl:call-template name="participant"/>
                        <!--xsl:call-template name="participant1"/-->
                        <!--xsl:call-template name="participant2"/-->
                        <xsl:call-template name="dataEnterer"/>
                        <xsl:call-template name="informant"/>
                        <xsl:call-template name="informationRecipient"/>
                        <xsl:call-template name="authenticator"/>
                        <xsl:call-template name="legalAuthenticator"/>
                    </div>
                </xsl:if>
            </body>
        </html>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle structuredBody</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:component/hl7:structuredBody">
        <xsl:for-each select="hl7:component/hl7:section">
            <xsl:call-template name="section">
                <xsl:with-param name="level" select="3"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle nonXMLBody</xd:p>
        </xd:desc>
        <xd:param name="usemap"/>
    </xd:doc>
    <xsl:template match="hl7:component/hl7:nonXMLBody | hl7:observationMedia">
        <xsl:param name="usemap"/>
        <xsl:variable name="renderID">
            <xsl:choose>
                <xsl:when test="@ID">
                    <xsl:value-of select="@ID"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat(generate-id(.), '_', local-name(.))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="renderAltText">
            <xsl:variable name="i18nid">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'id'"/>
                </xsl:call-template>
            </xsl:variable>
            <xsl:if test="hl7:id">
                <xsl:value-of select="concat($i18nid, ' = ',hl7:id[1]/@root, ' ', hl7:id[1]/@extension)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="renderElement" select="self::hl7:nonXMLBody/hl7:text | self::hl7:observationMedia/hl7:value"/>
        <xsl:choose>
            <!-- Minimal mitigation for security risk based on malicious input -->
            <xsl:when test="$renderElement/hl7:reference[starts-with(translate(normalize-space(@value),'JAVASCRIPT','javascript'),'javascript')]">
                <pre title="{$renderAltText}">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'securityRiskURLLabel'"/>
                    </xsl:call-template>
                    <b><i><xsl:value-of select="$renderElement/hl7:reference/@value"/></i></b>
                </pre>
            </xsl:when>
            <!-- if there is a reference, use that in an iframe -->
            <xsl:when test="$renderElement/hl7:reference">
                <xsl:variable name="source" select="string($renderElement/hl7:reference/@value)"/>
                <xsl:variable name="lcSource" select="translate($source, $uc, $lc)"/>
                <xsl:variable name="scrubbedSource" select="translate($source, $simple-sanitizer-match, $simple-sanitizer-replace)"/>
                <xsl:message><xsl:value-of select="$source"/>, <xsl:value-of select="$lcSource"/></xsl:message>
                <xsl:choose>
                    <xsl:when test="contains($lcSource,'javascript')">
                        <p>
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'javascript-injection-warning'"/>
                            </xsl:call-template>
                        </p>
                        <xsl:message>
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'javascript-injection-warning'"/>
                            </xsl:call-template>
                        </xsl:message>
                    </xsl:when>
                    <xsl:when test="not($source = $scrubbedSource)">
                        <p>
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'malicious-content-warning'"/>
                            </xsl:call-template>
                        </p>
                        <xsl:message>
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'malicious-content-warning'"/>
                            </xsl:call-template>
                        </xsl:message>
                    </xsl:when>
                    <xsl:when test="$renderElement[starts-with(@mediaType, 'image/')]">
                        <img alt="{$renderAltText}" title="{$renderAltText}" src="{$scrubbedSource}">
                            <xsl:if test="string-length($usemap) &gt; 0">
                                <xsl:attribute name="usemap">
                                    <xsl:value-of select="$usemap"/>
                                </xsl:attribute>
                            </xsl:if>
                        </img>
                    </xsl:when>
                    <xsl:otherwise>
                        <iframe name="{$renderID}" id="{$renderID}" width="100%" height="600" src="{$source}" title="{$renderAltText}" sandbox=""/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <!-- This is an image of some sort -->
            <xsl:when test="$renderElement[starts-with(@mediaType,'image/')]">
                <img alt="{$renderAltText}" title="{$renderAltText}">
                    <xsl:if test="string-length($usemap) &gt; 0">
                        <xsl:attribute name="usemap">
                            <xsl:value-of select="$usemap"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('data:',$renderElement/@mediaType,';base64,',$renderElement/text())"/>
                    </xsl:attribute>
                </img>
            </xsl:when>
            <!-- This is something base64 -->
            <xsl:when test="$renderElement[@representation = 'B64']">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'If the contents are not displayed here, it may be offered as a download.'"/>
                </xsl:call-template>
                <iframe name="{$renderID}" id="{$renderID}" width="100%" height="600" title="{$renderAltText}">
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('data:', $renderElement/@mediaType, ';base64,', $renderElement/text())"/>
                    </xsl:attribute>
                </iframe>
            </xsl:when>
            <!-- This is plain text -->
            <xsl:when test="$renderElement[not(@mediaType) or @mediaType='text/plain']">
                <pre title="{$renderAltText}">
                    <xsl:value-of select="$renderElement/text()"/>
                </pre>
            </xsl:when>
            <xsl:otherwise>
                <pre title="{$renderAltText}">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'Cannot display the text'"/>
                    </xsl:call-template>
                </pre>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>component/section: display title and text, and process any nested component/sections increasing margin-left as we go deeper</xd:p>
        </xd:desc>
        <xd:param name="level">Header level element to call, e.g. h1, h2 or h3</xd:param>
        <xd:param name="margin">Margin defined in em</xd:param>
    </xd:doc>
    <xsl:template name="section">
        <xsl:param name="level" select="3"/>
        <xsl:param name="margin" select="0"/>
        
        <div style="margin-left: {$margin}em;" class="section">
            <div class="section-title">
                <xsl:if test="string($useJavascript)='true'">
                    <div class="button expandCollapse" onclick="collapseSection(this)">
                        <xsl:attribute name="title">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'Collapse'"/>
                            </xsl:call-template>
                        </xsl:attribute>
                        <xsl:text>▼</xsl:text>
                    </div>
                </xsl:if>
                <xsl:call-template name="section-title">
                    <xsl:with-param name="level" select="$level"/>
                </xsl:call-template>
            </div>
            <div class="section-content">
                <xsl:if test="hl7:author | hl7:informant | hl7:subject">
                    <div class="section-meta">
                        <xsl:call-template name="section-author"/>
                        <xsl:call-template name="section-informant"/>
                        <xsl:call-template name="section-subject"/>
                    </div>
                </xsl:if>
                <div class="section-body">
                    <xsl:if test="hl7:text">
                        <xsl:call-template name="section-text"/>
                    </xsl:if>
                    <xsl:for-each select="hl7:component/hl7:section">
                        <xsl:call-template name="section">
                            <xsl:with-param name="margin" select="$margin + 2"/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:if test="not(hl7:text | hl7:component/hl7:section)">
                        <xsl:text>&#160;</xsl:text>
                    </xsl:if>
                </div>
            </div>
        </div>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Produces a section title with at least an anchor based on relative position in the document (for the Table of Contents), and a second anchor if the section has the @ID tag</xd:p>
        </xd:desc>
        <xd:param name="level">Header level element to call, e.g. h1, h2 or h3</xd:param>
    </xd:doc>
    <xsl:template name="section-title">
        <xsl:param name="level" select="3"/>
        <!--<xsl:if test="@ID">
            <a name="{@ID}"/>
        </xsl:if>-->
        <xsl:element name="{concat('h', $level)}">
            <xsl:attribute name="id">
                <xsl:choose>
                    <xsl:when test="@ID">
                        <xsl:value-of select="@ID"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="." mode="getAnchorName"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:if test="hl7:code">
                <xsl:attribute name="title">
                    <xsl:call-template name="show-code-set">
                        <xsl:with-param name="in" select="hl7:code"/>
                        <xsl:with-param name="sep" select="', '"/>
                        <xsl:with-param name="textonly" select="'true'"/>
                    </xsl:call-template>
                </xsl:attribute>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="count(hl7:component/hl7:structuredBody/hl7:component[hl7:section]) &gt; 1">
                    <!-- Add link to go back to top if the document has more than one section, otherwise superfluous -->
                    <a href="#_toc">
                        <xsl:apply-templates select="." mode="getTitleName"/>
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="." mode="getTitleName"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Produces a legal style of numbering for a section. E.g. 1.1, 1.2.1, 1.2.2 etc.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:section" mode="getNumbering">
        <xsl:for-each select="ancestor-or-self::hl7:section">
            <xsl:value-of select="count(parent::hl7:component/preceding-sibling::hl7:component) + 1"/>
            <xsl:if test="position() != last()">
                <xsl:text>.</xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Produces an anchor name suitable for the HTML &lt;a/&gt; tag</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:section" mode="getAnchorName">
        <xsl:value-of select="'section_'"/>
        <xsl:apply-templates select="." mode="getNumbering"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Produces a human readable section title based on its title, or code as fallback</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:section" mode="getTitleName">
        <xsl:if test="$dosectionnumbering = 'true'">
            <xsl:apply-templates select="." mode="getNumbering"/>
            <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="hl7:title">
                <xsl:call-template name="show-text-set">
                    <xsl:with-param name="in" select="hl7:title"/>
                    <xsl:with-param name="sep" select="', '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="hl7:code">
                <xsl:call-template name="show-code-set">
                    <xsl:with-param name="in" select="hl7:code"/>
                    <xsl:with-param name="sep" select="', '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="hl7:id">
                <xsl:call-template name="show-id-set">
                    <xsl:with-param name="in" select="hl7:id"/>
                    <xsl:with-param name="sep" select="', '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'section'"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle section author</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="section-author">
        <xsl:if test="hl7:author">
            <div>
                <b>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'sectionAuthor'"/>
                        <xsl:with-param name="post" select="': '"/>
                    </xsl:call-template>
                </b>
                <div>
                    <ul>
                        <xsl:for-each select="hl7:author">
                            <li>
                                <xsl:choose>
                                    <xsl:when test="hl7:assignedAuthor/hl7:assignedPerson">
                                        <xsl:call-template name="show-name-set">
                                            <xsl:with-param name="in" select="hl7:assignedAuthor/hl7:assignedPerson/hl7:name"/>
                                        </xsl:call-template>
                                        <xsl:if test="hl7:assignedAuthor/hl7:assignedPerson/hl7:desc">
                                            <div>
                                                <xsl:value-of select="hl7:assignedAuthor/hl7:assignedPerson/hl7:desc"/>
                                            </div>
                                        </xsl:if>
                                        <xsl:if test="hl7:assignedAuthor/hl7:assignedPerson/hl7:birthTime">
                                            <xsl:text> </xsl:text>
                                            <xsl:call-template name="getLocalizedString">
                                                <xsl:with-param name="key" select="'birthTimeLong'"/>
                                            </xsl:call-template>
                                            <xsl:text> </xsl:text>
                                            <xsl:call-template name="show-timestamp">
                                                <xsl:with-param name="in" select="hl7:assignedAuthor/hl7:assignedPerson/hl7:birthTime"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:when test="hl7:assignedAuthor/hl7:assignedAuthoringDevice">
                                        <xsl:value-of select="hl7:assignedAuthor/hl7:assignedAuthoringDevice/hl7:softwareName"/>
                                    </xsl:when>
                                    <xsl:when test="hl7:assignedAuthor/hl7:assignedDevice/hl7:softwareName">
                                        <xsl:value-of select="hl7:assignedAuthor/hl7:assignedDevice/hl7:softwareName/@value"/>
                                    </xsl:when>
                                    <xsl:when test="hl7:assignedAuthor/hl7:id">
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'id'"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                        <xsl:call-template name="show-id-set">
                                            <xsl:with-param name="in" select="hl7:assignedAuthor/hl7:id"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:if test="hl7:assignedAuthor/hl7:code">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="pre" select="' - '"/>
                                        <xsl:with-param name="key" select="'code'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:assignedAuthor/hl7:code"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="hl7:assignedAuthor/hl7:representedOrganization/hl7:name">
                                        <xsl:text>, </xsl:text>
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'organization'"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                        <xsl:call-template name="show-name-set">
                                            <xsl:with-param name="in" select="hl7:assignedAuthor/hl7:representedOrganization/hl7:name"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:when test="hl7:assignedAuthor/hl7:representedOrganization/hl7:id">
                                        <xsl:text>, </xsl:text>
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'organization'"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                        <xsl:call-template name="show-id-set">
                                            <xsl:with-param name="in" select="hl7:assignedAuthor/hl7:representedOrganization/hl7:id"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:if test="hl7:assignedAuthor/hl7:telecom">
                                    <br/>
                                    <xsl:call-template name="show-telecom-set">
                                        <xsl:with-param name="in" select="hl7:assignedAuthor/hl7:telecom"/>
                                    </xsl:call-template>
                                </xsl:if>
                            </li>
                        </xsl:for-each>
                    </ul>
                </div>
            </div>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle  section informant </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="section-informant">
        <xsl:if test="hl7:informant">
            <div>
                <b>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'sectionInformant'"/>
                        <xsl:with-param name="post" select="': '"/>
                    </xsl:call-template>
                </b>
                <div>
                    <ul>
                        <xsl:for-each select="hl7:informant">
                            <li>
                                <xsl:choose>
                                    <xsl:when test="hl7:relatedEntity">
                                        <xsl:choose>
                                            <xsl:when test="hl7:relatedEntity/hl7:code">
                                                <xsl:text>(</xsl:text>
                                                <xsl:call-template name="show-code-set">
                                                    <xsl:with-param name="in" select="hl7:relatedEntity/hl7:code"/>
                                                </xsl:call-template>
                                                <xsl:text>) </xsl:text>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:text>(</xsl:text>
                                                <xsl:call-template name="getLocalizedString">
                                                    <xsl:with-param name="key" select="concat('2.16.840.1.113883.5.110-',hl7:relatedEntity/@classCode)"/>
                                                </xsl:call-template>
                                                <xsl:text>) </xsl:text>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:call-template name="show-name-set">
                                            <xsl:with-param name="in" select="hl7:relatedEntity/hl7:relatedPerson/hl7:name"/>
                                        </xsl:call-template>
                                        <xsl:if test="hl7:relatedEntity/hl7:relatedPerson/hl7:desc">
                                            <div>
                                                <xsl:value-of select="hl7:relatedEntity/hl7:relatedPerson/hl7:desc"/>
                                            </div>
                                        </xsl:if>
                                        <xsl:if test="hl7:relatedEntity/hl7:relatedPerson/hl7:birthTime">
                                            <xsl:text> </xsl:text>
                                            <xsl:call-template name="getLocalizedString">
                                                <xsl:with-param name="key" select="'birthTimeLong'"/>
                                            </xsl:call-template>
                                            <xsl:text> </xsl:text>
                                            <xsl:call-template name="show-timestamp">
                                                <xsl:with-param name="in" select="hl7:relatedEntity/hl7:relatedPerson/hl7:birthTime"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:when test="hl7:assignedEntity">
                                        <xsl:choose>
                                            <xsl:when test="hl7:assignedEntity/hl7:assignedPerson/hl7:name">
                                                <xsl:call-template name="show-name-set">
                                                    <xsl:with-param name="in" select="hl7:assignedEntity/hl7:assignedPerson/hl7:name"/>
                                                </xsl:call-template>
                                                <xsl:if test="hl7:assignedEntity/hl7:assignedPerson/hl7:desc">
                                                    <div>
                                                        <xsl:value-of select="hl7:assignedEntity/hl7:assignedPerson/hl7:desc"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="hl7:assignedEntity/hl7:assignedPerson/hl7:birthTime">
                                                    <xsl:text> </xsl:text>
                                                    <xsl:call-template name="getLocalizedString">
                                                        <xsl:with-param name="key" select="'birthTimeLong'"/>
                                                    </xsl:call-template>
                                                    <xsl:text> </xsl:text>
                                                    <xsl:call-template name="show-timestamp">
                                                        <xsl:with-param name="in" select="hl7:assignedEntity/hl7:assignedPerson/hl7:birthTime"/>
                                                    </xsl:call-template>
                                                </xsl:if>
                                            </xsl:when>
                                            <xsl:when test="hl7:assignedEntity/hl7:id">
                                                <xsl:call-template name="getLocalizedString">
                                                    <xsl:with-param name="key" select="'id'"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="show-id-set">
                                                    <xsl:with-param name="in" select="hl7:assignedEntity/hl7:id"/>
                                                    <xsl:with-param name="sep" select="', '"/>
                                                </xsl:call-template>
                                            </xsl:when>
                                        </xsl:choose>

                                        <xsl:if test="hl7:assignedEntity/hl7:representedOrganization">
                                            <xsl:text>, </xsl:text>
                                            <xsl:call-template name="getLocalizedString">
                                                <xsl:with-param name="key" select="'organization'"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="show-name-set">
                                                <xsl:with-param name="in" select="hl7:assignedEntity/hl7:representedOrganization/hl7:name"/>
                                                <xsl:with-param name="sep" select="', '"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="hl7:assignedEntity/hl7:representedOrganization/hl7:telecom">
                                            <xsl:text>, </xsl:text>
                                            <xsl:call-template name="show-telecom-set">
                                                <xsl:with-param name="in" select="hl7:assignedEntity/hl7:representedOrganization/hl7:telecom"/>
                                                <xsl:with-param name="sep" select="', '"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                    </xsl:when>
                                </xsl:choose>

                                <xsl:if test="hl7:relatedEntity/hl7:telecom | hl7:assignedEntity/hl7:telecom">
                                    <br/>
                                    <xsl:call-template name="show-telecom-set">
                                        <xsl:with-param name="in" select="hl7:relatedEntity/hl7:telecom | hl7:assignedEntity/hl7:telecom"/>
                                    </xsl:call-template>
                                </xsl:if>
                            </li>
                        </xsl:for-each>
                    </ul>
                </div>
            </div>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle  section subject </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="section-subject">
        <xsl:if test="hl7:subject">
            <div>
                <b>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'sectionSubject'"/>
                        <xsl:with-param name="post" select="': '"/>
                    </xsl:call-template>
                </b>
                <div>
                    <ul>
                        <xsl:for-each select="hl7:subject">
                            <li>
                                <xsl:if test="hl7:relatedSubject/hl7:subject/hl7:name">
                                    <xsl:call-template name="show-name-set">
                                        <xsl:with-param name="in" select="hl7:relatedSubject/hl7:subject/hl7:name"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="hl7:relatedSubject/hl7:code">
                                    <xsl:text> - </xsl:text>
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'code'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:relatedSubject/hl7:code"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="hl7:relatedSubject/hl7:subject[*[local-name() = 'birthTime'] | *[local-name() = 'deceasedInd'] | *[local-name() = 'birthdeceasedTime'] | *[local-name() = 'multipleBirthInd'] | *[local-name() = 'multipleBirthOrderNumber']]">
                                    <xsl:text>, </xsl:text>
                                    <xsl:call-template name="show-birthDeathTime-multipleBirth">
                                        <xsl:with-param name="in" select="hl7:relatedSubject/hl7:subject"/>
                                        <xsl:with-param name="clinicalDocumentEffectiveTime" select="ancestor-or-self::hl7:ClinicalDocument/hl7:effectiveTime/@value"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="hl7:relatedSubject/hl7:subject/hl7:administrativeGenderCode">
                                    <xsl:text>, </xsl:text>
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'administrativeGenderCode'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:relatedSubject/hl7:subject/hl7:administrativeGenderCode"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="hl7:relatedSubject/hl7:subject/hl7:raceCode">
                                    <xsl:text>, </xsl:text>
                                            <xsl:call-template name="getLocalizedString">
                                                <xsl:with-param name="key" select="'Race'"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="show-code-set">
                                                <xsl:with-param name="in" select="hl7:relatedSubject/hl7:subject/hl7:raceCode"/>
                                            </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="hl7:relatedSubject/hl7:subject/hl7:ethnicGroupCode">
                                    <xsl:text>, </xsl:text>
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'Ethnicity'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:relatedSubject/hl7:subject/hl7:ethnicGroupCode"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="hl7:relatedSubject/hl7:telecom">
                                    <div>
                                        <xsl:call-template name="show-telecom-set">
                                            <xsl:with-param name="in" select="hl7:relatedSubject/hl7:telecom"/>
                                        </xsl:call-template>
                                    </div>
                                </xsl:if>
                            </li>
                        </xsl:for-each>
                    </ul>
                </div>
            </div>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Puts a div around the Section.text and hands it off to other templates</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="section-text">
        <div>
            <xsl:apply-templates select="hl7:text"/>
        </div>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle    paragraph  </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:paragraph">
        <p>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!--<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-->
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle    linkHtml  </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:linkHtml">
        <xsl:element name="a">
            <xsl:apply-templates select="." mode="handleSectionTextAttributes">
                <xsl:with-param name="class">linkHtml</xsl:with-param>
            </xsl:apply-templates>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle pre</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:pre">
        <pre>
            <xsl:apply-templates/>
        </pre>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle content. Content w/ deleted text is hidden</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:content">
        <span>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!--<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-->
            <!-- IHE PCC MCV -->
            <!--<xsl:if test="@styleCode = 'xHR' or starts-with(@styleCode, 'xHR ')">
                <hr class="xHR"/>
            </xsl:if>-->
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle line break </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:br">
        <xsl:element name="br">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle list  </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:list">
        <!-- caption -->
        <xsl:if test="hl7:caption">
            <div style="font-weight:bold; ">
                <xsl:apply-templates select="hl7:caption"/>
            </div>
        </xsl:if>
        <!-- item -->
        <xsl:choose>
            <xsl:when test="@listType='ordered'">
                <ol>
                    <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
                    <!--<xsl:if test="@ID">
                        <a name="{@ID}"/>
                    </xsl:if>-->
                    <xsl:for-each select="hl7:item">
                        <li>
                            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
                            <!--<xsl:if test="@ID">
                                <a name="{@ID}"/>
                            </xsl:if>-->
                            <xsl:apply-templates/>
                        </li>
                    </xsl:for-each>
                </ol>
            </xsl:when>
            <xsl:otherwise>
                <!-- list is unordered -->
                <ul>
                    <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
                    <!--<xsl:if test="@ID">
                        <a name="{@ID}"/>
                    </xsl:if>-->
                    <xsl:for-each select="hl7:item">
                        <li>
                            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
                            <!--<xsl:if test="@ID">
                                <a name="{@ID}"/>
                            </xsl:if>-->
                            <xsl:apply-templates/>
                        </li>
                    </xsl:for-each>
                </ul>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle caption  </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:caption">
        <xsl:choose>
            <xsl:when test="parent::hl7:table">
                <caption>
                    <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
                    <!--<xsl:if test="@ID">
                        <a name="{@ID}"/>
                    </xsl:if>-->
                    <xsl:apply-templates/>
                </caption>
            </xsl:when>
            <xsl:otherwise>
                <div class="caption">
                    <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
                    <!--<xsl:if test="@ID">
                        <a name="{@ID}"/>
                    </xsl:if>-->
                    <xsl:apply-templates/>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle footnote </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:footnote">
        <xsl:variable name="id" select="@ID"/>
        <xsl:variable name="footNoteNum">
            <xsl:for-each select="//hl7:footnote">
                <xsl:if test="@ID = $id">
                    <xsl:value-of select="position()"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <div>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes">
                <xsl:with-param name="class" select="'narr_footnote'"/>
            </xsl:apply-templates>
            <xsl:text>[</xsl:text>
            <xsl:value-of select="$footNoteNum"/>
            <xsl:text>]. </xsl:text>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle footnoteRef. Produces a superscript [n] where n is the occurence number of this ref in the
                whole document. Also adds a title with the first 50 characters of th footnote on the number so you 
                don't have to navigate to the footnote and just continue to read.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:footnoteRef">
        <xsl:variable name="idref" select="@IDREF"/>
        <xsl:variable name="footNoteNum">
            <xsl:for-each select="//hl7:footnote">
                <xsl:if test="@ID = $idref">
                    <xsl:value-of select="position()"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="footNoteText">
            <xsl:copy-of select="//hl7:footnote[@ID = $idref]//text()"/>
        </xsl:variable>
        <sup>
            <xsl:text>[</xsl:text>
            <a href="#{$idref}">
                <!-- Render footnoteref with the first 50 characters of the text -->
                <xsl:attribute name="title">
                    <xsl:value-of select="substring($footNoteText, 1, 50)"/>
                    <xsl:if test="string-length($footNoteText) > 50">
                        <xsl:text>...</xsl:text>
                    </xsl:if>
                </xsl:attribute>
                <xsl:value-of select="$footNoteNum"/>
            </a>
            <xsl:text>]</xsl:text>
        </sup>
    </xsl:template>

    <!--<xd:doc>
        <xd:desc>
            <xd:p>Handle renderMultiMedia. Produces one or more iframes depending on the number of IDREFS in @referencedObject. Can have a caption on all of them.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:renderMultiMedia">
        <xsl:variable name="idrefs">
            <xsl:call-template name="tokenize">
                <xsl:with-param name="string" select="@referencedObject"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:apply-templates select="ancestor::hl7:ClinicalDocument//hl7:observationMedia[@ID = $idrefs]"/>
    </xsl:template>-->
    
    <xsl:variable name="table-elem-attrs">
        <tableElems>
            <elem name="table">
                <attr name="ID"/>
                <attr name="language"/>
                <attr name="styleCode"/>
                <attr name="summary"/>
                <attr name="width"/>
                <attr name="border"/>
                <attr name="frame"/>
                <attr name="rules"/>
                <attr name="cellspacing"/>
                <attr name="cellpadding"/>
            </elem>
            <elem name="thead">
                <attr name="ID"/>
                <attr name="language"/>
                <attr name="styleCode"/>
                <attr name="align"/>
                <attr name="char"/>
                <attr name="charoff"/>
                <attr name="valign"/>
            </elem>
            <elem name="tfoot">
                <attr name="ID"/>
                <attr name="language"/>
                <attr name="styleCode"/>
                <attr name="align"/>
                <attr name="char"/>
                <attr name="charoff"/>
                <attr name="valign"/>
            </elem>
            <elem name="tbody">
                <attr name="ID"/>
                <attr name="language"/>
                <attr name="styleCode"/>
                <attr name="align"/>
                <attr name="char"/>
                <attr name="charoff"/>
                <attr name="valign"/>
            </elem>
            <elem name="colgroup">
                <attr name="ID"/>
                <attr name="language"/>
                <attr name="styleCode"/>
                <attr name="span"/>
                <attr name="width"/>
                <attr name="align"/>
                <attr name="char"/>
                <attr name="charoff"/>
                <attr name="valign"/>
            </elem>
            <elem name="col">
                <attr name="ID"/>
                <attr name="language"/>
                <attr name="styleCode"/>
                <attr name="span"/>
                <attr name="width"/>
                <attr name="align"/>
                <attr name="char"/>
                <attr name="charoff"/>
                <attr name="valign"/>
            </elem>
            <elem name="tr">
                <attr name="ID"/>
                <attr name="language"/>
                <attr name="styleCode"/>
                <attr name="align"/>
                <attr name="char"/>
                <attr name="charoff"/>
                <attr name="valign"/>
            </elem>
            <elem name="th">
                <attr name="ID"/>
                <attr name="language"/>
                <attr name="styleCode"/>
                <attr name="abbr"/>
                <attr name="axis"/>
                <attr name="headers"/>
                <attr name="scope"/>
                <attr name="rowspan"/>
                <attr name="colspan"/>
                <attr name="align"/>
                <attr name="char"/>
                <attr name="charoff"/>
                <attr name="valign"/>
            </elem>
            <elem name="td">
                <attr name="ID"/>
                <attr name="language"/>
                <attr name="styleCode"/>
                <attr name="abbr"/>
                <attr name="axis"/>
                <attr name="headers"/>
                <attr name="scope"/>
                <attr name="rowspan"/>
                <attr name="colspan"/>
                <attr name="align"/>
                <attr name="char"/>
                <attr name="charoff"/>
                <attr name="valign"/>
            </elem>
        </tableElems>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc>Handle table and constituents of table</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:table | hl7:thead | hl7:tfoot | hl7:tbody | hl7:colgroup | hl7:col | hl7:tr | hl7:th | hl7:td">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!--<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-->
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!--<xd:doc>
        <xd:desc>
            <xd:p>Handle table</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:table">
        <table>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes">
                <xsl:with-param name="class" select="'narr_table'"/>
            </xsl:apply-templates>
            <!-\-<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-\->
            <xsl:apply-templates/>
        </table>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle thead</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:thead">
        <thead>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!-\-<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-\->
            <xsl:apply-templates/>
        </thead>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle tfoot</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:tfoot">
        <tfoot>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!-\-<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-\->
            <xsl:apply-templates/>
        </tfoot>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle tbody</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:tbody">
        <tbody>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!-\-<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-\->
            <xsl:apply-templates/>
        </tbody>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle colgroup</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:colgroup">
        <colgroup>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!-\-<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-\->
            <xsl:apply-templates/>
        </colgroup>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle col</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:col">
        <col>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!-\-<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-\->
            <xsl:apply-templates/>
        </col>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle tr</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:tr">
        <tr>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes">
                <xsl:with-param name="class" select="'narr_tr'"/>
            </xsl:apply-templates>
            <!-\-<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-\->
            <xsl:apply-templates/>
        </tr>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle th</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:th">
        <th>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes">
                <xsl:with-param name="class" select="'narr_th'"/>
            </xsl:apply-templates>
            <!-\-<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-\->
            <xsl:apply-templates/>
        </th>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle td</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:td">
        <td>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!-\-<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-\->
            <xsl:apply-templates/>
        </td>
    </xsl:template>-->
    
    <xd:doc>
        <xd:desc>Security measure. Only process images on the image whitelist</xd:desc>
        <xd:param name="current-whitelist"/>
        <xd:param name="image-uri"/>
        <xd:param name="altTitleText"/>
    </xd:doc>
    <xsl:template name="check-external-image-whitelist">
        <xsl:param name="current-whitelist"/>
        <xsl:param name="image-uri"/>
        <xsl:param name="altTitleText"/>
        <xsl:choose>
            <xsl:when test="string-length($current-whitelist) &gt; 0">
                <xsl:variable name="whitelist-item">
                    <xsl:choose>
                        <xsl:when test="contains($current-whitelist,'|')">
                            <xsl:value-of select="substring-before($current-whitelist,'|')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$current-whitelist"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="starts-with($image-uri,$whitelist-item)">
                        <br clear="all"/>
                        <img src="{$image-uri}" alt="{$altTitleText}" title="{$altTitleText}"/>
                        <xsl:message>
                            <xsl:value-of select="$image-uri"/>
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'is-in-the-whitelist'"/>
                            </xsl:call-template>
                        </xsl:message>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="check-external-image-whitelist">
                            <xsl:with-param name="current-whitelist" select="substring-after($current-whitelist,'|')"/>
                            <xsl:with-param name="image-uri" select="$image-uri"/>
                            <xsl:with-param name="altTitleText" select="$altTitleText"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
                
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'non-local-image-found-1'"/>
                    </xsl:call-template>
                    <xsl:value-of select="$image-uri"/>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'non-local-image-found-2'"/>
                    </xsl:call-template>
                </p>
                <xsl:message>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'non-local-image-found-1'"/>
                    </xsl:call-template>
                    <xsl:value-of select="$image-uri"/>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'non-local-image-found-2'"/>
                    </xsl:call-template>
                </xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle RenderMultiMedia. This currently only handles GIF's and JPEG's. It could, however, be extended 
                by including other image MIME types in the predicate and/or by generating &lt;object&gt; or &lt;applet&gt; 
                tag with the correct params depending on the media type @ID =$imageRef referencedObject </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:renderMultiMedia">
        <xsl:variable name="imageRefs" select="@referencedObject"/>
        <!--<xsl:variable name="imageRefs">
            <xsl:call-template name="tokenize">
                <xsl:with-param name="string" select="@referencedObject"/>
                <xsl:with-param name="delimiters" select="' '"/>
            </xsl:call-template>
        </xsl:variable>-->
        <xsl:variable name="referencedObjects" select="ancestor::hl7:ClinicalDocument//hl7:regionOfInterest[@ID = $imageRefs] | ancestor::hl7:ClinicalDocument//hl7:observationMedia[@ID = $imageRefs]"/>
        <br/>
        <span>
            <xsl:apply-templates select="hl7:caption"/>
            <xsl:for-each select="$referencedObjects">
                <xsl:choose>
                    <xsl:when test="self::hl7:regionOfInterest">
                        <!-- What we actually would want is an svg with fallback to just the image that renders the ROI on top of image
                            The only example (in the CDA standard itself) that we've seen so far has unusable coordinates. That for now
                            is not very encouraging to put in the effort, so we just render the images for now
                        -->
                        <xsl:apply-templates select=".//hl7:observationMedia">
                            <!--<xsl:with-param name="usemap" select="@ID"/>-->
                        </xsl:apply-templates>
                        <!--<xsl:variable name="coords">
                            <xsl:variable name="tcoords">
                                <xsl:for-each select="hl7:value/@value">
                                    <xsl:value-of select="."/>
                                    <xsl:text> </xsl:text>
                                </xsl:for-each>
                            </xsl:variable>
                            <xsl:value-of select="translate(normalize-space($tcoords),' ',',')"/>
                        </xsl:variable>-->
                        <!--<svg id="graph" width="100%" height="400px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="https://www.w3.org/1999/xlink">
                            <!-\- pattern -\->
                            <defs>
                                <pattern id="image" x="0%" y="0%" height="100%" width="100%" viewBox="0 0 512 512">
                                    <image x="0%" y="0%" width="512" height="512" xlink:href="https://cdn3.iconfinder.com/data/icons/people-professions/512/Baby-512.png"/>
                                </pattern>
                            </defs>
                            <circle id="sd" class="medium" cx="5%" cy="40%" r="5%" fill="url(#image)" stroke="lightblue" stroke-width="0.5%"/>
                        </svg>-->
                        <!--<map id="{@ID}" name="{@ID}">
                            <xsl:choose>
                                <!-\- A circle defined by two (column,row) pairs. The first point is the center of the circle and the second point is a point on the perimeter of the circle. -\->
                                <xsl:when test="hl7:code/@code = 'CIRCLE'">
                                    <area shape="circle" coords="{$coords}" alt="Computer" href="computer.htm"/>
                                </xsl:when>
                                <!-\- An ellipse defined by four (column,row) pairs, the first two points specifying the endpoints of the major axis and the second two points specifying the endpoints of the minor axis. -\->
                                <xsl:when test="hl7:code/@code = 'ELLIPSE'">
                                    <area shape="poly" coords="{$coords}" alt="Computer" href="computer.htm"/>
                                </xsl:when>
                                <!-\- A single point denoted by a single (column,row) pair, or multiple points each denoted by a (column,row) pair. -\->
                                <xsl:when test="hl7:code/@code = 'POINT'">
                                    <area shape="poly" coords="{$coords}" alt="Computer" href="computer.htm"/>
                                </xsl:when>
                                <!-\- A series of connected line segments with ordered vertices denoted by (column,row) pairs; if the first and last vertices are the same, it is a closed polygon. -\->
                                <xsl:when test="hl7:code/@code = 'POLY'">
                                    <area shape="poly" coords="{$coords}" alt="Computer" href="computer.htm"/>
                                </xsl:when>
                            </xsl:choose>
                        </map>-->
                    </xsl:when>
                    <!-- Here is where the direct MultiMedia image referencing goes -->
                    <xsl:when test="self::hl7:observationMedia">
                        <xsl:apply-templates select="."/>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </span>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle superscript</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:sup">
        <sup>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!--<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-->
            <xsl:apply-templates/>
        </sup>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle subscript</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:sub">
        <sub>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!--<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-->
            <xsl:apply-templates/>
        </sub>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Attribute processing for CDAr2 and CDAr3</xd:p>
        </xd:desc>
        <xd:param name="class">If valued then this gets added to potential other class codes</xd:param>
    </xd:doc>
    <xsl:template match="*" mode="handleSectionTextAttributes">
        <xsl:param name="class">
            <xsl:choose>
                <xsl:when test="local-name() = 'table'">narr_table</xsl:when>
                <xsl:when test="local-name() = 'tr'">narr_tr</xsl:when>
                <xsl:when test="local-name() = 'th'">narr_th</xsl:when>
            </xsl:choose>
        </xsl:param>
        
        <xsl:variable name="classes">
            <xsl:if test="string-length($class)">
                <xsl:value-of select="$class"/>
            </xsl:if>
            <xsl:if test="@revised">
                <xsl:text> </xsl:text>
                <xsl:text>revision_</xsl:text>
                <xsl:value-of select="@revised"/>
                <xsl:text>_final</xsl:text>
            </xsl:if>
            <xsl:if test="@styleCode">
                <xsl:text> </xsl:text>
                <xsl:value-of select="@styleCode"/>
            </xsl:if>
            <xsl:if test="@class">
                <xsl:text> </xsl:text>
                <xsl:value-of select="@class"/>
            </xsl:if>
        </xsl:variable>
        
        <xsl:variable name="elem-name" select="local-name(.)"/>
        
        <!-- Write @class attribute if there's data for it -->
        <xsl:if test="string-length(normalize-space($classes))>0">
            <xsl:attribute name="class">
                <xsl:value-of select="normalize-space($classes)"/>
            </xsl:attribute>
        </xsl:if>
        <!-- Write title with @revised (CDAr1 / CDAr2) prefixing to @title if one exists already -->
        <xsl:if test="@revised">
            <xsl:attribute name="title">
                <xsl:value-of select="normalize-space(concat(@revised,' ',@title))"/>
            </xsl:attribute>
        </xsl:if>
        <!-- Write default table cellspacing / cellpadding -->
        <xsl:if test="self::hl7:table">
            <xsl:if test="not(@cellspacing)">
                <xsl:attribute name="cellspacing">
                    <xsl:value-of select="'1'"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="not(@cellpadding)">
                <xsl:attribute name="cellpadding">
                    <xsl:value-of select="'1'"/>
                </xsl:attribute>
            </xsl:if>
        </xsl:if>
        
        <xsl:for-each select="@*">
            <xsl:sort select="local-name()" order="descending"/>
            <xsl:variable name="attr-name" select="local-name(.)"/>
            <xsl:variable name="attr-value" select="."/>
            <xsl:variable name="lcSource" select="translate($attr-value, $uc, $lc)"/>
            <xsl:variable name="scrubbedSource" select="translate($attr-value, $simple-sanitizer-match, $simple-sanitizer-replace)"/>
            <xsl:choose>
                <xsl:when test="contains($lcSource,'javascript')">
                    <xsl:variable name="warningText">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="'javascript-injection-warning'"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:message terminate="yes">
                        <xsl:value-of select="$warningText"/>
                        <xsl:value-of select="$attr-value"/>
                    </xsl:message>
                    <xsl:if test="$attr-name = 'href'">
                        <xsl:attribute name="title">
                            <xsl:value-of select="concat(normalize-space(concat(../@title, ' ', $warningText)), ' ', $attr-value)"/>
                        </xsl:attribute>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="not($attr-value = $scrubbedSource)">
                    <xsl:variable name="warningText">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="'malicious-content-warning'"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:message>
                        <xsl:value-of select="$warningText"/>
                        <xsl:value-of select="$attr-value"/>
                    </xsl:message>
                    <xsl:if test="$attr-name = 'href'">
                        <xsl:attribute name="title">
                            <xsl:value-of select="concat(normalize-space(concat(../@title, ' ', $warningText)), ' ', $attr-value)"/>
                        </xsl:attribute>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="exslt:node-set($table-elem-attrs)/elem[@name = $elem-name] and 
                                not(exslt:node-set($table-elem-attrs)//elem[@name = $elem-name]/attr[@name = $attr-name])">
                    <xsl:message><xsl:value-of select="$attr-name"/> is not legal in <xsl:value-of select="$elem-name"/></xsl:message>
                </xsl:when>
                <!-- Regular handling from here -->
                <xsl:when test="$attr-name = 'ID'">
                    <xsl:attribute name="id">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'class'">
                    <!-- Already handled -->
                </xsl:when>
                <xsl:when test="$attr-name = 'revised'">
                    <!-- Already handled -->
                </xsl:when>
                <xsl:when test="$attr-name = 'styleCode'">
                    <!-- Already handled -->
                </xsl:when>
                <xsl:when test="$attr-name = 'ID'">
                    <!-- @ID should be handled in a name tag, so don't add here -->
                </xsl:when>
                <xsl:when test="$attr-name = 'IDREF'">
                    <!-- @IDREF doubtful. Should be in an href attribute, but doesn't hurt to add here -->
                    <xsl:attribute name="idref">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'language'">
                    <xsl:attribute name="lang">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>

                <!-- Table stuff -->
                <xsl:when test="$attr-name = 'border'">
                    <xsl:attribute name="border">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'frame'">
                    <xsl:attribute name="frame">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'rules'">
                    <xsl:attribute name="rules">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'cellpadding'">
                    <xsl:attribute name="cellpadding">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'cellspacing'">
                    <xsl:attribute name="cellspacing">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'span'">
                    <xsl:attribute name="span">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'summary'">
                    <xsl:attribute name="summary">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'width'">
                    <xsl:attribute name="width">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'align'">
                    <xsl:attribute name="align">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'valign'">
                    <xsl:attribute name="valign">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'char'">
                    <xsl:attribute name="char">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'charoff'">
                    <xsl:attribute name="charoff">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'abbr'">
                    <xsl:attribute name="abbr">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'scope'">
                    <xsl:attribute name="scope">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'headers'">
                    <xsl:attribute name="headers">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'axis'">
                    <xsl:attribute name="axis">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'colspan'">
                    <xsl:attribute name="colspan">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'rowspan'">
                    <xsl:attribute name="rowspan">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>

                <!-- LinkHTML stuff -->
                <xsl:when test="$attr-name = 'name'">
                    <xsl:attribute name="name">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'rel'">
                    <xsl:attribute name="rel">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'href'">
                    <xsl:attribute name="href">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'title'">
                    <xsl:attribute name="title">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'rev'">
                    <xsl:attribute name="rev">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <!-- For CDAr3 we might get a slew of attributes not catered for explicitly, 
                        but supposedly HTML compatible so just could add them as-is -->
                    <!-- However... CDAr3 never happened and this poses a security risk, so ignore -->
                    <!--<xsl:attribute name="{$attr-name}">
                        <xsl:value-of select="."/>
                    </xsl:attribute>-->
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <!-- 
        ====================================
        START CDAr3 NarrativeBlock specifics
        ====================================
    -->
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle HTML like CDAr3 style Section.text elements that are not handled already above</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:a | hl7:dd | hl7:dl | hl7:img | hl7:ins | hl7:span | hl7:p | hl7:ol | hl7:ul| hl7:li">
        <xsl:element name="{local-name()}" namespace="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- 
        ==================================
        END CDAr3 NarrativeBlock specifics
        ==================================
    -->

    <xd:doc>
        <xd:desc>
            <xd:p>Handle the document title based on the ClinicalDocument.title, ClinicalDocument.code or finally just 'Clinical Document'</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="show-title">
        <xsl:variable name="documentEffectiveTime">
            <xsl:call-template name="show-timestamp">
                <xsl:with-param name="in" select="hl7:effectiveTime"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
            <!-- CDAr2 DTr1 -->
            <xsl:when test="string-length(hl7:title) &gt; 0">
                <xsl:value-of select="hl7:title"/>
            </xsl:when>
            <!-- CDAr3 DTr2 -->
            <xsl:when test="string-length(hl7:title/@value) &gt; 0">
                <xsl:value-of select="hl7:title/@value"/>
            </xsl:when>
            <!-- CDAr2 DTr1 -->
            <xsl:when test="hl7:code/@displayName">
                <xsl:value-of select="hl7:code/@displayName"/>
            </xsl:when>
            <!-- CDAr3 DTr2 -->
            <xsl:when test="hl7:code/hl7:displayName/@value">
                <xsl:value-of select="hl7:code/hl7:displayName/@value"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'Clinical Document'"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text> (</xsl:text>
        <xsl:value-of select="normalize-space($documentEffectiveTime)"/>
        <xsl:if test="hl7:confidentialityCode[@code[not(. = 'N')]]">
            <xsl:variable name="confidentialityText">
                <xsl:for-each select="hl7:confidentialityCode">
                    <xsl:choose>
                        <xsl:when test="string-length(@displayName) = 0 and @codeSystem = '2.16.840.1.113883.5.25' and (@code = 'N' or @code = 'R' or @code = 'V')">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="concat(@codeSystem, '-', @code)"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="show-code-set">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:text> </xsl:text>
            <img style="width: 1.2em; height: 1.2em;">
                <xsl:attribute name="src">
                    <xsl:text>data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAhGVYSWZNTQAqAAAACAAGAQYAAwAAAAEAAgAAARIAAwAAAAEAAQAAARoABQAAAAEAAABWARsABQAAAAEAAABeASgAAwAAAAEAAgAAh2kABAAAAAEAAABmAAAAAAAAAEgAAAABAAAASAAAAAEAAqACAAQAAAABAAAAFKADAAQAAAABAAAAFAAAAAAh/bHvAAAACXBIWXMAAAsTAAALEwEAmpwYAAAC4mlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS40LjAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgICAgICAgICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iPgogICAgICAgICA8dGlmZjpSZXNvbHV0aW9uVW5pdD4yPC90aWZmOlJlc29sdXRpb25Vbml0PgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICAgICA8dGlmZjpDb21wcmVzc2lvbj4xPC90aWZmOkNvbXByZXNzaW9uPgogICAgICAgICA8dGlmZjpQaG90b21ldHJpY0ludGVycHJldGF0aW9uPjI8L3RpZmY6UGhvdG9tZXRyaWNJbnRlcnByZXRhdGlvbj4KICAgICAgICAgPGV4aWY6UGl4ZWxZRGltZW5zaW9uPjUwPC9leGlmOlBpeGVsWURpbWVuc2lvbj4KICAgICAgICAgPGV4aWY6Q29sb3JTcGFjZT4xPC9leGlmOkNvbG9yU3BhY2U+CiAgICAgICAgIDxleGlmOlBpeGVsWERpbWVuc2lvbj41MDwvZXhpZjpQaXhlbFhEaW1lbnNpb24+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgqg2Ex1AAAEBElEQVQ4EX1U/29TVRQ/973X19euXRaG3V47HUwG6BwxbIyKJnMxMWz4g7ofFhP+AH8wYgxujhijEBKDBKPxN3/zB6PzBw0xoomkHQ5UQL6UzQ1qWFuUbus61m1d+/r63vWcW96LM8STnHfPPV8+93PPPS3AAyQWiymOu8T5lmzJ7CUl2/HHOHdzHB+t7N8bsgmsr6+vmi3xLX+nZ09kUrMHOIBf5DFWbN3a9n3k4dZh3cdSTu5/Mdy9w+zOmrErdun64nsfnOQtLS2IB1XScDjMj354iscvJfIzd3PdVOjUkL1BOOeCLa6e89dnrh4aHiWgNVSza2/U7o7uo71JvkMjR/jElcn0b9PTjbgHrJFo3SBjnMvkyORXh7745jsqNh7dvsM+8dEnPP7LRaEnP/6Ut7Vvp9j6V6fP8MuTM8eoBgFFLdku8kPxuGBYXC8+cyc9K/L6Bw6w/QMDJatceqe1RY++ODj4+0svD1JM/vPWDFg23482Q7HISeK+VC4XEuDF1YJUuHePYtZT+54G26xceK6v9zg57i4tf7Zj584uNLltIQa369FWUQ1UIQKQ+odSIU+wLhjUdR08sswiYR10vdnCeBuGyvgyoc2NjbCpoZ5RTn0wQPU21VEfEcNmjoGrdu3W7Nf5hfkX1ourXGYS0zQv+DSvjZcyKZFzUEqGoZQNA2zObX9dUGpo3PyDqfChaHv7CiZIkEwmvXTCQrHa/+2PP1HDueZVLU1VhU37pqYm1JC793oUzMGDsC3jF6/yazeT76JNLD1KpVKhRDDMin9+bk74n+zaw4xyGbAI1oprcCOREDlPdHayQCAIhlEGf12Anf/5nLWyUpD8fi1ChSgWPsTjwpIl2fJ4qL/ATJPGDWBxKQ96sw5nY3FGGolEYAl9JEiEFibLMjGjwReCTf1DGJZlMduu9ZdWj+qB5JWbcPTYceh9theIYnZuHg6+MgQ9e6M4MiIXbFuQd3/C7tjQIGGjCZyCHA8gG1KpFCwsijGCTCYtfCLGahhUw2ugIuYONlhVB1CgmmYVHuvogNHhw7C0vAy5fB6OjAxDR+cuqFBLHEBkev9mGwG5LCOQOJXRqZIkwfTUFLzx1gioXg0UVYVXX3sdpm4kRMxhJU4XULWPe2WGPbSqtcfw+eugalZgd3cPTCYS8PbhNzGbQ2G5ALv39CA5CbyaJhBoOJGIi6ukVVXQIob+QICSKr9OnKO11iSyHiwEYuHHx8F2iSn927aJJ/c2+Ccead16+8vTZ9qKOHu1cXCacB+bHgBRqH2WZYPm06C5KQTZzO1pOjMeB0mhf4qxsTE5zNji5WTyeQVCB217E8X/RyScPYvLkuLJ/ZXKnj01+jklj4+/b/8DWjHw0QiROMwAAAAASUVORK5CYII=</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="alt"/>
                <xsl:attribute name="title">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'confidentialityCode'"/>
                        <xsl:with-param name="post" select="': '"/>
                    </xsl:call-template>
                    <xsl:value-of select="$confidentialityText"/>
                </xsl:attribute>
            </img>
            <xsl:text> </xsl:text>
            <xsl:value-of select="$confidentialityText"/>
        </xsl:if>
        <xsl:text>)</xsl:text>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show patients, guardians, consents, encounters, serviceEvents, orders and authors</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="show-header">
        <table class="header_table">
            <tbody>
                <!-- Patient row -->
                <xsl:for-each select="hl7:recordTarget/hl7:patientRole">
                    <tr>
                        <td class="td_label">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'recordTarget'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <!-- IE8 hack: without this span with float, IE8 will render the span with float right on a new line -->
                            <span class="span_value">
                                <xsl:call-template name="show-name-set">
                                    <xsl:with-param name="in" select="hl7:patient/hl7:name[1]"/>
                                </xsl:call-template>
                            </span>
                            <span>
                                <xsl:if test="hl7:patient/hl7:birthTime[@value]">
                                    <span>
                                    <br />
                                        <span class="span_label">
                                            <xsl:choose>
                                                <xsl:when test="hl7:patient/*[local-name() = 'deceasedInd'][@value = 'true' or @nullFlavor] | hl7:patient/*[local-name() = 'deceasedTime']">
                                                    <xsl:call-template name="getLocalizedString">
                                                        <xsl:with-param name="key" select="'birthTimeLongDeceased'"/>
                                                    </xsl:call-template>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:call-template name="getLocalizedString">
                                                        <xsl:with-param name="key" select="'birthTimeLong'"/>
                                                    </xsl:call-template>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                            <xsl:text>: </xsl:text>
                                        </span>
                                        <span class="span_value">
                                            <xsl:call-template name="show-timestamp">
                                                <xsl:with-param name="in" select="hl7:patient/hl7:birthTime"/>
                                            </xsl:call-template>
                                            <xsl:if test="hl7:patient/*[local-name() = 'deceasedInd'][@value = 'true' or @nullFlavor] | hl7:patient/*[local-name() = 'deceasedTime']">
                                                <xsl:text> - &#8224; </xsl:text>
                                                <xsl:choose>
                                                    <xsl:when test="hl7:patient/*[local-name() = 'deceasedTime'][@value]">
                                                        <xsl:call-template name="show-timestamp">
                                                            <xsl:with-param name="in" select="hl7:patient/*[local-name() = 'deceasedTime']"/>
                                                        </xsl:call-template>
                                                    </xsl:when>
                                                    <xsl:when test="hl7:patient/*[local-name() = 'deceasedInd'][@nullFlavor]">
                                                        <xsl:call-template name="show-nullFlavor">
                                                            <xsl:with-param name="in" select="hl7:patient/*[local-name() = 'deceasedInd']/@nullFlavor"/>
                                                        </xsl:call-template>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:call-template name="getLocalizedString">
                                                            <xsl:with-param name="key" select="'date_unknown'"/>
                                                        </xsl:call-template>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:if>
                                            <xsl:variable name="comparedate">
                                                <xsl:choose>
                                                    <xsl:when test="hl7:patient/*[local-name() = 'deceasedTime'][@value]">
                                                        <xsl:value-of select="hl7:patient/*[local-name() = 'deceasedTime']/@value"/>
                                                    </xsl:when>
                                                    <xsl:when test="not(hl7:patient/*[local-name() = 'deceasedInd'] or hl7:patient/*[local-name() = 'deceasedInd'][@value = 'true' or @nullFlavor] or hl7:patient/*[local-name() = 'deceasedTime'])">
                                                        <xsl:value-of select="$currentDate"/>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <xsl:if test="string-length($comparedate) > 0">
                                                <span>
                                                    <xsl:attribute name="title">
                                                        <xsl:choose>
                                                            <xsl:when test="hl7:patient/*[local-name() = 'deceasedTime'][@value]">
                                                                <xsl:call-template name="getLocalizedString">
                                                                    <xsl:with-param name="key" select="'At the time of death'"/>
                                                                </xsl:call-template>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:call-template name="getLocalizedString">
                                                                    <xsl:with-param name="key" select="'At document creation time'"/>
                                                                </xsl:call-template>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:attribute>
                                                    <xsl:call-template name="getLocalizedString">
                                                        <xsl:with-param name="pre">
                                                            <xsl:text> (</xsl:text>
                                                            <xsl:call-template name="getAge">
                                                                <xsl:with-param name="comparedate" select="$comparedate"/>
                                                                <xsl:with-param name="date" select="hl7:patient/hl7:birthTime/@value"/>
                                                            </xsl:call-template>
                                                        </xsl:with-param>
                                                        <xsl:with-param name="key" select="'yr'"/>
                                                        <xsl:with-param name="post" select="')'"/>
                                                    </xsl:call-template>
                                                </span>
                                            </xsl:if>
                                            <xsl:if test="hl7:patient/*[local-name() = 'multipleBirthInd'][@value = 'true'] | hl7:patient/*[local-name() = 'multipleBirthOrderNumber']">
                                                <i>
                                                    <xsl:call-template name="getLocalizedString">
                                                        <xsl:with-param name="pre" select="' '"/>
                                                        <xsl:with-param name="key" select="'partOfMultipleBirth'"/>
                                                    </xsl:call-template>
                                                </i>
                                            </xsl:if>
                                        </span>
                                    </span>
                                </xsl:if>
                                <xsl:if test="hl7:patient/hl7:administrativeGenderCode[@code]">
                                <br />
                                    <span class="span_label">
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'administrativeGenderCode'"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                    </span>
                                    <span class="span_value">
                                        <xsl:call-template name="show-code-set">
                                            <xsl:with-param name="in" select="hl7:patient/hl7:administrativeGenderCode"/>
                                        </xsl:call-template>
                                    </span>
                                </xsl:if>
                            </span>
                            <xsl:if test="hl7:id[not(contains($skip-ids-var, concat(',',@root,',')))]">
                                <span class="print_visible">
                                <br />
                                    <span class="span_label">
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'patientIdLong'"/>
                                            <xsl:with-param name="post" select="':&#160;'"/>
                                        </xsl:call-template>
                                    </span>
                                    <span class="span_value">
                                        <xsl:call-template name="show-id-set">
                                            <xsl:with-param name="in" select="hl7:id[not(contains($skip-ids-var, concat(',', @root, ',')))]"/>
                                            <xsl:with-param name="sep" select="', '"/>
                                        </xsl:call-template>
                                    </span>
                                </span>
                            </xsl:if>
                        </td>
                    </tr>
                    <xsl:if test="hl7:patient/hl7:guardian">
                        <tr>
                            <td class="td_label">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Guardian'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <span class="span_value">
                                    <xsl:call-template name="show-name-set">
                                        <xsl:with-param name="in" select="hl7:patient/hl7:guardian/*/hl7:name[1]"/>
                                    </xsl:call-template>
                                    <xsl:if test="hl7:patient/hl7:guardian/hl7:code">
                                        <xsl:text> - </xsl:text>
                                        <xsl:call-template name="show-code-set">
                                            <xsl:with-param name="in" select="hl7:patient/hl7:guardian/hl7:code"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                </span>
                            </td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>
                <!-- Authorization -->
                <xsl:for-each select="hl7:authorization/hl7:consent">
                    <tr>
                        <td class="td_label">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'consent'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:if test="hl7:id">
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'id'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-id-set">
                                        <xsl:with-param name="in" select="hl7:id"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                            <xsl:if test="hl7:code">
                                <xsl:if test="hl7:id">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'code'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:code"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                            <xsl:if test="hl7:statusCode">
                                <xsl:if test="hl7:id | hl7:code">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'statusCode'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-code">
                                        <xsl:with-param name="in" select="hl7:statusCode"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                        </td>
                    </tr>
                </xsl:for-each>
                <!-- Encounter row -->
                <xsl:for-each select="hl7:componentOf/hl7:encompassingEncounter">
                    <tr>
                        <td class="td_label">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'Encounter'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:if test="hl7:id">
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'id'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-id-set">
                                        <xsl:with-param name="in" select="hl7:id"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                            <xsl:if test="hl7:code">
                                <xsl:if test="hl7:id">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                                <br />
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'type'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:code"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                            <xsl:if test="hl7:effectiveTime">
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'effectiveTime'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-ivlts">
                                        <xsl:with-param name="in" select="hl7:effectiveTime"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                            <xsl:if test="hl7:location/hl7:healthCareFacility/hl7:code">
                                <div>
                                    <span class="span_label">
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'location'"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                    </span>
                                    <span class="span_value">
                                        <xsl:call-template name="show-code-set">
                                            <xsl:with-param name="in" select="hl7:location/hl7:healthCareFacility/hl7:code"/>
                                        </xsl:call-template>
                                    </span>
                                </div>
                            </xsl:if>
                        </td>
                    </tr>
                </xsl:for-each>
                <!-- DocumentationOf -->
                <xsl:for-each select="hl7:documentationOf/hl7:serviceEvent">
                    <xsl:variable name="displayName">
                        <xsl:if test="@classCode[not(. = 'ACT')]">
                            <xsl:call-template name="show-actClassCode">
                                <xsl:with-param name="clsCode" select="@classCode"/>
                            </xsl:call-template>
                        </xsl:if>
                    </xsl:variable>
                    <tr>
                        <td class="td_label">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'documentationOf'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:if test="string-length($displayName) > 0">
                                <xsl:call-template name="firstCharCaseUp">
                                    <xsl:with-param name="data" select="$displayName"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="hl7:code">
                                <xsl:if test="string-length($displayName) > 0">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                                <span class="span_value">
                                    <xsl:call-template name="show-code">
                                        <xsl:with-param name="in" select="hl7:code"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                            <xsl:if test="hl7:effectiveTime">
                                <xsl:if test="string-length($displayName) > 0 or hl7:code">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                                <br />
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'effectiveTime'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-ivlts">
                                        <xsl:with-param name="in" select="hl7:effectiveTime"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                            <xsl:for-each select="hl7:performer/hl7:assignedEntity/hl7:assignedPerson[hl7:name]">
                                <xsl:if test="string-length($displayName) > 0 or ancestor::hl7:serviceEvent[1]/hl7:code or ancestor::hl7:serviceEvent[1]/hl7:effectiveTime">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                                <br />
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="concat('typeCode-', ancestor::hl7:performer[1]/@typeCode)"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-name">
                                        <xsl:with-param name="in" select="hl7:name[1]"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:for-each>
                        </td>
                    </tr>
                </xsl:for-each>
                <!-- InFulfillmentOf -->
                <xsl:for-each select="hl7:inFulfillmentOf/hl7:order">
                    <tr>
                        <td class="td_label">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'typeCode-FLFS'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <span class="span_label">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'order'"/>
                                </xsl:call-template>
                                <xsl:text> </xsl:text>
                            </span>
                            <xsl:if test="hl7:id">
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'id'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-id-set">
                                        <xsl:with-param name="in" select="hl7:id"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                            <xsl:if test="hl7:code">
                                <xsl:if test="hl7:id">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'code'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:code"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                            <xsl:if test="hl7:priorityCode">
                                <xsl:if test="hl7:id | hl7:code">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'priorityCode'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:priorityCode"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                        </td>
                    </tr>
                </xsl:for-each>
                <!-- Author row -->
                <xsl:for-each select="hl7:author/hl7:assignedAuthor">
                    <tr>
                        <td class="td_label">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'author'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <span class="span_value">
                                <xsl:choose>
                                    <xsl:when test="hl7:assignedPerson/hl7:name">
                                        <xsl:call-template name="show-name-set">
                                            <xsl:with-param name="in" select="hl7:assignedPerson/hl7:name[1]"/>
                                        </xsl:call-template>
                                        <xsl:if test="hl7:assignedPerson/hl7:desc">
                                            <div>
                                                <xsl:value-of select="hl7:assignedPerson/hl7:desc"/>
                                            </div>
                                        </xsl:if>
                                        <xsl:if test="hl7:assignedPerson/hl7:birthTime">
                                            <xsl:text> </xsl:text>
                                            <xsl:call-template name="getLocalizedString">
                                                <xsl:with-param name="key" select="'birthTimeLong'"/>
                                            </xsl:call-template>
                                            <xsl:text> </xsl:text>
                                            <xsl:call-template name="show-timestamp">
                                                <xsl:with-param name="in" select="hl7:assignedPerson/hl7:birthTime"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:when test="hl7:assignedAuthoringDevice/hl7:softwareName">
                                        <xsl:value-of select="hl7:assignedAuthoringDevice/hl7:softwareName"/>
                                    </xsl:when>
                                    <xsl:when test="hl7:assignedDevice/hl7:softwareName">
                                        <xsl:value-of select="hl7:assignedDevice/hl7:softwareName/@value"/>
                                    </xsl:when>
                                </xsl:choose>
                            </span>
                            <xsl:if test="hl7:representedOrganization">
                                <xsl:variable name="organizationName">
                                    <xsl:choose>
                                        <xsl:when test="hl7:representedOrganization/hl7:name">
                                            <xsl:call-template name="show-name-set">
                                                <xsl:with-param name="in" select="hl7:representedOrganization/hl7:name[1]"/>
                                            </xsl:call-template>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:variable name="id-root" select="(hl7:representedOrganization/hl7:id[not(@nullFlavor)])[1]/@root"/>
                                            <xsl:variable name="id-ext" select="(hl7:representedOrganization/hl7:id[not(@nullFlavor)])[1]/@extension"/>
                                            <xsl:choose>
                                                <xsl:when test="$id-ext">
                                                    <xsl:call-template name="show-name-set">
                                                        <xsl:with-param name="in" select="(ancestor::hl7:ClinicalDocument//*[hl7:id[@root = $id-root][@extension = $id-ext]][hl7:name])[1]/hl7:name[1]"/>
                                                    </xsl:call-template>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:call-template name="show-name-set">
                                                        <xsl:with-param name="in" select="(ancestor::hl7:ClinicalDocument//*[hl7:id[@root = $id-root][not(@extension)]][hl7:name])[1]/hl7:name[1]"/>
                                                    </xsl:call-template>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:text>, </xsl:text>
                                <br />
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'organization'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:choose>
                                        <xsl:when test="string-length(normalize-space($organizationName)) > 0">
                                            <xsl:value-of select="normalize-space($organizationName)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:call-template name="show-id-set">
                                                <xsl:with-param name="in" select="hl7:representedOrganization/hl7:id"/>
                                            </xsl:call-template>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </span>
                            </xsl:if>
                            <xsl:if test="../hl7:time[@value | *]">
                                <xsl:text>, </xsl:text>
                                <br />
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'Authored_on'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-timestamp">
                                        <xsl:with-param name="in" select="../hl7:time"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                        </td>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle general document propreties (id + creation time)</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="documentGeneral">
        <table class="header_table">
            <tbody>
                <tr>
                    <td class="td_label td_label_width">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="'Document'"/>
                        </xsl:call-template>
                    </td>
                    <td style="width: 30%;">
                        <xsl:call-template name="idVersionSetId"/>
                    </td>
                    <td class="td_label td_label_width">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="'Created_on'"/>
                        </xsl:call-template>
                    </td>
                    <td>
                        <xsl:call-template name="show-timestamp">
                            <xsl:with-param name="in" select="hl7:effectiveTime"/>
                        </xsl:call-template>
                    </td>
                </tr>
            </tbody>
        </table>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle confidentiality</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="confidentiality">
        <table class="header_table">
            <tbody>
                <td class="td_label">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'Confidentiality'"/>
                    </xsl:call-template>
                </td>
                <td style="width: 80%;">
                    <xsl:call-template name="show-code-set">
                        <xsl:with-param name="in" select="hl7:confidentialityCode"/>
                    </xsl:call-template>
                </td>
            </tbody>
        </table>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header author</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="author">
        <xsl:for-each select="hl7:author/hl7:assignedAuthor">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:if test="hl7:representedOrganization/hl7:addr | hl7:representedOrganization/hl7:telecom">
                                <xsl:attribute name="rowspan">2</xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'author'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="hl7:addr | hl7:telecom">
                                    <xsl:attribute name="style">width: 30%;</xsl:attribute>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="colspan">3</xsl:attribute>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:if test="hl7:representedOrganization/hl7:addr | hl7:representedOrganization/hl7:telecom">
                                <xsl:attribute name="rowspan">2</xsl:attribute>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="hl7:assignedPerson/hl7:name">
                                    <xsl:call-template name="show-name-set">
                                        <xsl:with-param name="in" select="hl7:assignedPerson/hl7:name"/>
                                    </xsl:call-template>
                                    <xsl:if test="hl7:assignedPerson/hl7:desc">
                                        <div>
                                            <xsl:value-of select="hl7:assignedPerson/hl7:desc"/>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="hl7:assignedPerson/hl7:birthTime">
                                        <xsl:text> </xsl:text>
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'birthTimeLong'"/>
                                        </xsl:call-template>
                                        <xsl:text> </xsl:text>
                                        <xsl:call-template name="show-timestamp">
                                            <xsl:with-param name="in" select="hl7:assignedPerson/hl7:birthTime"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:when test="hl7:assignedAuthoringDevice/hl7:softwareName">
                                    <xsl:value-of select="hl7:assignedAuthoringDevice/hl7:softwareName"/>
                                </xsl:when>
                                <xsl:when test="hl7:assignedDevice/hl7:softwareName">
                                    <xsl:value-of select="hl7:assignedDevice/hl7:softwareName/@value"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="show-id-set">
                                        <xsl:with-param name="in" select="hl7:in"/>
                                        <xsl:with-param name="sep" select="'br'"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:if test="hl7:code">
                                <xsl:text> - </xsl:text>
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'code'"/>
                                    <xsl:with-param name="post" select="': '"/>
                                </xsl:call-template>
                                <xsl:call-template name="show-code-set">
                                    <xsl:with-param name="in" select="hl7:code"/>
                                    <xsl:with-param name="sep" select="'br'"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="hl7:representedOrganization">
                                <xsl:text>, </xsl:text>
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'organization'"/>
                                    <xsl:with-param name="post" select="': '"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:variable name="name-set">
                                <xsl:choose>
                                    <xsl:when test="hl7:representedOrganization/hl7:name">
                                        <xsl:copy-of select="hl7:representedOrganization/hl7:name"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:variable name="id-root" select="(hl7:representedOrganization/hl7:id[not(@nullFlavor)])[1]/@root"/>
                                        <xsl:variable name="id-ext" select="(hl7:representedOrganization/hl7:id[not(@nullFlavor)])[1]/@extension"/>
                                        <xsl:choose>
                                            <xsl:when test="$id-ext">
                                                <xsl:copy-of select="(ancestor::hl7:ClinicalDocument//*[hl7:id[@root = $id-root][@extension = $id-ext]][hl7:name])[1]/hl7:name"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:copy-of select="(ancestor::hl7:ClinicalDocument//*[hl7:id[@root = $id-root][not(@extension)]][hl7:name])[1]/hl7:name"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:choose>
                                <xsl:when test="exslt:node-set($name-set)">
                                    <xsl:call-template name="show-name-set">
                                        <xsl:with-param name="in" select="exslt:node-set($name-set)"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="show-id-set">
                                        <xsl:with-param name="in" select="hl7:representedOrganization/hl7:id"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <xsl:if test="hl7:addr | hl7:telecom">
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="."/>
                                </xsl:call-template>
                            </td>
                        </xsl:if>
                    </tr>
                    <xsl:if test="hl7:representedOrganization/hl7:addr | hl7:representedOrganization/hl7:telecom">
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                                <xsl:text> (</xsl:text>
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'organization'"/>
                                </xsl:call-template>
                                <xsl:text>)</xsl:text>
                            </td>
                            <td>
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="hl7:representedOrganization"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:if>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header authenticator</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="authenticator">
        <xsl:for-each select="hl7:authenticator">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'typeCode-AUTHEN'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:if test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom">
                                <xsl:attribute name="style">width: 30%;</xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="show-assignedEntity">
                                <xsl:with-param name="asgnEntity" select="hl7:assignedEntity"/>
                            </xsl:call-template>
                            <xsl:text> </xsl:text>
                            <xsl:call-template name="show-code-set">
                                <xsl:with-param name="in" select="hl7:signatureCode"/>
                            </xsl:call-template>
                            <xsl:if test="hl7:time/@value">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="pre" select="'&#160;'"/>
                                    <xsl:with-param name="key" select="'at'"/>
                                    <xsl:with-param name="post" select="'&#160;'"/>
                                </xsl:call-template>
                                <xsl:call-template name="show-timestamp">
                                    <xsl:with-param name="in" select="hl7:time"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:call-template name="show-signatureText">
                                <xsl:with-param name="in" select="*[local-name() = 'signatureText']"/>
                            </xsl:call-template>
                        </td>
                        <xsl:if test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom">
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="hl7:assignedEntity"/>
                                </xsl:call-template>
                            </td>
                        </xsl:if>
                    </tr>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header legalAuthenticator</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="legalAuthenticator">
        <xsl:for-each select="hl7:legalAuthenticator">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'typeCode-LA'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:if test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom">
                                <xsl:attribute name="style">width: 30%;</xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="show-assignedEntity">
                                <xsl:with-param name="asgnEntity" select="hl7:assignedEntity"/>
                            </xsl:call-template>
                            <xsl:text> </xsl:text>
                            <xsl:call-template name="show-code-set">
                                <xsl:with-param name="in" select="hl7:signatureCode"/>
                            </xsl:call-template>
                            <xsl:if test="hl7:time/@value">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="pre" select="'&#160;'"/>
                                    <xsl:with-param name="key" select="'at'"/>
                                    <xsl:with-param name="post" select="'&#160;'"/>
                                </xsl:call-template>
                                <xsl:call-template name="show-timestamp">
                                    <xsl:with-param name="in" select="hl7:time"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:call-template name="show-signatureText">
                                <xsl:with-param name="in" select="*[local-name() = 'signatureText']"/>
                            </xsl:call-template>
                        </td>
                        <xsl:if test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom">
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="hl7:assignedEntity"/>
                                </xsl:call-template>
                            </td>
                        </xsl:if>
                    </tr>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header dataEnterer</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="dataEnterer">
        <xsl:for-each select="hl7:dataEnterer">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'typeCode-ENT'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:if test="hl7:assignedEntity/hl7:addr | hl7:dataEnterer/hl7:assignedEntity/hl7:telecom">
                                <xsl:attribute name="style">width: 30%;</xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="show-assignedEntity">
                                <xsl:with-param name="asgnEntity" select="hl7:assignedEntity"/>
                            </xsl:call-template>
                        </td>
                        <xsl:if test="hl7:assignedEntity/hl7:addr | hl7:dataEnterer/hl7:assignedEntity/hl7:telecom">
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="hl7:assignedEntity"/>
                                </xsl:call-template>
                            </td>
                        </xsl:if>
                    </tr>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header componentOf</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="componentOf">
        <xsl:for-each select="hl7:componentOf/hl7:encompassingEncounter">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'Encounter'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="hl7:effectiveTime">
                                    <xsl:attribute name="style">width: 30%;</xsl:attribute>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="colspan">3</xsl:attribute>
                                </xsl:otherwise>
                            </xsl:choose>
                            <table class="table_simple">
                                <tbody>
                                    <tr>
                                        <td class="td_label">
                                            <xsl:call-template name="getLocalizedString">
                                                <xsl:with-param name="key" select="'id'"/>
                                            </xsl:call-template>
                                        </td>
                                        <td>
                                            <xsl:call-template name="show-id-set">
                                                <xsl:with-param name="in" select="hl7:id"/>
                                            </xsl:call-template>
                                        </td>
                                    </tr>
                                    <xsl:if test="hl7:code">
                                        <tr>
                                            <td class="td_label">
                                                <xsl:call-template name="getLocalizedString">
                                                    <xsl:with-param name="key" select="'type'"/>
                                                </xsl:call-template>
                                            </td>
                                            <td>
                                                <xsl:call-template name="show-code-set">
                                                    <xsl:with-param name="in" select="hl7:code"/>
                                                </xsl:call-template>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                </tbody>
                            </table>
                        </td>
                        <xsl:if test="hl7:effectiveTime">
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Encounter Date'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-ivlts">
                                    <xsl:with-param name="in" select="hl7:effectiveTime"/>
                                </xsl:call-template>
                            </td>
                        </xsl:if>
                    </tr>
                    <xsl:if test="hl7:dischargeDispositionCode | sdtc:admissionReferralSourceCode | hl7:admissionReferralSourceCode">
                        <tr>
                            <xsl:choose>
                                <xsl:when test="sdtc:admissionReferralSourceCode | hl7:admissionReferralSourceCode">
                                    <td class="td_label td_label_width">
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'Encounter Admission Referral Source'"/>
                                        </xsl:call-template>
                                    </td>
                                    <td style="width: 30%;">
                                        <xsl:call-template name="show-code-set">
                                            <xsl:with-param name="in" select="sdtc:admissionReferralSourceCode | hl7:admissionReferralSourceCode"/>
                                        </xsl:call-template>
                                    </td>
                                    <td class="td_label td_label_width">
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'Encounter Discharge Disposition'"/>
                                        </xsl:call-template>
                                    </td>
                                    <td style="width: 30%;">
                                        <xsl:call-template name="show-code-set">
                                            <xsl:with-param name="in" select="hl7:dischargeDispositionCode"/>
                                        </xsl:call-template>
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td class="td_label td_label_width">
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'Encounter Discharge Disposition'"/>
                                        </xsl:call-template>
                                    </td>
                                    <td colspan="3">
                                        <xsl:call-template name="show-code-set">
                                            <xsl:with-param name="in" select="hl7:dischargeDispositionCode"/>
                                        </xsl:call-template>
                                    </td>
                                </xsl:otherwise>
                            </xsl:choose>
                        </tr>
                    </xsl:if>
                    <xsl:if test="hl7:location">
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Encounter Location'"/>
                                </xsl:call-template>
                            </td>
                            <td colspan="3">
                                <xsl:choose>
                                    <!-- FIXME: playingPlace is CDAr3 May Ballot specific. This is unlikely to remain this way -->
                                    <!-- FIXME: scopingOrganization is CDAr3 May Ballot specific. This is unlikely to remain this way -->
                                    <xsl:when test="hl7:location/hl7:healthCareFacility/hl7:*[local-name() = 'location' or local-name() = 'playingPlace']/hl7:name">
                                        <xsl:call-template name="show-name-set">
                                            <xsl:with-param name="in" select="hl7:location/hl7:healthCareFacility/hl7:*[local-name() = 'location' or local-name() = 'playingPlace']/hl7:name"/>
                                        </xsl:call-template>
                                        <xsl:if test="hl7:location/hl7:healthCareFacility/hl7:*[local-name() = 'location' or local-name() = 'playingPlace']/hl7:addr">
                                            <xsl:text> (</xsl:text>
                                            <xsl:call-template name="show-address-set">
                                                <xsl:with-param name="in" select="hl7:location/hl7:healthCareFacility/hl7:*[local-name() = 'location' or local-name() = 'playingPlace']/hl7:addr"/>
                                                <xsl:with-param name="sep" select="', '"/>
                                            </xsl:call-template>
                                            <xsl:text>)</xsl:text>
                                        </xsl:if>
                                        <xsl:for-each select="
                                                hl7:location/hl7:healthCareFacility/hl7:serviceProviderOrganization/hl7:name |
                                                hl7:location/hl7:healthCareFacility/hl7:scopingOrganization/hl7:name">
                                            <xsl:call-template name="getLocalizedString">
                                                <xsl:with-param name="pre" select="'&#160;'"/>
                                                <xsl:with-param name="key" select="'of'"/>
                                                <xsl:with-param name="post" select="'&#160;'"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="show-name-set">
                                                <xsl:with-param name="in" select="hl7:location/hl7:healthCareFacility/hl7:serviceProviderOrganization/hl7:name"/>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:when test="hl7:location/hl7:healthCareFacility/hl7:code">
                                        <xsl:call-template name="show-code-set">
                                            <xsl:with-param name="in" select="hl7:location/hl7:healthCareFacility/hl7:code"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:if test="hl7:location/hl7:healthCareFacility/hl7:id">
                                            <xsl:call-template name="getLocalizedString">
                                                <xsl:with-param name="key" select="'id'"/>
                                                <xsl:with-param name="post" select="':'"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="show-id-set">
                                                <xsl:with-param name="in" select="hl7:location/hl7:healthCareFacility/hl7:id"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:if test="hl7:responsibleParty">
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'responsibleParty'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="hl7:responsibleParty/hl7:assignedEntity/hl7:addr | hl7:responsibleParty/hl7:assignedEntity/hl7:telecom">
                                        <xsl:attribute name="style">width: 30%;</xsl:attribute>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:attribute name="colspan">3</xsl:attribute>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:call-template name="show-assignedEntity">
                                    <xsl:with-param name="asgnEntity" select="hl7:responsibleParty/hl7:assignedEntity"/>
                                </xsl:call-template>
                            </td>
                            <xsl:if test="hl7:responsibleParty/hl7:assignedEntity/hl7:addr | hl7:responsibleParty/hl7:assignedEntity/hl7:telecom">
                                <td class="td_label td_label_width">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'Contact_details'"/>
                                    </xsl:call-template>
                                </td>
                                <td>
                                    <xsl:call-template name="show-contactInfo">
                                        <xsl:with-param name="contact" select="hl7:responsibleParty/hl7:assignedEntity"/>
                                    </xsl:call-template>
                                </td>
                            </xsl:if>
                        </tr>
                    </xsl:if>
                    <xsl:for-each select="hl7:encounterParticipant">
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="show-participationTypeOrCode">
                                    <xsl:with-param name="typeCode" select="@typeCode"/>
                                </xsl:call-template>
                                <xsl:if test="hl7:time">
                                    <xsl:text> (</xsl:text>
                                    <xsl:call-template name="show-ivlts">
                                        <xsl:with-param name="in" select="hl7:time"/>
                                    </xsl:call-template>
                                    <xsl:text>)</xsl:text>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom">
                                        <xsl:attribute name="style">width: 30%;</xsl:attribute>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:attribute name="colspan">3</xsl:attribute>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:call-template name="show-assignedEntity">
                                    <xsl:with-param name="asgnEntity" select="hl7:assignedEntity"/>
                                </xsl:call-template>
                            </td>
                            <xsl:if test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom">
                                <td class="td_label td_label_width">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'Contact_details'"/>
                                    </xsl:call-template>
                                </td>
                                <td>
                                    <xsl:call-template name="show-contactInfo">
                                        <xsl:with-param name="contact" select="hl7:assignedEntity"/>
                                    </xsl:call-template>
                                </td>
                            </xsl:if>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header custodian</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="custodian">
        <xsl:for-each select="hl7:custodian">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'custodian'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:if test="hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr | hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:telecom">
                                <xsl:attribute name="style">width: 30%;</xsl:attribute>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:name">
                                    <xsl:call-template name="show-name-set">
                                        <xsl:with-param name="in" select="hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:name"/>
                                        <xsl:with-param name="sep" select="'br'"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="show-id-set">
                                        <xsl:with-param name="in" select="hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:id"/>
                                        <xsl:with-param name="sep" select="'br'"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <xsl:if test="hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr | hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:telecom">
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="hl7:assignedCustodian/hl7:representedCustodianOrganization"/>
                                </xsl:call-template>
                            </td>
                        </xsl:if>
                    </tr>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header documentationOf</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="documentationOf">
        <xsl:for-each select="hl7:documentationOf">
            <table class="header_table">
                <tbody>
                    <xsl:if test="hl7:serviceEvent[@classCode | hl7:code]">
                        <xsl:variable name="displayName">
                            <xsl:if test="hl7:serviceEvent/@classCode[not(. = 'ACT')]">
                                <xsl:call-template name="show-actClassCode">
                                    <xsl:with-param name="clsCode" select="hl7:serviceEvent/@classCode"/>
                                </xsl:call-template>
                            </xsl:if>
                        </xsl:variable>
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'documentationOf'"/>
                                </xsl:call-template>
                                <xsl:if test="string-length($displayName) > 0">
                                    <xsl:text> - </xsl:text>
                                    <xsl:value-of select="$displayName"/>
                                </xsl:if>
                            </td>
                            <td style="width: 80%;" colspan="3">
                                <xsl:call-template name="show-code">
                                    <xsl:with-param name="in" select="hl7:serviceEvent/hl7:code"/>
                                </xsl:call-template>
                                <xsl:call-template name="show-ivlts">
                                    <xsl:with-param name="in" select="hl7:serviceEvent/hl7:effectiveTime"/>
                                </xsl:call-template>
                                <xsl:call-template name="show-code">
                                    <xsl:with-param name="in" select="hl7:serviceEvent/hl7:statusCode"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:for-each select="hl7:serviceEvent/hl7:performer">
                        <xsl:variable name="displayName">
                            <xsl:call-template name="show-participationType">
                                <xsl:with-param name="ptype" select="@typeCode"/>
                            </xsl:call-template>
                            <xsl:text> - </xsl:text>
                            <xsl:if test="hl7:functionCode//@code">
                                <xsl:call-template name="show-code-set">
                                    <xsl:with-param name="in" select="hl7:functionCode"/>
                                </xsl:call-template>
                            </xsl:if>
                        </xsl:variable>
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="firstCharCaseUp">
                                    <xsl:with-param name="data" select="$displayName"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom">
                                        <xsl:attribute name="style">width: 30%;</xsl:attribute>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:attribute name="colspan">3</xsl:attribute>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:call-template name="show-assignedEntity">
                                    <xsl:with-param name="asgnEntity" select="hl7:assignedEntity"/>
                                </xsl:call-template>
                            </td>
                            <xsl:if test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom">
                                <td class="td_label td_label_width">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'Contact_details'"/>
                                    </xsl:call-template>
                                </td>
                                <td>
                                    <xsl:call-template name="show-contactInfo">
                                        <xsl:with-param name="contact" select="hl7:assignedEntity"/>
                                    </xsl:call-template>
                                </td>
                            </xsl:if>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header inFulfillmentOf</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="inFulfillmentOf">
        <xsl:for-each select="hl7:inFulfillmentOf">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'typeCode-FLFS'"/>
                            </xsl:call-template>
                        </td>
                        <td style="width: 80%;">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'order'"/>
                            </xsl:call-template>
                            <xsl:text>: </xsl:text>
                            <xsl:for-each select="hl7:order">
                                <xsl:call-template name="show-id-set">
                                    <xsl:with-param name="in" select="hl7:id"/>
                                </xsl:call-template>
                                <xsl:if test="hl7:code">
                                    <xsl:text>&#160;</xsl:text>
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:code"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="hl7:priorityCode">
                                    <xsl:text>&#160;</xsl:text>
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:priorityCode"/>
                                    </xsl:call-template>
                                </xsl:if>
                            </xsl:for-each>
                        </td>
                    </tr>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header informant</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="informant">
        <xsl:for-each select="hl7:informant">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'typeCode-INF'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:if test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom | hl7:relatedEntity/hl7:addr | hl7:relatedEntity/hl7:telecom">
                                <xsl:attribute name="style">width: 30%;</xsl:attribute>
                            </xsl:if>
                            <xsl:if test="hl7:assignedEntity">
                                <xsl:call-template name="show-assignedEntity">
                                    <xsl:with-param name="asgnEntity" select="hl7:assignedEntity"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="hl7:relatedEntity">
                                <xsl:call-template name="show-relatedEntity">
                                    <xsl:with-param name="relatedEntity" select="hl7:relatedEntity"/>
                                </xsl:call-template>
                            </xsl:if>
                        </td>
                        <xsl:choose>
                            <xsl:when test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom">
                                <td class="td_label td_label_width">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'Contact_details'"/>
                                    </xsl:call-template>
                                </td>
                                <td>
                                    <xsl:if test="hl7:assignedEntity">
                                        <xsl:call-template name="show-contactInfo">
                                            <xsl:with-param name="contact" select="hl7:assignedEntity"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                </td>
                            </xsl:when>
                            <xsl:when test="hl7:relatedEntity/hl7:addr | hl7:relatedEntity/hl7:telecom">
                                <td class="td_label td_label_width">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'Contact_details'"/>
                                    </xsl:call-template>
                                </td>
                                <td>
                                    <xsl:if test="hl7:relatedEntity">
                                        <xsl:call-template name="show-contactInfo">
                                            <xsl:with-param name="contact" select="hl7:relatedEntity"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                </td>
                            </xsl:when>
                        </xsl:choose>
                    </tr>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header informationRecipient</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="informationRecipient">
        <xsl:for-each select="hl7:informationRecipient">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'typeCode-PRCP'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="hl7:intendedRecipient/hl7:addr | hl7:intendedRecipient/hl7:telecom">
                                    <xsl:attribute name="style">width: 30%;</xsl:attribute>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="colspan">3</xsl:attribute>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:choose>
                                <xsl:when test="hl7:intendedRecipient/hl7:informationRecipient/hl7:name">
                                    <xsl:for-each select="hl7:intendedRecipient/hl7:informationRecipient">
                                        <xsl:call-template name="show-name-set">
                                            <xsl:with-param name="in" select="hl7:name"/>
                                            <xsl:with-param name="sep" select="'br'"/>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:for-each select="hl7:intendedRecipient">
                                        <xsl:call-template name="show-id-set">
                                            <xsl:with-param name="in" select="hl7:id"/>
                                            <xsl:with-param name="sep" select="'br'"/>
                                        </xsl:call-template>
                                        <br/>
                                    </xsl:for-each>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <xsl:if test="hl7:intendedRecipient/hl7:addr | hl7:intendedRecipient/hl7:telecom">
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="hl7:intendedRecipient"/>
                                </xsl:call-template>
                            </td>
                        </xsl:if>
                    </tr>
                    <xsl:for-each select="hl7:intendedRecipient/hl7:receivedOrganization">
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="pre" select="''"/>
                                    <xsl:with-param name="key" select="'Organization'"/>
                                    <xsl:with-param name="post" select="''"/>
                                </xsl:call-template>
                            </td>
                            <td style="width: 30%;">
                                <div>
                                    <xsl:call-template name="show-name-set">
                                        <xsl:with-param name="in" select="hl7:name"/>
                                    </xsl:call-template>
                                </div>
                                <xsl:if test="hl7:id">
                                    <table class="table_simple">
                                        <tbody>
                                            <tr>
                                                <td class="td_label">
                                                    <xsl:call-template name="getLocalizedString">
                                                        <xsl:with-param name="key" select="'id'"/>
                                                    </xsl:call-template>
                                                </td>
                                                <td>
                                                    <xsl:call-template name="show-id-set">
                                                        <xsl:with-param name="in" select="hl7:id"/>
                                                    </xsl:call-template>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </xsl:if>
                            </td>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                                <xsl:text> (</xsl:text>
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'organization'"/>
                                </xsl:call-template>
                                <xsl:text>)</xsl:text>
                            </td>
                            <td style="width: 30%;">
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="."/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header participant</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="participant">
        <xsl:for-each select="hl7:participant">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:variable name="participtRole">
                                <xsl:call-template name="show-participationTypeOrCode">
                                    <xsl:with-param name="typeCode" select="@typeCode"/>
                                    <xsl:with-param name="classCode" select="hl7:associatedEntity/@classCode"/>
                                    <xsl:with-param name="code" select="hl7:associatedEntity/hl7:code"/>
                                </xsl:call-template>
                            </xsl:variable>
                            <xsl:choose>
                                <xsl:when test="string-length($participtRole) > 0">
                                    <xsl:call-template name="firstCharCaseUp">
                                        <xsl:with-param name="data" select="$participtRole"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'participant'"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td>
                            <xsl:if test="hl7:associatedEntity/hl7:addr | hl7:associatedEntity/hl7:telecom">
                                <xsl:attribute name="style">width: 30%;</xsl:attribute>
                            </xsl:if>
                            <xsl:if test="hl7:functionCode">
                                <xsl:call-template name="show-code-set">
                                    <xsl:with-param name="in" select="hl7:functionCode"/>
                                </xsl:call-template>
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                            <xsl:call-template name="show-associatedEntity">
                                <xsl:with-param name="assoEntity" select="hl7:associatedEntity"/>
                            </xsl:call-template>
                            <xsl:call-template name="show-ivlts">
                                <xsl:with-param name="in" select="hl7:time"/>
                            </xsl:call-template>
                        </td>
                        <xsl:if test="hl7:associatedEntity/hl7:addr | hl7:associatedEntity/hl7:telecom">
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="hl7:associatedEntity"/>
                                </xsl:call-template>
                            </td>
                        </xsl:if>
                    </tr>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header recordTarget</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="recordTarget">
        <xsl:for-each select="hl7:recordTarget/hl7:patientRole">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="pre" select="''"/>
                                <xsl:with-param name="key" select="'recordTarget'"/>
                                <xsl:with-param name="post" select="''"/>
                            </xsl:call-template>
                        </td>
                        <td style="width: 30%;">
                            <xsl:call-template name="show-name-set">
                                <xsl:with-param name="in" select="hl7:patient/hl7:name"/>
                            </xsl:call-template>
                        </td>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'Contact_details'"/>
                            </xsl:call-template>
                        </td>
                        <td style="width: 30%;">
                            <xsl:call-template name="show-contactInfo">
                                <xsl:with-param name="contact" select="."/>
                            </xsl:call-template>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:choose>
                                <xsl:when test="hl7:patient/*[local-name() = 'deceasedInd'][@value = 'true' or @nullFlavor] | hl7:patient/*[local-name() = 'deceasedTime']">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'birthTimeLongDeceased'"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'birthTimeLong'"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td style="width: 30%;">
                            <xsl:call-template name="show-birthDeathTime-multipleBirth">
                                <xsl:with-param name="in" select="hl7:patient"/>
                                <xsl:with-param name="clinicalDocumentEffectiveTime" select="ancestor-or-self::hl7:ClinicalDocument/hl7:effectiveTime/@value"/>
                            </xsl:call-template>
                        </td>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'administrativeGenderCode'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:call-template name="show-code-set">
                                <xsl:with-param name="in" select="hl7:patient/hl7:administrativeGenderCode"/>
                            </xsl:call-template>
                        </td>
                    </tr>
                    <xsl:if test="hl7:patient/hl7:raceCode | hl7:patient/hl7:ethnicGroupCode">
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Race'"/>
                                </xsl:call-template>
                            </td>
                            <td style="width: 30%;">
                                <xsl:call-template name="show-code-set">
                                    <xsl:with-param name="in" select="hl7:patient/hl7:raceCode"/>
                                </xsl:call-template>
                            </td>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Ethnicity'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-code-set">
                                    <xsl:with-param name="in" select="hl7:patient/hl7:ethnicGroupCode"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:if>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'patientIdsLong'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:if test="not(hl7:patient/hl7:languageCommunication)">
                                <xsl:attribute name="colspan">3</xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="show-id-set">
                                <xsl:with-param name="in" select="hl7:id[not(contains($skip-ids-var, concat(',',@root,',')))]"/>
                                <xsl:with-param name="sep" select="'br'"/>
                            </xsl:call-template>
                        </td>
                        <xsl:if test="hl7:patient/hl7:languageCommunication">
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'languageCommunication'"/>
                                </xsl:call-template>
                            </td>
                            <td colspan="3">
                                <xsl:for-each select="hl7:patient/hl7:languageCommunication">
                                    <div>
                                        <xsl:value-of select="hl7:languageCode/@code"/>
                                        <xsl:if test="hl7:modeCode">
                                            <xsl:text>, </xsl:text>
                                            <xsl:call-template name="show-code-set">
                                                <xsl:with-param name="in" select="hl7:modeCode"/>
                                                <xsl:with-param name="sep" select="' '"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="hl7:proficiencyLevelCode">
                                            <xsl:text>, </xsl:text>
                                            <xsl:call-template name="show-code-set">
                                                <xsl:with-param name="in" select="hl7:proficiencyLevelCode"/>
                                                <xsl:with-param name="sep" select="' '"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="hl7:preferenceInd">
                                            <xsl:text>, </xsl:text>
                                            <xsl:call-template name="getLocalizedString">
                                                <xsl:with-param name="key" select="'preferredLanguage'"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="show-boolean">
                                                <xsl:with-param name="in" select="hl7:preferenceInd"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                    </div>
                                </xsl:for-each>
                            </td>
                        </xsl:if>
                    </tr>
                    <xsl:if test="hl7:patient/hl7:guardian">
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Guardian'"/>
                                </xsl:call-template>
                            </td>
                            <td style="width: 30%;">
                                <xsl:call-template name="show-name-set">
                                    <xsl:with-param name="in" select="hl7:patient/hl7:guardian/*/hl7:name"/>
                                </xsl:call-template>
                                <xsl:if test="hl7:patient/hl7:guardian/hl7:code">
                                    <xsl:text> - </xsl:text>
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:patient/hl7:guardian/hl7:code"/>
                                    </xsl:call-template>
                                </xsl:if>
                            </td>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="hl7:patient/hl7:guardian"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:for-each select="hl7:providerOrganization">
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="pre" select="''"/>
                                    <xsl:with-param name="key" select="'providerOrganization'"/>
                                    <xsl:with-param name="post" select="''"/>
                                </xsl:call-template>
                            </td>
                            <td style="width: 30%;">
                                <div>
                                    <xsl:call-template name="show-name-set">
                                        <xsl:with-param name="in" select="hl7:name"/>
                                    </xsl:call-template>
                                </div>
                                <xsl:if test="hl7:id">
                                    <table class="table_simple">
                                        <tbody>
                                            <tr>
                                                <td class="td_label">
                                                    <xsl:call-template name="getLocalizedString">
                                                        <xsl:with-param name="key" select="'id'"/>
                                                    </xsl:call-template>
                                                </td>
                                                <td>
                                                    <xsl:call-template name="show-id-set">
                                                        <xsl:with-param name="in" select="hl7:id"/>
                                                    </xsl:call-template>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </xsl:if>
                            </td>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                                <xsl:text> (</xsl:text>
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'organization'"/>
                                </xsl:call-template>
                                <xsl:text>)</xsl:text>
                            </td>
                            <td style="width: 30%;">
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="."/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header relatedDocument</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="relatedDocument">
        <xsl:for-each select="hl7:relatedDocument">
            <xsl:variable name="parentCDACode" select="ancestor::hl7:ClinicalDocument[1]/hl7:code"/>
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:choose>
                                <xsl:when test="@inversionInd = 'true'">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'relatingDocumentInverted'"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'relatingDocument'"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:text> (</xsl:text>
                            <xsl:call-template name="show-actRelationship">
                                <xsl:with-param name="ptype" select="@typeCode"/>
                            </xsl:call-template>
                            <xsl:text>)</xsl:text>
                        </td>
                        <td style="width: 80%;">
                            <xsl:for-each select="hl7:parentDocument">
                                <xsl:call-template name="idVersionSetId"/>
                            </xsl:for-each>
                        </td>
                    </tr>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header authorization</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="authorization">
        <xsl:for-each select="hl7:authorization">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'consent'"/>
                            </xsl:call-template>
                        </td>
                        <td style="width: 80%;">
                            <xsl:choose>
                                <xsl:when test="hl7:consent/hl7:code">
                                    <xsl:call-template name="show-code">
                                        <xsl:with-param name="in" select="hl7:consent/hl7:code"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="show-code">
                                        <xsl:with-param name="in" select="hl7:consent/hl7:statusCode"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                            <br/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header assignedEntity</xd:p>
        </xd:desc>
        <xd:param name="asgnEntity">Contains the assignedEntity element</xd:param>
    </xd:doc>
    <xsl:template name="show-assignedEntity">
        <xsl:param name="asgnEntity"/>
        <xsl:choose>
            <xsl:when test="$asgnEntity/hl7:assignedPerson/hl7:name">
                <xsl:call-template name="show-name-set">
                    <xsl:with-param name="in" select="$asgnEntity/hl7:assignedPerson/hl7:name"/>
                </xsl:call-template>
                <xsl:if test="$asgnEntity/hl7:assignedPerson/hl7:desc">
                    <div>
                        <xsl:value-of select="$asgnEntity/hl7:assignedPerson/hl7:desc"/>
                    </div>
                </xsl:if>
                <xsl:if test="$asgnEntity/hl7:assignedPerson/hl7:birthTime">
                    <xsl:text> </xsl:text>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'birthTimeLong'"/>
                    </xsl:call-template>
                    <xsl:text> </xsl:text>
                    <xsl:call-template name="show-timestamp">
                        <xsl:with-param name="in" select="$asgnEntity/hl7:assignedPerson/hl7:birthTime"/>
                    </xsl:call-template>
                </xsl:if>
                <xsl:if test="$asgnEntity/hl7:representedOrganization/hl7:name">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="pre" select="' '"/>
                        <xsl:with-param name="key" select="'of'"/>
                        <xsl:with-param name="post" select="' '"/>
                    </xsl:call-template>
                    <xsl:call-template name="show-name-set">
                        <xsl:with-param name="in" select="$asgnEntity/hl7:representedOrganization/hl7:name"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$asgnEntity/hl7:representedOrganization">
                <xsl:value-of select="$asgnEntity/hl7:representedOrganization/hl7:name"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="show-id-set">
                    <xsl:with-param name="in" select="$asgnEntity/hl7:id"/>
                    <xsl:with-param name="sep" select="'br'"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header relatedEntity</xd:p>
        </xd:desc>
        <xd:param name="relatedEntity">Contains the relatedEntity element</xd:param>
    </xd:doc>
    <xsl:template name="show-relatedEntity">
        <xsl:param name="relatedEntity"/>
        <xsl:choose>
            <xsl:when test="$relatedEntity/hl7:relatedPerson/hl7:name">
                <xsl:call-template name="show-name-set">
                    <xsl:with-param name="in" select="$relatedEntity/hl7:relatedPerson/hl7:name"/>
                </xsl:call-template>
                <xsl:if test="$relatedEntity/hl7:relatedPerson/hl7:desc">
                    <div>
                        <xsl:value-of select="$relatedEntity/hl7:relatedPerson/hl7:desc"/>
                    </div>
                </xsl:if>
                <xsl:if test="$relatedEntity/hl7:relatedPerson/hl7:birthTime">
                    <xsl:text> </xsl:text>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'birthTimeLong'"/>
                    </xsl:call-template>
                    <xsl:text> </xsl:text>
                    <xsl:call-template name="show-timestamp">
                        <xsl:with-param name="in" select="$relatedEntity/hl7:relatedPerson/hl7:birthTime"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header associatedEntity</xd:p>
        </xd:desc>
        <xd:param name="assoEntity">Contains the associatedEntity element</xd:param>
    </xd:doc>
    <xsl:template name="show-associatedEntity">
        <xsl:param name="assoEntity"/>
        <xsl:if test="$assoEntity/hl7:associatedPerson">
            <xsl:call-template name="show-name-set">
                <xsl:with-param name="in" select="$assoEntity/hl7:associatedPerson/hl7:name"/>
                <xsl:with-param name="sep" select="'br'"/>
            </xsl:call-template>
            <xsl:if test="$assoEntity/hl7:assignedPerson/hl7:desc">
                <div>
                    <xsl:value-of select="$assoEntity/hl7:assignedPerson/hl7:desc"/>
                </div>
            </xsl:if>
            <xsl:if test="$assoEntity/hl7:assignedPerson/hl7:birthTime">
                <xsl:text> </xsl:text>
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'birthTimeLong'"/>
                </xsl:call-template>
                <xsl:text> </xsl:text>
                <xsl:call-template name="show-timestamp">
                    <xsl:with-param name="in" select="$assoEntity/hl7:assignedPerson/hl7:birthTime"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:if>
        <xsl:if test="$assoEntity/hl7:code">
            <xsl:if test="$assoEntity/hl7:associatedPerson/hl7:name or $assoEntity/hl7:associatedPerson/hl7:id">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:call-template name="show-code-set">
                <xsl:with-param name="in" select="$assoEntity/hl7:code"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="$assoEntity/hl7:id">
            <xsl:if test="$assoEntity/hl7:associatedPerson/hl7:name">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:call-template name="getLocalizedString">
                <xsl:with-param name="key" select="'id'"/>
                <xsl:with-param name="post" select="': '"/>
            </xsl:call-template>
            <xsl:call-template name="show-id-set">
                <xsl:with-param name="in" select="$assoEntity/hl7:id"/>
                <xsl:with-param name="sep" select="'br'"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="$assoEntity/hl7:scopingOrganization">
            <br/>
            <xsl:call-template name="getLocalizedString">
                <xsl:with-param name="key" select="'organization'"/>
                <xsl:with-param name="post" select="': '"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="$assoEntity/hl7:scopingOrganization/hl7:name">
                <xsl:call-template name="show-name-set">
                    <xsl:with-param name="in" select="$assoEntity/hl7:scopingOrganization/hl7:name"/>
                </xsl:call-template>
                <xsl:if test="$assoEntity/hl7:scopingOrganization/hl7:standardIndustryClassCode">
                    <xsl:value-of select="$assoEntity/hl7:scopingOrganization/hl7:standardIndustryClassCode/@displayName"/>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="pre" select="' '"/>
                        <xsl:with-param name="key" select="'code'"/>
                        <xsl:with-param name="post" select="':'"/>
                    </xsl:call-template>
                    <xsl:call-template name="show-code-set">
                        <xsl:with-param name="in" select="$assoEntity/hl7:scopingOrganization/hl7:standardIndustryClassCode/@code"/>
                    </xsl:call-template>
                </xsl:if>
                <xsl:text>, </xsl:text>
            </xsl:when>
            <xsl:when test="$assoEntity/hl7:scopingOrganization/hl7:standardIndustryClassCode">
                <xsl:value-of select="$assoEntity/hl7:scopingOrganization/hl7:standardIndustryClassCode/@displayName"/>
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="pre" select="' '"/>
                    <xsl:with-param name="key" select="'code'"/>
                    <xsl:with-param name="post" select="':'"/>
                </xsl:call-template>
                <xsl:call-template name="show-code-set">
                    <xsl:with-param name="in" select="$assoEntity/hl7:scopingOrganization/hl7:standardIndustryClassCode/@code"/>
                </xsl:call-template>
                <xsl:text>, </xsl:text>
            </xsl:when>
        </xsl:choose>
        <xsl:if test="$assoEntity/hl7:scopingOrganization/hl7:id">
            <xsl:call-template name="getLocalizedString">
                <xsl:with-param name="key" select="'id'"/>
                <xsl:with-param name="post" select="': '"/>
            </xsl:call-template>
            <xsl:call-template name="show-id-set">
                <xsl:with-param name="in" select="$assoEntity/hl7:scopingOrganization/hl7:id"/>
                <xsl:with-param name="sep" select="'br'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle id, setId and versionNumber</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="idVersionSetId">
        <xsl:if test="hl7:id | hl7:setId | hl7:versionNumber">
            <table class="table_simple">
                <tbody>
                    <xsl:if test="hl7:id">
                        <tr>
                            <td class="td_label">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'id'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-id-set">
                                    <xsl:with-param name="in" select="hl7:id"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:if test="hl7:versionNumber">
                        <tr>
                            <td class="td_label">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'versionNumber'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:value-of select="hl7:versionNumber/@value"/>
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:if test="hl7:setId">
                        <tr>
                            <td class="td_label">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'setId'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-id-set">
                                    <xsl:with-param name="in" select="hl7:setId"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:if>
                </tbody>
            </table>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle contactInfo. Address and telecom</xd:p>
        </xd:desc>
        <xd:param name="contact">Element containing addr and or telecom element</xd:param>
    </xd:doc>
    <xsl:template name="show-contactInfo">
        <xsl:param name="contact"/>
        <xsl:call-template name="show-address-set">
            <xsl:with-param name="in" select="$contact/hl7:addr"/>
            <xsl:with-param name="sep" select="'br'"/>
        </xsl:call-template>
        <xsl:if test="$contact/hl7:addr and $contact/hl7:telecom">
            <br/>
        </xsl:if>
        <xsl:call-template name="show-telecom-set">
            <xsl:with-param name="in" select="$contact/hl7:telecom"/>
            <xsl:with-param name="sep" select="', '"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>Handle one line of birth/death/multiple birth data</xd:desc>
        <xd:param name="in">One element with the child elements birthTime, deceasedInd, deceasedTime, multipleBirthInd, multipleBirthOrderNumber. Each of those is optional and may bein the V3 namespace or in another namespace like sdtc</xd:param>
        <xd:param name="clinicalDocumentEffectiveTime">hl7:ClinicalDocument/hl7:effectiveTime/@value</xd:param>
    </xd:doc>
    <xsl:template name="show-birthDeathTime-multipleBirth">
        <xsl:param name="in"/>
        <xsl:param name="clinicalDocumentEffectiveTime" select="ancestor-or-self::hl7:ClinicalDocument/hl7:effectiveTime/@value"/>
        <xsl:if test="$in">
            <xsl:call-template name="show-timestamp">
                <xsl:with-param name="in" select="$in/*[local-name() = 'birthTime']"/>
            </xsl:call-template>
            <xsl:if test="$in/*[local-name() = 'deceasedInd'][@value = 'true' or @nullFlavor] | $in/*[local-name() = 'deceasedTime']">
                <xsl:text> - </xsl:text>
                <xsl:choose>
                    <xsl:when test="$in/*[local-name() = 'deceasedTime'][@value]">
                        <xsl:call-template name="show-timestamp">
                            <xsl:with-param name="in" select="$in/*[local-name() = 'deceasedTime']"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$in/*[local-name() = 'deceasedInd'][@nullFlavor]">
                        <xsl:call-template name="show-nullFlavor">
                            <xsl:with-param name="in" select="$in/*[local-name() = 'deceasedInd']/@nullFlavor"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="pre" select="'&#8224;'"/>
                            <xsl:with-param name="key" select="'date_unknown'"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
            <xsl:variable name="comparedate">
                <xsl:choose>
                    <xsl:when test="$in/*[local-name() = 'deceasedTime'][@value]">
                        <xsl:value-of select="$in/*[local-name() = 'deceasedTime']/@value"/>
                    </xsl:when>
                    <xsl:when test="not($in/*[local-name() = 'deceasedInd'] or $in/*[local-name() = 'deceasedTime'][@value = 'true' or @nullFlavor] or $in/*[local-name() = 'deceasedTime'])">
                        <xsl:value-of select="$clinicalDocumentEffectiveTime"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:if test="string-length($comparedate) > 0">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="pre">
                        <xsl:text> (</xsl:text>
                        <xsl:call-template name="getAge">
                            <xsl:with-param name="comparedate" select="$comparedate"/>
                            <xsl:with-param name="date" select="$in/hl7:birthTime/@value"/>
                        </xsl:call-template>
                    </xsl:with-param>
                    <xsl:with-param name="key" select="'yr'"/>
                    <xsl:with-param name="post" select="')'"/>
                </xsl:call-template>
            </xsl:if>
            <xsl:if test="$in/*[local-name() = 'multipleBirthInd'][@value = 'true'] | $in/*[local-name() = 'multipleBirthOrderNumber']">
                <i>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="pre" select="' '"/>
                        <xsl:with-param name="key" select="'partOfMultipleBirth'"/>
                    </xsl:call-template>
                </i>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Get localized string for a classCode</xd:p>
        </xd:desc>
        <xd:param name="clsCode">Class code string</xd:param>
    </xd:doc>
    <xsl:template name="show-actClassCode">
        <xsl:param name="clsCode"/>
        <xsl:call-template name="getLocalizedString">
            <xsl:with-param name="key" select="concat('2.16.840.1.113883.5.6-',$clsCode)"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Get localized string for a typeCode from an act relationship</xd:p>
        </xd:desc>
        <xd:param name="ptype">ActRelationship type string</xd:param>
    </xd:doc>
    <xsl:template name="show-actRelationship">
        <xsl:param name="ptype"/>
        <xsl:call-template name="getLocalizedString">
            <xsl:with-param name="key" select="concat('2.16.840.1.113883.5.1002-',$ptype)"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Get localized string for a typeCode from a participation</xd:p>
        </xd:desc>
        <xd:param name="ptype">Participation type string</xd:param>
    </xd:doc>
    <xsl:template name="show-participationType">
        <xsl:param name="ptype"/>
        <xsl:call-template name="getLocalizedString">
            <xsl:with-param name="key" select="concat('2.16.840.1.113883.5.90-',$ptype)"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Takes the participation typeCode attribute and translates that to a human readable form and adds the Role.code in human readable form if available.</xd:p>
        </xd:desc>
        <xd:param name="typeCode">required. Participation typeCode</xd:param>
        <xd:param name="code">optional. Role.code</xd:param>
        <xd:param name="classCode">optional. Class code of the contained class, if any</xd:param>
    </xd:doc>
    <xsl:template name="show-participationTypeOrCode">
        <xsl:param name="typeCode"/>
        <xsl:param name="classCode"/>
        <xsl:param name="code"/>
        <xsl:if test="string-length($typeCode) > 0">
            <xsl:call-template name="getLocalizedString">
                <xsl:with-param name="key" select="concat('2.16.840.1.113883.5.90-',$typeCode)"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="string-length($classCode) > 0">
            <xsl:if test="string-length($typeCode) > 0">
                <xsl:text> - </xsl:text>
            </xsl:if>
            <xsl:call-template name="getLocalizedString">
                <xsl:with-param name="key" select="concat('2.16.840.1.113883.5.110-',$classCode)"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="$code">
            <xsl:if test="$code//@code">
                <xsl:text> </xsl:text>
                <xsl:call-template name="show-code-set">
                    <xsl:with-param name="in" select="$code"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <!-- ====================================================================== -->
    <!--                         Datatype based functions                       -->
    <!-- ====================================================================== -->

    <xd:doc>
        <xd:desc>
            <xd:p>Show elements with datatype II separated with the value in 'sep'. Calls <xd:ref name="show-id" type="template">show-id</xd:ref>
        </xd:p>
        </xd:desc>
        <xd:param name="in">Set of 0 to * elements</xd:param>
        <xd:param name="sep">Separator between output of different elements. Default ', ' and special is 'br' which generates an HTML br tag</xd:param>
    </xd:doc>
    <xsl:template name="show-id-set">
        <xsl:param name="in"/>
        <xsl:param name="sep" select="', '"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 -->
                <xsl:when test="count($in) &gt; 1">
                    <xsl:for-each select="$in">
                        <xsl:call-template name="show-id">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[hl7:item]">
                    <xsl:for-each select="$in/hl7:item">
                        <xsl:call-template name="show-id">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:otherwise>
                    <xsl:call-template name="show-id">
                        <xsl:with-param name="in" select="$in"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show element with datatype II</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
    </xd:doc>
    <xsl:template name="show-id">
        <xsl:param name="in"/>
        <xsl:if test="$in">
            <span>
                <xsl:if test="$in[@assigningAuthorityName]">
                    <xsl:attribute name="title">
                        <xsl:value-of select="$in/@assigningAuthorityName"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:variable name="extension">
                    <xsl:if test="$in[@extension][@root]">
                        <xsl:choose>
                            <xsl:when test="$in[contains($mask-ids-var, concat(',',@root,','))]">
                                <span>
                                    <xsl:attribute name="title">
                                        <xsl:call-template name="show-nullFlavor">
                                            <xsl:with-param name="in" select="'MSK'"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                    <xsl:text>xxx-xxx-xxx</xsl:text>
                                </span>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$in/@extension"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="$in[@extension][@root]">
                        <xsl:copy-of select="$extension"/>
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="pre" select="' ('"/>
                            <xsl:with-param name="key" select="$in/@root"/>
                            <xsl:with-param name="post" select="')'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$in[@root]">
                        <xsl:value-of select="$in/@root"/>
                    </xsl:when>
                    <xsl:when test="$in[@extension]">
                        <xsl:copy-of select="$extension"/>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="$in[@nullFlavor]">
                    <xsl:text>(</xsl:text>
                    <xsl:call-template name="show-nullFlavor">
                        <xsl:with-param name="in" select="$in/@nullFlavor"/>
                    </xsl:call-template>
                    <xsl:text>)</xsl:text>
                </xsl:if>
            </span>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show elements with datatype INT separated with the value in 'sep'. Calls <xd:ref name="show-integer" type="template">show-integer</xd:ref>
            </xd:p>
        </xd:desc>
        <xd:param name="in">Set of 0 to * elements</xd:param>
        <xd:param name="sep">Separator between output of different elements. Default ', ' and special is 'br' which generates an HTML br tag</xd:param>
    </xd:doc>
    <xsl:template name="show-integer-set">
        <xsl:param name="in"/>
        <xsl:param name="sep" select="', '"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 -->
                <xsl:when test="count($in) > 1">
                    <xsl:for-each select="$in">
                        <xsl:call-template name="show-integer">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[hl7:item]">
                    <xsl:for-each select="$in/hl7:item">
                        <xsl:call-template name="show-integer">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:otherwise>
                    <xsl:call-template name="show-integer">
                        <xsl:with-param name="in" select="$in"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show element with datatype INT</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
    </xd:doc>
    <xsl:template name="show-integer">
        <xsl:param name="in"/>
        <xsl:if test="$in">
            <xsl:choose>
                <xsl:when test="$in[@value]">
                    <xsl:value-of select="$in/@value"/>
                </xsl:when>
            </xsl:choose>
            <xsl:if test="$in[@value]">
                <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:if test="$in[@nullFlavor]">
                <xsl:text>(</xsl:text>
                <xsl:call-template name="show-nullFlavor">
                    <xsl:with-param name="in" select="$in/@nullFlavor"/>
                </xsl:call-template>
                <xsl:text>)</xsl:text>
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show elements with datatype CD, CE, CV, CO separated with the value in 'sep'. Calls <xd:ref name="show-code" type="template">show-code</xd:ref></xd:p>
        </xd:desc>
        <xd:param name="in">Set of 0 to * elements</xd:param>
        <xd:param name="sep">Separator between output of different elements. Default ', ' and special is 'br' which generates an HTML br tag</xd:param>
        <xd:param name="textonly">XSLT 1.0 will output a warning when you create an element inside an attribute/text node/processing instruction. To prevent that warning, we should just prevent creation of elements in that context. Set to 'true' if that's the case. Default is 'false'.</xd:param>
    </xd:doc>
    <xsl:template name="show-code-set">
        <xsl:param name="in"/>
        <xsl:param name="sep" select="', '"/>
        <xsl:param name="textonly" select="'false'"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 -->
                <xsl:when test="count($in) > 1">
                    <xsl:for-each select="$in">
                        <xsl:call-template name="show-code">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textonly" select="$textonly"/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br' and not($textonly = 'true')">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[hl7:item]">
                    <xsl:for-each select="$in/hl7:item">
                        <xsl:call-template name="show-code">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textonly" select="$textonly"/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br' and not($textonly = 'true')">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:otherwise>
                    <xsl:call-template name="show-code">
                        <xsl:with-param name="in" select="$in"/>
                        <xsl:with-param name="textonly" select="$textonly"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show elements with datatype CD, CE, CV, CO</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
        <xd:param name="textonly">XSLT 1.0 will output a warning when you create an element inside an attribute/text node/processing instruction. To prevent that warning, we should just prevent creation of elements in that context. Set to 'true' if that's the case. Default is 'false'.</xd:param>
    </xd:doc>
    <xsl:template name="show-code">
        <xsl:param name="in"/>
        <xsl:param name="textonly" select="'false'"/>
        <xsl:if test="$in">
            <xsl:variable name="codeSystem">
                <xsl:choose>
                    <xsl:when test="@codeSystem"><xsl:value-of select="$in/@codeSystem"/></xsl:when>
                    <xsl:when test="$in/self::hl7:signatureCode[not(@codeSystem)]">2.16.840.1.113883.5.89</xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:choose>
                <!-- DTr1 -->
                <xsl:when test="$in[@code] and string-length($codeSystem) > 0">
                    <xsl:variable name="key" select="concat($codeSystem, '-', $in/@code)"/>
                    <xsl:variable name="displayName">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="$key"/>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:choose>
                        <xsl:when test="$displayName = $key and $in[@displayName]">
                            <xsl:value-of select="$in/@displayName"/>
                        </xsl:when>
                        <xsl:when test="$displayName = $key and $in[hl7:displayName/@value]">
                            <xsl:value-of select="($in/hl7:displayName/@value)[1]"/>
                        </xsl:when>
                        <xsl:when test="$displayName = $key">
                            <xsl:value-of select="$in/@code"/>
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="pre" select="' ('"/>
                                <xsl:with-param name="key" select="$codeSystem"/>
                                <xsl:with-param name="post" select="')'"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$displayName"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <!-- DTr1 -->
                <xsl:when test="$in[@displayName]">
                    <xsl:value-of select="$in/@displayName"/>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[hl7:displayName/@value]">
                    <xsl:value-of select="($in/hl7:displayName/@value)[1]"/>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:when test="$in[@code]">
                    <xsl:value-of select="$in/@code"/>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:when test="$in[@nullFlavor]">
                    <xsl:call-template name="show-nullFlavor">
                        <xsl:with-param name="in" select="$in/@nullFlavor"/>
                    </xsl:call-template>
                </xsl:when>
            </xsl:choose>
            <!-- DTr1 | DTr2 -->
            <xsl:for-each select="$in/*[local-name() = 'originalText'] | $in/*[local-name() = 'originalText']/*[local-name() = 'xml']">
                <xsl:text> - </xsl:text>
                <xsl:value-of select="."/>
            </xsl:for-each>
            <xsl:for-each select="$in/*[local-name() = 'translation']">
                <xsl:choose>
                    <xsl:when test="$textonly = 'true'">
                        <xsl:text>. </xsl:text>
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="local-name()"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="show-code-set">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <div style="margin-left: 2em;">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="local-name()"/>
                                <xsl:with-param name="post" select="': '"/>
                            </xsl:call-template>
                            <xsl:call-template name="show-code-set">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </div>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show elements with datatype EN, ON, PN or TN separated with the value in 'sep'. Calls <xd:ref name="show-name" type="template">show-name</xd:ref></xd:p>
        </xd:desc>
        <xd:param name="in">Set of 0 to * elements</xd:param>
        <xd:param name="sep">Separator between output of different elements. Default ', ' and special is 'br' which generates an HTML br tag</xd:param>
    </xd:doc>
    <xsl:template name="show-name-set">
        <xsl:param name="in"/>
        <xsl:param name="sep" select="', '"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 -->
                <xsl:when test="count($in) > 1">
                    <xsl:for-each select="$in">
                        <xsl:call-template name="show-name">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[hl7:item]">
                    <xsl:for-each select="$in/hl7:item">
                        <xsl:call-template name="show-name">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:otherwise>
                    <xsl:call-template name="show-name">
                        <xsl:with-param name="in" select="$in"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show element with datatype EN, ON, PN, or TN</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
    </xd:doc>
    <xsl:template name="show-name">
        <xsl:param name="in"/>
        <xsl:if test="$in">
            <xsl:if test="$in/@use">
                <xsl:call-template name="tokenize">
                    <xsl:with-param name="prefix" select="'nameUse_'"/>
                    <xsl:with-param name="string" select="$in/@use"/>
                    <xsl:with-param name="delimiters" select="' '"/>
                </xsl:call-template>
                <xsl:text>: </xsl:text>
            </xsl:if>
            <xsl:if test="$in[@use][@nullFlavor]">
                <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:call-template name="show-nullFlavor">
                <xsl:with-param name="in" select="$in/@nullFlavor"/>
            </xsl:call-template>
            <xsl:for-each select="$in/node()">
                <!-- 
                        Except for prefix, suffix and delimiter name parts, every name part is surrounded by implicit whitespace.
                        Leading and trailing explicit whitespace is insignificant in all those name parts. 
                    -->
                <xsl:if test="self::hl7:given[string-length(normalize-space(.)) > 0] | self::hl7:family[string-length(normalize-space(.)) > 0] | self::hl7:part[@type='GIV' or @type='FAM'][string-length(normalize-space(@value)) > 0]">
                    <xsl:if test="preceding-sibling::node()[string-length(normalize-space(.)) > 0]">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="self::comment() | self::processing-instruction()"/>
                    <!-- DTr1 -->
                    <xsl:when test="self::hl7:family">
                        <xsl:call-template name="caseUp">
                            <xsl:with-param name="data" select="."/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- DTr2 -->
                    <xsl:when test="self::hl7:part[@type = 'FAM']">
                        <xsl:call-template name="caseUp">
                            <xsl:with-param name="data" select="@value"/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- DTr1 -->
                    <xsl:when test="self::hl7:prefix[contains(@qualifier, 'VV')]">
                        <xsl:call-template name="caseUp">
                            <xsl:with-param name="data" select="."/>
                        </xsl:call-template>
                        <xsl:text> </xsl:text>
                    </xsl:when>
                    <!-- DTr2 -->
                    <xsl:when test="self::hl7:part[@type = 'PFX' and contains(@qualifier, 'VV')]">
                        <xsl:call-template name="caseUp">
                            <xsl:with-param name="data" select="@value"/>
                        </xsl:call-template>
                        <xsl:text> </xsl:text>
                    </xsl:when>
                    <!-- DTr1 -->
                    <xsl:when test="self::hl7:prefix | self::hl7:given | self::delimiter">
                        <xsl:value-of select="."/>
                    </xsl:when>
                    <!-- DTr2 -->
                    <xsl:when test="self::hl7:part[@type = 'PFX' or @type = 'GIV' or @type = 'DEL']">
                        <xsl:value-of select="@value"/>
                    </xsl:when>
                    <xsl:when test="string-length(normalize-space(.)) > 0">
                        <xsl:value-of select="."/>
                    </xsl:when>
                    <!-- DTr2 -->
                    <xsl:when test="self::hl7:part[not(@type)][string-length(normalize-space(@value)) > 0]">
                        <xsl:value-of select="@value"/>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="self::hl7:given[string-length(normalize-space(.)) > 0] | self::hl7:family[string-length(normalize-space(.)) > 0] | self::hl7:part[@type='GIV' or @type='FAM'][string-length(normalize-space(@value)) > 0]">
                    <xsl:if test="following-sibling::node()[string-length(normalize-space(.)) > 0]">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show elements with datatype AD separated with the value in 'sep'. Calls <xd:ref name="show-address" type="template">show-address</xd:ref></xd:p>
        </xd:desc>
        <xd:param name="in">Set of 0 to * elements</xd:param>
        <xd:param name="sep">Separator between output of different elements. Default ', ' and special is 'br' which generates an HTML br tag</xd:param>
    </xd:doc>
    <xsl:template name="show-address-set">
        <xsl:param name="in"/>
        <xsl:param name="sep" select="', '"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 -->
                <xsl:when test="count($in) > 1">
                    <xsl:for-each select="$in">
                        <xsl:call-template name="show-address">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[hl7:item]">
                    <xsl:for-each select="$in/hl7:item">
                        <xsl:call-template name="show-address">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:otherwise>
                    <xsl:call-template name="show-address">
                        <xsl:with-param name="in" select="$in"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show element with datatype AD</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
    </xd:doc>
    <xsl:template name="show-address">
        <xsl:param name="in"/>
        <xsl:if test="$in">
            <xsl:if test="$in/@use">
                <xsl:call-template name="tokenize">
                    <xsl:with-param name="prefix" select="'addressUse_'"/>
                    <xsl:with-param name="string" select="$in/@use"/>
                    <xsl:with-param name="delimiters" select="' '"/>
                </xsl:call-template>
                <xsl:text>: </xsl:text>
            </xsl:if>
            <xsl:if test="$in[@use][@nullFlavor]">
                <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:call-template name="show-nullFlavor">
                <xsl:with-param name="in" select="$in/@nullFlavor"/>
            </xsl:call-template>
            <xsl:for-each select="$in/text() | $in/*">
                <xsl:choose>
                    <xsl:when test="self::hl7:useablePeriod"/>
                    <!-- DTr1 only if not streetAddressLine -->
                    <xsl:when test="self::hl7:streetName">
                        <xsl:if test="not(../hl7:streetAddressLine)">
                            <xsl:variable name="additionalLocator" select="following-sibling::hl7:*[1][local-name() = 'additionalLocator'] |
                                                                           following-sibling::hl7:*[1][local-name() = 'houseNumberNumeric' or local-name() = 'houseNumber' or local-name() = 'buildingNumberSuffix']/following-sibling::hl7:*[1][local-name() = 'additionalLocator'] | 
                                                                           following-sibling::hl7:*[1][local-name() = 'houseNumberNumeric' or local-name() = 'houseNumber']/following-sibling::hl7:*[1][local-name() = 'buildingNumberSuffix']/following-sibling::hl7:*[1][local-name() = 'additionalLocator']"/>
                            <xsl:variable name="houseNumber" select="following-sibling::hl7:*[1][local-name() = 'houseNumberNumeric'] | 
                                                                     following-sibling::hl7:*[1][local-name() = 'houseNumber']"/>
                            <xsl:variable name="buildingNumberSuffix" select="following-sibling::hl7:*[1][local-name() = 'buildingNumberSuffix'] | 
                                                                              following-sibling::hl7:*[1][local-name() = 'houseNumberNumeric' or local-name() = 'houseNumber']/following-sibling::hl7:*[1][local-name() = 'buildingNumberSuffix']"/>
                            <!-- 
                                Look for
                                - streetName houseNumber|houseNumberNumeric|buildingNumberSuffix
                                - streetName houseNumber|houseNumberNumeric|buildingNumberSuffix additionalLocator houseNumber|houseNumberNumeric|buildingNumberSuffix
                                - streetName additionalLocator houseNumber|houseNumberNumeric|buildingNumberSuffix
                                in that order and nothing in between.
                            -->
                            <xsl:value-of select="."/>
                            <xsl:choose>
                                <xsl:when test="string-length($houseNumber) > 0">
                                    <xsl:text>&#160;</xsl:text>
                                    <xsl:value-of select="$houseNumber"/>
                                    <xsl:if test="string-length($buildingNumberSuffix) > 0">
                                        <xsl:text>&#160;</xsl:text>
                                        <xsl:value-of select="$buildingNumberSuffix"/>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:when test="string-length($buildingNumberSuffix) > 0">
                                    <xsl:text>&#160;</xsl:text>
                                    <xsl:value-of select="$buildingNumberSuffix"/>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:if test="string-length($additionalLocator) > 0">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:value-of select="$additionalLocator"/>
                                
                                <xsl:variable name="houseNumber2" select="$additionalLocator/following-sibling::hl7:*[1][local-name() = 'houseNumberNumeric'] | 
                                                                          $additionalLocator/following-sibling::hl7:*[1][local-name() = 'houseNumber']"/>
                                <xsl:variable name="buildingNumberSuffix2" select="$additionalLocator/following-sibling::hl7:*[1][local-name() = 'buildingNumberSuffix'] | 
                                                                                   $additionalLocator/following-sibling::hl7:*[1][local-name() = 'houseNumberNumeric' or local-name() = 'houseNumber']/following-sibling::hl7:*[1][local-name() = 'buildingNumberSuffix']"/>
                                
                                <xsl:choose>
                                    <xsl:when test="string-length($houseNumber2) > 0">
                                        <xsl:text>&#160;</xsl:text>
                                        <xsl:value-of select="$houseNumber2"/>
                                        <xsl:if test="string-length($buildingNumberSuffix2) > 0">
                                            <xsl:text>&#160;</xsl:text>
                                            <xsl:value-of select="$buildingNumberSuffix2"/>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:when test="string-length($buildingNumberSuffix2) > 0">
                                        <xsl:text>&#160;</xsl:text>
                                        <xsl:value-of select="$buildingNumberSuffix2"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:if>
                            <xsl:if test="following-sibling::*[not(local-name() = 'houseNumber' or local-name() = 'houseNumberNumeric' or local-name() = 'buildingNumberSuffix' or local-name() = 'additionalLocator')][string-length(.) > 0 or @code]">
                                <br/>
                            </xsl:if>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr2 only if not streetAddressLine -->
                    <xsl:when test="self::hl7:part[@type='STR']">
                        <xsl:if test="not(../hl7:part[@type='SAL'])">
                            <xsl:variable name="additionalLocator" select="following-sibling::hl7:part[1][@type='ADL'] |
                                                                           following-sibling::hl7:part[1][@type='BNN' or @type='BNR' or @type='BNS']/following-sibling::hl7:part[1][@type='ADL'] | 
                                                                           following-sibling::hl7:part[1][@type='BNN' or @type='BNR' or @type='BNS']/following-sibling::hl7:part[1][@type='BNS']/following-sibling::hl7:part[1][@type='ADL']"/>
                            <xsl:variable name="houseNumber" select="following-sibling::hl7:part[1][@type='BNN'] | 
                                following-sibling::hl7:part[1][@type='BNR']"/>
                            <xsl:variable name="buildingNumberSuffix" select="following-sibling::hl7:part[1][@type='BNS'] | 
                                following-sibling::hl7:part[1][@type='BNN' or @type='BNR']/following-sibling::hl7:part[1][@type='BNS']"/>
                            <!-- 
                                Look for
                                - streetName houseNumber|houseNumberNumeric|buildingNumberSuffix
                                - streetName houseNumber|houseNumberNumeric|buildingNumberSuffix additionalLocator houseNumber|houseNumberNumeric|buildingNumberSuffix
                                - streetName additionalLocator houseNumber|houseNumberNumeric|buildingNumberSuffix
                                in that order and nothing in between.
                            -->
                            <xsl:value-of select="."/>
                            <xsl:choose>
                                <xsl:when test="string-length($houseNumber) > 0">
                                    <xsl:text>&#160;</xsl:text>
                                    <xsl:value-of select="$houseNumber"/>
                                    <xsl:if test="string-length($buildingNumberSuffix) > 0">
                                        <xsl:text>&#160;</xsl:text>
                                        <xsl:value-of select="$buildingNumberSuffix"/>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:when test="string-length($buildingNumberSuffix) > 0">
                                    <xsl:text>&#160;</xsl:text>
                                    <xsl:value-of select="$buildingNumberSuffix"/>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:if test="string-length($additionalLocator) > 0">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:value-of select="$additionalLocator"/>
                                
                                <xsl:variable name="houseNumber2" select="$additionalLocator/following-sibling::hl7:part[1][@type='BNN'] | 
                                    $additionalLocator/following-sibling::hl7:part[1][@type='BNR']"/>
                                <xsl:variable name="buildingNumberSuffix2" select="$additionalLocator/following-sibling::hl7:part[1][@type='BNS'] | 
                                    $additionalLocator/following-sibling::hl7:part[1][@type='BNN' or @type='BNR']/following-sibling::hl7:part[1][@type='BNS']"/>
                                
                                <xsl:choose>
                                    <xsl:when test="string-length($houseNumber2) > 0">
                                        <xsl:text>&#160;</xsl:text>
                                        <xsl:value-of select="$houseNumber2"/>
                                        <xsl:if test="string-length($buildingNumberSuffix2) > 0">
                                            <xsl:text>&#160;</xsl:text>
                                            <xsl:value-of select="$buildingNumberSuffix2"/>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:when test="string-length($buildingNumberSuffix2) > 0">
                                        <xsl:text>&#160;</xsl:text>
                                        <xsl:value-of select="$buildingNumberSuffix2"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:if>
                            <xsl:if test="following-sibling::*[not(@type='BNR' or local-name() = 'houseNumberNumeric' or @type='BNS' or @type='ADL')][string-length(.) > 0 or @code]">
                                <br/>
                            </xsl:if>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr1 only if not streetAddressLine -->
                    <xsl:when test="self::hl7:houseNumber or self::hl7:houseNumberNumeric or self::hl7:buildingNumberSuffix">
                        <xsl:if test="not(../hl7:streetAddressLine)">
                            <xsl:if test="not(preceding-sibling::hl7:*[1][local-name() = 'streetName' or local-name() = 'additionalLocator'])">
                                <xsl:if test="not(self::hl7:buildingNumberSuffix and preceding-sibling::hl7:*[1][local-name() = 'houseNumberNumeric' or local-name() = 'houseNumber'])">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="following-sibling::hl7:*[1][string-length(.) > 0 or @code]">
                                        <br/>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr2 only if not streetAddressLine -->
                    <xsl:when test="self::hl7:part[@type='BNN' or @type='BNR' or @type='BNS']">
                        <xsl:if test="not(../hl7:part[@type = 'SAL'])">
                            <xsl:if test="not(preceding-sibling::hl7:*[1][hl7:part[@type = 'STR' or @type = 'ADL']])">
                                <xsl:if test="not(self::hl7:part[@type='BNS'] and preceding-sibling::hl7:*[1][@type='BNN' or @type='BNR'])">
                                        <xsl:value-of select="@value"/>
                                        <xsl:if test="following-sibling::hl7:part[1][string-length(@value) > 0 or @code]">
                                             <br/>
                                        </xsl:if>
                                  </xsl:if>
                            </xsl:if>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr1 -->
                    <xsl:when test="self::hl7:additionalLocator">
                        <xsl:if test="not(preceding-sibling::hl7:*[1][local-name()='houseNumber' or local-name()='houseNumberNumeric' or local-name()='buildingNumberSuffix'])">
                            <xsl:value-of select="."/>
                            <xsl:if test="following-sibling::hl7:*[1][local-name()='houseNumberNumeric']">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:value-of select="following-sibling::hl7:*[1][local-name()='houseNumberNumeric']"/>
                            </xsl:if>
                            <xsl:if test="following-sibling::hl7:*[1][local-name()='houseNumber']">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:value-of select="following-sibling::hl7:*[1][local-name()='houseNumber']"/>
                            </xsl:if>
                            <xsl:if test="following-sibling::hl7:*[1][local-name()='buildingNumberSuffix']">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:value-of select="following-sibling::hl7:*[1][local-name()='buildingNumberSuffix']"/>
                            </xsl:if>
                            <xsl:if test="following-sibling::hl7:*[1][string-length(.) > 0 or @code]">
                                <br/>
                            </xsl:if>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr2 -->
                    <xsl:when test="self::hl7:part[@type='ADL']">
                        <xsl:if test="not(preceding-sibling::hl7:*[1][@type='BNN' or @type='BNR' or @type='BNS'])">
                            <xsl:value-of select="@value"/>
                            <xsl:if test="following-sibling::hl7:*[1][@type='BNN']">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:value-of select="following-sibling::hl7:*[1][@type='BNN']/@value"/>
                            </xsl:if>
                            <xsl:if test="following-sibling::hl7:*[1][@type='BNR']">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:value-of select="following-sibling::hl7:*[1][@type='BNR']/@value"/>
                            </xsl:if>
                            <xsl:if test="following-sibling::hl7:*[1][@type='BNS']">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:value-of select="following-sibling::hl7:*[1][@type='BNS']/@value"/>
                            </xsl:if>
                            <xsl:if test="following-sibling::hl7:part[1][string-length(@value) > 0 or @code]">
                                <br/>
                            </xsl:if>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr1 -->
                    <xsl:when test="self::hl7:postBox">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="'Postbox'"/>
                            <xsl:with-param name="post" select="' '"/>
                        </xsl:call-template>
                        <xsl:value-of select="."/>
                        <xsl:if test="following-sibling::hl7:*[1][string-length(.) > 0 or @code]">
                            <br/>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr2 -->
                    <xsl:when test="self::hl7:part[@type='POB']">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="'Postbox'"/>
                            <xsl:with-param name="post" select="' '"/>
                        </xsl:call-template>
                        <xsl:value-of select="@value"/>
                        <xsl:if test="following-sibling::hl7:part[1][string-length(@value) > 0 or @code]">
                            <br/>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr1 ZIP CITY, STATE or CITY, STATE ZIP depending on addr part contents -->
                    <xsl:when test="self::hl7:city">
                        <xsl:if test="preceding-sibling::hl7:postalCode[1][string-length(.) > 0 or @code]">
                            <xsl:choose>
                                <xsl:when test="preceding-sibling::hl7:postalCode[1][string-length(.) > 0]">
                                    <xsl:value-of select="preceding-sibling::hl7:postalCode[1][string-length(.) > 0]"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="preceding-sibling::hl7:postalCode[1][@code]/@code"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="."/>
                        <xsl:if test="../hl7:state[string-length(.)>0]">
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="../hl7:state"/>
                        </xsl:if>
                        <xsl:if test="following-sibling::hl7:postalCode[1][string-length(.) > 0 or @code]">
                            <xsl:text> </xsl:text>
                            <xsl:choose>
                                <xsl:when test="following-sibling::hl7:postalCode[1][string-length(.) > 0]">
                                    <xsl:value-of select="following-sibling::hl7:postalCode[1][string-length(.) > 0]"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="following-sibling::hl7:postalCode[1][@code]/@code"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                        <xsl:if test="following-sibling::hl7:*[1][string-length(.) > 0 or @code]">
                            <br/>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr2 ZIP CITY, STATE or CITY, STATE ZIP depending on addr part contents -->
                    <xsl:when test="self::hl7:part[@type='CTY']">
                        <xsl:if test="preceding-sibling::hl7:part[@type='ZIP'][1][string-length(@value) > 0 or @code]">
                            <xsl:choose>
                                <xsl:when test="preceding-sibling::hl7:postalCode[1][string-length(@value) > 0]">
                                    <xsl:value-of select="preceding-sibling::hl7:postalCode[1][string-length(@value) > 0]/@value"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="preceding-sibling::hl7:postalCode[1][@code]/@code"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="@value"/>
                        <xsl:if test="../hl7:part[@type='STA'][string-length(@value)>0]">
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="../hl7:part[@type='STA']/@value"/>
                        </xsl:if>
                        <xsl:if test="following-sibling::hl7:part[@type='ZIP'][1][string-length(@value) > 0 or @code]">
                            <xsl:choose>
                                <xsl:when test="following-sibling::hl7:postalCode[1][string-length(@value) > 0]">
                                    <xsl:value-of select="following-sibling::hl7:postalCode[1][string-length(@value) > 0]/@value"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="following-sibling::hl7:postalCode[1][@code]/@code"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:if test="following-sibling::hl7:part[1][string-length(@value) > 0 or @code]">
                            <br/>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr1 -->
                    <xsl:when test="self::hl7:postalCode and ../hl7:city"/>
                    <!-- DTr2 -->
                    <xsl:when test="self::hl7:part[@type='ZIP'] and ../hl7:part[@type='CTY']"/>
                    <!-- DTr1 -->
                    <xsl:when test="self::hl7:state">
                        <xsl:if test="not(../hl7:city)">
                            <xsl:if test="(string-length(preceding-sibling::hl7:*[1]) > 0 or preceding-sibling::*/@code)">
                                <br/>
                            </xsl:if>
                            <xsl:value-of select="."/>
                            <xsl:if test="(string-length(following-sibling::hl7:*[1]) > 0 or following-sibling::*/@code)">
                                <br/>
                            </xsl:if>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr2 -->
                    <xsl:when test="self::hl7:part[@type='STA']">
                        <xsl:if test="not(../hl7:part[@type = 'CTY'])">
                            <xsl:if test="(string-length(preceding-sibling::hl7:*[1]/@value) > 0 or preceding-sibling::hl7:*/@code)">
                                <br/>
                            </xsl:if>
                            <xsl:value-of select="@value"/>
                            <xsl:if test="(string-length(following-sibling::hl7:*[1]/@value) > 0 or following-sibling::hl7:*/@code)">
                                <br/>
                            </xsl:if>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr1 -->
                    <xsl:when test="string-length(text()) > 0">
                        <xsl:value-of select="."/>
                        <xsl:if test="(string-length(following-sibling::hl7:*[1]) > 0 or following-sibling::hl7:*/@code)">
                            <br/>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr2 -->
                    <xsl:when test="string-length(@value) > 0">
                        <xsl:value-of select="@value"/>
                        <xsl:if test="(string-length(following-sibling::hl7:*[1]/@value) > 0 or following-sibling::hl7:*/@code)">
                            <br/>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise> </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <xsl:for-each select="$in/hl7:useablePeriod">
                <div>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'Period'"/>
                    </xsl:call-template>
                    <xsl:text> </xsl:text>
                    <xsl:call-template name="show-ivlts">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </div>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show elements with datatype QTY/PQ separated with the value in 'sep'. Calls <xd:ref name="show-quantity" type="template">show-quantity</xd:ref>
            </xd:p>
        </xd:desc>
        <xd:param name="in">Set of 0 to * elements</xd:param>
        <xd:param name="sep">Separator between output of different elements. Default ', ' and special is 'br' which generates an HTML br tag</xd:param>
    </xd:doc>
    <xsl:template name="show-quantity-set">
        <xsl:param name="in"/>
        <xsl:param name="sep" select="', '"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 -->
                <xsl:when test="count($in) &gt; 1">
                    <xsl:for-each select="$in">
                        <xsl:call-template name="show-quantity">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[hl7:item]">
                    <xsl:for-each select="$in/hl7:item">
                        <xsl:call-template name="show-quantity">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:otherwise>
                    <xsl:call-template name="show-quantity">
                        <xsl:with-param name="in" select="$in"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show element with datatype QTY/PQ</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
    </xd:doc>
    <xsl:template name="show-quantity">
        <xsl:param name="in"/>
        <xsl:if test="$in">
            <xsl:choose>
                <xsl:when test="$in[@value]">
                    <xsl:value-of select="$in/@value"/>
                    <xsl:text> </xsl:text>
                    <xsl:choose>
                        <xsl:when test="$in[not(@unit) or @unit = '1'][@value = 1]">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'Unit'"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$in[not(@unit) or @unit = '1'][@value > 1]">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'Units'"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$in/@unit"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
            <xsl:if test="$in[@value | @unit]">
                <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:if test="$in[@nullFlavor]">
                <xsl:text>(</xsl:text>
                <xsl:call-template name="show-nullFlavor">
                    <xsl:with-param name="in" select="$in/@nullFlavor"/>
                </xsl:call-template>
                <xsl:text>)</xsl:text>
            </xsl:if>
            <xsl:for-each select="$in/*[local-name() = 'translation']">
                <div style="margin-left: 2em;">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="local-name()"/>
                        <xsl:with-param name="post" select="' '"/>
                    </xsl:call-template>
                    <xsl:call-template name="show-code-set">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </div>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>Show element with datatype IVL_TS</xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
    </xd:doc>
    <xsl:template name="show-ivlts">
        <xsl:param name="in"/>
        <xsl:if test="$in">
            <xsl:variable name="fromDate">
                <xsl:call-template name="show-timestamp">
                    <xsl:with-param name="in" select="$in/hl7:low"/>
                    <xsl:with-param name="part" select="'date'"/>
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="toDate">
                <xsl:call-template name="show-timestamp">
                    <xsl:with-param name="in" select="$in/hl7:high"/>
                    <xsl:with-param name="part" select="'date'"/>
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="fromTime">
                <xsl:call-template name="show-timestamp">
                    <xsl:with-param name="in" select="$in/hl7:low"/>
                    <xsl:with-param name="part" select="'time'"/>
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="toTime">
                <xsl:call-template name="show-timestamp">
                    <xsl:with-param name="in" select="$in/hl7:high"/>
                    <xsl:with-param name="part" select="'time'"/>
                </xsl:call-template>
            </xsl:variable>
            
            <xsl:choose>
                <xsl:when test="$in/@value">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'at'"/>
                        <xsl:with-param name="post" select="'&#160;'"/>
                    </xsl:call-template>
                    <xsl:call-template name="show-timestamp">
                        <xsl:with-param name="in" select="$in"/>
                    </xsl:call-template>
                </xsl:when>
                <!-- Same day, different times -->
                <xsl:when test="$fromDate = $toDate">
                    <xsl:call-template name="show-timestamp">
                        <xsl:with-param name="in" select="$in/hl7:low"/>
                        <xsl:with-param name="part" select="'date'"/>
                    </xsl:call-template>
                    
                    <xsl:if test="string-length(normalize-space($fromTime)) > 0">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="normalize-space($fromTime)"/>
                        
                        <xsl:if test="string-length(normalize-space($toTime)) > 0">
                            <xsl:text> - </xsl:text>
                            <xsl:value-of select="normalize-space($toTime)"/>
                        </xsl:if>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="$in/hl7:low">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'from'"/>
                        <xsl:with-param name="post" select="'&#160;'"/>
                    </xsl:call-template>
                    <xsl:call-template name="show-timestamp">
                        <xsl:with-param name="in" select="$in/hl7:low"/>
                    </xsl:call-template>
                    <xsl:if test="$in/hl7:high">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="pre" select="' '"/>
                            <xsl:with-param name="key" select="'to'"/>
                            <xsl:with-param name="post" select="'&#160;'"/>
                        </xsl:call-template>
                        <xsl:call-template name="show-timestamp">
                            <xsl:with-param name="in" select="$in/hl7:high"/>
                        </xsl:call-template>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="$in/hl7:high">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'to'"/>
                        <xsl:with-param name="post" select="'&#160;'"/>
                    </xsl:call-template>
                    <xsl:call-template name="show-timestamp">
                        <xsl:with-param name="in" select="$in/hl7:high"/>
                    </xsl:call-template>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Show elements with datatype TEL or URI separated with the value in 'sep'. Calls <xd:ref name="show-telecom" type="template">show-telecom</xd:ref></xd:p>
        </xd:desc>
        <xd:param name="in">Set of 0 to * elements</xd:param>
        <xd:param name="sep">Separator between output of different elements. Default ', ' and special is 'br' which generates an HTML br tag</xd:param>
    </xd:doc>
    <xsl:template name="show-telecom-set">
        <xsl:param name="in"/>
        <xsl:param name="sep" select="', '"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 -->
                <xsl:when test="count($in) > 1">
                    <xsl:for-each select="$in">
                        <xsl:call-template name="show-telecom">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[hl7:item]">
                    <xsl:for-each select="$in/hl7:item">
                        <xsl:call-template name="show-telecom">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:otherwise>
                    <xsl:call-template name="show-telecom">
                        <xsl:with-param name="in" select="$in"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show element with datatype TEL or URI</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
    </xd:doc>
    <xsl:template name="show-telecom">
        <xsl:param name="in"/>
        <xsl:choose>
            <xsl:when test="$in">
                <xsl:for-each select="$in">
                    <xsl:if test="position() > 1">
                        <br/>
                    </xsl:if>
                    
                    <xsl:variable name="type" select="substring-before(@value, ':')"/>
                    <xsl:variable name="value" select="substring-after(@value, ':')"/>
                    <xsl:if test="$type">
                        <xsl:call-template name="translateTelecomUriScheme">
                            <xsl:with-param name="code" select="$type"/>
                        </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="@use">
                        <xsl:text> </xsl:text>
                        <xsl:call-template name="tokenize">
                            <xsl:with-param name="prefix" select="'addressUse_'"/>
                            <xsl:with-param name="string" select="@use"/>
                            <xsl:with-param name="delimiters" select="' '"/>
                        </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="$type or @use">
                        <xsl:text>: </xsl:text>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="$type">
                            <xsl:value-of select="$value"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="@value"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'telecom information not available'"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show element with datatype TS</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
        <xd:param name="part">value to tell if we want the full thing 'datetime', date only 'date', or time only 'time'</xd:param>
    </xd:doc>
    <xsl:template name="show-timestamp">
        <xsl:param name="in"/>
        <xsl:param name="part" select="'datetime'"/>
        
        <xsl:call-template name="formatDateTime">
            <xsl:with-param name="date" select="$in/@value"/>
            <xsl:with-param name="part" select="$part"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show elements with datatype ST separated with the value in 'sep'. Calls <xd:ref name="show-text" type="template">show-text</xd:ref></xd:p>
        </xd:desc>
        <xd:param name="in">Set of 0 to * elements</xd:param>
        <xd:param name="sep">Separator between output of different elements. Default ', ' and special is 'br' which generates an HTML br tag</xd:param>
    </xd:doc>
    <xsl:template name="show-text-set">
        <xsl:param name="in"/>
        <xsl:param name="sep" select="', '"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 -->
                <xsl:when test="count($in) > 1">
                    <xsl:for-each select="$in">
                        <xsl:call-template name="show-text">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[hl7:item]">
                    <xsl:for-each select="$in/hl7:item">
                        <xsl:call-template name="show-text">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:otherwise>
                    <xsl:call-template name="show-text">
                        <xsl:with-param name="in" select="$in"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show element with datatype ST</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
    </xd:doc>
    <xsl:template name="show-text">
        <xsl:param name="in"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 and DTr2 -->
                <xsl:when test="$in[@nullFlavor]">
                    <xsl:call-template name="show-nullFlavor">
                        <xsl:with-param name="in" select="$in/@nullFlavor"/>
                    </xsl:call-template>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[@value]">
                    <xsl:copy-of select="translate($in/@value, '&#13;&#10;', '&lt;br/&gt;')"/>
                </xsl:when>
                <!-- DTr1 -->
                <xsl:otherwise>
                    <xsl:copy-of select="translate($in/text(), '&#13;&#10;', '&lt;br/&gt;')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Show element with datatype BL/BN</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
    </xd:doc>
    <xsl:template name="show-boolean">
        <xsl:param name="in"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 and DTr2 -->
                <xsl:when test="$in[@value]">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="concat('boolean-', $in/@value)"/>
                    </xsl:call-template>
                </xsl:when>
                <!-- DTr1 and DTr2 -->
                <xsl:when test="$in[@nullFlavor]">
                    <xsl:call-template name="show-nullFlavor">
                        <xsl:with-param name="in" select="$in/@nullFlavor"/>
                    </xsl:call-template>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Show a nullFlavor as text</xd:p>
        </xd:desc>
        <xd:param name="in">The nullFlavor code, e.g. NI, OTH</xd:param>
    </xd:doc>
    <xsl:template name="show-nullFlavor">
        <xsl:param name="in"/>
        <xsl:if test="string-length($in) > 0">
            <xsl:call-template name="getLocalizedString">
                <xsl:with-param name="key" select="concat('nullFlavor_', $in)"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>SDTC defines sdtc:signatureText including a digital signature. XSLT lacks tools to verify validity, but may signal its presence</xd:desc>
        <xd:param name="in">sdtc:signatureText element</xd:param>
    </xd:doc>
    <xsl:template name="show-signatureText">
        <xsl:param name="in"/>
        <xsl:for-each select="$in[local-name() = 'signatureText'][string-length(.) > 0]">
            <xsl:text> </xsl:text>
            <img>
                <xsl:attribute name="src">
                    <xsl:text>data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAQCAYAAAAWGF8bAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAACXBIWXMAAAsTAAALEwEAmpwYAAACC2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS40LjAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyI+CiAgICAgICAgIDx0aWZmOlJlc29sdXRpb25Vbml0PjI8L3RpZmY6UmVzb2x1dGlvblVuaXQ+CiAgICAgICAgIDx0aWZmOkNvbXByZXNzaW9uPjE8L3RpZmY6Q29tcHJlc3Npb24+CiAgICAgICAgIDx0aWZmOk9yaWVudGF0aW9uPjE8L3RpZmY6T3JpZW50YXRpb24+CiAgICAgICAgIDx0aWZmOlBob3RvbWV0cmljSW50ZXJwcmV0YXRpb24+MjwvdGlmZjpQaG90b21ldHJpY0ludGVycHJldGF0aW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KD0UqkwAAApdJREFUOBGVVL9LslEUfszbD12yBmmRICmkbAiC0v9AQadAQdAaoiFoam5qaYmWCAKFGtqiRQQHpyJ1avMHBkFIQRItYj/Mbu9zPm7IR8P3Hbjvfb3nnOc+5zzn1Vav1/XR0RHe398xMDAArTX+x2w2m+QopbCxsQF1cnKCg4MDeDwePD8/CxaDaCb473dx9j3GxsbQbDYxPDwM9fn5KS7uQ0ND8m4ATY5hbS4wfp5zfX19YXR0VAgolknzer2YnJxEr9eTIJNkQH/bCcZS7+/vcXl5KSHKJIZCIaysrODj40N6SS9vNqzMxf3A9DscDlxcXAggYxQPadlsFtVqFU9PTxgZGRFgl8sFu90urF9fX38EMySYOzg4iLu7O8Fgdcr0p1aroVgs4vj4GNPT07i9vcX6+roE+nw+7O/vS9MZ3w/IywuFAm5ubqQyJRnW4+XlBVdXVxgfH8f19TWCwSBKpRKWl5eFcavVEkCKZ6oiOIVkrjHFkmgcHbfbjZmZGeNDpVLB4eEhNjc3kUql5Jy9np+fl5bwgCWzOpqIZOhzDqkWLRwOI5fLodFoYGpqSs7ImMxjsRgCgQDe3t4EwIiSz+f/lGzoU/atrS0kk0mcnp4iHo9jdnYW6XRaAAnOalZXV+V3/4Pi0Yhl297e1mdnZ3h4eBDp/X6/lEohKMzS0hIWFhbw+PgogJw7LiMmK+S4tNttJBIJKE44wWgcDZZ1fn6OSCQCczMV/BdzOp1Qa2tr4LdIFScmJlAul5HJZLC4uCjjs7OzI8CcsX4jMzNCLJXjE41GQbU0l9VkbSXpvb09bTVd7+7uamtEtMVa/Na/kf5tMZfn3W5Xlq3T6VgXaekDd44Kv2uKMDc39zPE/ex+ezdsvwFm7oHDCGA3ogAAAABJRU5ErkJggg==</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="alt"/>
                <xsl:attribute name="title">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'Signature present but not verified'"/>
                    </xsl:call-template>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="*[local-name() = 'thumbnail']"/>
                </xsl:attribute>
            </img>
        </xsl:for-each>
    </xsl:template>
    
    <!-- ====================================================================== -->
    <!--                           Supporting functions                         -->
    <!-- ====================================================================== -->

    <xd:doc>
        <xd:desc>
            <xd:p>Takes the 5th and 6th character from a timestamp, and returns the localized month name</xd:p>
        </xd:desc>
        <xd:param name="date">Timestamp string</xd:param>
    </xd:doc>
    <xsl:template name="formatMonth">
        <xsl:param name="date"/>
        <!-- month -->
        <xsl:variable name="month" select="substring($date, 5, 2)"/>
        <xsl:choose>
            <xsl:when test="$month = '01'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'January'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '02'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'February'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '03'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'March'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '04'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'April'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '05'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'May'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '06'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'June'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '07'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'July'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '08'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'August'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '09'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'September'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '10'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'October'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '11'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'November'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '12'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'December'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$month"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Formats a timestamp</xd:p>
        </xd:desc>
        <xd:param name="date"/>
        <xd:param name="part">value to tell if we want the full thing 'datetime', date only 'date', or time only 'time'</xd:param>
    </xd:doc>
    <xsl:template name="formatDateTime">
        <xsl:param name="date"/>
        <xsl:param name="part" select="'datetime'"/>
        
        <xsl:variable name="yearNum" select="substring ($date, 1, 4)"/>
        <xsl:variable name="monthNum" select="substring ($date, 5, 2)"/>
        <xsl:variable name="monthText">
            <xsl:call-template name="formatMonth">
                <xsl:with-param name="date" select="$date"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="dayNum">
            <xsl:choose>
                <xsl:when test="substring($date, 7, 1) = '0'">
                    <xsl:value-of select="substring($date, 8, 1)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="substring($date, 7, 2)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:if test="not($part = 'time')">
            <xsl:choose>
                <xsl:when test="$textLangPartLowerCase = 'nl'">
                    <xsl:value-of select="$dayNum"/>
                    <xsl:text> </xsl:text>
                    <xsl:call-template name="caseDown">
                        <xsl:with-param name="data" select="$monthText"/>
                    </xsl:call-template>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="$yearNum"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="firstCharCaseUp">
                        <xsl:with-param name="data" select="$monthText"/>
                    </xsl:call-template>
                    <xsl:if test="string-length($dayNum) > 0">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$dayNum"/>
                    </xsl:if>
                    <xsl:if test="string-length($yearNum) > 0">
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="$yearNum"/>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>

        <!-- time and US timezone -->
        <xsl:if test="string-length($date) > 8 and not($part = 'date')">
            <xsl:if test="not($part = 'time')">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <!-- time -->
            <xsl:variable name="time">
                <xsl:value-of select="substring($date, 9, 6)"/>
            </xsl:variable>
            <xsl:variable name="hh">
                <xsl:value-of select="substring($time, 1, 2)"/>
            </xsl:variable>
            <xsl:variable name="mm">
                <xsl:value-of select="substring($time, 3, 2)"/>
            </xsl:variable>
            <xsl:variable name="ss">
                <xsl:value-of select="substring($time, 5, 2)"/>
            </xsl:variable>
            <xsl:if test="string-length($hh) > 1">
                <xsl:choose>
                    <xsl:when test="$textLangPartLowerCase = 'en' and number($hh) > 12">
                        <xsl:value-of select="number($hh) - 12"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$hh"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="string-length($mm) > 1 and not(contains($mm, '-')) and not(contains($mm, '+')) and not($mm = '00' and $ss = '00')">
                        <xsl:text>:</xsl:text>
                        <xsl:value-of select="$mm"/>
                        <xsl:if test="string-length($ss) > 1 and not(contains($ss, '-')) and not(contains($ss, '+')) and not($ss = '00')">
                            <xsl:text>:</xsl:text>
                            <xsl:value-of select="$ss"/>
                        </xsl:if>
                    </xsl:when>
                    <xsl:when test="$textLangPartLowerCase = 'nl'">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="'h'"/>
                        </xsl:call-template>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="$textLangPartLowerCase = 'en'">
                    <xsl:choose>
                        <xsl:when test="number($hh) > 12">
                            <xsl:text>PM</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>AM</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:if>
            <!-- time zone. Don't try getting a name for it as that will always fail parts of the year due to daylight savings -->
            <xsl:choose>
                <xsl:when test="contains($date, '+')">
                    <xsl:text> +</xsl:text>
                    <xsl:value-of select="substring-after($date, '+')"/>
                </xsl:when>
                <xsl:when test="contains($date, '-')">
                    <xsl:text> -</xsl:text>
                    <xsl:value-of select="substring-after($date, '-')"/>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Get someones age based on the difference between 'date' and <xd:ref name="currentDate" type="parameter">currentDate</xd:ref>.</xd:p>
        </xd:desc>
        <xd:param name="date">Persons date of birth as HL7 TS</xd:param>
        <xd:param name="comparedate">The date, format yyyymmdd as HL7 TS, that the age should be calculated relative to</xd:param>
    </xd:doc>
    <xsl:template name="getAge">
        <xsl:param name="comparedate"/>
        <xsl:param name="date"/>
        <xsl:variable name="yearNum" select="substring($date, 1, 4)"/>
        <xsl:variable name="monthNum" select="substring($date, 5, 2)"/>
        <xsl:variable name="dayNum">
            <xsl:choose>
                <xsl:when test="substring ($date, 7, 1)=&quot;0&quot;">
                    <xsl:value-of select="substring($date, 8, 1)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="substring($date, 7, 2)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="yearNumCreate" select="substring($comparedate, 1, 4)"/>
        <xsl:variable name="monthNumCreate" select="substring($comparedate, 5, 2)"/>
        <xsl:variable name="dayNumCreate">
            <xsl:choose>
                <xsl:when test="substring ($comparedate, 7, 1)=&quot;0&quot;">
                    <xsl:value-of select="substring($comparedate, 8, 1)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="substring($comparedate, 7, 2)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="yearDiff" select="number($yearNumCreate) - number($yearNum)"/>
        <xsl:choose>
            <xsl:when test="number($monthNum) &lt; number($monthNumCreate)">
                <xsl:value-of select="$yearDiff"/>
            </xsl:when>
            <xsl:when test="number($monthNum) &gt; number($monthNumCreate)">
                <xsl:value-of select="$yearDiff - 1"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="number($dayNum) &lt;= number($dayNumCreate)">
                        <xsl:value-of select="$yearDiff"/>
                    </xsl:when>
                    <xsl:when test="number($dayNum) &gt; number($dayNumCreate)">
                        <xsl:value-of select="$yearDiff - 1"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Convert Telecom URI scheme (tel, fax, http, mailto) to display text</xd:p>
        </xd:desc>
        <xd:param name="code">Scheme string</xd:param>
    </xd:doc>
    <xsl:template name="translateTelecomUriScheme">
        <xsl:param name="code"/>
        <!--xsl:value-of select="document('voc.xml')/systems/system[@root=$code/@codeSystem]/code[@value=$code/@code]/@displayName"/-->
        <!--xsl:value-of select="document('codes.xml')/*/code[@code=$code]/@display"/-->
        <xsl:choose>
            <!-- lookup table Telecom URI -->
            <xsl:when test="$code = 'tel'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'Tel'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$code = 'fax'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'Fax'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$code = 'http' or $code = 'https'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'Web'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$code = 'mailto'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'Mail'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>{$code='</xsl:text>
                <xsl:value-of select="$code"/>
                <xsl:text>'?}</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Converts Latin characters in input to lower case and returns the result</xd:p>
        </xd:desc>
        <xd:param name="data">Input string</xd:param>
    </xd:doc>
    <xsl:template name="caseDown">
        <xsl:param name="data"/>
        <xsl:if test="$data">
            <xsl:value-of select="translate($data, $uc, $lc)"/>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Converts Latin characters in input to upper case and returns the result</xd:p>
        </xd:desc>
        <xd:param name="data">Input string</xd:param>
    </xd:doc>
    <xsl:template name="caseUp">
        <xsl:param name="data"/>
        <xsl:if test="$data">
            <xsl:value-of select="translate($data,$lc, $uc)"/>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Converts first character in input to upper case if it is a Latin character and returns the result</xd:p>
        </xd:desc>
        <xd:param name="data">Input string</xd:param>
    </xd:doc>
    <xsl:template name="firstCharCaseUp">
        <xsl:param name="data"/>
        <xsl:if test="$data">
            <xsl:call-template name="caseUp">
                <xsl:with-param name="data" select="substring($data, 1, 1)"/>
            </xsl:call-template>
            <xsl:value-of select="substring($data, 2)"/>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Tokenize based on delimiters, or if no delimiter do character tokenization</xd:p>
        </xd:desc>
        <xd:param name="string">String to tokenize</xd:param>
        <xd:param name="delimiters">Optional delimiter string</xd:param>
        <xd:param name="prefix">Optional prefix for every 'array' item</xd:param>
        <xd:param name="localize">Optional parameter to determine if we should just tokenize or also try to localize array items (default)</xd:param>
    </xd:doc>
    <xsl:template name="tokenize">
        <xsl:param name="string" select="''"/>
        <xsl:param name="delimiters" select="' '"/>
        <xsl:param name="prefix"/>
        <xsl:param name="localize" select="true()"/>
        <xsl:choose>
            <xsl:when test="not($string)"/>
            <xsl:when test="not($delimiters)">
                <xsl:call-template name="_tokenize-characters">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="prefix" select="$prefix"/>
                    <xsl:with-param name="localize" select="$localize"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="_tokenize-delimiters">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="delimiters" select="$delimiters"/>
                    <xsl:with-param name="prefix" select="$prefix"/>
                    <xsl:with-param name="localize" select="$localize"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Tokenize every character</xd:p>
        </xd:desc>
        <xd:param name="string">String to tokenize</xd:param>
        <xd:param name="prefix">Optional prefix for every 'array' item</xd:param>
        <xd:param name="localize">Optional parameter to determine if we should just tokenize or also try to localize array items (default)</xd:param>
    </xd:doc>
    <xsl:template name="_tokenize-characters">
        <xsl:param name="string"/>
        <xsl:param name="prefix"/>
        <xsl:param name="localize" select="true()"/>
        <xsl:if test="$string">
            <xsl:choose>
                <xsl:when test="$localize">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="concat($prefix,substring($string, 1, 1))"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="substring($string, 1, 1)"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:call-template name="_tokenize-characters">
                <xsl:with-param name="string" select="substring($string, 2)"/>
                <xsl:with-param name="prefix" select="$prefix"/>
                <xsl:with-param name="localize" select="$localize"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Tokenize based on delimiters</xd:p>
        </xd:desc>
        <xd:param name="string">String to tokenize</xd:param>
        <xd:param name="delimiters">Required delimiter string</xd:param>
        <xd:param name="prefix">Optional prefix for every 'array' item</xd:param>
        <xd:param name="localize">Optional parameter to determine if we should just tokenize or also try to localize array items (default)</xd:param>
    </xd:doc>
    <xsl:template name="_tokenize-delimiters">
        <xsl:param name="string"/>
        <xsl:param name="delimiters"/>
        <xsl:param name="prefix"/>
        <xsl:param name="localize" select="true()"/>
        
        <xsl:variable name="delimiter" select="substring($delimiters, 1, 1)"/>
        <xsl:choose>
            <xsl:when test="not($delimiter)">
                <xsl:choose>
                    <xsl:when test="$localize">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="concat($prefix, $string)"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$string"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="contains($string, $delimiter)">
                <xsl:if test="not(starts-with($string, $delimiter))">
                    <xsl:call-template name="_tokenize-delimiters">
                        <xsl:with-param name="string" select="substring-before($string, $delimiter)"/>
                        <xsl:with-param name="delimiters" select="substring($delimiters, 2)"/>
                        <xsl:with-param name="prefix" select="$prefix"/>
                        <xsl:with-param name="localize" select="$localize"/>
                    </xsl:call-template>
                </xsl:if>
                <xsl:text> </xsl:text>
                <xsl:call-template name="_tokenize-delimiters">
                    <xsl:with-param name="string" select="substring-after($string, $delimiter)"/>
                    <xsl:with-param name="delimiters" select="$delimiters"/>
                    <xsl:with-param name="prefix" select="$prefix"/>
                    <xsl:with-param name="localize" select="$localize"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="_tokenize-delimiters">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="delimiters" select="substring($delimiters, 2)"/>
                    <xsl:with-param name="prefix" select="$prefix"/>
                    <xsl:with-param name="localize" select="$localize"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Index the translation file for performance</xd:desc>
    </xd:doc>
    <xsl:key name="util-i18nkey" match="translation" use="@key"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Retrieves a language dependant string from our <xd:ref name="vocFile" type="parameter">language file</xd:ref> such as a label based on a key. Returns string based on <xd:ref name="textLang" type="parameter">textLang</xd:ref>, <xd:ref name="textLangDefault" type="parameter">textLangDefault</xd:ref>, the first two characters of the textLangDefault, e.g. 'en' in 'en-US' and finally if all else fails just the key text.</xd:p>
        </xd:desc>
        <xd:param name="pre">Some text or space to prefix our string with</xd:param>
        <xd:param name="key">The key to find our text with</xd:param>
        <xd:param name="post">Some text like a colon or space to postfix our text with</xd:param>
    </xd:doc>
    <xsl:template name="getLocalizedString">
        <xsl:param name="pre" select="''"/>
        <xsl:param name="key"/>
        <xsl:param name="post" select="''"/>
        
        <xsl:for-each select="$vocMessages">
            <xsl:variable name="translation" select="key('util-i18nkey', $key)"/>
            <xsl:choose>
                <!-- compare 'de-CH' -->
                <xsl:when test="$key = 'Display Disclaimer'">
    <xsl:value-of select="'Disclaimer: the purpose of this stylesheet and the results it produces from xml messages is exclusively for testing. They are explicitly NOT suited for use in a medical practise.'"/>
</xsl:when>
<xsl:when test="$key = 'Table of Contents'">
    <xsl:value-of select="'Table of Contents'"/>
</xsl:when>
<xsl:when test="$key = 'Signed'">
    <xsl:value-of select="'Signed'"/>
</xsl:when>
<xsl:when test="$key = 'Signature present but not verified'">
    <xsl:value-of select="'Signature is present. Validity has not been checked.'"/>
</xsl:when>
<xsl:when test="$key = 'show revisions'">
    <xsl:value-of select="'Show Revisions'"/>
</xsl:when>
<xsl:when test="$key = 'hide revisions'">
    <xsl:value-of select="'Hide Revisions'"/>
</xsl:when>
<xsl:when test="$key = 'ClinicalDocument'">
    <xsl:value-of select="'ClinicalDocument'"/>
</xsl:when>
<xsl:when test="$key = 'authenticator'">
    <xsl:value-of select="'Authenticator'"/>
</xsl:when>
<xsl:when test="$key = 'legalAuthenticator'">
    <xsl:value-of select="'Legal Authenticator'"/>
</xsl:when>
<xsl:when test="$key = 'informationRecipient'">
    <xsl:value-of select="'Information Recipient'"/>
</xsl:when>
<xsl:when test="$key = 'author'">
    <xsl:value-of select="'Author'"/>
</xsl:when>
<xsl:when test="$key = 'custodian'">
    <xsl:value-of select="'Custodian'"/>
</xsl:when>
<xsl:when test="$key = 'dataEnterer'">
    <xsl:value-of select="'Data Enterer'"/>
</xsl:when>
<xsl:when test="$key = 'overseer'">
    <xsl:value-of select="'Overseer'"/>
</xsl:when>
<xsl:when test="$key = 'recordTarget'">
    <xsl:value-of select="'Patient'"/>
</xsl:when>
<xsl:when test="$key = 'informant'">
    <xsl:value-of select="'Informant'"/>
</xsl:when>
<xsl:when test="$key = 'Participant'">
    <xsl:value-of select="'Participant'"/>
</xsl:when>
<xsl:when test="$key = 'Custodian_Organization'">
    <xsl:value-of select="'Custodian Organization'"/>
</xsl:when>
<xsl:when test="$key = 'performer'">
    <xsl:value-of select="'Performer'"/>
</xsl:when>
<xsl:when test="$key = 'responsibleParty'">
    <xsl:value-of select="'Responsible Party'"/>
</xsl:when>
<xsl:when test="$key = 'encounterParticipant'">
    <xsl:value-of select="'Encounter Participant'"/>
</xsl:when>
<xsl:when test="$key = 'location'">
    <xsl:value-of select="'Location'"/>
</xsl:when>
<xsl:when test="$key = 'subject'">
    <xsl:value-of select="'Subject'"/>
</xsl:when>
<xsl:when test="$key = 'organizationPartOf'">
    <xsl:value-of select="'Organization Part Of'"/>
</xsl:when>
<xsl:when test="$key = 'organization'">
    <xsl:value-of select="'Organization'"/>
</xsl:when>
<xsl:when test="$key = 'person'">
    <xsl:value-of select="'Person'"/>
</xsl:when>
<xsl:when test="$key = 'authoringDevice'">
    <xsl:value-of select="'Device'"/>
</xsl:when>
<xsl:when test="$key = 'place'">
    <xsl:value-of select="'Place'"/>
</xsl:when>
<xsl:when test="$key = 'healthCareFacility'">
    <xsl:value-of select="'Health Care Facility'"/>
</xsl:when>
<xsl:when test="$key = 'patientIdShort'">
    <xsl:value-of select="'MRN'"/>
</xsl:when>
<xsl:when test="$key = 'patientIdLong'">
    <xsl:value-of select="'Patient-ID'"/>
</xsl:when>
<xsl:when test="$key = 'patientIdsLong'">
    <xsl:value-of select="'Patient-IDs'"/>
</xsl:when>
<xsl:when test="$key = 'birthPlace'">
    <xsl:value-of select="'Birthplace'"/>
</xsl:when>
<xsl:when test="$key = 'birthTimeLong'">
    <xsl:value-of select="'Date of Birth'"/>
</xsl:when>
<xsl:when test="$key = 'birthTimeLongDeceased'">
    <xsl:value-of select="'Birthdate/Deceased'"/>
</xsl:when>
<xsl:when test="$key = 'Deceased'">
    <xsl:value-of select="'Deceased'"/>
</xsl:when>
<xsl:when test="$key = 'date_unknown'">
    <xsl:value-of select="'date unknown'"/>
</xsl:when>
<xsl:when test="$key = 'boolean-true'">
    <xsl:value-of select="'yes'"/>
</xsl:when>
<xsl:when test="$key = 'boolean-false'">
    <xsl:value-of select="'no'"/>
</xsl:when>
<xsl:when test="$key = 'yr'">
    <xsl:value-of select="'yr'"/>
</xsl:when>
<xsl:when test="$key = 'At the time of death'">
    <xsl:value-of select="'At the time of death'"/>
</xsl:when>
<xsl:when test="$key = 'At document creation time'">
    <xsl:value-of select="'At document creation time'"/>
</xsl:when>
<xsl:when test="$key = 'birthTimeShort'">
    <xsl:value-of select="'DOB'"/>
</xsl:when>
<xsl:when test="$key = 'partOfMultipleBirth'">
    <xsl:value-of select="'Multiple Birth'"/>
</xsl:when>
<xsl:when test="$key = 'administrativeGenderCode'">
    <xsl:value-of select="'Gender'"/>
</xsl:when>
<xsl:when test="$key = 'maritalStatusCode'">
    <xsl:value-of select="'Marital Status'"/>
</xsl:when>
<xsl:when test="$key = 'languageCommunication'">
    <xsl:value-of select="'Language Communication'"/>
</xsl:when>
<xsl:when test="$key = 'preferredLanguage'">
    <xsl:value-of select="'preferred'"/>
</xsl:when>
<xsl:when test="$key = 'Ethnicity'">
    <xsl:value-of select="'Ethnicity'"/>
</xsl:when>
<xsl:when test="$key = 'proficiencyLevelCode'">
    <xsl:value-of select="'Proficiency Level Code'"/>
</xsl:when>
<xsl:when test="$key = 'Guardian'">
    <xsl:value-of select="'Guardian'"/>
</xsl:when>
<xsl:when test="$key = 'providerOrganization'">
    <xsl:value-of select="'Provider Organization'"/>
</xsl:when>
<xsl:when test="$key = 'relatedDocument'">
    <xsl:value-of select="'Related Document'"/>
</xsl:when>
<xsl:when test="$key = 'relatingDocument'">
    <xsl:value-of select="'This document relates to document'"/>
</xsl:when>
<xsl:when test="$key = 'relatingDocumentInverted'">
    <xsl:value-of select="'Document relating to this document'"/>
</xsl:when>
<xsl:when test="$key = 'parentDocument'">
    <xsl:value-of select="'Parent Document'"/>
</xsl:when>
<xsl:when test="$key = 'Document'">
    <xsl:value-of select="'Document'"/>
</xsl:when>
<xsl:when test="$key = 'Document Type'">
    <xsl:value-of select="'Document Type'"/>
</xsl:when>
<xsl:when test="$key = 'Document Version'">
    <xsl:value-of select="'Document Version'"/>
</xsl:when>
<xsl:when test="$key = 'Document Version and Set ID'">
    <xsl:value-of select="'Document Version and Set ID'"/>
</xsl:when>
<xsl:when test="$key = 'documentationOf'">
    <xsl:value-of select="'Documentation&#160;Of'"/>
</xsl:when>
<xsl:when test="$key = 'serviceEvent'">
    <xsl:value-of select="'Service Event'"/>
</xsl:when>
<xsl:when test="$key = 'inFulfillmentOf'">
    <xsl:value-of select="'In Fulfillment Of'"/>
</xsl:when>
<xsl:when test="$key = 'order'">
    <xsl:value-of select="'Order'"/>
</xsl:when>
<xsl:when test="$key = 'authorization'">
    <xsl:value-of select="'Authorization'"/>
</xsl:when>
<xsl:when test="$key = 'consent'">
    <xsl:value-of select="'Consent'"/>
</xsl:when>
<xsl:when test="$key = 'componentOf'">
    <xsl:value-of select="'Component Of'"/>
</xsl:when>
<xsl:when test="$key = 'encompassingEncounter'">
    <xsl:value-of select="'Encounter'"/>
</xsl:when>
<xsl:when test="$key = 'Encounter Id'">
    <xsl:value-of select="'Encounter Id'"/>
</xsl:when>
<xsl:when test="$key = 'Encounter Type'">
    <xsl:value-of select="'Encounter Type'"/>
</xsl:when>
<xsl:when test="$key = 'Encounter Date'">
    <xsl:value-of select="'Encounter Date'"/>
</xsl:when>
<xsl:when test="$key = 'Encounter Location'">
    <xsl:value-of select="'Encounter Location'"/>
</xsl:when>
<xsl:when test="$key = 'Encounter Admission Referral Source'">
    <xsl:value-of select="'Admission Referral Source'"/>
</xsl:when>
<xsl:when test="$key = 'Encounter Discharge Disposition'">
    <xsl:value-of select="'Discharge Disposition'"/>
</xsl:when>
<xsl:when test="$key = 'Document Id'">
    <xsl:value-of select="'Document Id'"/>
</xsl:when>
<xsl:when test="$key = 'SetId and Version'">
    <xsl:value-of select="'SetId and Version'"/>
</xsl:when>
<xsl:when test="$key = 'id'">
    <xsl:value-of select="'ID'"/>
</xsl:when>
<xsl:when test="$key = 'setId'">
    <xsl:value-of select="'Set‑ID'"/>
</xsl:when>
<xsl:when test="$key = 'versionNumber'">
    <xsl:value-of select="'Version'"/>
</xsl:when>
<xsl:when test="$key = 'code'">
    <xsl:value-of select="'Code'"/>
</xsl:when>
<xsl:when test="$key = 'type'">
    <xsl:value-of select="'Type'"/>
</xsl:when>
<xsl:when test="$key = 'title'">
    <xsl:value-of select="'Title'"/>
</xsl:when>
<xsl:when test="$key = 'effectiveTime'">
    <xsl:value-of select="'Date/Time'"/>
</xsl:when>
<xsl:when test="$key = 'versionCode'">
    <xsl:value-of select="'Version Code'"/>
</xsl:when>
<xsl:when test="$key = 'acknowledgement'">
    <xsl:value-of select="'Acknowledgement'"/>
</xsl:when>
<xsl:when test="$key = 'acknowledgementDetail'">
    <xsl:value-of select="'Acknowledgement Detail'"/>
</xsl:when>
<xsl:when test="$key = 'attentionLine'">
    <xsl:value-of select="'Attention Line'"/>
</xsl:when>
<xsl:when test="$key = 'keyWordText'">
    <xsl:value-of select="'Key Word'"/>
</xsl:when>
<xsl:when test="$key = 'sender'">
    <xsl:value-of select="'Sender'"/>
</xsl:when>
<xsl:when test="$key = 'receiver'">
    <xsl:value-of select="'Receiver'"/>
</xsl:when>
<xsl:when test="$key = 'interactionId'">
    <xsl:value-of select="'Interaction ID'"/>
</xsl:when>
<xsl:when test="$key = 'profileId'">
    <xsl:value-of select="'Profile ID'"/>
</xsl:when>
<xsl:when test="$key = 'transmissionQuantity'">
    <xsl:value-of select="'Batch Message Count'"/>
</xsl:when>
<xsl:when test="$key = 'resultTotalQuantity'">
    <xsl:value-of select="'Result Count Total'"/>
</xsl:when>
<xsl:when test="$key = 'resultCurrentQuantity'">
    <xsl:value-of select="'Result Count Current'"/>
</xsl:when>
<xsl:when test="$key = 'resultRemainingQuantity'">
    <xsl:value-of select="'Result Count Remaining'"/>
</xsl:when>
<xsl:when test="$key = 'justifiedDetectedIssue'">
    <xsl:value-of select="'Detected Issue'"/>
</xsl:when>
<xsl:when test="$key = 'queryAck'">
    <xsl:value-of select="'Query Ack'"/>
</xsl:when>
<xsl:when test="$key = 'queryByParameter'">
    <xsl:value-of select="'Query by Parameter'"/>
</xsl:when>
<xsl:when test="$key = 'queryId'">
    <xsl:value-of select="'Query-ID'"/>
</xsl:when>
<xsl:when test="$key = 'queryResponseCode'">
    <xsl:value-of select="'Query Response Code'"/>
</xsl:when>
<xsl:when test="$key = 'responseModalityCode'">
    <xsl:value-of select="'Response Modality'"/>
</xsl:when>
<xsl:when test="$key = 'responsePriorityCode'">
    <xsl:value-of select="'Response Priority'"/>
</xsl:when>
<xsl:when test="$key = 'initialQuantity'">
    <xsl:value-of select="'Initial Quantity'"/>
</xsl:when>
<xsl:when test="$key = 'initialQuantityCode'">
    <xsl:value-of select="'Initial Quantity Code'"/>
</xsl:when>
<xsl:when test="$key = 'executionAndDeliveryTime'">
    <xsl:value-of select="'Execution and Delivery Time'"/>
</xsl:when>
<xsl:when test="$key = 'functionCode'">
    <xsl:value-of select="'Function'"/>
</xsl:when>
<xsl:when test="$key = 'copyTime'">
    <xsl:value-of select="'Copy Date/time'"/>
</xsl:when>
<xsl:when test="$key = 'time'">
    <xsl:value-of select="'Time'"/>
</xsl:when>
<xsl:when test="$key = 'confidentialityCode'">
    <xsl:value-of select="'Confidentiality'"/>
</xsl:when>
<xsl:when test="$key = 'languageCode'">
    <xsl:value-of select="'Language'"/>
</xsl:when>
<xsl:when test="$key = 'signatureCode'">
    <xsl:value-of select="'Signature Code'"/>
</xsl:when>
<xsl:when test="$key = 'signatureCode-S'">
    <xsl:value-of select="'Signed'"/>
</xsl:when>
<xsl:when test="$key = 'signatureCode-I'">
    <xsl:value-of select="'Intended'"/>
</xsl:when>
<xsl:when test="$key = 'signatureCode-X'">
    <xsl:value-of select="'Signature Required'"/>
</xsl:when>
<xsl:when test="$key = 'addr'">
    <xsl:value-of select="'Address'"/>
</xsl:when>
<xsl:when test="$key = 'address not available'">
    <xsl:value-of select="'address not available'"/>
</xsl:when>
<xsl:when test="$key = 'telecom'">
    <xsl:value-of select="'Telecom'"/>
</xsl:when>
<xsl:when test="$key = 'telecom information not available'">
    <xsl:value-of select="'telecom information not available'"/>
</xsl:when>
<xsl:when test="$key = 'name'">
    <xsl:value-of select="'Name'"/>
</xsl:when>
<xsl:when test="$key = 'statusCode'">
    <xsl:value-of select="'Status'"/>
</xsl:when>
<xsl:when test="$key = 'text'">
    <xsl:value-of select="'Text'"/>
</xsl:when>
<xsl:when test="$key = 'priorityCode'">
    <xsl:value-of select="'Priority'"/>
</xsl:when>
<xsl:when test="$key = 'dischargeDispositionCode'">
    <xsl:value-of select="'Discharge Disposition'"/>
</xsl:when>
<xsl:when test="$key = 'component'">
    <xsl:value-of select="'component'"/>
</xsl:when>
<xsl:when test="$key = 'section'">
    <xsl:value-of select="'Section'"/>
</xsl:when>
<xsl:when test="$key = 'sectionAuthor'">
    <xsl:value-of select="'Section Author'"/>
</xsl:when>
<xsl:when test="$key = 'sectionSubject'">
    <xsl:value-of select="'Section Subject'"/>
</xsl:when>
<xsl:when test="$key = 'sectionInformant'">
    <xsl:value-of select="'Section Informant'"/>
</xsl:when>
<xsl:when test="$key = 'Supporting_author'">
    <xsl:value-of select="'Supporting Author'"/>
</xsl:when>
<xsl:when test="$key = 'Payer'">
    <xsl:value-of select="'Payer'"/>
</xsl:when>
<xsl:when test="$key = 'Policy_Number'">
    <xsl:value-of select="'Policy Number'"/>
</xsl:when>
<xsl:when test="$key = 'Insured'">
    <xsl:value-of select="'Insured'"/>
</xsl:when>
<xsl:when test="$key = 'Insurance_Company'">
    <xsl:value-of select="'Insurance Company'"/>
</xsl:when>
<xsl:when test="$key = 'Clinical_Document'">
    <xsl:value-of select="'Clinical Document'"/>
</xsl:when>
<xsl:when test="$key = 'Created_on'">
    <xsl:value-of select="'Created On'"/>
</xsl:when>
<xsl:when test="$key = 'Created'">
    <xsl:value-of select="'Created'"/>
</xsl:when>
<xsl:when test="$key = 'Authored_on'">
    <xsl:value-of select="'Authored On'"/>
</xsl:when>
<xsl:when test="$key = 'Authored'">
    <xsl:value-of select="'Authored'"/>
</xsl:when>
<xsl:when test="$key = 'Exam_Date'">
    <xsl:value-of select="'Exam Date'"/>
</xsl:when>
<xsl:when test="$key = 'Exam_Time'">
    <xsl:value-of select="'Exam Time'"/>
</xsl:when>
<xsl:when test="$key = 'Next_of_Kin'">
    <xsl:value-of select="'Next of Kin'"/>
</xsl:when>
<xsl:when test="$key = 'Table_of_Contents'">
    <xsl:value-of select="'Table of Contents'"/>
</xsl:when>
<xsl:when test="$key = 'January'">
    <xsl:value-of select="'January'"/>
</xsl:when>
<xsl:when test="$key = 'February'">
    <xsl:value-of select="'February'"/>
</xsl:when>
<xsl:when test="$key = 'March'">
    <xsl:value-of select="'March'"/>
</xsl:when>
<xsl:when test="$key = 'April'">
    <xsl:value-of select="'April'"/>
</xsl:when>
<xsl:when test="$key = 'May'">
    <xsl:value-of select="'May'"/>
</xsl:when>
<xsl:when test="$key = 'June'">
    <xsl:value-of select="'June'"/>
</xsl:when>
<xsl:when test="$key = 'July'">
    <xsl:value-of select="'July'"/>
</xsl:when>
<xsl:when test="$key = 'August'">
    <xsl:value-of select="'August'"/>
</xsl:when>
<xsl:when test="$key = 'September'">
    <xsl:value-of select="'September'"/>
</xsl:when>
<xsl:when test="$key = 'October'">
    <xsl:value-of select="'October'"/>
</xsl:when>
<xsl:when test="$key = 'November'">
    <xsl:value-of select="'November'"/>
</xsl:when>
<xsl:when test="$key = 'December'">
    <xsl:value-of select="'December'"/>
</xsl:when>
<xsl:when test="$key = 'Monday'">
    <xsl:value-of select="'Monday'"/>
</xsl:when>
<xsl:when test="$key = 'Tuesday'">
    <xsl:value-of select="'Tuesday'"/>
</xsl:when>
<xsl:when test="$key = 'Wednesday'">
    <xsl:value-of select="'Wednesday'"/>
</xsl:when>
<xsl:when test="$key = 'Thursday'">
    <xsl:value-of select="'Thursday'"/>
</xsl:when>
<xsl:when test="$key = 'Friday'">
    <xsl:value-of select="'Friday'"/>
</xsl:when>
<xsl:when test="$key = 'Saturday'">
    <xsl:value-of select="'Saturday'"/>
</xsl:when>
<xsl:when test="$key = 'Sunday'">
    <xsl:value-of select="'Sunday'"/>
</xsl:when>
<xsl:when test="$key = 'dowMon'">
    <xsl:value-of select="'Mon'"/>
</xsl:when>
<xsl:when test="$key = 'dowTue'">
    <xsl:value-of select="'Tue'"/>
</xsl:when>
<xsl:when test="$key = 'dowWed'">
    <xsl:value-of select="'Wed'"/>
</xsl:when>
<xsl:when test="$key = 'dowThu'">
    <xsl:value-of select="'Thu'"/>
</xsl:when>
<xsl:when test="$key = 'Fri'">
    <xsl:value-of select="'Fri'"/>
</xsl:when>
<xsl:when test="$key = 'Sat'">
    <xsl:value-of select="'Sat'"/>
</xsl:when>
<xsl:when test="$key = 'Sun'">
    <xsl:value-of select="'Sun'"/>
</xsl:when>
<xsl:when test="$key = 'h'">
    <xsl:value-of select="'h'"/>
</xsl:when>
<xsl:when test="$key = 'Electronically_generated_by'">
    <xsl:value-of select="'Electronically generated by'"/>
</xsl:when>
<xsl:when test="$key = 'Cannot_display_the_text'">
    <xsl:value-of select="'Cannot display the text'"/>
</xsl:when>
<xsl:when test="$key = 'Coded_Entries'">
    <xsl:value-of select="'Coded Entries'"/>
</xsl:when>
<xsl:when test="$key = 'displayname'">
    <xsl:value-of select="'Displayname'"/>
</xsl:when>
<xsl:when test="$key = 'qualifier'">
    <xsl:value-of select="'qualifier'"/>
</xsl:when>
<xsl:when test="$key = 'Name'">
    <xsl:value-of select="'value'"/>
</xsl:when>
<xsl:when test="$key = 'Value'">
    <xsl:value-of select="'Value'"/>
</xsl:when>
<xsl:when test="$key = 'Quantity'">
    <xsl:value-of select="'Quantity'"/>
</xsl:when>
<xsl:when test="$key = 'Unit'">
    <xsl:value-of select="'Unit'"/>
</xsl:when>
<xsl:when test="$key = 'Units'">
    <xsl:value-of select="'Units'"/>
</xsl:when>
<xsl:when test="$key = 'unit'">
    <xsl:value-of select="'unit'"/>
</xsl:when>
<xsl:when test="$key = 'units'">
    <xsl:value-of select="'units'"/>
</xsl:when>
<xsl:when test="$key = 'per'">
    <xsl:value-of select="'per'"/>
</xsl:when>
<xsl:when test="$key = 'Reference'">
    <xsl:value-of select="'Reference'"/>
</xsl:when>
<xsl:when test="$key = 'Status'">
    <xsl:value-of select="'Status'"/>
</xsl:when>
<xsl:when test="$key = 'Time'">
    <xsl:value-of select="'Time'"/>
</xsl:when>
<xsl:when test="$key = 'from'">
    <xsl:value-of select="'from'"/>
</xsl:when>
<xsl:when test="$key = 'From'">
    <xsl:value-of select="'From'"/>
</xsl:when>
<xsl:when test="$key = 'FromNoTo'">
    <xsl:value-of select="'From'"/>
</xsl:when>
<xsl:when test="$key = 'to'">
    <xsl:value-of select="'to'"/>
</xsl:when>
<xsl:when test="$key = 'To'">
    <xsl:value-of select="'To'"/>
</xsl:when>
<xsl:when test="$key = 'Up To'">
    <xsl:value-of select="'Up To'"/>
</xsl:when>
<xsl:when test="$key = 'inclusive'">
    <xsl:value-of select="'inclusive'"/>
</xsl:when>
<xsl:when test="$key = 'for'">
    <xsl:value-of select="'for'"/>
</xsl:when>
<xsl:when test="$key = 'every'">
    <xsl:value-of select="'every'"/>
</xsl:when>
<xsl:when test="$key = 'NHS_Number'">
    <xsl:value-of select="'NHS Number'"/>
</xsl:when>
<xsl:when test="$key = 'Document_Created'">
    <xsl:value-of select="'Document Created'"/>
</xsl:when>
<xsl:when test="$key = 'Document_Owner'">
    <xsl:value-of select="'Document Owner'"/>
</xsl:when>
<xsl:when test="$key = 'on'">
    <xsl:value-of select="'on'"/>
</xsl:when>
<xsl:when test="$key = 'On'">
    <xsl:value-of select="'On'"/>
</xsl:when>
<xsl:when test="$key = 'at'">
    <xsl:value-of select="'at'"/>
</xsl:when>
<xsl:when test="$key = 'At'">
    <xsl:value-of select="'At'"/>
</xsl:when>
<xsl:when test="$key = 'Period'">
    <xsl:value-of select="'Period'"/>
</xsl:when>
<xsl:when test="$key = 'Encounter_Type'">
    <xsl:value-of select="'Encounter Type'"/>
</xsl:when>
<xsl:when test="$key = 'Encounter_Time'">
    <xsl:value-of select="'Encounter Time'"/>
</xsl:when>
<xsl:when test="$key = 'Care_Setting_Type'">
    <xsl:value-of select="'Care Setting Type'"/>
</xsl:when>
<xsl:when test="$key = 'Recipient'">
    <xsl:value-of select="'Recipient'"/>
</xsl:when>
<xsl:when test="$key = 'Referrer'">
    <xsl:value-of select="'Referrer'"/>
</xsl:when>
<xsl:when test="$key = 'Referring Organization'">
    <xsl:value-of select="'Referring Organization'"/>
</xsl:when>
<xsl:when test="$key = 'Service Provider'">
    <xsl:value-of select="'Service Provider'"/>
</xsl:when>
<xsl:when test="$key = 'Document_ID'">
    <xsl:value-of select="'Document ID'"/>
</xsl:when>
<xsl:when test="$key = 'Version'">
    <xsl:value-of select="'Version'"/>
</xsl:when>
<xsl:when test="$key = 'Primary_Recipient'">
    <xsl:value-of select="'Primary Recipient'"/>
</xsl:when>
<xsl:when test="$key = 'Primary_Recipients'">
    <xsl:value-of select="'Primary Recipients'"/>
</xsl:when>
<xsl:when test="$key = 'Copy_Recipient'">
    <xsl:value-of select="'Copy Recipient'"/>
</xsl:when>
<xsl:when test="$key = 'Copy_Recipients'">
    <xsl:value-of select="'Copy Recipients'"/>
</xsl:when>
<xsl:when test="$key = 'Tel'">
    <xsl:value-of select="'Tel'"/>
</xsl:when>
<xsl:when test="$key = 'Fax'">
    <xsl:value-of select="'Fax'"/>
</xsl:when>
<xsl:when test="$key = 'Email'">
    <xsl:value-of select="'Email'"/>
</xsl:when>
<xsl:when test="$key = 'Web'">
    <xsl:value-of select="'Web'"/>
</xsl:when>
<xsl:when test="$key = 'Contact_details'">
    <xsl:value-of select="'Contact Details'"/>
</xsl:when>
<xsl:when test="$key = 'Diagnostic Radiology'">
    <xsl:value-of select="'Diagnostic Radiology'"/>
</xsl:when>
<xsl:when test="$key = 'Consultant'">
    <xsl:value-of select="'Consultant'"/>
</xsl:when>
<xsl:when test="$key = 'Cannot display the text'">
    <xsl:value-of select="'Cannot display the text'"/>
</xsl:when>
<xsl:when test="$key = 'Facility ID'">
    <xsl:value-of select="'Facility ID'"/>
</xsl:when>
<xsl:when test="$key = 'Not available'">
    <xsl:value-of select="'Not available'"/>
</xsl:when>
<xsl:when test="$key = 'First day of period reported'">
    <xsl:value-of select="'First day of period reported'"/>
</xsl:when>
<xsl:when test="$key = 'Last day of period reported'">
    <xsl:value-of select="'Last day of period reported'"/>
</xsl:when>
<xsl:when test="$key = 'Footnote'">
    <xsl:value-of select="'Footnote'"/>
</xsl:when>
<xsl:when test="$key = 'Information not available'">
    <xsl:value-of select="'Information not available'"/>
</xsl:when>
<xsl:when test="$key = 'Race'">
    <xsl:value-of select="'Race'"/>
</xsl:when>
<xsl:when test="$key = 'doseQuantity'">
    <xsl:value-of select="'Dose Quantity'"/>
</xsl:when>
<xsl:when test="$key = 'maxDoseQuantity'">
    <xsl:value-of select="'Max Dose Quantity'"/>
</xsl:when>
<xsl:when test="$key = 'rateQuantity'">
    <xsl:value-of select="'Rate Quantity'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1-M'">
    <xsl:value-of select="'Male'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1-F'">
    <xsl:value-of select="'Female'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1-UN'">
    <xsl:value-of select="'Undifferentiated'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.4-AMB'">
    <xsl:value-of select="'ambulatory'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.4-EMER'">
    <xsl:value-of select="'emergency'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.4-FLD'">
    <xsl:value-of select="'field'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.4-HH'">
    <xsl:value-of select="'home health'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.4-IMP'">
    <xsl:value-of select="'inpatient'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.4-ACUTE'">
    <xsl:value-of select="'acute'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.4-NONAC'">
    <xsl:value-of select="'inpatient non-acute'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.4-SS'">
    <xsl:value-of select="'short stay'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.4-VR'">
    <xsl:value-of select="'virtual'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-ACT'">
    <xsl:value-of select="'act'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-ACCM'">
    <xsl:value-of select="'accommodation'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-ACCT'">
    <xsl:value-of select="'account'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-ACSN'">
    <xsl:value-of select="'accession'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-ADJUD'">
    <xsl:value-of select="'financial adjudication'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-CACT'">
    <xsl:value-of select="'control act'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-ACTN'">
    <xsl:value-of select="'action'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-INFO'">
    <xsl:value-of select="'information'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-STC'">
    <xsl:value-of select="'state transition control'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-CNTRCT'">
    <xsl:value-of select="'contract'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-FCNTRCT'">
    <xsl:value-of select="'financial contract'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-COV'">
    <xsl:value-of select="'coverage'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-CONS'">
    <xsl:value-of select="'consent'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-CONTREG'">
    <xsl:value-of select="'container registration'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-CTTEVENT'">
    <xsl:value-of select="'clinical trial timepoint event'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-DISPACT'">
    <xsl:value-of select="'disciplinary action'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-EXPOS'">
    <xsl:value-of select="'exposure'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-AEXPOS'">
    <xsl:value-of select="'acquisition exposure'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-TEXPOS'">
    <xsl:value-of select="'transmission exposure'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-INC'">
    <xsl:value-of select="'incident'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-INFRM'">
    <xsl:value-of select="'inform'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-INVE'">
    <xsl:value-of select="'invoice element'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-LIST'">
    <xsl:value-of select="'working list'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-MPROT'">
    <xsl:value-of select="'monitoring program'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-OBS'">
    <xsl:value-of select="'observation'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-ALRT'">
    <xsl:value-of select="'detected issue'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-BATTERY'">
    <xsl:value-of select="'battery'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-CLNTRL'">
    <xsl:value-of select="'clinical trial'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-CNOD'">
    <xsl:value-of select="'Condition Node'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-CONC'">
    <xsl:value-of select="'concern'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-COND'">
    <xsl:value-of select="'Condition'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-CASE'">
    <xsl:value-of select="'public health case'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-OUTB'">
    <xsl:value-of select="'outbreak'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-DGIMG'">
    <xsl:value-of select="'diagnostic image'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-GEN'">
    <xsl:value-of select="'genomic observation'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-DETPOL'">
    <xsl:value-of select="'determinant peptide'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-EXP'">
    <xsl:value-of select="'expression level'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-LOC'">
    <xsl:value-of select="'locus'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-PHN'">
    <xsl:value-of select="'phenotype'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-POL'">
    <xsl:value-of select="'polypeptide'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-SEQ'">
    <xsl:value-of select="'bio sequence'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-SEQVAR'">
    <xsl:value-of select="'bio sequence variation'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-INVSTG'">
    <xsl:value-of select="'investigation'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-OBSSER'">
    <xsl:value-of select="'observation series'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-OBSCOR'">
    <xsl:value-of select="'correlated observation sequences'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-POS'">
    <xsl:value-of select="'position'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-POSACC'">
    <xsl:value-of select="'position accuracy'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-POSCOORD'">
    <xsl:value-of select="'position coordinate'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-SPCOBS'">
    <xsl:value-of select="'specimen observationActClassSpecObs'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-VERIF'">
    <xsl:value-of select="'Verification'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-ROIBND'">
    <xsl:value-of select="'bounded ROI'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-ROIOVL'">
    <xsl:value-of select="'overlay ROI'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-LLD'">
    <xsl:value-of select="'left lateral decubitus'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-PRN'">
    <xsl:value-of select="'prone'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-RLD'">
    <xsl:value-of select="'right lateral decubitus'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-SFWL'">
    <xsl:value-of select="'Semi-Fowlers'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-SIT'">
    <xsl:value-of select="'sitting'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-STN'">
    <xsl:value-of select="'standing'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-SUP'">
    <xsl:value-of select="'supine'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-RTRD'">
    <xsl:value-of select="'reverse trendelenburg'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-TRD'">
    <xsl:value-of select="'trendelenburg'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-PCPR'">
    <xsl:value-of select="'care provision'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-ENC'">
    <xsl:value-of select="'encounter'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-POLICY'">
    <xsl:value-of select="'policy'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-JURISPOL'">
    <xsl:value-of select="'jurisdictional policy'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-ORGPOL'">
    <xsl:value-of select="'organizational policy'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-SCOPOL'">
    <xsl:value-of select="'scope of practice policy'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-STDPOL'">
    <xsl:value-of select="'standard of practice policy'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-PROC'">
    <xsl:value-of select="'procedure'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-SBADM'">
    <xsl:value-of select="'substance administration'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-SBEXT'">
    <xsl:value-of select="'Substance Extraction'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-SPECCOLLECT'">
    <xsl:value-of select="'Specimen Collection'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-REG'">
    <xsl:value-of select="'registration'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-REV'">
    <xsl:value-of select="'review'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-SPCTRT'">
    <xsl:value-of select="'specimen treatment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-SPLY'">
    <xsl:value-of select="'supply'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-DIET'">
    <xsl:value-of select="'diet'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-STORE'">
    <xsl:value-of select="'storage'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-SUBST'">
    <xsl:value-of select="'Substitution'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-TRFR'">
    <xsl:value-of select="'transfer'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-TRNS'">
    <xsl:value-of select="'transportation'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-XACT'">
    <xsl:value-of select="'financial transaction'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-COMPOSITION'">
    <xsl:value-of select="'composition'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-DOC'">
    <xsl:value-of select="'document'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-DOCCLIN'">
    <xsl:value-of select="'clinical document'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-CDALVLONE'">
    <xsl:value-of select="'CDA Level One clinical document'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-CONTAINER'">
    <xsl:value-of select="'record container'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-CATEGORY'">
    <xsl:value-of select="'category'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-DOCBODY'">
    <xsl:value-of select="'document body'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-DOCSECT'">
    <xsl:value-of select="'document section'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-TOPIC'">
    <xsl:value-of select="'topic'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-EXTRACT'">
    <xsl:value-of select="'extract'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-EHR'">
    <xsl:value-of select="'electronic health record'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-FOLDER'">
    <xsl:value-of select="'folder'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-GROUPER'">
    <xsl:value-of select="'grouper'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6-CLUSTER'">
    <xsl:value-of select="'cluster'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.18-CA'">
    <xsl:value-of select="'Commit Accept'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.18-CE'">
    <xsl:value-of select="'Commit Error'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.18-CR'">
    <xsl:value-of select="'Commit Reject'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.18-AA'">
    <xsl:value-of select="'Application Accept'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.18-AE'">
    <xsl:value-of select="'Application Error'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.18-AR'">
    <xsl:value-of select="'Application Reject'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1082-W'">
    <xsl:value-of select="'Warning'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1082-I'">
    <xsl:value-of select="'Information'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1082-E'">
    <xsl:value-of select="'Error'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1067-AE'">
    <xsl:value-of select="'AE (Application error, query aborted)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1067-NF'">
    <xsl:value-of select="'NF (Nothing found, no errors)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1067-OK'">
    <xsl:value-of select="'OK (Data found)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1067-QE'">
    <xsl:value-of select="'QE (Query Parameter Error, query aborted)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.109-B'">
    <xsl:value-of select="'B (Batch)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.109-R'">
    <xsl:value-of select="'R (Realtime)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.109-T'">
    <xsl:value-of select="'T (Bolus)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.102-D'">
    <xsl:value-of select="'D (Deferred)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.102-I'">
    <xsl:value-of select="'I (Immediate)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1112-RD'">
    <xsl:value-of select="'RD (Records)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.25-N'">
    <xsl:value-of select="'Normal'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.25-R'">
    <xsl:value-of select="'Restricted'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.25-V'">
    <xsl:value-of select="'Very restricted'"/>
</xsl:when>
<xsl:when test="$key = 'nullFlavor_DER'">
    <xsl:value-of select="'derived'"/>
</xsl:when>
<xsl:when test="$key = 'nullFlavor_OTH'">
    <xsl:value-of select="'other'"/>
</xsl:when>
<xsl:when test="$key = 'nullFlavor_ASKU'">
    <xsl:value-of select="'asked but unknown'"/>
</xsl:when>
<xsl:when test="$key = 'nullFlavor_NAV'">
    <xsl:value-of select="'not available'"/>
</xsl:when>
<xsl:when test="$key = 'nullFlavor_NASK'">
    <xsl:value-of select="'not asked'"/>
</xsl:when>
<xsl:when test="$key = 'nullFlavor_QS'">
    <xsl:value-of select="'sufficient quantity'"/>
</xsl:when>
<xsl:when test="$key = 'nullFlavor_TRC'">
    <xsl:value-of select="'trace'"/>
</xsl:when>
<xsl:when test="$key = 'nullFlavor_NI'">
    <xsl:value-of select="'no information'"/>
</xsl:when>
<xsl:when test="$key = 'nullFlavor_INV'">
    <xsl:value-of select="'invalid'"/>
</xsl:when>
<xsl:when test="$key = 'nullFlavor_MSK'">
    <xsl:value-of select="'masked'"/>
</xsl:when>
<xsl:when test="$key = 'nullFlavor_NA'">
    <xsl:value-of select="'not applicable'"/>
</xsl:when>
<xsl:when test="$key = 'nullFlavor_NINF'">
    <xsl:value-of select="'negative infinity'"/>
</xsl:when>
<xsl:when test="$key = 'nullFlavor_PINF'">
    <xsl:value-of select="'positive infinity'"/>
</xsl:when>
<xsl:when test="$key = 'nullFlavor_UNC'">
    <xsl:value-of select="'un-encoded'"/>
</xsl:when>
<xsl:when test="$key = 'nullFlavor_UNK'">
    <xsl:value-of select="'unknown'"/>
</xsl:when>
<xsl:when test="$key = 'nullFlavor_NP'">
    <xsl:value-of select="'not present'"/>
</xsl:when>
<xsl:when test="$key = 'statusCode-active'">
    <xsl:value-of select="'Active'"/>
</xsl:when>
<xsl:when test="$key = 'statusCode-completed'">
    <xsl:value-of select="'Completed'"/>
</xsl:when>
<xsl:when test="$key = 'statusCode-cancelled'">
    <xsl:value-of select="'Cancelled'"/>
</xsl:when>
<xsl:when test="$key = 'statusCode-nullified'">
    <xsl:value-of select="'Nullified'"/>
</xsl:when>
<xsl:when test="$key = 'statusCode-aborted'">
    <xsl:value-of select="'Aborted'"/>
</xsl:when>
<xsl:when test="$key = 'statusCode-obsolete'">
    <xsl:value-of select="'Obsolete'"/>
</xsl:when>
<xsl:when test="$key = 'statusCode-suspended'">
    <xsl:value-of select="'Suspended'"/>
</xsl:when>
<xsl:when test="$key = 'statusCode-new'">
    <xsl:value-of select="'New'"/>
</xsl:when>
<xsl:when test="$key = 'statusCode-normal'">
    <xsl:value-of select="'Normal'"/>
</xsl:when>
<xsl:when test="$key = 'statusCode-pending'">
    <xsl:value-of select="'Pending'"/>
</xsl:when>
<xsl:when test="$key = 'statusCode-terminated'">
    <xsl:value-of select="'Terminated'"/>
</xsl:when>
<xsl:when test="$key = 'statusCode-inactive'">
    <xsl:value-of select="'Inactive'"/>
</xsl:when>
<xsl:when test="$key = 'statusCode-executing'">
    <xsl:value-of select="'Executing'"/>
</xsl:when>
<xsl:when test="$key = 'statusCode-waitContinuedQueryResponse'">
    <xsl:value-of select="'Wait continued query response'"/>
</xsl:when>
<xsl:when test="$key = 'statusCode-deliveredResponse'">
    <xsl:value-of select="'Delivered response'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-AUCG'">
    <xsl:value-of select="'caregiver information receiver'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1002-APND'">
    <xsl:value-of select="'appendage'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1002-RPLC'">
    <xsl:value-of select="'replaces'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1002-XFRM'">
    <xsl:value-of select="'transformation'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-AULR'">
    <xsl:value-of select="'legitimate relationship information receiver'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-AUTM'">
    <xsl:value-of select="'care team information receiver'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-AUWA'">
    <xsl:value-of select="'work area information receiver'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-GRDCON'">
    <xsl:value-of select="'legal guardian consent author'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-POACON'">
    <xsl:value-of select="'healthcare power of attorney consent author'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-PRCON'">
    <xsl:value-of select="'personal representative consent author'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-PROMSK'">
    <xsl:value-of select="'authorized provider masking author'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-SUBCON'">
    <xsl:value-of select="'subject of consent author'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-AUCOV'">
    <xsl:value-of select="'consent overrider'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-AUEMROV'">
    <xsl:value-of select="'emergency overrider'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-CLMADJ'">
    <xsl:value-of select="'claims adjudication'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-ENROLL'">
    <xsl:value-of select="'enrollment broker'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-FFSMGT'">
    <xsl:value-of select="'ffs management'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-MCMGT'">
    <xsl:value-of select="'managed care management'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-PROVMGT'">
    <xsl:value-of select="'provider management'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-UMGT'">
    <xsl:value-of select="'utilization management'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-FULINRD'">
    <xsl:value-of select="'fully insured'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-SELFINRD'">
    <xsl:value-of select="'self insured'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-PAYORCNTR'">
    <xsl:value-of select="'payor contracting'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-REINS'">
    <xsl:value-of select="'reinsures'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-RETROCES'">
    <xsl:value-of select="'retrocessionaires'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-SUBCTRT'">
    <xsl:value-of select="'subcontracting risk'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-UNDERWRTNG'">
    <xsl:value-of select="'underwriting'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-ADMPHYS'">
    <xsl:value-of select="'admitting physician'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-ANEST'">
    <xsl:value-of select="'anesthesist'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-ANRS'">
    <xsl:value-of select="'anesthesia nurse'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-ATTPHYS'">
    <xsl:value-of select="'attending physician'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-DISPHYS'">
    <xsl:value-of select="'discharging physician'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-FASST'">
    <xsl:value-of select="'first assistant surgeon'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-MDWF'">
    <xsl:value-of select="'midwife'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-NASST'">
    <xsl:value-of select="'nurse assistant'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-PCP'">
    <xsl:value-of select="'primary care physician'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-PRISURG'">
    <xsl:value-of select="'primary surgeon'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-RNDPHYS'">
    <xsl:value-of select="'rounding physician'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-SASST'">
    <xsl:value-of select="'second assistant surgeon'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-SNRS'">
    <xsl:value-of select="'scrub nurse'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88-TASST'">
    <xsl:value-of select="'third assistant'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.89-I'">
    <xsl:value-of select="'intended'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.89-S'">
    <xsl:value-of select="'signed'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.89-X'">
    <xsl:value-of select="'required'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-PART'">
    <xsl:value-of select="'Participation'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-ADM'">
    <xsl:value-of select="'admitter'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-ATND'">
    <xsl:value-of select="'attender'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-CALLBCK'">
    <xsl:value-of select="'callback contact'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-CON'">
    <xsl:value-of select="'consultant'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-DIS'">
    <xsl:value-of select="'discharger'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-ESC'">
    <xsl:value-of select="'escort'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-REF'">
    <xsl:value-of select="'referrer'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-AUT'">
    <xsl:value-of select="'author (originator)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-INF'">
    <xsl:value-of select="'informant'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-TRANS'">
    <xsl:value-of select="'Transcriber'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-ENT'">
    <xsl:value-of select="'data entry person'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-WIT'">
    <xsl:value-of select="'witness'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-CST'">
    <xsl:value-of select="'custodian'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-DIR'">
    <xsl:value-of select="'direct target'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-BBY'">
    <xsl:value-of select="'baby'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-CSM'">
    <xsl:value-of select="'consumable'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-DEV'">
    <xsl:value-of select="'device'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-NRD'">
    <xsl:value-of select="'non-reuseable device'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-RDV'">
    <xsl:value-of select="'reusable device'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-DON'">
    <xsl:value-of select="'donor'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-EXPAGNT'">
    <xsl:value-of select="'ExposureAgent'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-EXPART'">
    <xsl:value-of select="'ExposureParticipation'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-EXPTRGT'">
    <xsl:value-of select="'ExposureTarget'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-EXSRC'">
    <xsl:value-of select="'ExposureSource'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-PRD'">
    <xsl:value-of select="'product'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-SBJ'">
    <xsl:value-of select="'subject'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-SPC'">
    <xsl:value-of select="'specimen'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-IND'">
    <xsl:value-of select="'indirect target'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-BEN'">
    <xsl:value-of select="'beneficiary'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-CAGNT'">
    <xsl:value-of select="'causative agent'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-COV'">
    <xsl:value-of select="'coverage target'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-GUAR'">
    <xsl:value-of select="'guarantor party'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-HLD'">
    <xsl:value-of select="'holder'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-RCT'">
    <xsl:value-of select="'record target'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-RCV'">
    <xsl:value-of select="'receiver'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-IRCP'">
    <xsl:value-of select="'information recipient'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-NOT'">
    <xsl:value-of select="'urgent notification contact'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-PRCP'">
    <xsl:value-of select="'primary information recipient'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-REFB'">
    <xsl:value-of select="'Referred By'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-REFT'">
    <xsl:value-of select="'Referred to'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-TRC'">
    <xsl:value-of select="'tracker'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-LOC'">
    <xsl:value-of select="'location'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-DST'">
    <xsl:value-of select="'destination'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-ELOC'">
    <xsl:value-of select="'entry location'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-ORG'">
    <xsl:value-of select="'origin'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-RML'">
    <xsl:value-of select="'remote'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-VIA'">
    <xsl:value-of select="'via'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-PRF'">
    <xsl:value-of select="'performer'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-DIST'">
    <xsl:value-of select="'distributor'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-PPRF'">
    <xsl:value-of select="'primary performer'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-SPRF'">
    <xsl:value-of select="'secondary performer'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-RESP'">
    <xsl:value-of select="'responsible party'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-VRF'">
    <xsl:value-of select="'verifier'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-AUTHEN'">
    <xsl:value-of select="'authenticator'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.90-LA'">
    <xsl:value-of select="'legal authenticator'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-CHILD'">
    <xsl:value-of select="'child'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-CRED'">
    <xsl:value-of select="'credentialed entity'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-NURPRAC'">
    <xsl:value-of select="'nurse practitioner'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-NURS'">
    <xsl:value-of select="'nurse'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-PA'">
    <xsl:value-of select="'physician assistant'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-PHYS'">
    <xsl:value-of select="'physician'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-ROL'">
    <xsl:value-of select="'role'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-AFFL'">
    <xsl:value-of select="'affiliate'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-AGNT'">
    <xsl:value-of select="'agent'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-ASSIGNED'">
    <xsl:value-of select="'assigned entity'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-COMPAR'">
    <xsl:value-of select="'commissioning party'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-SGNOFF'">
    <xsl:value-of select="'signing authority or officer'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-CON'">
    <xsl:value-of select="'contact'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-ECON'">
    <xsl:value-of select="'emergency contact'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-NOK'">
    <xsl:value-of select="'next of kin'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-GUARD'">
    <xsl:value-of select="'guardian'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-CIT'">
    <xsl:value-of select="'citizen'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-COVPTY'">
    <xsl:value-of select="'covered party'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-CLAIM'">
    <xsl:value-of select="'claimant'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-NAMED'">
    <xsl:value-of select="'named insured'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-DEPEN'">
    <xsl:value-of select="'dependent'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-INDIV'">
    <xsl:value-of select="'individual'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-SUBSCR'">
    <xsl:value-of select="'subscriber'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-PROG'">
    <xsl:value-of select="'program eligible'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-CRINV'">
    <xsl:value-of select="'clinical research investigator'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-CRSPNSR'">
    <xsl:value-of select="'clinical research sponsor'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-EMP'">
    <xsl:value-of select="'employee'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-MIL'">
    <xsl:value-of select="'military person'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-INVSBJ'">
    <xsl:value-of select="'Investigation Subject'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-CASEBJ'">
    <xsl:value-of select="'Case Subject'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-RESBJ'">
    <xsl:value-of select="'research subject'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-LIC'">
    <xsl:value-of select="'licensed entity'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-NOT'">
    <xsl:value-of select="'notary public'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-PROV'">
    <xsl:value-of select="'healthcare provider'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-PAT'">
    <xsl:value-of select="'patient'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-PAYEE'">
    <xsl:value-of select="'payee'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-PAYOR'">
    <xsl:value-of select="'invoice payor'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-POLHOLD'">
    <xsl:value-of select="'policy holder'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-QUAL'">
    <xsl:value-of select="'qualified entity'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-SPNSR'">
    <xsl:value-of select="'coverage sponsor'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-STD'">
    <xsl:value-of select="'student'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-UNDWRT'">
    <xsl:value-of select="'underwriter'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-CAREGIVER'">
    <xsl:value-of select="'caregiver'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-PRS'">
    <xsl:value-of select="'personal relationship'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-ACCESS'">
    <xsl:value-of select="'access'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-ADMM'">
    <xsl:value-of select="'Administerable Material'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-BIRTHPL'">
    <xsl:value-of select="'birthplace'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-DEATHPLC'">
    <xsl:value-of select="'place of death'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-DST'">
    <xsl:value-of select="'distributed material'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-RET'">
    <xsl:value-of select="'retailed material'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-EXPR'">
    <xsl:value-of select="'exposed entity'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-HLD'">
    <xsl:value-of select="'held entity'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-HLTHCHRT'">
    <xsl:value-of select="'health chart'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-IDENT'">
    <xsl:value-of select="'identified entity'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-MANU'">
    <xsl:value-of select="'manufactured product'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-THER'">
    <xsl:value-of select="'therapeutic agent'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-MNT'">
    <xsl:value-of select="'maintained entity'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-OWN'">
    <xsl:value-of select="'owned entity'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-RGPR'">
    <xsl:value-of select="'regulated product'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-SDLOC'">
    <xsl:value-of select="'service delivery location'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-DSDLOC'">
    <xsl:value-of select="'dedicated service delivery location'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-ISDLOC'">
    <xsl:value-of select="'incidental service delivery location'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-TERR'">
    <xsl:value-of select="'territory of authority'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-USED'">
    <xsl:value-of select="'used entity'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-WRTE'">
    <xsl:value-of select="'warranted product'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-EQUIV'">
    <xsl:value-of select="'equivalent entity'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-SAME'">
    <xsl:value-of select="'same'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-SUBY'">
    <xsl:value-of select="'subsumed by'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-GEN'">
    <xsl:value-of select="'has generalization'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-GRIC'">
    <xsl:value-of select="'has generic'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-INST'">
    <xsl:value-of select="'instance'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-SUBS'">
    <xsl:value-of select="'subsumer'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-CONT'">
    <xsl:value-of select="'content'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-EXPAGTCAR'">
    <xsl:value-of select="'exposure agent carrier'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-EXPVECTOR'">
    <xsl:value-of select="'exposure vector'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-FOMITE'">
    <xsl:value-of select="'fomite'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-INGR'">
    <xsl:value-of select="'ingredient'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-ACTI'">
    <xsl:value-of select="'active ingredient'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-ACTIB'">
    <xsl:value-of select="'active ingredient - basis of strength'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-ACTIM'">
    <xsl:value-of select="'active ingredient - moiety is basis of strength'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-ACTIR'">
    <xsl:value-of select="'active ingredient - reference substance is basis of strength'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-ADTV'">
    <xsl:value-of select="'additive'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-BASE'">
    <xsl:value-of select="'base'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-IACT'">
    <xsl:value-of select="'inactive ingredient'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-COLR'">
    <xsl:value-of select="'color additive'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-FLVR'">
    <xsl:value-of select="'flavor additive'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-PRSV'">
    <xsl:value-of select="'preservative'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-STBL'">
    <xsl:value-of select="'stabilizer'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-LOCE'">
    <xsl:value-of select="'located entity'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-STOR'">
    <xsl:value-of select="'stored entity'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-MBR'">
    <xsl:value-of select="'member'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-PART'">
    <xsl:value-of select="'part'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-ACTM'">
    <xsl:value-of select="'active moiety'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-SPEC'">
    <xsl:value-of select="'specimen'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-ALQT'">
    <xsl:value-of select="'aliquot'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.110-ISLT'">
    <xsl:value-of select="'isolate'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-FAMMEMB'">
    <xsl:value-of select="'Family Member'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-CHILD'">
    <xsl:value-of select="'Child'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-CHLDADOPT'">
    <xsl:value-of select="'adopted child'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-DAUADOPT'">
    <xsl:value-of select="'adopted daughter'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-SONADOPT'">
    <xsl:value-of select="'adopted son'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-CHLDFOST'">
    <xsl:value-of select="'foster child'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-DAUFOST'">
    <xsl:value-of select="'foster daughter'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-SONFOST'">
    <xsl:value-of select="'foster son'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-CHLDINLAW'">
    <xsl:value-of select="'child in-law'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-DAUINLAW'">
    <xsl:value-of select="'daughter in-law'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-SONINLAW'">
    <xsl:value-of select="'son in-law'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-DAUC'">
    <xsl:value-of select="'Daughter'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-DAU'">
    <xsl:value-of select="'natural daughter'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-STPDAU'">
    <xsl:value-of select="'stepdaughter'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-NCHILD'">
    <xsl:value-of select="'natural child'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-SON'">
    <xsl:value-of select="'natural son'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-SONC'">
    <xsl:value-of select="'son'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-STPSON'">
    <xsl:value-of select="'stepson'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-STPCHLD'">
    <xsl:value-of select="'step child'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-EXT'">
    <xsl:value-of select="'extended family member'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-AUNT'">
    <xsl:value-of select="'aunt'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-MAUNT'">
    <xsl:value-of select="'Maternal Aunt'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-PAUNT'">
    <xsl:value-of select="'Paternal Aunt'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-COUSN'">
    <xsl:value-of select="'cousin'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-MCOUSN'">
    <xsl:value-of select="'Maternal Cousin'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-PCOUSN'">
    <xsl:value-of select="'Paternal Cousin'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-GGRPRN'">
    <xsl:value-of select="'great grandparent'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-GGRFTH'">
    <xsl:value-of select="'great grandfather'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-GGRMTH'">
    <xsl:value-of select="'great grandmother'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-MGGRFTH'">
    <xsl:value-of select="'Maternal Greatgrandfather'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-MGGRMTH'">
    <xsl:value-of select="'Maternal Greatgrandmother'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-MGGRPRN'">
    <xsl:value-of select="'Maternal Greatgrandparent'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-PGGRFTH'">
    <xsl:value-of select="'Paternal Greatgrandfather'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-PGGRMTH'">
    <xsl:value-of select="'Paternal Greatgrandmother'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-PGGRPRN'">
    <xsl:value-of select="'Paternal Greatgrandparent'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-GRNDCHILD'">
    <xsl:value-of select="'grandchild'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-GRNDDAU'">
    <xsl:value-of select="'granddaughter'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-GRNDSON'">
    <xsl:value-of select="'grandson'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-GRPRN'">
    <xsl:value-of select="'Grandparent'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-GRFTH'">
    <xsl:value-of select="'Grandfather'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-GRMTH'">
    <xsl:value-of select="'Grandmother'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-MGRFTH'">
    <xsl:value-of select="'MaternalGrandfather'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-MGRMTH'">
    <xsl:value-of select="'MaternalGrandmother'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-MGRPRN'">
    <xsl:value-of select="'Maternal Grandparent'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-PGRFTH'">
    <xsl:value-of select="'Paternal Grandfather'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-PGRMTH'">
    <xsl:value-of select="'Paternal Grandmother'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-PGRPRN'">
    <xsl:value-of select="'Paternal Grandparent'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-NIENEPH'">
    <xsl:value-of select="'niece/nephew'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-NEPHEW'">
    <xsl:value-of select="'nephew'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-NIECE'">
    <xsl:value-of select="'niece'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-UNCLE'">
    <xsl:value-of select="'uncle'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-MUNCLE'">
    <xsl:value-of select="'Maternal Uncle'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-PUNCLE'">
    <xsl:value-of select="'Paternal Uncle'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-PRN'">
    <xsl:value-of select="'Parent'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-FTH'">
    <xsl:value-of select="'Father'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-MTH'">
    <xsl:value-of select="'Mother'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-NPRN'">
    <xsl:value-of select="'natural parent'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-NFTH'">
    <xsl:value-of select="'natural father'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-NFTHF'">
    <xsl:value-of select="'natural father of fetus'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-NMTH'">
    <xsl:value-of select="'natural mother'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-PRNINLAW'">
    <xsl:value-of select="'parent in-law'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-FTHINLAW'">
    <xsl:value-of select="'father-in-law'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-MTHINLAW'">
    <xsl:value-of select="'mother-in-law'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-STPPRN'">
    <xsl:value-of select="'step parent'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-STPFTH'">
    <xsl:value-of select="'stepfather'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-STPMTH'">
    <xsl:value-of select="'stepmother'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-SIB'">
    <xsl:value-of select="'Sibling'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-BRO'">
    <xsl:value-of select="'Brother'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-HSIB'">
    <xsl:value-of select="'half-sibling'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-HBRO'">
    <xsl:value-of select="'half-brother'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-HSIS'">
    <xsl:value-of select="'half-sister'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-NSIB'">
    <xsl:value-of select="'natural sibling'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-NBRO'">
    <xsl:value-of select="'natural brother'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-NSIS'">
    <xsl:value-of select="'natural sister'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-SIBINLAW'">
    <xsl:value-of select="'sibling in-law'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-BROINLAW'">
    <xsl:value-of select="'brother-in-law'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-SISINLAW'">
    <xsl:value-of select="'sister-in-law'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-SIS'">
    <xsl:value-of select="'Sister'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-STPSIB'">
    <xsl:value-of select="'step sibling'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-STPBRO'">
    <xsl:value-of select="'stepbrother'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-STPSIS'">
    <xsl:value-of select="'stepsister'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-SIGOTHR'">
    <xsl:value-of select="'significant other'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-DOMPART'">
    <xsl:value-of select="'domestic partner'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-SPS'">
    <xsl:value-of select="'spouse'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-HUSB'">
    <xsl:value-of select="'husband'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-WIFE'">
    <xsl:value-of select="'wife'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-FRND'">
    <xsl:value-of select="'unrelated friend'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-NBOR'">
    <xsl:value-of select="'neighbor'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-ROOM'">
    <xsl:value-of select="'Roommate'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-NOK'">
    <xsl:value-of select="'Next of Kin'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-ECON'">
    <xsl:value-of select="'Emergency contact'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111-GENRL'">
    <xsl:value-of select="'General'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.12.443-CP'">
    <xsl:value-of select="'consulting provider'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.12.443-PP'">
    <xsl:value-of select="'primary care provider'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.12.443-RP'">
    <xsl:value-of select="'referring provider'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.12.443-MP'">
    <xsl:value-of select="'medical home provider'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-AUT'">
    <xsl:value-of select="'Author'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-ENT'">
    <xsl:value-of select="'Data Enterer'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-FLFS'">
    <xsl:value-of select="'In Fulfillment Of'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-FLFS-rev'">
    <xsl:value-of select="'Fulfilled By'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-INF'">
    <xsl:value-of select="'Informant'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-AUTHEN'">
    <xsl:value-of select="'Authenticator'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-LA'">
    <xsl:value-of select="'Legal Authenticator'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-PRCP'">
    <xsl:value-of select="'Information Recipient'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-PRF'">
    <xsl:value-of select="'Performer'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-PPRF'">
    <xsl:value-of select="'Primary Performer'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-RCT'">
    <xsl:value-of select="'Patient'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-RESP'">
    <xsl:value-of select="'Responsible Party'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-SPRF'">
    <xsl:value-of select="'Supporting Performer'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-TRC'">
    <xsl:value-of select="'Secondary Information Recipient'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-COMP'">
    <xsl:value-of select="'Component'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-COMP-rev'">
    <xsl:value-of select="'Component Of'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-MFST'">
    <xsl:value-of select="'Manifestation Of'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-MFST-rev'">
    <xsl:value-of select="'Manifested By'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-REFR'">
    <xsl:value-of select="'Refers To'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-REFR-rev'">
    <xsl:value-of select="'Referred By'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-RPLC'">
    <xsl:value-of select="'Replaces'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-RPLC-rev'">
    <xsl:value-of select="'Replaced By'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-RSON'">
    <xsl:value-of select="'Reason'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-RSON-rev'">
    <xsl:value-of select="'Is Reason For'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-SUBJ'">
    <xsl:value-of select="'Subject'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-SUBJ-rev'">
    <xsl:value-of select="'Subject Of'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-SPRT'">
    <xsl:value-of select="'Supported By'"/>
</xsl:when>
<xsl:when test="$key = 'typeCode-SPRT-rev'">
    <xsl:value-of select="'Supports'"/>
</xsl:when>
<xsl:when test="$key = 'moodCode-DEF'">
    <xsl:value-of select="'definition'"/>
</xsl:when>
<xsl:when test="$key = 'moodCode-GOL'">
    <xsl:value-of select="'goal'"/>
</xsl:when>
<xsl:when test="$key = 'moodCode-INT'">
    <xsl:value-of select="'intent'"/>
</xsl:when>
<xsl:when test="$key = 'moodCode-PRMS'">
    <xsl:value-of select="'promise'"/>
</xsl:when>
<xsl:when test="$key = 'moodCode-PRP'">
    <xsl:value-of select="'proposal'"/>
</xsl:when>
<xsl:when test="$key = 'moodCode-RQO'">
    <xsl:value-of select="'request'"/>
</xsl:when>
<xsl:when test="$key = 'nameUse_ABC'">
    <xsl:value-of select="'Alphabetic'"/>
</xsl:when>
<xsl:when test="$key = 'nameUse_IDE'">
    <xsl:value-of select="'Ideographic'"/>
</xsl:when>
<xsl:when test="$key = 'nameUse_SYL'">
    <xsl:value-of select="'Syllabic'"/>
</xsl:when>
<xsl:when test="$key = 'nameUse_ASGN'">
    <xsl:value-of select="'assigned'"/>
</xsl:when>
<xsl:when test="$key = 'nameUse_C'">
    <xsl:value-of select="'License'"/>
</xsl:when>
<xsl:when test="$key = 'nameUse_I'">
    <xsl:value-of select="'Indigenous/Tribal'"/>
</xsl:when>
<xsl:when test="$key = 'nameUse_L'">
    <xsl:value-of select="'Legal'"/>
</xsl:when>
<xsl:when test="$key = 'nameUse_OR'">
    <xsl:value-of select="'official registry'"/>
</xsl:when>
<xsl:when test="$key = 'nameUse_P'">
    <xsl:value-of select="'pseudonym'"/>
</xsl:when>
<xsl:when test="$key = 'nameUse_A'">
    <xsl:value-of select="'Artist/Stage'"/>
</xsl:when>
<xsl:when test="$key = 'nameUse_R'">
    <xsl:value-of select="'Religious'"/>
</xsl:when>
<xsl:when test="$key = 'nameUse_SRCH'">
    <xsl:value-of select="'search'"/>
</xsl:when>
<xsl:when test="$key = 'nameUse_PHON'">
    <xsl:value-of select="'phonetic'"/>
</xsl:when>
<xsl:when test="$key = 'nameUse_SNDX'">
    <xsl:value-of select="'Soundex'"/>
</xsl:when>
<xsl:when test="$key = 'addressUse_H'">
    <xsl:value-of select="'Home'"/>
</xsl:when>
<xsl:when test="$key = 'addressUse_HV'">
    <xsl:value-of select="'Vacation Home'"/>
</xsl:when>
<xsl:when test="$key = 'addressUse_HP'">
    <xsl:value-of select="'Home Primary'"/>
</xsl:when>
<xsl:when test="$key = 'addressUse_WP'">
    <xsl:value-of select="'Workplace'"/>
</xsl:when>
<xsl:when test="$key = 'addressUse_PUB'">
    <xsl:value-of select="'Public'"/>
</xsl:when>
<xsl:when test="$key = 'addressUse_EC'">
    <xsl:value-of select="'Emergency'"/>
</xsl:when>
<xsl:when test="$key = 'addressUse_MC'">
    <xsl:value-of select="'Mobile'"/>
</xsl:when>
<xsl:when test="$key = 'addressUse_PG'">
    <xsl:value-of select="'Pager'"/>
</xsl:when>
<xsl:when test="$key = 'addressUse_PST'">
    <xsl:value-of select="'Postal'"/>
</xsl:when>
<xsl:when test="$key = 'addressUse_TMP'">
    <xsl:value-of select="'Temporary'"/>
</xsl:when>
<xsl:when test="$key = 'addressUse_CONF'">
    <xsl:value-of select="'Confidential'"/>
</xsl:when>
<xsl:when test="$key = 'addressUse_PHYS'">
    <xsl:value-of select="'Physical'"/>
</xsl:when>
<xsl:when test="$key = 'addressUse_DIR'">
    <xsl:value-of select="'Direct'"/>
</xsl:when>
<xsl:when test="$key = 'addressUse_BAD'">
    <xsl:value-of select="'Bad address'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11534-5'">
    <xsl:value-of select="'Temperature charts'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11536-0'">
    <xsl:value-of select="'Notes (Nursing)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11538-6'">
    <xsl:value-of select="'Study.total (CT)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11539-4'">
    <xsl:value-of select="'Study.total (CT)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11540-2'">
    <xsl:value-of select="'Study.total (CT)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11541-0'">
    <xsl:value-of select="'Study report (MRI)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11542-8'">
    <xsl:value-of select="'Subsequent visit evaluation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11543-6'">
    <xsl:value-of select="'Nursery records'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11485-0'">
    <xsl:value-of select="'Anesthesia records'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11486-8'">
    <xsl:value-of select="'Chemotherapy records'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11488-4'">
    <xsl:value-of select="'Consultation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11490-0'">
    <xsl:value-of select="'Discharge summarization note (Physician)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11492-6'">
    <xsl:value-of select="'History and physical note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11494-2'">
    <xsl:value-of select="'Initial assessment note (Physician)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11495-9'">
    <xsl:value-of select="'Initial assessment note (Physical therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11496-7'">
    <xsl:value-of select="'Initial assessment note (Podiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11497-5'">
    <xsl:value-of select="'Initial assessment note (Psychology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11498-3'">
    <xsl:value-of select="'Initial assessment note (Social service)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11499-1'">
    <xsl:value-of select="'Initial assessment note (Speech therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11500-6'">
    <xsl:value-of select="'Initial assessment note (Occupational therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11502-2'">
    <xsl:value-of select="'Laboratory report.total'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11503-0'">
    <xsl:value-of select="'Medical records'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11504-8'">
    <xsl:value-of select="'Surgical operation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11505-5'">
    <xsl:value-of select="'Procedure note (Physician)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11506-3'">
    <xsl:value-of select="'Subsequent evaluation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11507-1'">
    <xsl:value-of select="'Subsequent evaluation note (Occupational therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11508-9'">
    <xsl:value-of select="'Subsequent evaluation note (Physical therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11509-7'">
    <xsl:value-of select="'Subsequent evaluation note (Podiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11510-5'">
    <xsl:value-of select="'Subsequent evaluation note (Psychology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11512-1'">
    <xsl:value-of select="'Subsequent evaluation note (Speech therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11514-7'">
    <xsl:value-of select="'Records.total (Chiropractic)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11515-4'">
    <xsl:value-of select="'Records.total (Physical therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11516-2'">
    <xsl:value-of select="'Records.total (Physician)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11517-0'">
    <xsl:value-of select="'Records.total (Podiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11518-8'">
    <xsl:value-of select="'Records.total (Psychology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11519-6'">
    <xsl:value-of select="'Records.total (Social service)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11520-4'">
    <xsl:value-of select="'Records.total (Speech therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11521-2'">
    <xsl:value-of select="'Records.total (Occupational therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11522-0'">
    <xsl:value-of select="'Study report (Cardiac echo)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11523-8'">
    <xsl:value-of select="'Study report (EEG)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11524-6'">
    <xsl:value-of select="'Study report (EKG)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11525-3'">
    <xsl:value-of select="'Study report (OB US)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11526-1'">
    <xsl:value-of select="'Study report (Pathology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11527-9'">
    <xsl:value-of select="'Study report (Psychiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11528-7'">
    <xsl:value-of select="'Study.total (Radiology.XXX)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11529-5'">
    <xsl:value-of select="'Study report (Surgical pathology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-15507-7'">
    <xsl:value-of select="'Subsequent evaluation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-15508-5'">
    <xsl:value-of select="'Labor and delivery records'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-17787-3'">
    <xsl:value-of select="'Study report (Radnuc)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18765-8'">
    <xsl:value-of select="'Subsequent visit evaluation note (Podiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18766-6'">
    <xsl:value-of select="'Subsequent visit evaluation note (Psychology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18733-6'">
    <xsl:value-of select="'Subsequent evaluation note (Attending physician)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18734-4'">
    <xsl:value-of select="'Initial evaluation note (Occupational therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18735-1'">
    <xsl:value-of select="'Initial evaluation note (Physical therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18736-9'">
    <xsl:value-of select="'Initial evaluation note (Physician)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18737-7'">
    <xsl:value-of select="'Initial evaluation note (Podiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18738-5'">
    <xsl:value-of select="'Initial evaluation note (Psychology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18739-3'">
    <xsl:value-of select="'Initial evaluation note (Social service)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18740-1'">
    <xsl:value-of select="'Initial evaluation note (Speech therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18741-9'">
    <xsl:value-of select="'Subsequent visit evaluation note (Attending physician)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18742-7'">
    <xsl:value-of select="'Study report (Arthroscopy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18743-5'">
    <xsl:value-of select="'Autopsy report ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18744-3'">
    <xsl:value-of select="'Study report (Bronchoscopy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18745-0'">
    <xsl:value-of select="'Study report (Cardiac catheterization)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18746-8'">
    <xsl:value-of select="'Study report (Colonoscopy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18747-6'">
    <xsl:value-of select="'Study (CT)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18748-4'">
    <xsl:value-of select="'Study report (Diagnostic imaging)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18749-2'">
    <xsl:value-of select="'Study report (Electromyogram)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18750-0'">
    <xsl:value-of select="'Study report (Electrophysiology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18751-8'">
    <xsl:value-of select="'Study report (Endoscopy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18752-6'">
    <xsl:value-of select="'Study report (Exercise stress test)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18753-4'">
    <xsl:value-of select="'Study report (Flexible sigmoidoscopy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18754-2'">
    <xsl:value-of select="'Study report (Holter monitor)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18755-9'">
    <xsl:value-of select="'Study report (MRI)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18756-7'">
    <xsl:value-of select="'Study report (MRI)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18757-5'">
    <xsl:value-of select="'Study report (Radnuc)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18758-3'">
    <xsl:value-of select="'Study (PET scan)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18759-1'">
    <xsl:value-of select="'Study report (Spirometry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18760-9'">
    <xsl:value-of select="'Study (US)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18761-7'">
    <xsl:value-of select="'Transfer summarization note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18762-5'">
    <xsl:value-of select="'Subsequent evaluation note (Chiropractor)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18763-3'">
    <xsl:value-of select="'Initial evaluation note (Consulting physician)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18764-1'">
    <xsl:value-of select="'Subsequent evaluation note (Nurse practitioner)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18836-7'">
    <xsl:value-of select="'Procedure (*)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18841-7'">
    <xsl:value-of select="'Hospital consultations'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18842-5'">
    <xsl:value-of select="'Discharge summarization note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-24611-6'">
    <xsl:value-of select="'Confirmatory consultation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28032-1'">
    <xsl:value-of select="'Report.total (Cardiac echo)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28570-0'">
    <xsl:value-of select="'Procedure note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28571-8'">
    <xsl:value-of select="'Visit note (Speech therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28572-6'">
    <xsl:value-of select="'Initial evaluation note (Dentistry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28573-4'">
    <xsl:value-of select="'Surgical operation note (Physician)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28574-2'">
    <xsl:value-of select="'Discharge note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28575-9'">
    <xsl:value-of select="'Progress note (Nurse practitioner)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28577-5'">
    <xsl:value-of select="'Procedure note (Dentistry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28578-3'">
    <xsl:value-of select="'Visit note (Occupational therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28579-1'">
    <xsl:value-of select="'Visit note (Physical therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28580-9'">
    <xsl:value-of select="'Progress note (Chiropractor)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28581-7'">
    <xsl:value-of select="'Initial evaluation note (Chiropractor)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28583-3'">
    <xsl:value-of select="'Surgical operation note (Dentistry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28651-8'">
    <xsl:value-of select="'Transfer summarization note (Nursing)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28653-4'">
    <xsl:value-of select="'Visit note (Social service)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28568-4'">
    <xsl:value-of select="'Visit note (Physician)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28569-2'">
    <xsl:value-of select="'Subsequent evaluation note (Consulting physician)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28615-3'">
    <xsl:value-of select="'Audiology study'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28616-1'">
    <xsl:value-of select="'Transfer summarization note (Physician)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28617-9'">
    <xsl:value-of select="'Subsequent evaluation note (Dentistry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28618-7'">
    <xsl:value-of select="'Visit note (Dentistry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28621-1'">
    <xsl:value-of select="'Initial evaluation note (Nurse practitioner)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28622-9'">
    <xsl:value-of select="'Discharge assessment note (Nursing)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28623-7'">
    <xsl:value-of select="'Subsequent evaluation note (Nursing)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28624-5'">
    <xsl:value-of select="'Surgical operation note (Podiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28625-2'">
    <xsl:value-of select="'Procedure note (Podiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28626-0'">
    <xsl:value-of select="'History and physical note (Physician)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28627-8'">
    <xsl:value-of select="'Subsequent evaluation note (Psychiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28628-6'">
    <xsl:value-of select="'Visit note (Psychiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28633-6'">
    <xsl:value-of select="'Study report (Polysomnography)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28635-1'">
    <xsl:value-of select="'Initial evaluation note (Psychiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28636-9'">
    <xsl:value-of select="'Initial evaluation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28654-2'">
    <xsl:value-of select="'Initial evaluation note (Attending physician)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28655-9'">
    <xsl:value-of select="'Discharge summarization note (Attending physician)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-28656-7'">
    <xsl:value-of select="'Subsequent evaluation note (Social service)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-29749-9'">
    <xsl:value-of select="'Dialysis records'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-29750-7'">
    <xsl:value-of select="'Neonatal intensive care records'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-29751-5'">
    <xsl:value-of select="'Critical care records'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-29752-3'">
    <xsl:value-of select="'Perioperative records'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-29753-1'">
    <xsl:value-of select="'Initial evaluation note (Nursing)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-29754-9'">
    <xsl:value-of select="'Study report (Nystagmogram)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-29755-6'">
    <xsl:value-of select="'Study report (Nerve conduction)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-29756-4'">
    <xsl:value-of select="'Study report (Peritoneoscopy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-29757-2'">
    <xsl:value-of select="'Study report (Colposcopy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-29761-4'">
    <xsl:value-of select="'Discharge summarization note (Dentistry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34134-7'">
    <xsl:value-of select="'Supervisory note (Attending physician)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34135-4'">
    <xsl:value-of select="'Supervisory note (Attending physician.cardiology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34136-2'">
    <xsl:value-of select="'Supervisory note (Attending physician.gastroenterology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34137-0'">
    <xsl:value-of select="'Surgical operation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34138-8'">
    <xsl:value-of select="'Targeted history and physical note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34125-5'">
    <xsl:value-of select="'Subsequent evaluation note (Case manager)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34126-3'">
    <xsl:value-of select="'Subsequent evaluation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34127-1'">
    <xsl:value-of select="'Subsequent evaluation note (Dental hygienist)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34128-9'">
    <xsl:value-of select="'Subsequent evaluation note (Dentistry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34129-7'">
    <xsl:value-of select="'Subsequent evaluation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34130-5'">
    <xsl:value-of select="'Subsequent evaluation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34131-3'">
    <xsl:value-of select="'Subsequent evaluation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34132-1'">
    <xsl:value-of select="'Subsequent evaluation note (Pharmacy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34133-9'">
    <xsl:value-of select="'Summarization of episode note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34798-9'">
    <xsl:value-of select="'Consultation note (Neurosurgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34799-7'">
    <xsl:value-of select="'Evaluation and management note (Neurosurgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34800-3'">
    <xsl:value-of select="'Consultation note (Nutrition+Dietetics)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34801-1'">
    <xsl:value-of select="'Evaluation and management note (Nutrition+Dietetics)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34802-9'">
    <xsl:value-of select="'Evaluation and management note (Occupational health)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34803-7'">
    <xsl:value-of select="'Consultation note (Occupational health)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34804-5'">
    <xsl:value-of select="'Evaluation and management note (Occupational therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34805-2'">
    <xsl:value-of select="'Consultation note (Oncology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-33716-2'">
    <xsl:value-of select="'Study report (Cytology.non-gyn)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-33717-0'">
    <xsl:value-of select="'Study report (Cytology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-33718-8'">
    <xsl:value-of select="'Cytology report (Cyto stain)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-33719-6'">
    <xsl:value-of select="'Study report (Flow cytometry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-33720-4'">
    <xsl:value-of select="'Blood bank consult'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-33721-2'">
    <xsl:value-of select="'Bone marrow biopsy report'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34094-3'">
    <xsl:value-of select="'Admission history and physical note (Cardiology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34095-0'">
    <xsl:value-of select="'Comprehensive history and physical note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34096-8'">
    <xsl:value-of select="'Comprehensive history and physical note'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34097-6'">
    <xsl:value-of select="'Conference evaluation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34098-4'">
    <xsl:value-of select="'Conference evaluation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34099-2'">
    <xsl:value-of select="'Consultation note (Cardiology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34100-8'">
    <xsl:value-of select="'Consultation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34101-6'">
    <xsl:value-of select="'Consultation note (General medicine)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34102-4'">
    <xsl:value-of select="'Consultation note (Psychiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34103-2'">
    <xsl:value-of select="'Consultation note (Pulmonary)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34104-0'">
    <xsl:value-of select="'Consultation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34105-7'">
    <xsl:value-of select="'Discharge summarization note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34106-5'">
    <xsl:value-of select="'Discharge summarization note (Physician)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34107-3'">
    <xsl:value-of select="'Education procedure note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34108-1'">
    <xsl:value-of select="'Evaluation and management note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34109-9'">
    <xsl:value-of select="'Evaluation and management note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34110-7'">
    <xsl:value-of select="'Evaluation and management note (Diabetology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34111-5'">
    <xsl:value-of select="'Evaluation and management note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34112-3'">
    <xsl:value-of select="'Evaluation and management note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34113-1'">
    <xsl:value-of select="'Evaluation and management note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34114-9'">
    <xsl:value-of select="'Group counseling note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34115-6'">
    <xsl:value-of select="'History and physical note (Medical student)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34116-4'">
    <xsl:value-of select="'History and physical note (Physician)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34117-2'">
    <xsl:value-of select="'History and physical note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34118-0'">
    <xsl:value-of select="'Initial evaluation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34119-8'">
    <xsl:value-of select="'Initial evaluation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34120-6'">
    <xsl:value-of select="'Initial evaluation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34121-4'">
    <xsl:value-of select="'Interventional procedure note'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34122-2'">
    <xsl:value-of select="'Pathology procedure note (Pathology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34123-0'">
    <xsl:value-of select="'Pre-operative evaluation and management note (Anesthesia)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34124-8'">
    <xsl:value-of select="'Subsequent evaluation note (Cardiology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34139-6'">
    <xsl:value-of select="'Telephone encounter note (Nursing)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34140-4'">
    <xsl:value-of select="'Transfer of care referral note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34876-3'">
    <xsl:value-of select="'Pre-operative evaluation and management note (Surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34877-1'">
    <xsl:value-of select="'Surgical operation note (Urology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34878-9'">
    <xsl:value-of select="'Evaluation and management note (Emergency medicine)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34879-7'">
    <xsl:value-of select="'Consultation note (Endocrinology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34880-5'">
    <xsl:value-of select="'Post-operative evaluation and management note (Nurse.surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34881-3'">
    <xsl:value-of select="'Pre-operative evaluation and management note (Nurse.surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34861-5'">
    <xsl:value-of select="'Evaluation and management note (Diabetology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34862-3'">
    <xsl:value-of select="'Admission evaluation note (Attending physician.general medicine)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34863-1'">
    <xsl:value-of select="'Post-operative evaluation and management note (General surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34864-9'">
    <xsl:value-of select="'Counseling note (Mental health)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34865-6'">
    <xsl:value-of select="'Counseling note (Psychiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34866-4'">
    <xsl:value-of select="'Counseling note (Psychology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34867-2'">
    <xsl:value-of select="'Post-operative evaluation and management note (Ophthalmology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34868-0'">
    <xsl:value-of select="'Surgical operation note (Orthopedics)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34869-8'">
    <xsl:value-of select="'Counseling note (Pharmacy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34870-6'">
    <xsl:value-of select="'Surgical operation note (Plastic surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34871-4'">
    <xsl:value-of select="'Surgical operation note (Podiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34872-2'">
    <xsl:value-of select="'Counseling note (Social work)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34873-0'">
    <xsl:value-of select="'Admission evaluation note (Surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34874-8'">
    <xsl:value-of select="'Surgical operation note (Surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34875-5'">
    <xsl:value-of select="'Post-operative evaluation and management note (Surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34744-3'">
    <xsl:value-of select="'Admission evaluation note (Nursing)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34745-0'">
    <xsl:value-of select="'Discharge summarization note (Nursing)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34746-8'">
    <xsl:value-of select="'Evaluation and management note (Nursing)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34747-6'">
    <xsl:value-of select="'Pre-operative evaluation and management note (Nursing)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34748-4'">
    <xsl:value-of select="'Telephone encounter note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34749-2'">
    <xsl:value-of select="'Consultation note (Anesthesia)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34750-0'">
    <xsl:value-of select="'Evaluation and management note (Anesthesia)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34751-8'">
    <xsl:value-of select="'Pre-operative evaluation and management note (Anesthesia)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34752-6'">
    <xsl:value-of select="'Evaluation and management note (Cardiology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34753-4'">
    <xsl:value-of select="'Evaluation and management note (Cardiology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34754-2'">
    <xsl:value-of select="'Evaluation and management note (Critical care)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34755-9'">
    <xsl:value-of select="'Transfer summarization note (Critical care)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34756-7'">
    <xsl:value-of select="'Consultation note (Dentistry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34757-5'">
    <xsl:value-of select="'Evaluation and management note (Dentistry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34758-3'">
    <xsl:value-of select="'Consultation note (Dermatology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34759-1'">
    <xsl:value-of select="'Evaluation and management note (Dermatology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34760-9'">
    <xsl:value-of select="'Consultation note (Diabetology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34761-7'">
    <xsl:value-of select="'Consultation note (Gastroenterology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34762-5'">
    <xsl:value-of select="'Evaluation and management note (Gastroenterology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34763-3'">
    <xsl:value-of select="'Admission history and physical note (General medicine)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34764-1'">
    <xsl:value-of select="'Consultation note (General medicine)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34765-8'">
    <xsl:value-of select="'Evaluation and management note (General medicine)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34766-6'">
    <xsl:value-of select="'Evaluation and management note (General medicine)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34767-4'">
    <xsl:value-of select="'Evaluation and management note (Medical student.general medicine)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34768-2'">
    <xsl:value-of select="'Evaluation and management note (Nurse.general medicine)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34769-0'">
    <xsl:value-of select="'Evaluation and management note (Attending physician.general medicine)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34770-8'">
    <xsl:value-of select="'Transfer summarization note (General medicine)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34771-6'">
    <xsl:value-of select="'Consultation note (General surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34772-4'">
    <xsl:value-of select="'Evaluation and management note (General surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34773-2'">
    <xsl:value-of select="'Evaluation and management note (Attending physician.general surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34774-0'">
    <xsl:value-of select="'History and physical note (General surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34775-7'">
    <xsl:value-of select="'Pre-operative evaluation and management note (General surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34776-5'">
    <xsl:value-of select="'Consultation note (Gerontology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34777-3'">
    <xsl:value-of select="'Consultation note (Gynecology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34778-1'">
    <xsl:value-of select="'Evaluation and management note (Gynecology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34779-9'">
    <xsl:value-of select="'Consultation note (Hematology+Oncology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34780-7'">
    <xsl:value-of select="'Evaluation and management note (Hematology+Oncology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34781-5'">
    <xsl:value-of select="'Consultation note (Infectious disease)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34782-3'">
    <xsl:value-of select="'Evaluation and management note (Infectious disease)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34783-1'">
    <xsl:value-of select="'Consultation note (Kinesiotherapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34784-9'">
    <xsl:value-of select="'Evaluation and management note (Kinesiotherapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34785-6'">
    <xsl:value-of select="'Consultation note (Mental health)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34786-4'">
    <xsl:value-of select="'Evaluation and management note (Mental health)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34787-2'">
    <xsl:value-of select="'Group counseling note (Mental health)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34788-0'">
    <xsl:value-of select="'Consultation note (Psychiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34789-8'">
    <xsl:value-of select="'Evaluation and management note (Psychiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34790-6'">
    <xsl:value-of select="'Group counseling note (Psychiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34791-4'">
    <xsl:value-of select="'Consultation note (Psychology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34792-2'">
    <xsl:value-of select="'Evaluation and management note (Psychology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34793-0'">
    <xsl:value-of select="'Group counseling note (Psychology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34794-8'">
    <xsl:value-of select="'Evaluation and management note (Multidisciplinary)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34795-5'">
    <xsl:value-of select="'Consultation note (Nephrology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34796-3'">
    <xsl:value-of select="'Evaluation and management note (Nephrology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34797-1'">
    <xsl:value-of select="'Consultation note (Neurology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34806-0'">
    <xsl:value-of select="'Evaluation and management note (Oncology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34807-8'">
    <xsl:value-of select="'Consultation note (Ophthalmology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34808-6'">
    <xsl:value-of select="'Evaluation and management note (Ophthalmology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34809-4'">
    <xsl:value-of select="'Pre-operative evaluation and management note (Ophthalmology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34810-2'">
    <xsl:value-of select="'Consultation note (Optometry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34811-0'">
    <xsl:value-of select="'Evaluation and management note (Optometry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34812-8'">
    <xsl:value-of select="'Consultation note (Oromaxillofacial surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34813-6'">
    <xsl:value-of select="'Evaluation and management note (Oromaxillofacial surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34814-4'">
    <xsl:value-of select="'Consultation note (Orthopedics)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34815-1'">
    <xsl:value-of select="'Evaluation and management note (Orthopedics)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34816-9'">
    <xsl:value-of select="'Consultation note (Otorhinolaryngology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34817-7'">
    <xsl:value-of select="'Evaluation and management note (Otorhinolaryngology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34818-5'">
    <xsl:value-of select="'Surgical operation note (Otorhinolaryngology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34819-3'">
    <xsl:value-of select="'Evaluation and management note (Pathology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34820-1'">
    <xsl:value-of select="'Consultation note (Pharmacy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34821-9'">
    <xsl:value-of select="'Evaluation and management note (Pharmacy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34822-7'">
    <xsl:value-of select="'Consultation note (Physical medicine and rehabilitation)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34823-5'">
    <xsl:value-of select="'Evaluation and management note (Physical medicine and rehabilitation)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34824-3'">
    <xsl:value-of select="'Consultation note (Physical therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34825-0'">
    <xsl:value-of select="'Evaluation and management note (Physical therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34826-8'">
    <xsl:value-of select="'Consultation note (Plastic surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34827-6'">
    <xsl:value-of select="'Evaluation and management note (Plastic surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34828-4'">
    <xsl:value-of select="'Consultation note (Podiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34829-2'">
    <xsl:value-of select="'Evaluation and management note (Podiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34830-0'">
    <xsl:value-of select="'Evaluation and management note (Pulmonary)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34831-8'">
    <xsl:value-of select="'Consultation note (Radiation oncology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34832-6'">
    <xsl:value-of select="'Evaluation and management note (Radiation oncology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34833-4'">
    <xsl:value-of select="'Consultation note (Recreational therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34834-2'">
    <xsl:value-of select="'Evaluation and management note (Recreational therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34835-9'">
    <xsl:value-of select="'Consultation note (Rehabilitation)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34836-7'">
    <xsl:value-of select="'Evaluation and management note (Rehabilitation)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34837-5'">
    <xsl:value-of select="'Consultation note (Respiratory therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34838-3'">
    <xsl:value-of select="'Evaluation and management note (Respiratory therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34839-1'">
    <xsl:value-of select="'Consultation note (Rheumatology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34840-9'">
    <xsl:value-of select="'Evaluation and management note (Rheumatology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34841-7'">
    <xsl:value-of select="'Consultation note (Social work)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34842-5'">
    <xsl:value-of select="'Evaluation and management note (Social work)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34843-3'">
    <xsl:value-of select="'Group counseling note (Social work)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34844-1'">
    <xsl:value-of select="'Telephone encounter note (Social work)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34845-8'">
    <xsl:value-of select="'Consultation note (Speech therapy+Audiology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34846-6'">
    <xsl:value-of select="'Evaluation and management note (Speech therapy+Audiology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34847-4'">
    <xsl:value-of select="'Consultation note (Surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34848-2'">
    <xsl:value-of select="'Evaluation and management note (Surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34849-0'">
    <xsl:value-of select="'Consultation note (Thoracic surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34850-8'">
    <xsl:value-of select="'Evaluation and management note (Thoracic surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34851-6'">
    <xsl:value-of select="'Consultation note (Urology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34852-4'">
    <xsl:value-of select="'Evaluation and management note (Urology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34853-2'">
    <xsl:value-of select="'Consultation note (Vascular surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34854-0'">
    <xsl:value-of select="'Evaluation and management note (Vascular surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34855-7'">
    <xsl:value-of select="'Consultation note (Occupational therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34856-5'">
    <xsl:value-of select="'Evaluation and management note (Anticoagulation)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34857-3'">
    <xsl:value-of select="'Evaluation and management note (Substance abuse)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34858-1'">
    <xsl:value-of select="'Evaluation and management note (Pain management)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34859-9'">
    <xsl:value-of select="'Evaluation and management note (Hyperlipidemia)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34860-7'">
    <xsl:value-of select="'Evaluation and management note (Hypertension)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34895-3'">
    <xsl:value-of select="'Education note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34896-1'">
    <xsl:value-of select="'Interventional procedure note (Cardiology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34897-9'">
    <xsl:value-of select="'Education note (Diabetology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34898-7'">
    <xsl:value-of select="'Evaluation and management note (Endocrinology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34899-5'">
    <xsl:value-of select="'Interventional procedure note (Gastroenterology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34900-1'">
    <xsl:value-of select="'Subsequent evaluation note (General medicine)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34901-9'">
    <xsl:value-of select="'Subsequent evaluation note (General medicine)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34902-7'">
    <xsl:value-of select="'Education note (Gerontology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34903-5'">
    <xsl:value-of select="'Note (Mental health)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34904-3'">
    <xsl:value-of select="'Subsequent evaluation note (Mental health)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34905-0'">
    <xsl:value-of select="'Evaluation and management note (Neurology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-34906-8'">
    <xsl:value-of select="'Note (Pastoral care)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38269-7'">
    <xsl:value-of select="'Study report (XR.DEXA)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38932-0'">
    <xsl:value-of select="'VA C&amp;P exam.acromegaly ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38933-8'">
    <xsl:value-of select="'VA C&amp;P exam.aid and attendance &amp;or housebound ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38934-6'">
    <xsl:value-of select="'VA C&amp;P exam.arrhythmias ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38935-3'">
    <xsl:value-of select="'VA C&amp;P exam.miscellaneous arteries &amp;or veins ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38936-1'">
    <xsl:value-of select="'VA C&amp;P exam.audio ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38937-9'">
    <xsl:value-of select="'VA C&amp;P exam.bones fractures &amp;or bone disease ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38938-7'">
    <xsl:value-of select="'VA C&amp;P exam.brain &amp;or spinal cord ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38939-5'">
    <xsl:value-of select="'VA C&amp;P exam.chronic fatigue syndrome ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38940-3'">
    <xsl:value-of select="'VA C&amp;P exam.cold injury protocol ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38941-1'">
    <xsl:value-of select="'VA C&amp;P exam.cranial nerves ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38942-9'">
    <xsl:value-of select="'VA C&amp;P exam.Cushings syndrome ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38985-8'">
    <xsl:value-of select="'VA C&amp;P exam.social &amp;or industrial survey ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38986-6'">
    <xsl:value-of select="'VA C&amp;P exam.spine ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38987-4'">
    <xsl:value-of select="'VA C&amp;P exam.stomach &amp;or duodenum &amp;or peritoneal adhesions ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38988-2'">
    <xsl:value-of select="'VA C&amp;P exam.thyroid &amp;or parathyroid diseases ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38943-7'">
    <xsl:value-of select="'VA C&amp;P exam.dental &amp;or oral ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38944-5'">
    <xsl:value-of select="'VA C&amp;P exam.diabetes mellitus ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38945-2'">
    <xsl:value-of select="'VA C&amp;P exam.miscellaneous digestive conditions ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38946-0'">
    <xsl:value-of select="'VA C&amp;P exam.ear disease ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38947-8'">
    <xsl:value-of select="'VA C&amp;P exam.mental health eating disorders ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38948-6'">
    <xsl:value-of select="'VA C&amp;P exam.miscellaneous endocrine diseases ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38949-4'">
    <xsl:value-of select="'VA C&amp;P exam.epilepsy &amp;or narcolepsy ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38950-2'">
    <xsl:value-of select="'VA C&amp;P exam.esophagus &amp;or hiatal hernia ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38951-0'">
    <xsl:value-of select="'VA C&amp;P exam.eye ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38952-8'">
    <xsl:value-of select="'VA C&amp;P exam.feet ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38953-6'">
    <xsl:value-of select="'VA C&amp;P exam.fibromyalgia ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38954-4'">
    <xsl:value-of select="'VA C&amp;P exam.general medical ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38955-1'">
    <xsl:value-of select="'VA C&amp;P exam.genitourinary ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38956-9'">
    <xsl:value-of select="'VA C&amp;P exam.disability in gulf war veterans ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38957-7'">
    <xsl:value-of select="'VA C&amp;P exam.gynecological conditions &amp;or disorders of the breast ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38958-5'">
    <xsl:value-of select="'VA C&amp;P exam.hand &amp;or thumb &amp;or fingers ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38959-3'">
    <xsl:value-of select="'VA C&amp;P exam.heart ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38960-1'">
    <xsl:value-of select="'VA C&amp;P exam.hemic disorders ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38961-9'">
    <xsl:value-of select="'VA C&amp;P exam.HIV-related illness ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38962-7'">
    <xsl:value-of select="'VA C&amp;P exam.hypertension ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38963-5'">
    <xsl:value-of select="'VA C&amp;P exam.infectious &amp;or immune &amp;or nutritional disabilities ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38964-3'">
    <xsl:value-of select="'VA C&amp;P exam.initial evaluation post-traumatic stress disorder ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38965-0'">
    <xsl:value-of select="'VA C&amp;P exam.large &amp;or small intestines ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38966-8'">
    <xsl:value-of select="'VA C&amp;P exam.extremity joints ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38967-6'">
    <xsl:value-of select="'VA C&amp;P exam.liver &amp;or gall bladder &amp;or pancreas ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38968-4'">
    <xsl:value-of select="'VA C&amp;P exam.lymphatic disorders ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38969-2'">
    <xsl:value-of select="'VA C&amp;P exam.general mental disorders ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38970-0'">
    <xsl:value-of select="'VA C&amp;P exam.mouth &amp;or lips &amp;or tongue ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38971-8'">
    <xsl:value-of select="'VA C&amp;P exam.muscles ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38972-6'">
    <xsl:value-of select="'VA C&amp;P exam.miscellaneous neurological disorders ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38973-4'">
    <xsl:value-of select="'VA C&amp;P exam.nose &amp;or sinus &amp;or larynx &amp;or pharynx ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38974-2'">
    <xsl:value-of select="'VA C&amp;P exam.peripheral nerves ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38975-9'">
    <xsl:value-of select="'VA C&amp;P exam.prisoner of war protocol ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38976-7'">
    <xsl:value-of select="'VA C&amp;P exam.pulmonary tuberculosis &amp;or mycobacterial diseases ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38977-5'">
    <xsl:value-of select="'VA C&amp;P exam.rectum &amp;or anus ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38978-3'">
    <xsl:value-of select="'VA C&amp;P exam.residuals of amputations ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38979-1'">
    <xsl:value-of select="'VA C&amp;P exam.obstructive &amp;or restrictive &amp;or interstitial respiratory diseases ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38980-9'">
    <xsl:value-of select="'VA C&amp;P exam.miscellaneous respiratory diseases ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38981-7'">
    <xsl:value-of select="'VA C&amp;P exam.review evaluation post-traumatic stress disorder ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38982-5'">
    <xsl:value-of select="'VA C&amp;P exam.scars ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38983-3'">
    <xsl:value-of select="'VA C&amp;P exam.sense of smell &amp;or taste ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38984-1'">
    <xsl:value-of select="'VA C&amp;P exam.skin diseases other than scars ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-46208-5'">
    <xsl:value-of select="'Nursing notes'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-46209-3'">
    <xsl:value-of select="'Provider orders'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-46210-1'">
    <xsl:value-of select="'Note (Case manager)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-46213-5'">
    <xsl:value-of select="'Tilt table study'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-46214-3'">
    <xsl:value-of select="'Intracardiac ablation study'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-46215-0'">
    <xsl:value-of select="'Note (Wound care management)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-46242-4'">
    <xsl:value-of select="'Vital signs measurements'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-46264-8'">
    <xsl:value-of select="'History of medical device use ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47039-3'">
    <xsl:value-of select="'Admission history and physical note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47040-1'">
    <xsl:value-of select="'Confirmatory consultation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47041-9'">
    <xsl:value-of select="'Confirmatory consultation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47042-7'">
    <xsl:value-of select="'Counseling note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47043-5'">
    <xsl:value-of select="'Group counseling note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47044-3'">
    <xsl:value-of select="'Initial evaluation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47045-0'">
    <xsl:value-of select="'Study report ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47046-8'">
    <xsl:value-of select="'Summary of death ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47047-6'">
    <xsl:value-of select="'Supervisory note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47048-4'">
    <xsl:value-of select="'Diagnostic interventional study report (Interventional radiology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47049-2'">
    <xsl:value-of select="'Communication ({Non-patient})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47245-6'">
    <xsl:value-of select="'HIV Rx Form'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47420-5'">
    <xsl:value-of select="'Functional status assessment ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47519-4'">
    <xsl:value-of select="'History of Procedures ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47520-2'">
    <xsl:value-of select="'Cytology report (Cyto stain)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47521-0'">
    <xsl:value-of select="'Cytology report (Cyto stain)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47522-8'">
    <xsl:value-of select="'Cytology report (Cyto stain)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47523-6'">
    <xsl:value-of select="'Cytology report (Cyto stain)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47524-4'">
    <xsl:value-of select="'Cytology report (Cyto stain)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47525-1'">
    <xsl:value-of select="'Cytology report (Cyto stain)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47526-9'">
    <xsl:value-of select="'Cytology report (Cyto stain)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47527-7'">
    <xsl:value-of select="'Cytology report (Cyto stain.thin prep)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47528-5'">
    <xsl:value-of select="'Cytology report (Cyto stain)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47529-3'">
    <xsl:value-of select="'Cytology report (XXX stain)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-47530-1'">
    <xsl:value-of select="'Cytology report (Cyto stain)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-48768-6'">
    <xsl:value-of select="'Payment sources'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-48764-5'">
    <xsl:value-of select="'Summary purpose'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-48765-2'">
    <xsl:value-of select="'Allergies, adverse reactions, alerts'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-48807-2'">
    <xsl:value-of select="'Bone marrow aspiration report'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-50007-4'">
    <xsl:value-of select="'Cytology report (Cyto stain)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-51969-4'">
    <xsl:value-of select="'Genetic analysis summary report (Molgen)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52030-4'">
    <xsl:value-of select="'Explanation of benefits attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52031-2'">
    <xsl:value-of select="'Explanation of benefits to subscriber attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52032-0'">
    <xsl:value-of select="'Appeal denial letter attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52033-8'">
    <xsl:value-of select="'General correspondence attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52034-6'">
    <xsl:value-of select="'Payer letter attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52035-3'">
    <xsl:value-of select="'Home health claims attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52036-1'">
    <xsl:value-of select="'Home health prior authorization attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52037-9'">
    <xsl:value-of select="'Member ID card copy attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52038-7'">
    <xsl:value-of select="'Subscriber Information including retroactive and presumptive eligibility attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52039-5'">
    <xsl:value-of select="'Skilled Nursing Facility record attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52040-3'">
    <xsl:value-of select="'Dental X-rays and other images (not DICOM) attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52041-1'">
    <xsl:value-of select="'Blood glucose monitors attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-50971-1'">
    <xsl:value-of select="'Cytology report (Cyto stain)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-51897-7'">
    <xsl:value-of select="'Healthcare Associated Infection report ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-51898-5'">
    <xsl:value-of select="'Risk factors ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-51899-3'">
    <xsl:value-of select="'Details ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-51900-9'">
    <xsl:value-of select="'Summary ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-51845-6'">
    <xsl:value-of select="'Consultation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-51846-4'">
    <xsl:value-of select="'Consultation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-51847-2'">
    <xsl:value-of select="'Assessment+Plan note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-51848-0'">
    <xsl:value-of select="'Assessment note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-51849-8'">
    <xsl:value-of select="'Admission history and physical note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-51850-6'">
    <xsl:value-of select="'Physical findings (Observed)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-51851-4'">
    <xsl:value-of select="'Administrative note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-51852-2'">
    <xsl:value-of select="'Letter ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-51853-0'">
    <xsl:value-of select="'Consultation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-51854-8'">
    <xsl:value-of select="'Consultation note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-51855-5'">
    <xsl:value-of select="'Note (Patient)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-51965-2'">
    <xsl:value-of select="'Pharmacogenetic analysis report (Molgen)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52027-0'">
    <xsl:value-of select="'Abortion consent attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52028-8'">
    <xsl:value-of select="'Hysterectomy consent attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52029-6'">
    <xsl:value-of select="'Sterilization consent attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52042-9'">
    <xsl:value-of select="'Continuous positive airway pressure attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52043-7'">
    <xsl:value-of select="'Enteral nutrition attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52044-5'">
    <xsl:value-of select="'External infusion pump attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52045-2'">
    <xsl:value-of select="'Gait trainers attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52046-0'">
    <xsl:value-of select="'Hospital beds attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52047-8'">
    <xsl:value-of select="'Immunosuppressive drugs attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52048-6'">
    <xsl:value-of select="'Lymphedema pumps attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52049-4'">
    <xsl:value-of select="'Manual wheelchair attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52050-2'">
    <xsl:value-of select="'Motorized wheelchair attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52051-0'">
    <xsl:value-of select="'Orthotics + prosthetics attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52052-8'">
    <xsl:value-of select="'Osteogenesis stimulators attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52053-6'">
    <xsl:value-of select="'Oxygen attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52054-4'">
    <xsl:value-of select="'Parenteral attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52055-1'">
    <xsl:value-of select="'Power operated vehicles attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52056-9'">
    <xsl:value-of select="'Repair of durable medical equipment attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52057-7'">
    <xsl:value-of select="'Seat lift mechanism attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52058-5'">
    <xsl:value-of select="'Seating systems attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52059-3'">
    <xsl:value-of select="'Speech generating device attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52060-1'">
    <xsl:value-of select="'Standers + standing frames attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52061-9'">
    <xsl:value-of select="'Support surfaces attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52062-7'">
    <xsl:value-of select="'Transcutaneous electrical neural stimulation attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52063-5'">
    <xsl:value-of select="'Prescription for durable medical equipment attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52064-3'">
    <xsl:value-of select="'First report of injury attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52065-0'">
    <xsl:value-of select="'Automobile liability attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52066-8'">
    <xsl:value-of select="'Notice of Discharge Medicare Appeal Rights Form attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52067-6'">
    <xsl:value-of select="'Past filing limit justification attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52068-4'">
    <xsl:value-of select="'Property and casualty state mandated forms attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52069-2'">
    <xsl:value-of select="'Tax ID number - IRS form W9 attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52070-0'">
    <xsl:value-of select="'Workers compensation attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52071-8'">
    <xsl:value-of select="'Employee assistance program attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52072-6'">
    <xsl:value-of select="'Non-emergency transportation attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52073-4'">
    <xsl:value-of select="'Vision attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-52075-9'">
    <xsl:value-of select="'Purchase invoice attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-53242-4'">
    <xsl:value-of select="'Charge ticket or encounter form attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-53243-2'">
    <xsl:value-of select="'Advance beneficiary notice attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-53244-0'">
    <xsl:value-of select="'Notice of privacy practices receipt attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-53245-7'">
    <xsl:value-of select="'Driver license image attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-53246-5'">
    <xsl:value-of select="'Non-medical services attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-53247-3'">
    <xsl:value-of select="'Eligibility acknowledgement attachment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-53576-5'">
    <xsl:value-of select="'Personal health monitoring report ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-54094-8'">
    <xsl:value-of select="'Triage note'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-54095-5'">
    <xsl:value-of select="'Chemotherapy effectiveness panel'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-54096-3'">
    <xsl:value-of select="'Identity testing (Molgen)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55107-7'">
    <xsl:value-of select="'Addendum'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55108-5'">
    <xsl:value-of select="'Clinical presentation'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55109-3'">
    <xsl:value-of select="'Complications'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55110-1'">
    <xsl:value-of select="'Conclusions'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55111-9'">
    <xsl:value-of select="'Current imaging procedure descriptions'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55112-7'">
    <xsl:value-of select="'Document summary'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55113-5'">
    <xsl:value-of select="'Key images (Radiology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55114-3'">
    <xsl:value-of select="'Prior imaging procedure descriptions'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55115-0'">
    <xsl:value-of select="'Requested imaging studies information'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55182-0'">
    <xsl:value-of select="'Quality Reporting Document Architecture incidence report'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55183-8'">
    <xsl:value-of select="'Quality Reporting Document Architecture patient list report'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55184-6'">
    <xsl:value-of select="'Quality Reporting Document Architecture calculated summary report'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55185-3'">
    <xsl:value-of select="'Measure set'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55186-1'">
    <xsl:value-of select="'Measure'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55187-9'">
    <xsl:value-of select="'Reporting parameters'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55188-7'">
    <xsl:value-of select="'Patient data'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55228-1'">
    <xsl:value-of select="'Study report (Cytogenetics)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55229-9'">
    <xsl:value-of select="'Study report (Immune stain)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55230-7'">
    <xsl:value-of select="'Study report (Immunophenotyping)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55750-4'">
    <xsl:value-of select="'Patient safety report'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55751-2'">
    <xsl:value-of select="'Public health case report'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57056-4'">
    <xsl:value-of select="'Labor and delivery admission history and physical ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57057-2'">
    <xsl:value-of select="'Labor and delivery summary ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57058-0'">
    <xsl:value-of select="'Maternal Discharge Summary ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-56444-3'">
    <xsl:value-of select="'Healthcare communication'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-56445-0'">
    <xsl:value-of select="'Medication summary'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-56446-8'">
    <xsl:value-of select="'Appointment summary'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-56447-6'">
    <xsl:value-of select="'Treatment plan'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57016-8'">
    <xsl:value-of select="'Privacy policy acknowledgment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57017-6'">
    <xsl:value-of select="'Privacy policy'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57024-2'">
    <xsl:value-of select="'Health Quality Measure document'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57053-1'">
    <xsl:value-of select="'Note (Nursing)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57054-9'">
    <xsl:value-of select="'Triage and nursing note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57055-6'">
    <xsl:value-of select="'Antepartum summary ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57129-9'">
    <xsl:value-of select="'Full newborn screening summary report for display or printing'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57133-1'">
    <xsl:value-of select="'Referral note'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57134-9'">
    <xsl:value-of select="'Referral note (Dentistry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57135-6'">
    <xsl:value-of select="'Referral note (Dermatology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57136-4'">
    <xsl:value-of select="'Referral note (Diabetology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57137-2'">
    <xsl:value-of select="'Referral note (Endocrinology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57138-0'">
    <xsl:value-of select="'Referral note (Gastroenterology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57139-8'">
    <xsl:value-of select="'Referral note (General medicine)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57140-6'">
    <xsl:value-of select="'Referral note (General surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57141-4'">
    <xsl:value-of select="'Referral note (Infectious disease)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57142-2'">
    <xsl:value-of select="'Referral note (Kinesiotherapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57143-0'">
    <xsl:value-of select="'Referral note (Mental health)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57144-8'">
    <xsl:value-of select="'Referral note (Nephrology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57145-5'">
    <xsl:value-of select="'Referral note (Neurology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57146-3'">
    <xsl:value-of select="'Referral note (Neurosurgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57147-1'">
    <xsl:value-of select="'Referral note (Occupational health)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57148-9'">
    <xsl:value-of select="'Referral note (Occupational therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57149-7'">
    <xsl:value-of select="'Referral note (Oncology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57150-5'">
    <xsl:value-of select="'Referral note (Ophthalmology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57151-3'">
    <xsl:value-of select="'Referral note (Optometry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57152-1'">
    <xsl:value-of select="'Referral note (Pharmacy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57153-9'">
    <xsl:value-of select="'Referral note (Physical medicine and rehabilitation)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57154-7'">
    <xsl:value-of select="'Referral note (Physical therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57155-4'">
    <xsl:value-of select="'Referral note (Plastic surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57156-2'">
    <xsl:value-of select="'Referral note (Podiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57157-0'">
    <xsl:value-of select="'Referral note (Psychiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57158-8'">
    <xsl:value-of select="'Referral note (Psychology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57159-6'">
    <xsl:value-of select="'Referral note (Radiation oncology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57160-4'">
    <xsl:value-of select="'Referral note (Recreational therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57161-2'">
    <xsl:value-of select="'Referral note (Rehabilitation)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57162-0'">
    <xsl:value-of select="'Referral note (Respiratory therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57163-8'">
    <xsl:value-of select="'Referral note (Rheumatology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57164-6'">
    <xsl:value-of select="'Referral note (Social Work)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57165-3'">
    <xsl:value-of select="'Referral note (Speech therapy)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57166-1'">
    <xsl:value-of select="'Referral note (Surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57167-9'">
    <xsl:value-of select="'Referral note (Thoracic surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57168-7'">
    <xsl:value-of select="'Referral note (Urology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57169-5'">
    <xsl:value-of select="'Referral note (Vascular surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57170-3'">
    <xsl:value-of select="'Referral note (Cardiovascular disease)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57171-1'">
    <xsl:value-of select="'Referral note (Geriatric medicine)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57172-9'">
    <xsl:value-of select="'Referral note (Hematology and Oncology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57173-7'">
    <xsl:value-of select="'Referral note (Nutrition and Dietetics)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57174-5'">
    <xsl:value-of select="'Referral note (Oral surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57175-2'">
    <xsl:value-of select="'Referral note (Orthopedic surgery)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57176-0'">
    <xsl:value-of select="'Referral note (Otolaryngology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57177-8'">
    <xsl:value-of select="'Referral note (Pulmonary disease)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57178-6'">
    <xsl:value-of select="'Referral note (Critical care medicine)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57179-4'">
    <xsl:value-of select="'Referral note (Obstetrics and Gynecology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57829-4'">
    <xsl:value-of select="'Prescription for medical equipment or product'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57830-2'">
    <xsl:value-of select="'Admission request'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57831-0'">
    <xsl:value-of select="'Prescription for rehabilitation'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57832-8'">
    <xsl:value-of select="'Prescription for diagnostic or specialist care'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57833-6'">
    <xsl:value-of select="'Prescription for medication'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57834-4'">
    <xsl:value-of select="'Patient transportation request'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-58477-1'">
    <xsl:value-of select="'Study report (Pulmonary function)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-59258-4'">
    <xsl:value-of select="'Discharge summarization note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-59259-2'">
    <xsl:value-of select="'Discharge summarization note (Psychiatry)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-59268-3'">
    <xsl:value-of select="'Neonatal care report'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-59281-6'">
    <xsl:value-of select="'Transthoracic cardiac echo study report (US)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-59282-4'">
    <xsl:value-of select="'Stress cardiac echo study report (US)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-59283-2'">
    <xsl:value-of select="'Well child visit note ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-59284-0'">
    <xsl:value-of select="'Consent (Patient)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-60280-5'">
    <xsl:value-of select="'Discharge instructions ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-60281-3'">
    <xsl:value-of select="'Discharge Instructions ({Provider})'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-60568-3'">
    <xsl:value-of select="'Synoptic report'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-60569-1'">
    <xsl:value-of select="'Report addendum.synoptic'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-60570-9'">
    <xsl:value-of select="'Consultation note (Pathology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-60571-7'">
    <xsl:value-of select="'Consultation note.synoptic (Pathology)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-60590-7'">
    <xsl:value-of select="'Medication dispensed.brief'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-60591-5'">
    <xsl:value-of select="'Patient summary'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-60592-3'">
    <xsl:value-of select="'Patient summary.unexpected contact'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-60593-1'">
    <xsl:value-of select="'Medication dispensed.extended'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-61143-4'">
    <xsl:value-of select="'Summary (Nursing)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-61145-9'">
    <xsl:value-of select="'Patient plan of care'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-61356-2'">
    <xsl:value-of select="'Medication pharmaceutical advice.extended'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-61357-0'">
    <xsl:value-of select="'Medication pharmaceutical advice.brief'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-61358-8'">
    <xsl:value-of select="'Surgerical operation consent (Patient)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-61359-6'">
    <xsl:value-of select="'Anesthesia consent (Patient)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-62385-0'">
    <xsl:value-of select="'Recommendation'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10160-0'">
    <xsl:value-of select="'History of medication use'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10162-6'">
    <xsl:value-of select="'History of pregnancies'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10164-2'">
    <xsl:value-of select="'History of present illness'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10167-5'">
    <xsl:value-of select="'History of surgical procedures'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10830-8'">
    <xsl:value-of select="'Surgical operation note complications'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10154-3'">
    <xsl:value-of select="'Chief complaint'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10155-0'">
    <xsl:value-of select="'History of allergies'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10157-6'">
    <xsl:value-of select="'History of family member diseases'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10183-2'">
    <xsl:value-of select="'Hospital discharge medications'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10184-0'">
    <xsl:value-of select="'Hospital discharge physical findings'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10187-3'">
    <xsl:value-of select="'Review of systems'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10210-3'">
    <xsl:value-of select="'Physical findings'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10213-7'">
    <xsl:value-of select="'Surgical operation note anesthesia'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10215-2'">
    <xsl:value-of select="'Surgical operation note findings'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10216-0'">
    <xsl:value-of select="'Surgical operation note fluids'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10217-8'">
    <xsl:value-of select="'Surgical operation note indications'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10218-6'">
    <xsl:value-of select="'Surgical operation note postoperative Dx'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10219-4'">
    <xsl:value-of select="'Surgical operation note preoperative Dx'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10221-0'">
    <xsl:value-of select="'Surgical operation note specimens taken'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-10223-6'">
    <xsl:value-of select="'Surgical operation note surgical procedure'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11535-2'">
    <xsl:value-of select="'Hospital discharge Dx'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11537-8'">
    <xsl:value-of select="'Surgical drains'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11283-9'">
    <xsl:value-of select="'Acuity assessment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11302-7'">
    <xsl:value-of select="'ED disposition'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11329-0'">
    <xsl:value-of select="'History general'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11332-4'">
    <xsl:value-of select="'History of cognitive function'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11336-5'">
    <xsl:value-of select="'History of hospitalizations'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11346-4'">
    <xsl:value-of select="'History of outpatient visits'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11348-0'">
    <xsl:value-of select="'History of past illness'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11369-6'">
    <xsl:value-of select="'History of immunization'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11370-4'">
    <xsl:value-of select="'Immunization status'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11450-4'">
    <xsl:value-of select="'Problem list'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11459-5'">
    <xsl:value-of select="'Transport mode'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-11493-4'">
    <xsl:value-of select="'Hospital discharge studies summary'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18769-0'">
    <xsl:value-of select="'Microbial susceptibility tests'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18610-6'">
    <xsl:value-of select="'Medication.administered'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18776-5'">
    <xsl:value-of select="'Plan of treatment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18782-3'">
    <xsl:value-of select="'Study observation'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18783-1'">
    <xsl:value-of select="'Study recommendation'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18785-6'">
    <xsl:value-of select="'Reason for study'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-18834-2'">
    <xsl:value-of select="'Comparison.study'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-19005-8'">
    <xsl:value-of select="'Imaging study'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-22029-3'">
    <xsl:value-of select="'Physical exam.total'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-29299-5'">
    <xsl:value-of select="'Reason for visit'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-29545-1'">
    <xsl:value-of select="'Physical findings'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-29762-2'">
    <xsl:value-of select="'Social history'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-30954-2'">
    <xsl:value-of select="'Relevant diagnostic tests &amp;or laboratory data'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38212-7'">
    <xsl:value-of select="'Pain assessment panel'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-38227-5'">
    <xsl:value-of select="'Braden scale score.total'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-42348-3'">
    <xsl:value-of select="'Advance directives'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-42349-1'">
    <xsl:value-of select="'Reason for referral'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-46239-0'">
    <xsl:value-of select="'Chief complaint+Reason for visit'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-46240-8'">
    <xsl:value-of select="'History of hospitalizations+History of outpatient visits'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-46241-6'">
    <xsl:value-of select="'Hospital admission Dx'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55102-8'">
    <xsl:value-of select="'Surgical operation note disposition'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55103-6'">
    <xsl:value-of select="'Surgical operation note estimated blood loss'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-55104-4'">
    <xsl:value-of select="'Surgical operation note planned procedure'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-5511-1'">
    <xsl:value-of select="'CD62E'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57059-8'">
    <xsl:value-of select="'Pregnancy visit summary'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57060-6'">
    <xsl:value-of select="'Estimated date of delivery'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57072-1'">
    <xsl:value-of select="'Intravenous fluids administered'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57073-9'">
    <xsl:value-of select="'Prenatal events'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57074-7'">
    <xsl:value-of select="'Labor and delivery process'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57075-4'">
    <xsl:value-of select="'Newborn delivery information'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57076-2'">
    <xsl:value-of select="'Postpartum hospitalization treatment'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57077-0'">
    <xsl:value-of select="'Newborn status at maternal discharge'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57078-8'">
    <xsl:value-of select="'Antenatal testing and surveillance'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57079-6'">
    <xsl:value-of select="'Birth plan'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57080-4'">
    <xsl:value-of select="'Implanted medical device'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57081-2'">
    <xsl:value-of select="'Anesthesia risk review of systems'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-56836-0'">
    <xsl:value-of select="'History of blood transfusion'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-56838-6'">
    <xsl:value-of select="'History of infectious disease'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57025-9'">
    <xsl:value-of select="'Data criteria'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57026-7'">
    <xsl:value-of select="'Population criteria'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57027-5'">
    <xsl:value-of select="'Measure observations'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57827-8'">
    <xsl:value-of select="'Reason for co-payment exemption'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-5782-8'">
    <xsl:value-of select="'Crystals'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57828-6'">
    <xsl:value-of select="'Prescriptions'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-57826-0'">
    <xsl:value-of select="'Co-payment amount'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-59768-2'">
    <xsl:value-of select="'Procedure indications'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-59769-0'">
    <xsl:value-of select="'Postprocedure diagnosis'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-59770-8'">
    <xsl:value-of select="'Procedure estimated blood loss'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-59771-6'">
    <xsl:value-of select="'Procedure implants'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-59772-4'">
    <xsl:value-of select="'Planned procedure'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-59773-2'">
    <xsl:value-of select="'Procedure specimens taken'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-59774-0'">
    <xsl:value-of select="'Procedure anesthesia'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-59775-7'">
    <xsl:value-of select="'Procedure disposition'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-59776-5'">
    <xsl:value-of select="'Procedure findings'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-61144-2'">
    <xsl:value-of select="'Diet and nutrition'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-61146-7'">
    <xsl:value-of select="'Goals'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-61147-5'">
    <xsl:value-of select="'Expected outcomes'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-8724-7'">
    <xsl:value-of select="'Surgical operation note description'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-8716-3'">
    <xsl:value-of select="'Physical findings'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-8648-8'">
    <xsl:value-of select="'Hospital course'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-8658-7'">
    <xsl:value-of select="'History of allergies'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1-8675-5'">
    <xsl:value-of select="'Fluid intake.intravascular'"/>
</xsl:when>
<xsl:when test="$key = '1.0.3166.1.2.2'">
    <xsl:value-of select="'ISO 3166 Alpha 2'"/>
</xsl:when>
<xsl:when test="$key = '1.0.639.1'">
    <xsl:value-of select="'ISO 639-1'"/>
</xsl:when>
<xsl:when test="$key = '1.2.276.0.76.5.409'">
    <xsl:value-of select="'ICD-10-DE'"/>
</xsl:when>
<xsl:when test="$key = '1.3.160'">
    <xsl:value-of select="'EAN Artikelcodes'"/>
</xsl:when>
<xsl:when test="$key = '2.16.528.1.1007.3.1'">
    <xsl:value-of select="'UZI-Zorgverlener'"/>
</xsl:when>
<xsl:when test="$key = '2.16.528.1.1007.3.2'">
    <xsl:value-of select="'UZI-Systemen'"/>
</xsl:when>
<xsl:when test="$key = '2.16.528.1.1007.3.3'">
    <xsl:value-of select="'UZI-Registernummer'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.1.4.1'">
    <xsl:value-of select="'NHS Number'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.15.1060'">
    <xsl:value-of select="'RoleCodeNL Zorgaanbiedertype'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.15.111'">
    <xsl:value-of select="'RoleCodeNL Zorgverlenertype'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.15.2'">
    <xsl:value-of select="'RoleCodeNL Organisatiedeeltype'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.15.20'">
    <xsl:value-of select="'Mate van overgevoeligheid'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.15.4'">
    <xsl:value-of select="'ActRegistryNL Gegevenssoort'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.2.70.10'">
    <xsl:value-of select="'Indicatie geheim'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.3.11.6'">
    <xsl:value-of select="'RoleCodeNL WettelijkeVertegenwoordiger'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.3.11.8'">
    <xsl:value-of select="'RolCodeNL Toegang Patiënt'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.6.1'">
    <xsl:value-of select="'Vektis AGB-Z'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.6.3'">
    <xsl:value-of select="'NL National PID'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.6.4'">
    <xsl:value-of select="'NL UZOVI'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.3.23.5.1'">
    <xsl:value-of select="'PALGA servicetypes'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.3.23.5.3'">
    <xsl:value-of select="'PALGA types obductie'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.1.361'">
    <xsl:value-of select="'G-Standaard Bestand 361 a-tabel (eenheid gebruiksadvies)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.1.651'">
    <xsl:value-of select="'G-Standaard Bestand 651 (obsolete)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.1.652'">
    <xsl:value-of select="'G-Standaard Bestand 652 (obsolete)'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.1.725'">
    <xsl:value-of select="'G-Standaard Bestand 725'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.1.750'">
    <xsl:value-of select="'G-Standaard Bestand 750'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.1.900.2'">
    <xsl:value-of select="'G-Standaard bestand 902 Thesaurus 2'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.1.902.122'">
    <xsl:value-of select="'G-Standaard Tabel 122'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.1.902.40'">
    <xsl:value-of select="'G-Standaard Tabel 40'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.1'">
    <xsl:value-of select="'G-Standaard GPK'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.10'">
    <xsl:value-of select="'G-Standaard PRK'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.11'">
    <xsl:value-of select="'G-Standaard tabel 902 thesaurus 0006'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.12'">
    <xsl:value-of select="'G-Standaard tabel 902 thesaurus 4'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.13'">
    <xsl:value-of select="'Perinatologische observatiecodes'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.14'">
    <xsl:value-of select="'Perinatologische procedurecodes'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.15'">
    <xsl:value-of select="'Nederlandse postcodes'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.16.34'">
    <xsl:value-of select="'GBA Landcodes'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.2.14'">
    <xsl:value-of select="'LMR ontslagbestemmingen'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.2'">
    <xsl:value-of select="'Tabel 25'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.3'">
    <xsl:value-of select="'Tabel 25 Tijdseenheden'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.30.1045'">
    <xsl:value-of select="'Gecodeerde antwoorden bij Code diagnostische bepalingen'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.30.11'">
    <xsl:value-of select="'NHG Tabel 11 Code sociale laag'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.30.12'">
    <xsl:value-of select="'NHG Tabel 12 Code specialisme'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.30.14'">
    <xsl:value-of select="'NHG Tabel 14 Code contact'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.30.15'">
    <xsl:value-of select="'Code verrichtingen'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.30.20'">
    <xsl:value-of select="'NHG Tabel 20 Code opleiding'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.30.45'">
    <xsl:value-of select="'Code diagnostische bepalingen'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.31.1'">
    <xsl:value-of select="'ICPC-1-NL'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.32.2'">
    <xsl:value-of select="'Journaalregeltypen'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.4'">
    <xsl:value-of select="'Tabel 25 Eenheden gebruiksadvies'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.5'">
    <xsl:value-of select="'NHG Tabel 25 B-codes'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.6'">
    <xsl:value-of select="'NHG Tabel 25 Aanvullende teksten'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.7'">
    <xsl:value-of select="'G-Standaard HPK'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.8'">
    <xsl:value-of select="'G-Standaard ZI_nummer'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.80'">
    <xsl:value-of select="'Cliq catalogus van hulpmiddelen'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.4.9'">
    <xsl:value-of select="'G-Standaard thesaurus subtabel 0007'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.6.14'">
    <xsl:value-of select="'JGZ Regios'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.6.5'">
    <xsl:value-of select="'Nederlands Ministerie'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.6.6'">
    <xsl:value-of select="'LSP Applicatie ID'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.6.70'">
    <xsl:value-of select="'SBV-Z Identificatiedocumenttypes'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.3.42'">
    <xsl:value-of select="'DoD MHS'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.3.933'">
    <xsl:value-of select="'HL7 Demo'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.4.1'">
    <xsl:value-of select="'SSN'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.4.6'">
    <xsl:value-of select="'NPI'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1'">
    <xsl:value-of select="'AdministrativeGender'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1001'">
    <xsl:value-of select="'ActMood'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1008'">
    <xsl:value-of select="'NullFlavor'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1011'">
    <xsl:value-of select="'Phone type'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1012'">
    <xsl:value-of select="'Address type'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1053'">
    <xsl:value-of select="'ActUncertainty'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1057'">
    <xsl:value-of select="'ContextControl'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1060'">
    <xsl:value-of select="'EntityCode'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1064'">
    <xsl:value-of select="'ParticipationMode'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1067'">
    <xsl:value-of select="'QueryResponse'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1068'">
    <xsl:value-of select="'RoleStatus'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1071'">
    <xsl:value-of select="'SubstitutionCondition'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1077'">
    <xsl:value-of select="'EducationLevel'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1082'">
    <xsl:value-of select="'AcknowledgementDetail'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1100'">
    <xsl:value-of select="'AcknowledgementDetailCode'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.1112'">
    <xsl:value-of select="'QueryRequestLimit'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.102'">
    <xsl:value-of select="'QueryPriority'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.111'">
    <xsl:value-of select="'RoleCode'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.112'">
    <xsl:value-of select="'RouteOfAdministration'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.139'">
    <xsl:value-of select="'TimingEvent'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.14'">
    <xsl:value-of select="'ActStatus'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.18'">
    <xsl:value-of select="'AcknowledgementType'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.2'">
    <xsl:value-of select="'MaritalStatus'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.25'">
    <xsl:value-of select="'Confidentiality'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.33'">
    <xsl:value-of select="'DocumentCompletion'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.34'">
    <xsl:value-of select="'DocumentStorage'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.109'">
    <xsl:value-of select="'ResponseModality'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.4'">
    <xsl:value-of select="'ActCode'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.6'">
    <xsl:value-of select="'ActClass'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.60'">
    <xsl:value-of select="'LanguageAbilityMode'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.61'">
    <xsl:value-of select="'LanguageAbilityProficiency'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.7'">
    <xsl:value-of select="'ActPriority'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.83'">
    <xsl:value-of select="'Observation Interpretation'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.85'">
    <xsl:value-of select="'OrderableDrugForm'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.88'">
    <xsl:value-of select="'ParticipationFunction'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.5.89'">
    <xsl:value-of select="'ParticipationSignature'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.1'">
    <xsl:value-of select="'LOINC'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.3.2'">
    <xsl:value-of select="'ICD-10-NL'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.21'"> 
    <xsl:value-of select="'National Uniform Billing Council, UB 92'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.73'">
    <xsl:value-of select="'WHO ATC'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.90'">
    <xsl:value-of select="'ICD-10-CM'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.96'">
    <xsl:value-of select="'SNOMED CT'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.101'">
    <xsl:value-of select="'NUCC Provider Types'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.6.121'">
    <xsl:value-of select="'HumanLanguage'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.12.443'">
    <xsl:value-of select="'HL7v2 Table 443 Provider Role Code'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.19'">
    <xsl:value-of select="'Examples'"/>
</xsl:when>
<xsl:when test="$key = 'javascript-injection-warning'">
    <xsl:value-of select="'WARNING: Javascript injection attempt detected in source CDA document. Terminating'"/>
</xsl:when>
<xsl:when test="$key = 'malicious-content-warning'">
    <xsl:value-of select="'WARNING: Potentially malicious content found in CDA document.'"/>
</xsl:when>
<xsl:when test="$key = 'is-in-the-whitelist'">
    <xsl:value-of select="'is in the whitelist'"/>
</xsl:when>
<xsl:when test="$key = 'non-local-image-found-1'">
    <xsl:value-of select="'WARNING: non-local image found'"/>
</xsl:when>
<xsl:when test="$key = 'non-local-image-found-2'">
    <xsl:value-of select="'. Removing. If you wish to preserve non-local images please set the limit-external-images param to no.'"/>
</xsl:when>
<xsl:when test="$key = 'logicalOR'">
    <xsl:value-of select="'OR'"/>
</xsl:when>
<xsl:when test="$key = 'logicalAND'">
    <xsl:value-of select="'AND'"/>
</xsl:when>
<xsl:when test="$key = 'Expand All'">
    <xsl:value-of select="'Expand All'"/>
</xsl:when>
<xsl:when test="$key = 'Collapse All'">
    <xsl:value-of select="'Collapse All'"/>
</xsl:when>
<xsl:when test="$key = 'Expand'">
    <xsl:value-of select="'Expand'"/>
</xsl:when>
<xsl:when test="$key = 'Collapse'">
    <xsl:value-of select="'Collapse'"/>
</xsl:when>
<xsl:when test="$key = 'untitled_doc'">
    <xsl:value-of select="'Untitled Document'"/>
</xsl:when>
<xsl:when test="$key = 'no_human_display'">
    <xsl:value-of select="'No human-readable content available'"/>
</xsl:when>
<xsl:when test="$key = 'subject-heading'">
    <xsl:value-of select="'Subject Details'"/>
</xsl:when>
<xsl:when test="$key = 'author-heading'">
    <xsl:value-of select="'Author Details'"/>
</xsl:when>
<xsl:when test="$key = 'encounter-heading'">
    <xsl:value-of select="'Encounter Details'"/>
</xsl:when>
<xsl:when test="$key = 'untitled-section'">
    <xsl:value-of select="'Untitled Section'"/>
</xsl:when>
<xsl:when test="$key = 'err-fhir-1'">
    <xsl:value-of select="'Source document must be a bundle'"/>
</xsl:when>
<xsl:when test="$key = 'err-fhir-2'">
    <xsl:value-of select="'Bundle must start with a Composition resource'"/>
</xsl:when>
<xsl:when test="$key = 'err-fhir-3'">
    <xsl:value-of select="'Warning: Bundle type does not indicate it is a document.'"/>
</xsl:when>
<xsl:when test="$key = 'err-fhir-4'">
    <xsl:value-of select="'Error: The document composition includes a reference to a resource not contained inside the document bundle:'"/>
</xsl:when>
<xsl:when test="$key = 'err-fhir-5'">
    <xsl:value-of select="'Error: A referenced resource is not contained and is not fully qualified:'"/>
</xsl:when>
<xsl:when test="$key = 'err-fhir-6'">
    <xsl:value-of select="'Warning: Headings exceed 6 levels deep. Remaining headings converted to simple paragraphs'"/>
</xsl:when>
<xsl:when test="$key = 'err-fhir-7'">
    <xsl:value-of select="'Source document must be a composition'"/>
</xsl:when>
<xsl:when test="$key = 'ucum-s'">
    <xsl:value-of select="'second'"/>
</xsl:when>
<xsl:when test="$key = 'ucum-min'">
    <xsl:value-of select="'minute'"/>
</xsl:when>
<xsl:when test="$key = 'ucum-h'">
    <xsl:value-of select="'hour'"/>
</xsl:when>
<xsl:when test="$key = 'ucum-d'">
    <xsl:value-of select="'day'"/>
</xsl:when>
<xsl:when test="$key = 'ucum-wk'">
    <xsl:value-of select="'week'"/>
</xsl:when>
<xsl:when test="$key = 'ucum-mo'">
    <xsl:value-of select="'month'"/>
</xsl:when>
<xsl:when test="$key = 'ucum-a'">
    <xsl:value-of select="'year'"/>
</xsl:when>
<xsl:when test="$key = 'ucums-s'">
    <xsl:value-of select="'seconds'"/>
</xsl:when>
<xsl:when test="$key = 'ucums-min'">
    <xsl:value-of select="'minutes'"/>
</xsl:when>
<xsl:when test="$key = 'ucums-h'">
    <xsl:value-of select="'hours'"/>
</xsl:when>
<xsl:when test="$key = 'ucums-d'">
    <xsl:value-of select="'days'"/>
</xsl:when>
<xsl:when test="$key = 'ucums-wk'">
    <xsl:value-of select="'weeks'"/>
</xsl:when>
<xsl:when test="$key = 'ucums-mo'">
    <xsl:value-of select="'months'"/>
</xsl:when>
<xsl:when test="$key = 'ucums-a'">
    <xsl:value-of select="'year'"/>
</xsl:when>
<xsl:when test="$key = 'eventtiming-HS'">
    <xsl:value-of select="'before (trying to) sleep'"/>
</xsl:when>
<xsl:when test="$key = 'eventtiming-WAKE'">
    <xsl:value-of select="'after waking'"/>
</xsl:when>
<xsl:when test="$key = 'eventtiming-C'">
    <xsl:value-of select="'at a meal'"/>
</xsl:when>
<xsl:when test="$key = 'eventtiming-CM'">
    <xsl:value-of select="'at breakfast'"/>
</xsl:when>
<xsl:when test="$key = 'eventtiming-CD'">
    <xsl:value-of select="'at lunch'"/>
</xsl:when>
<xsl:when test="$key = 'eventtiming-CV'">
    <xsl:value-of select="'at dinner'"/>
</xsl:when>
<xsl:when test="$key = 'eventtiming-AC'">
    <xsl:value-of select="'before a meal'"/>
</xsl:when>
<xsl:when test="$key = 'eventtiming-ACM'">
    <xsl:value-of select="'before breakfast'"/>
</xsl:when>
<xsl:when test="$key = 'eventtiming-ACD'">
    <xsl:value-of select="'before lunch'"/>
</xsl:when>
<xsl:when test="$key = 'eventtiming-ACV'">
    <xsl:value-of select="'before dinner'"/>
</xsl:when>
<xsl:when test="$key = 'eventtiming-PC'">
    <xsl:value-of select="'after a meal'"/>
</xsl:when>
<xsl:when test="$key = 'eventtiming-PCM'">
    <xsl:value-of select="'after breakfast'"/>
</xsl:when>
<xsl:when test="$key = 'eventtiming-PCD'">
    <xsl:value-of select="'after lunch'"/>
</xsl:when>
<xsl:when test="$key = 'eventtiming-PCV'">
    <xsl:value-of select="'after dinner'"/>
</xsl:when>
<xsl:when test="$key = 'status-draft'">
    <xsl:value-of select="'draft'"/>
</xsl:when>
<xsl:when test="$key = 'status-active'">
    <xsl:value-of select="'active'"/>
</xsl:when>
<xsl:when test="$key = 'status-suspended'">
    <xsl:value-of select="'suspended'"/>
</xsl:when>
<xsl:when test="$key = 'status-completed'">
    <xsl:value-of select="'completed'"/>
</xsl:when>
<xsl:when test="$key = 'status-entered-in-error'">
    <xsl:value-of select="'entered-in-error'"/>
</xsl:when>
<xsl:when test="$key = 'status-cancelled'">
    <xsl:value-of select="'cancelled'"/>
</xsl:when>
<xsl:when test="$key = 'status-unknown'">
    <xsl:value-of select="'unknown'"/>
</xsl:when>
<xsl:when test="$key = 'status-inactive'">
    <xsl:value-of select="'inactive'"/>
</xsl:when>
<xsl:when test="$key = 'status-resolved'">
    <xsl:value-of select="'resolved'"/>
</xsl:when>
<xsl:when test="$key = 'status-unconfirmed'">
    <xsl:value-of select="'unconfirmed'"/>
</xsl:when>
<xsl:when test="$key = 'status-confirmed'">
    <xsl:value-of select="'confirmed'"/>
</xsl:when>
<xsl:when test="$key = 'status-refuted'">
    <xsl:value-of select="'refuted'"/>
</xsl:when>
<xsl:when test="$key = 'status-recurrence'">
    <xsl:value-of select="'recurrence'"/>
</xsl:when>
<xsl:when test="$key = 'status-remission'">
    <xsl:value-of select="'remission'"/>
</xsl:when>
<xsl:when test="$key = 'status-provisional'">
    <xsl:value-of select="'provisional'"/>
</xsl:when>
<xsl:when test="$key = 'status-differential'">
    <xsl:value-of select="'differential'"/>
</xsl:when>
<xsl:when test="$key = 'status-proposed'">
    <xsl:value-of select="'proposed'"/>
</xsl:when>
<xsl:when test="$key = 'status-pending'">
    <xsl:value-of select="'pending'"/>
</xsl:when>
<xsl:when test="$key = 'status-booked'">
    <xsl:value-of select="'booked'"/>
</xsl:when>
<xsl:when test="$key = 'status-arrived'">
    <xsl:value-of select="'arrived'"/>
</xsl:when>
<xsl:when test="$key = 'status-fulfilled'">
    <xsl:value-of select="'fulfilled'"/>
</xsl:when>
<xsl:when test="$key = 'status-noshow'">
    <xsl:value-of select="'noshow'"/>
</xsl:when>
<xsl:when test="$key = 'status-busy'">
    <xsl:value-of select="'busy'"/>
</xsl:when>
<xsl:when test="$key = 'status-free'">
    <xsl:value-of select="'free'"/>
</xsl:when>
<xsl:when test="$key = 'status-busy-unavailable'">
    <xsl:value-of select="'busy unavailable'"/>
</xsl:when>
<xsl:when test="$key = 'status-busy-tentative'">
    <xsl:value-of select="'busy tentative'"/>
</xsl:when>
<xsl:when test="$key = 'status-not-started'">
    <xsl:value-of select="'not started'"/>
</xsl:when>
<xsl:when test="$key = 'status-scheduled'">
    <xsl:value-of select="'scheduled'"/>
</xsl:when>
<xsl:when test="$key = 'status-in-progress'">
    <xsl:value-of select="'in progress'"/>
</xsl:when>
<xsl:when test="$key = 'status-on-hold'">
    <xsl:value-of select="'on hold'"/>
</xsl:when>
<xsl:when test="$key = 'status-onhold'">
    <xsl:value-of select="'on hold'"/>
</xsl:when>
<xsl:when test="$key = 'status-rejected'">
    <xsl:value-of select="'rejected'"/>
</xsl:when>
<xsl:when test="$key = 'status-intended'">
    <xsl:value-of select="'intended'"/>
</xsl:when>
<xsl:when test="$key = 'status-stopped'">
    <xsl:value-of select="'stopped'"/>
</xsl:when>
<xsl:when test="$key = 'status-finished'">
    <xsl:value-of select="'finished'"/>
</xsl:when>
<xsl:when test="$key = 'status-planned'">
    <xsl:value-of select="'planned'"/>
</xsl:when>
<xsl:when test="$key = 'status-available'">
    <xsl:value-of select="'available'"/>
</xsl:when>
<xsl:when test="$key = 'status-unavailable'">
    <xsl:value-of select="'unavailable'"/>
</xsl:when>
<xsl:when test="$key = 'status-unsatisfactory'">
    <xsl:value-of select="'unsatisfactory'"/>
</xsl:when>
<xsl:when test="$key = 'status-final'">
    <xsl:value-of select="'final'"/>
</xsl:when>
<xsl:when test="$key = 'status-aborted'">
    <xsl:value-of select="'aborted'"/>
</xsl:when>
<xsl:when test="$key = 'status-preparation'">
    <xsl:value-of select="'preparation'"/>
</xsl:when>
<xsl:when test="$key = 'status-amended'">
    <xsl:value-of select="'amended'"/>
</xsl:when>
<xsl:when test="$key = 'status-corrected'">
    <xsl:value-of select="'corrected'"/>
</xsl:when>
<xsl:when test="$key = 'status-current'">
    <xsl:value-of select="'current'"/>
</xsl:when>
<xsl:when test="$key = 'status-registered'">
    <xsl:value-of select="'registered'"/>
</xsl:when>
<xsl:when test="$key = 'status-preliminary'">
    <xsl:value-of select="'preliminary'"/>
</xsl:when>
<xsl:when test="$key = 'status-retired'">
    <xsl:value-of select="'retired'"/>
</xsl:when>
<xsl:when test="$key = 'status-requested'">
    <xsl:value-of select="'requested'"/>
</xsl:when>
<xsl:when test="$key = 'status-accepted'">
    <xsl:value-of select="'accepted'"/>
</xsl:when>
<xsl:when test="$key = 'status-on-target'">
    <xsl:value-of select="'on target'"/>
</xsl:when>
<xsl:when test="$key = 'status-ahead-of-target'">
    <xsl:value-of select="'ahead of target'"/>
</xsl:when>
<xsl:when test="$key = 'status-behind-target'">
    <xsl:value-of select="'behind target'"/>
</xsl:when>
<xsl:when test="$key = 'status-sustaining'">
    <xsl:value-of select="'sustaining'"/>
</xsl:when>
<xsl:when test="$key = 'status-achieved'">
    <xsl:value-of select="'achieved'"/>
</xsl:when>
<xsl:when test="$key = 'status-failed'">
    <xsl:value-of select="'failed'"/>
</xsl:when>
<xsl:when test="$key = 'status-ready'">
    <xsl:value-of select="'ready'"/>
</xsl:when>
<xsl:when test="$key = 'status-waitlist'">
    <xsl:value-of select="'waitlist'"/>
</xsl:when>
<xsl:when test="$key = 'intent-proposal'">
    <xsl:value-of select="'proposal'"/>
</xsl:when>
<xsl:when test="$key = 'intent-plan'">
    <xsl:value-of select="'plan'"/>
</xsl:when>
<xsl:when test="$key = 'intent-order'">
    <xsl:value-of select="'order'"/>
</xsl:when>
<xsl:when test="$key = 'intent-original-order'">
    <xsl:value-of select="'original order'"/>
</xsl:when>
<xsl:when test="$key = 'intent-reflex-order'">
    <xsl:value-of select="'reflex order'"/>
</xsl:when>
<xsl:when test="$key = 'intent-filler-order'">
    <xsl:value-of select="'filler order'"/>
</xsl:when>
<xsl:when test="$key = 'intent-instance-order'">
    <xsl:value-of select="'instance order'"/>
</xsl:when>
<xsl:when test="$key = 'intent-option'">
    <xsl:value-of select="'option'"/>
</xsl:when>
<xsl:when test="$key = 'listmode-working'">
    <xsl:value-of select="'Working List'"/>
</xsl:when>
<xsl:when test="$key = 'listmode-snapshot'">
    <xsl:value-of select="'Snapshot List'"/>
</xsl:when>
<xsl:when test="$key = 'listmode-changes'">
    <xsl:value-of select="'Changes List'"/>
</xsl:when>
<xsl:when test="$key = 'requestpriority-routine'">
    <xsl:value-of select="'routine'"/>
</xsl:when>
<xsl:when test="$key = 'requestpriority-urgent'">
    <xsl:value-of select="'urgent'"/>
</xsl:when>
<xsl:when test="$key = 'requestpriority-asap'">
    <xsl:value-of select="'asap'"/>
</xsl:when>
<xsl:when test="$key = 'requestpriority-stat'">
    <xsl:value-of select="'stat'"/>
</xsl:when>
<xsl:when test="$key = 'Activity'">
    <xsl:value-of select="'Activity'"/>
</xsl:when>
<xsl:when test="$key = 'Consenting Party'">
    <xsl:value-of select="'Consenting Party'"/>
</xsl:when>
<xsl:when test="$key = 'Method'">
    <xsl:value-of select="'Method'"/>
</xsl:when>
<xsl:when test="$key = 'Dose Status'">
    <xsl:value-of select="'Dose Status'"/>
</xsl:when>
<xsl:when test="$key = 'Dose Status Reason'">
    <xsl:value-of select="'Dose Status Reason'"/>
</xsl:when>
<xsl:when test="$key = 'Sequence'">
    <xsl:value-of select="'Sequence'"/>
</xsl:when>
<xsl:when test="$key = 'Practitioner'">
    <xsl:value-of select="'Practitioner'"/>
</xsl:when>
<xsl:when test="$key = 'PractitionerRole'">
    <xsl:value-of select="'Practitioner Role'"/>
</xsl:when>
<xsl:when test="$key = 'Task'">
    <xsl:value-of select="'Task'"/>
</xsl:when>
<xsl:when test="$key = 'Ordered By'">
    <xsl:value-of select="'Ordered By'"/>
</xsl:when>
<xsl:when test="$key = 'Preferred Pharmacy'">
    <xsl:value-of select="'Preferred Pharmacy'"/>
</xsl:when>
<xsl:when test="$key = 'Operator'">
    <xsl:value-of select="'Operator'"/>
</xsl:when>
<xsl:when test="$key = 'Related'">
    <xsl:value-of select="'Related'"/>
</xsl:when>
<xsl:when test="$key = 'Based On'">
    <xsl:value-of select="'Based On'"/>
</xsl:when>
<xsl:when test="$key = 'Derived From'">
    <xsl:value-of select="'Derived From'"/>
</xsl:when>
<xsl:when test="$key = 'Business Status'">
    <xsl:value-of select="'Business Status'"/>
</xsl:when>
<xsl:when test="$key = 'Capacity'">
    <xsl:value-of select="'Capacity'"/>
</xsl:when>
<xsl:when test="$key = 'Group ID'">
    <xsl:value-of select="'Group ID'"/>
</xsl:when>
<xsl:when test="$key = 'Effective Time'">
    <xsl:value-of select="'Effective Time'"/>
</xsl:when>
<xsl:when test="$key = 'Enteral Formula'">
    <xsl:value-of select="'Enteral Formula'"/>
</xsl:when>
<xsl:when test="$key = 'Enteral Nutrition'">
    <xsl:value-of select="'Enteral Nutrition'"/>
</xsl:when>
<xsl:when test="$key = 'Feeding Tube Length'">
    <xsl:value-of select="'Feeding Tube Length'"/>
</xsl:when>
<xsl:when test="$key = 'Administered'">
    <xsl:value-of select="'Administered'"/>
</xsl:when>
<xsl:when test="$key = 'Container'">
    <xsl:value-of select="'Container'"/>
</xsl:when>
<xsl:when test="$key = 'Endpoint'">
    <xsl:value-of select="'Endpoint'"/>
</xsl:when>
<xsl:when test="$key = 'Consent Period'">
    <xsl:value-of select="'Consent Period'"/>
</xsl:when>
<xsl:when test="$key = 'Repetitions'">
    <xsl:value-of select="'Repetitions'"/>
</xsl:when>
<xsl:when test="$key = 'Requested Performer'">
    <xsl:value-of select="'Requested Performer'"/>
</xsl:when>
<xsl:when test="$key = 'Requested Performer Type'">
    <xsl:value-of select="'Requested Performer Type'"/>
</xsl:when>
<xsl:when test="$key = 'Requester'">
    <xsl:value-of select="'Requester'"/>
</xsl:when>
<xsl:when test="$key = 'Relevant History'">
    <xsl:value-of select="'Relevant History'"/>
</xsl:when>
<xsl:when test="$key = 'Input'">
    <xsl:value-of select="'Input'"/>
</xsl:when>
<xsl:when test="$key = 'Output'">
    <xsl:value-of select="'Output'"/>
</xsl:when>
<xsl:when test="$key = 'Responsible Owner'">
    <xsl:value-of select="'Responsible Owner'"/>
</xsl:when>
<xsl:when test="$key = 'Instruction'">
    <xsl:value-of select="'Instruction'"/>
</xsl:when>
<xsl:when test="$key = 'Interpretation'">
    <xsl:value-of select="'Interpretation'"/>
</xsl:when>
<xsl:when test="$key = 'on behalf of'">
    <xsl:value-of select="'on behalf of'"/>
</xsl:when>
<xsl:when test="$key = 'Healthcare Service'">
    <xsl:value-of select="'Healthcare Service'"/>
</xsl:when>
<xsl:when test="$key = 'Reported By Performer'">
    <xsl:value-of select="'Reported By Performer'"/>
</xsl:when>
<xsl:when test="$key = 'Reference Range'">
    <xsl:value-of select="'Reference Range'"/>
</xsl:when>
<xsl:when test="$key = 'Immunization'">
    <xsl:value-of select="'Immunization'"/>
</xsl:when>
<xsl:when test="$key = 'ImmunizationRecommendation'">
    <xsl:value-of select="'ImmunizationRecommendation'"/>
</xsl:when>
<xsl:when test="$key = 'Supporting Immunization'">
    <xsl:value-of select="'Supporting Immunization'"/>
</xsl:when>
<xsl:when test="$key = 'Supporting Information'">
    <xsl:value-of select="'Supporting Information'"/>
</xsl:when>
<xsl:when test="$key = 'Occurrence'">
    <xsl:value-of select="'Occurrence'"/>
</xsl:when>
<xsl:when test="$key = 'Media Collected DateTime'">
    <xsl:value-of select="'Media Collected DateTime'"/>
</xsl:when>
<xsl:when test="$key = 'Media Collected Period'">
    <xsl:value-of select="'Media Collected Period'"/>
</xsl:when>
<xsl:when test="$key = 'Mode'">
    <xsl:value-of select="'Mode'"/>
</xsl:when>
<xsl:when test="$key = 'Permission'">
    <xsl:value-of select="'Permission'"/>
</xsl:when>
<xsl:when test="$key = 'Start'">
    <xsl:value-of select="'Start'"/>
</xsl:when>
<xsl:when test="$key = 'Available'">
    <xsl:value-of select="'Available'"/>
</xsl:when>
<xsl:when test="$key = 'Not Available'">
    <xsl:value-of select="'Not Available'"/>
</xsl:when>
<xsl:when test="$key = 'Availability Exceptions'">
    <xsl:value-of select="'Availability Exceptions'"/>
</xsl:when>
<xsl:when test="$key = 'Living at home'">
    <xsl:value-of select="'Living at home'"/>
</xsl:when>
<xsl:when test="$key = 'Living away from home'">
    <xsl:value-of select="'Living away from home'"/>
</xsl:when>
<xsl:when test="$key = 'Living at home unknown'">
    <xsl:value-of select="'Living at home unknown'"/>
</xsl:when>
<xsl:when test="$key = 'All Day'">
    <xsl:value-of select="'All Day'"/>
</xsl:when>
<xsl:when test="$key = 'Amount'">
    <xsl:value-of select="'Amount'"/>
</xsl:when>
<xsl:when test="$key = 'Legally Capable'">
    <xsl:value-of select="'Legally Capable'"/>
</xsl:when>
<xsl:when test="$key = 'Legal Status'">
    <xsl:value-of select="'Legal Status'"/>
</xsl:when>
<xsl:when test="$key = 'Due'">
    <xsl:value-of select="'Due'"/>
</xsl:when>
<xsl:when test="$key = 'Target'">
    <xsl:value-of select="'Target'"/>
</xsl:when>
<xsl:when test="$key = 'CareTeam'">
    <xsl:value-of select="'Care Team'"/>
</xsl:when>
<xsl:when test="$key = 'Performed'">
    <xsl:value-of select="'Performed'"/>
</xsl:when>
<xsl:when test="$key = 'General Practitioner'">
    <xsl:value-of select="'General Practitioner'"/>
</xsl:when>
<xsl:when test="$key = 'Care Manager'">
    <xsl:value-of select="'Care Manager'"/>
</xsl:when>
<xsl:when test="$key = 'Managing Organization'">
    <xsl:value-of select="'Managing Organization'"/>
</xsl:when>
<xsl:when test="$key = 'Category'">
    <xsl:value-of select="'Category'"/>
</xsl:when>
<xsl:when test="$key = 'Deleted'">
    <xsl:value-of select="'Deleted'"/>
</xsl:when>
<xsl:when test="$key = 'Data'">
    <xsl:value-of select="'Data'"/>
</xsl:when>
<xsl:when test="$key = 'Data Period'">
    <xsl:value-of select="'Data Period'"/>
</xsl:when>
<xsl:when test="$key = 'Do NOT do'">
    <xsl:value-of select="'Do NOT do'"/>
</xsl:when>
<xsl:when test="$key = 'Dose Number'">
    <xsl:value-of select="'Dose Number'"/>
</xsl:when>
<xsl:when test="$key = 'Do Not Perform'">
    <xsl:value-of select="'Do Not Perform'"/>
</xsl:when>
<xsl:when test="$key = 'Context'">
    <xsl:value-of select="'Context'"/>
</xsl:when>
<xsl:when test="$key = 'Details'">
    <xsl:value-of select="'Details'"/>
</xsl:when>
<xsl:when test="$key = 'Definition'">
    <xsl:value-of select="'Definition'"/>
</xsl:when>
<xsl:when test="$key = 'Detail Definition'">
    <xsl:value-of select="'Detail Definition'"/>
</xsl:when>
<xsl:when test="$key = 'Medical Device'">
    <xsl:value-of select="'Medical Device'"/>
</xsl:when>
<xsl:when test="$key = 'Goal'">
    <xsl:value-of select="'Goal'"/>
</xsl:when>
<xsl:when test="$key = 'Linked To'">
    <xsl:value-of select="'Linked To'"/>
</xsl:when>
<xsl:when test="$key = 'Location'">
    <xsl:value-of select="'Location'"/>
</xsl:when>
<xsl:when test="$key = 'Appointment'">
    <xsl:value-of select="'Appointment'"/>
</xsl:when>
<xsl:when test="$key = 'Binary'">
    <xsl:value-of select="'Binary'"/>
</xsl:when>
<xsl:when test="$key = 'Slot'">
    <xsl:value-of select="'Slot'"/>
</xsl:when>
<xsl:when test="$key = 'Specialty'">
    <xsl:value-of select="'Specialty'"/>
</xsl:when>
<xsl:when test="$key = 'Service Type'">
    <xsl:value-of select="'Service Type'"/>
</xsl:when>
<xsl:when test="$key = 'Problem'">
    <xsl:value-of select="'Problem'"/>
</xsl:when>
<xsl:when test="$key = 'Note'">
    <xsl:value-of select="'Note'"/>
</xsl:when>
<xsl:when test="$key = 'Outcome'">
    <xsl:value-of select="'Outcome'"/>
</xsl:when>
<xsl:when test="$key = 'Scheduled'">
    <xsl:value-of select="'Scheduled'"/>
</xsl:when>
<xsl:when test="$key = 'Schedule'">
    <xsl:value-of select="'Schedule'"/>
</xsl:when>
<xsl:when test="$key = 'Device'">
    <xsl:value-of select="'Device'"/>
</xsl:when>
<xsl:when test="$key = 'Organization'">
    <xsl:value-of select="'Organization'"/>
</xsl:when>
<xsl:when test="$key = 'Nationality'">
    <xsl:value-of select="'Nationality'"/>
</xsl:when>
<xsl:when test="$key = 'Description'">
    <xsl:value-of select="'Description'"/>
</xsl:when>
<xsl:when test="$key = 'Patient Instructions'">
    <xsl:value-of select="'Patient Instructions'"/>
</xsl:when>
<xsl:when test="$key = 'Timing'">
    <xsl:value-of select="'Timing'"/>
</xsl:when>
<xsl:when test="$key = 'Lumen or Line'">
    <xsl:value-of select="'Lumen or Line'"/>
</xsl:when>
<xsl:when test="$key = 'Line Status'">
    <xsl:value-of select="'Line Status'"/>
</xsl:when>
<xsl:when test="$key = 'Lumen Location'">
    <xsl:value-of select="'Lumen Location'"/>
</xsl:when>
<xsl:when test="$key = 'Lock Fluid'">
    <xsl:value-of select="'Lock Fluid'"/>
</xsl:when>
<xsl:when test="$key = 'Administering System'">
    <xsl:value-of select="'Administering System'"/>
</xsl:when>
<xsl:when test="$key = 'Infusion Fluid'">
    <xsl:value-of select="'Infusion Fluid'"/>
</xsl:when>
<xsl:when test="$key = 'Peripheral'">
    <xsl:value-of select="'Peripheral'"/>
</xsl:when>
<xsl:when test="$key = 'Alias'">
    <xsl:value-of select="'Alias'"/>
</xsl:when>
<xsl:when test="$key = 'Online Editable'">
    <xsl:value-of select="'Online Editable'"/>
</xsl:when>
<xsl:when test="$key = 'until'">
    <xsl:value-of select="'until'"/>
</xsl:when>
<xsl:when test="$key = 'MedicationAdministration'">
    <xsl:value-of select="'MedicationAdministration'"/>
</xsl:when>
<xsl:when test="$key = 'Medication Agreement'">
    <xsl:value-of select="'Medication Agreement'"/>
</xsl:when>
<xsl:when test="$key = 'Dispense Request'">
    <xsl:value-of select="'Dispense Request'"/>
</xsl:when>
<xsl:when test="$key = 'Administration Agreement'">
    <xsl:value-of select="'Administration Agreement'"/>
</xsl:when>
<xsl:when test="$key = 'Medication Dispense'">
    <xsl:value-of select="'Medication Dispense'"/>
</xsl:when>
<xsl:when test="$key = 'Medication Use'">
    <xsl:value-of select="'Medication Use'"/>
</xsl:when>
<xsl:when test="$key = 'DiagnosticReport'">
    <xsl:value-of select="'DiagnosticReport'"/>
</xsl:when>
<xsl:when test="$key = 'List'">
    <xsl:value-of select="'List'"/>
</xsl:when>
<xsl:when test="$key = 'Used Item'">
    <xsl:value-of select="'Used Item'"/>
</xsl:when>
<xsl:when test="$key = 'Participants'">
    <xsl:value-of select="'Participants'"/>
</xsl:when>
<xsl:when test="$key = 'Onset'">
    <xsl:value-of select="'Onset'"/>
</xsl:when>
<xsl:when test="$key = 'Abatement'">
    <xsl:value-of select="'Abatement'"/>
</xsl:when>
<xsl:when test="$key = 'Last Occurrence'">
    <xsl:value-of select="'Last Occurrence'"/>
</xsl:when>
<xsl:when test="$key = 'Modified Date'">
    <xsl:value-of select="'Modified Date'"/>
</xsl:when>
<xsl:when test="$key = 'Reaction'">
    <xsl:value-of select="'Reaction'"/>
</xsl:when>
<xsl:when test="$key = 'Stage'">
    <xsl:value-of select="'Stage'"/>
</xsl:when>
<xsl:when test="$key = 'Evidence'">
    <xsl:value-of select="'Evidence'"/>
</xsl:when>
<xsl:when test="$key = 'frequency'">
    <xsl:value-of select="'frequency'"/>
</xsl:when>
<xsl:when test="$key = 'times'">
    <xsl:value-of select="'times'"/>
</xsl:when>
<xsl:when test="$key = 'of'">
    <xsl:value-of select="'of'"/>
</xsl:when>
<xsl:when test="$key = 'once'">
    <xsl:value-of select="'once'"/>
</xsl:when>
<xsl:when test="$key = 'max'">
    <xsl:value-of select="'max'"/>
</xsl:when>
<xsl:when test="$key = 'frequency max'">
    <xsl:value-of select="'frequency max'"/>
</xsl:when>
<xsl:when test="$key = 'bounds'">
    <xsl:value-of select="'bounds'"/>
</xsl:when>
<xsl:when test="$key = 'preferred'">
    <xsl:value-of select="'preferred'"/>
</xsl:when>
<xsl:when test="$key = 'not preferred'">
    <xsl:value-of select="'not preferred'"/>
</xsl:when>
<xsl:when test="$key = 'Complication'">
    <xsl:value-of select="'Complication'"/>
</xsl:when>
<xsl:when test="$key = 'Body Site'">
    <xsl:value-of select="'Body Site'"/>
</xsl:when>
<xsl:when test="$key = 'Usage Period'">
    <xsl:value-of select="'Usage Period'"/>
</xsl:when>
<xsl:when test="$key = 'Collection'">
    <xsl:value-of select="'Collection'"/>
</xsl:when>
<xsl:when test="$key = 'Indication'">
    <xsl:value-of select="'Indication'"/>
</xsl:when>
<xsl:when test="$key = 'UDI'">
    <xsl:value-of select="'UDI'"/>
</xsl:when>
<xsl:when test="$key = 'UDI Barcode'">
    <xsl:value-of select="'UDI Barcode'"/>
</xsl:when>
<xsl:when test="$key = 'Request Date'">
    <xsl:value-of select="'Request Date'"/>
</xsl:when>
<xsl:when test="$key = 'Oral Diet'">
    <xsl:value-of select="'Oral Diet'"/>
</xsl:when>
<xsl:when test="$key = 'Fluid Consistency'">
    <xsl:value-of select="'Fluid Consistency'"/>
</xsl:when>
<xsl:when test="$key = 'Verified'">
    <xsl:value-of select="'Verified'"/>
</xsl:when>
<xsl:when test="$key = 'Actor'">
    <xsl:value-of select="'Actor'"/>
</xsl:when>
<xsl:when test="$key = 'Additive'">
    <xsl:value-of select="'Additive'"/>
</xsl:when>
<xsl:when test="$key = 'Purpose'">
    <xsl:value-of select="'Purpose'"/>
</xsl:when>
<xsl:when test="$key = 'Action'">
    <xsl:value-of select="'Action'"/>
</xsl:when>
<xsl:when test="$key = 'Security Label'">
    <xsl:value-of select="'Security Label'"/>
</xsl:when>
<xsl:when test="$key = 'Not permitted unless'">
    <xsl:value-of select="'Not permitted unless'"/>
</xsl:when>
<xsl:when test="$key = 'Permitted if'">
    <xsl:value-of select="'Permitted if'"/>
</xsl:when>
<xsl:when test="$key = 'Allowed'">
    <xsl:value-of select="'Allowed'"/>
</xsl:when>
<xsl:when test="$key = 'Treatment Restriction'">
    <xsl:value-of select="'Treatment Restriction'"/>
</xsl:when>
<xsl:when test="$key = 'Source'">
    <xsl:value-of select="'Source'"/>
</xsl:when>
<xsl:when test="$key = 'Expiration Date'">
    <xsl:value-of select="'Expiration Date'"/>
</xsl:when>
<xsl:when test="$key = 'When'">
    <xsl:value-of select="'When'"/>
</xsl:when>
<xsl:when test="$key = 'Event'">
    <xsl:value-of select="'Event'"/>
</xsl:when>
<xsl:when test="$key = 'Conclusion'">
    <xsl:value-of select="'Conclusion'"/>
</xsl:when>
<xsl:when test="$key = 'Medication'">
    <xsl:value-of select="'Medication'"/>
</xsl:when>
<xsl:when test="$key = 'Restriction'">
    <xsl:value-of select="'Restriction'"/>
</xsl:when>
<xsl:when test="$key = 'Task Focus'">
    <xsl:value-of select="'Task Focus'"/>
</xsl:when>
<xsl:when test="$key = 'Part Of'">
    <xsl:value-of select="'Part Of'"/>
</xsl:when>
<xsl:when test="$key = 'Execution Period'">
    <xsl:value-of select="'Execution Period'"/>
</xsl:when>
<xsl:when test="$key = 'Task For'">
    <xsl:value-of select="'Task Beneficiary'"/>
</xsl:when>
<xsl:when test="$key = 'Result'">
    <xsl:value-of select="'Result'"/>
</xsl:when>
<xsl:when test="$key = 'Diagnosis'">
    <xsl:value-of select="'Diagnosis'"/>
</xsl:when>
<xsl:when test="$key = 'Lot Number'">
    <xsl:value-of select="'Lot Number'"/>
</xsl:when>
<xsl:when test="$key = 'Intent'">
    <xsl:value-of select="'Intent'"/>
</xsl:when>
<xsl:when test="$key = 'Entire Report'">
    <xsl:value-of select="'Entire Report'"/>
</xsl:when>
<xsl:when test="$key = 'CarePlan'">
    <xsl:value-of select="'Care Plan'"/>
</xsl:when>
<xsl:when test="$key = 'Coverage'">
    <xsl:value-of select="'Coverage'"/>
</xsl:when>
<xsl:when test="$key = 'Composition'">
    <xsl:value-of select="'Composition'"/>
</xsl:when>
<xsl:when test="$key = 'Condition'">
    <xsl:value-of select="'Condition'"/>
</xsl:when>
<xsl:when test="$key = 'Flag'">
    <xsl:value-of select="'Flag'"/>
</xsl:when>
<xsl:when test="$key = 'Observation'">
    <xsl:value-of select="'Observation'"/>
</xsl:when>
<xsl:when test="$key = 'Procedure'">
    <xsl:value-of select="'Procedure'"/>
</xsl:when>
<xsl:when test="$key = 'Consent'">
    <xsl:value-of select="'Consent'"/>
</xsl:when>
<xsl:when test="$key = 'Specimen'">
    <xsl:value-of select="'Specimen'"/>
</xsl:when>
<xsl:when test="$key = 'NutritionOrder'">
    <xsl:value-of select="'NutritionOrder'"/>
</xsl:when>
<xsl:when test="$key = 'DeviceUseStatement'">
    <xsl:value-of select="'Device Use Statement'"/>
</xsl:when>
<xsl:when test="$key = 'Encounter'">
    <xsl:value-of select="'Encounter'"/>
</xsl:when>
<xsl:when test="$key = 'AllergyIntolerance'">
    <xsl:value-of select="'Allergy/Intolerance'"/>
</xsl:when>
<xsl:when test="$key = 'Bank Name'">
    <xsl:value-of select="'Bank Name'"/>
</xsl:when>
<xsl:when test="$key = 'data absent'">
    <xsl:value-of select="'data absent'"/>
</xsl:when>
<xsl:when test="$key = 'Account Number'">
    <xsl:value-of select="'Account Number'"/>
</xsl:when>
<xsl:when test="$key = 'Bank Code'">
    <xsl:value-of select="'Bank code'"/>
</xsl:when>
<xsl:when test="$key = 'This Version'">
    <xsl:value-of select="'This Version'"/>
</xsl:when>
<xsl:when test="$key = 'Media'">
    <xsl:value-of select="'Media'"/>
</xsl:when>
<xsl:when test="$key = 'Prescriber'">
    <xsl:value-of select="'Prescriber'"/>
</xsl:when>
<xsl:when test="$key = 'Days Supply'">
    <xsl:value-of select="'Days Supply'"/>
</xsl:when>
<xsl:when test="$key = 'When Prepared'">
    <xsl:value-of select="'When Prepared'"/>
</xsl:when>
<xsl:when test="$key = 'When Handed Over'">
    <xsl:value-of select="'When Handed Over'"/>
</xsl:when>
<xsl:when test="$key = 'Taken As Agreed'">
    <xsl:value-of select="'Taken As Agreed'"/>
</xsl:when>
<xsl:when test="$key = 'Not Taken As Agreed'">
    <xsl:value-of select="'Not Taken As Agreed'"/>
</xsl:when>
<xsl:when test="$key = 'Reason For Change Or Discontinuation'">
    <xsl:value-of select="'Reason For Change Or Discontinuation'"/>
</xsl:when>
<xsl:when test="$key = 'Substitution'">
    <xsl:value-of select="'Substitution'"/>
</xsl:when>
<xsl:when test="$key = 'Inactive record'">
    <xsl:value-of select="'Inactive record'"/>
</xsl:when>
<xsl:when test="$key = 'Use Duration'">
    <xsl:value-of select="'Use Duration'"/>
</xsl:when>
<xsl:when test="$key = 'This information is copied from a third party'">
    <xsl:value-of select="'This information is copied from a third party'"/>
</xsl:when>
<xsl:when test="$key = 'Medication has been stopped'">
    <xsl:value-of select="'Medication has been stopped'"/>
</xsl:when>
<xsl:when test="$key = 'Repeat Period Cyclical Schedule'">
    <xsl:value-of select="'Repeat Period Cyclical Schedule'"/>
</xsl:when>
<xsl:when test="$key = 'Medication Treatment ID'">
    <xsl:value-of select="'Medication Treatment ID'"/>
</xsl:when>
<xsl:when test="$key = 'Prior Request'">
    <xsl:value-of select="'Prior Medication Request'"/>
</xsl:when>
<xsl:when test="$key = 'Attester'">
    <xsl:value-of select="'Attester'"/>
</xsl:when>
<xsl:when test="$key = 'Authority'">
    <xsl:value-of select="'Authority'"/>
</xsl:when>
<xsl:when test="$key = 'Assessment'">
    <xsl:value-of select="'Assessment'"/>
</xsl:when>
<xsl:when test="$key = 'As Needed'">
    <xsl:value-of select="'As Needed'"/>
</xsl:when>
<xsl:when test="$key = 'Route Of Administration'">
    <xsl:value-of select="'Route Of Administration'"/>
</xsl:when>
<xsl:when test="$key = 'Expected Supply Duration'">
    <xsl:value-of select="'Expected Supply Duration'"/>
</xsl:when>
<xsl:when test="$key = 'Number of Repeats Allowed'">
    <xsl:value-of select="'Max Repeats'"/>
</xsl:when>
<xsl:when test="$key = 'official'">
    <xsl:value-of select="'official'"/>
</xsl:when>
<xsl:when test="$key = 'Validity Period'">
    <xsl:value-of select="'Validity Period'"/>
</xsl:when>
<xsl:when test="$key = 'Destination'">
    <xsl:value-of select="'Destination'"/>
</xsl:when>
<xsl:when test="$key = 'Dosage'">
    <xsl:value-of select="'Dosage'"/>
</xsl:when>
<xsl:when test="$key = 'Dosage Instruction'">
    <xsl:value-of select="'Dosage Instruction'"/>
</xsl:when>
<xsl:when test="$key = 'Medication Taken'">
    <xsl:value-of select="'Medication Taken'"/>
</xsl:when>
<xsl:when test="$key = 'Reason For Medication'">
    <xsl:value-of select="'Reason For Medication'"/>
</xsl:when>
<xsl:when test="$key = 'Distribution Form'">
    <xsl:value-of select="'Distribution Form'"/>
</xsl:when>
<xsl:when test="$key = 'Medication Dispensed'">
    <xsl:value-of select="'Medication Dispensed'"/>
</xsl:when>
<xsl:when test="$key = 'Daily'">
    <xsl:value-of select="'Daily'"/>
</xsl:when>
<xsl:when test="$key = 'Reason Not Dispensed'">
    <xsl:value-of select="'Reason Not Dispensed'"/>
</xsl:when>
<xsl:when test="$key = 'Reason Not Given'">
    <xsl:value-of select="'Reason Not Given'"/>
</xsl:when>
<xsl:when test="$key = 'Substituted'">
    <xsl:value-of select="'Substituted'"/>
</xsl:when>
<xsl:when test="$key = 'ProcedureRequest'">
    <xsl:value-of select="'Procedure Request'"/>
</xsl:when>
<xsl:when test="$key = 'EpisodeOfCare'">
    <xsl:value-of select="'Episode of Care'"/>
</xsl:when>
<xsl:when test="$key = 'Image Study'">
    <xsl:value-of select="'Image Study'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.6.7'">
    <xsl:value-of select="'AGB-medical specialism'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.3.11.60.40.4.0'">
    <xsl:value-of select="'HCIM Element Code'"/>
</xsl:when>
<xsl:when test="$key = '2.16.840.1.113883.2.4.3.11.22.472'">
    <xsl:value-of select="'RoleCodeList (COD472-VEKT)'"/>
</xsl:when>
<xsl:when test="$key = 'dataAbsentReason_unknown'">
    <xsl:value-of select="'unknown'"/>
</xsl:when>
<xsl:when test="$key = 'dataAbsentReason_asked'">
    <xsl:value-of select="'asked but unknown'"/>
</xsl:when>
<xsl:when test="$key = 'dataAbsentReason_temp'">
    <xsl:value-of select="'temporarily unknown'"/>
</xsl:when>
<xsl:when test="$key = 'dataAbsentReason_not-asked'">
    <xsl:value-of select="'not asked'"/>
</xsl:when>
<xsl:when test="$key = 'dataAbsentReason_masked'">
    <xsl:value-of select="'masked'"/>
</xsl:when>
<xsl:when test="$key = 'dataAbsentReason_unsupported'">
    <xsl:value-of select="'unsupported'"/>
</xsl:when>
<xsl:when test="$key = 'dataAbsentReason_astext'">
    <xsl:value-of select="'as text'"/>
</xsl:when>
<xsl:when test="$key = 'dataAbsentReason_error'">
    <xsl:value-of select="'system/workflow failure'"/>
</xsl:when>
<xsl:when test="$key = 'dataAbsentReason_NaN'">
    <xsl:value-of select="'not a number'"/>
</xsl:when>
<xsl:when test="$key = 'dataAbsentReason_not-performed'">
    <xsl:value-of select="'not performed'"/>
</xsl:when>
                <xsl:when test="$translation/value[@lang = $textLangLowerCase]">
                    <xsl:value-of select="concat($pre, $translation/value[@lang = $textLangLowerCase]/text(), $post)"/>
                </xsl:when>
                <!-- compare 'de' in 'de-CH' -->
                <xsl:when test="$translation/value[substring(@lang, 1, 2) = $textLangPartLowerCase]">
                    <xsl:value-of select="concat($pre, $translation/value[substring(@lang, 1, 2) = $textLangPartLowerCase]/text(), $post)"/>
                </xsl:when>
                <!-- compare 'en-US' -->
                <xsl:when test="$translation/value[@lang = $textLangDefaultLowerCase]">
                    <xsl:value-of select="concat($pre, $translation/value[@lang = $textLangDefaultLowerCase]/text(), $post)"/>
                </xsl:when>
                <!-- compare 'en' in 'en-US' -->
                <xsl:when test="$translation/value[substring(@lang, 1, 2) = $textLangDefaultPartLowerCase]">
                    <xsl:value-of select="concat($pre, $translation/value[substring(@lang, 1, 2) = $textLangDefaultPartLowerCase]/text(), $post)"/>
                </xsl:when>
                <xsl:when test="$translation/value[@lang = 'en-us']">
                    <xsl:value-of select="concat($pre, $translation/text(), $post)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat($pre, $key, $post)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Helper template for calculation of CSS font sizes. Takes <xd:ref name="font-size-main" type="parameter">font-size-main</xd:ref> as base and adds the value in parameter <xd:i>with</xd:i> while retaining the unit.</xd:p>
        </xd:desc>
        <xd:param name="with">The value to add to the base value. May be a negative number</xd:param>
    </xd:doc>
    <xsl:template name="raiseFontSize">
        <xsl:param name="with"/>
        <xsl:variable name="mainsize" select="translate($font-size-main,'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz','')"/>
        <xsl:variable name="mainunit" select="translate($font-size-main,'0123456789','')"/>
        <xsl:value-of select="number($mainsize)+number($with)"/>
        <xsl:value-of select="$mainunit"/>
    </xsl:template>

    <!-- ====================================================================== -->
    <!--                             Javascript stuff                           -->
    <!-- ====================================================================== -->
    
    <xd:doc>
        <xd:desc>
            <xd:p>generate global section toggle</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="make-sectiontoggle">
        <xsl:if test="count(hl7:component/hl7:structuredBody/hl7:component[hl7:section]) &gt; 0">
            <td>
                <!-- creates toggle for sections -->
                <div id="sectionsToggleExpand" style="display: none;" class="span_button" onclick="expandAllSections();">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'Expand All'"/>
                    </xsl:call-template>
                </div>
                <div id="sectionsToggleCollapse" class="span_button" onclick="collapseAllSections();">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'Collapse All'"/>
                    </xsl:call-template>
                </div>
            </td>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>generate revision toggle</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="make-revisiontoggle">
        <xsl:if test="//hl7:content[@revised]">
            <td style="background-color: white;">
                <!-- creates toggle for revisions marks -->
                <div id="revisionToggleOn" class="span_button" onclick="showReviewMarks();">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'show revisions'"/>
                    </xsl:call-template>
                </div>
                <div id="revisionToggleOff" style="display: none;" class="span_button" onclick="hideReviewMarks();">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'hide revisions'"/>
                    </xsl:call-template>
                </div>
            </td>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>generate table of contents</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="make-tableofcontents">
        <xsl:variable name="tocid">
            <xsl:choose>
                <xsl:when test="$useJavascript"><xsl:text>nav</xsl:text></xsl:when>
                <xsl:otherwise><xsl:text>nonav</xsl:text></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="count(hl7:component/hl7:structuredBody/hl7:component[hl7:section]) &gt; 1">
            <td style="width: 35%;">
                <!-- produce table of contents -->
                <ul id="{$tocid}">
                    <li style="list-style: none;">
                        <div class="span_button">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'Table of Contents'"/>
                            </xsl:call-template>
                            <xsl:text>&#160;&#8711;</xsl:text>
                        </div>
                        <ul>
                            <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section">
                                <li>
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:text>#</xsl:text>
                                            <xsl:choose>
                                                <xsl:when test="@ID">
                                                    <xsl:value-of select="@ID"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:apply-templates select="." mode="getAnchorName"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:attribute>
                                        <xsl:apply-templates select="." mode="getTitleName"/>
                                        <xsl:if test="@nullFlavor">
                                            <xsl:text> (</xsl:text>
                                            <xsl:call-template name="show-nullFlavor">
                                                <xsl:with-param name="in" select="@nullFlavor"/>
                                            </xsl:call-template>
                                            <xsl:text>)</xsl:text>
                                        </xsl:if>
                                        <xsl:if test="$menu-depth > 1 and hl7:component/hl7:section">
                                            <xsl:text> ▶</xsl:text>
                                        </xsl:if>
                                    </a>
                                    <xsl:if test="$menu-depth > 1 and hl7:component/hl7:section">
                                        <ul>
                                            <xsl:for-each select="hl7:component/hl7:section">
                                                <li style="padding-left: 2em;">
                                                    <a>
                                                        <xsl:attribute name="href">
                                                            <xsl:text>#</xsl:text>
                                                            <xsl:choose>
                                                                <xsl:when test="@ID">
                                                                    <xsl:value-of select="@ID"/>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <xsl:apply-templates select="." mode="getAnchorName"/>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </xsl:attribute>
                                                        <xsl:apply-templates select="." mode="getTitleName"/>
                                                        <xsl:if test="$menu-depth > 2 and hl7:component/hl7:section">
                                                            <xsl:text> ▶</xsl:text>
                                                        </xsl:if>
                                                    </a>
                                                    <xsl:if test="$menu-depth > 2 and hl7:component/hl7:section">
                                                        <ul>
                                                            <xsl:for-each select="hl7:component/hl7:section">
                                                                <li style="padding-left: 2em;">
                                                                    <a>
                                                                        <xsl:attribute name="href">
                                                                            <xsl:text>#</xsl:text>
                                                                            <xsl:choose>
                                                                                <xsl:when test="@ID">
                                                                                    <xsl:value-of select="@ID"/>
                                                                                </xsl:when>
                                                                                <xsl:otherwise>
                                                                                    <xsl:apply-templates select="." mode="getAnchorName"/>
                                                                                </xsl:otherwise>
                                                                            </xsl:choose>
                                                                        </xsl:attribute>
                                                                        <xsl:apply-templates select="." mode="getTitleName"/>
                                                                    </a>
                                                                </li>
                                                            </xsl:for-each>
                                                        </ul>
                                                    </xsl:if>
                                                </li>
                                            </xsl:for-each>
                                        </ul>
                                    </xsl:if>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </li>
                </ul>
            </td>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>