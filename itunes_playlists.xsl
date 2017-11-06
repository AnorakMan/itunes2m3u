<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Nov 2, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> ipattison</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method='text'/>
   
    <xsl:template match="/">
        <xsl:text>Playlists</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each select="//key[text()='Playlists']/following-sibling::*[1]/dict">
            <xsl:variable name="plname">
                <xsl:value-of select="key[text()='Name']/following-sibling::*[1]/text()"></xsl:value-of>
            </xsl:variable>
            <xsl:result-document href="file:\\\C:\Users\ipattison\Desktop\playlists\{$plname}.m3u">
               <!-- <xsl:value-of select="key[text()='Name']/following-sibling::*[1]/text()"></xsl:value-of> -->
                <xsl:text>#EXTM3U</xsl:text>
                <xsl:text>&#10;</xsl:text>
                <xsl:for-each select="array/dict">
                    <xsl:variable name="trackint">
                        <xsl:value-of select="integer/text()"></xsl:value-of>
                    </xsl:variable>
                    <xsl:variable name="fpath" select="//key[text()=$trackint]/following-sibling::*[1]/key[text()='Location']/following-sibling::string/text()"/>
                    <xsl:value-of select="replace(replace($fpath, '%20', ' '), 'file://localhost/C:/Users/Sarah/Music', '/media')"/>
                    
                    <xsl:text>&#10;</xsl:text>
                </xsl:for-each>
            </xsl:result-document>
            
            <xsl:value-of select="key[text()='Name']/following-sibling::*[1]/text()"></xsl:value-of>
            
            <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
