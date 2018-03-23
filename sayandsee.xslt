<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="text" indent="no" />

    <xsl:template match="/">
        <!--<xsl:call-template name="loop">
            <xsl:with-param name="count" select="10" />
        </xsl:call-template>-->
        <xsl:call-template name="group">
            <xsl:with-param name="text" select="1211" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="loop">
        <xsl:param name="see" select="1" />
        <xsl:param name="count" select="1" />
        <xsl:if test="$count > 0">
            <xsl:variable name="say">
                <xsl:call-template name="say">
                    <xsl:with-param name="see" select="$see" />
                </xsl:call-template>
            </xsl:variable>
            <xsl:value-of select="$say" />
            <xsl:call-template name="loop">
                <xsl:with-param name="see" select="$say"/>
                <xsl:with-param name="count" select="$count - 1"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template name="say">
        <xsl:param name="see" select="1" />

        <xsl:value-of select="$see" />
    </xsl:template>
    
    <xsl:template name="group">
        <xsl:param name="seed"><xsl:text> </xsl:text></xsl:param>
        <xsl:param name="text" />
        <xsl:choose>
            <xsl:when test="string-length($text)">
                <xsl:variable name="next" select="substring($text, 1, 1)" />
                <xsl:variable name="separator">
                    <xsl:if test="$next != substring($seed, string-length($seed))">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:variable>
                <xsl:call-template name="group">
                    <xsl:with-param name="seed" select="concat($seed, $separator, $next)" />
                    <xsl:with-param name="text" select="substring($text, 2)" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$seed" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
