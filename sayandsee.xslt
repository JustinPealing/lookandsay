<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="text" indent="no" />

    <xsl:template match="/">
        <xsl:call-template name="sayandsee">
            <xsl:with-param name="text" select="1121" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="sayandsee">
        <xsl:param name="text" />
        <xsl:call-template name="sayandseerec">
            <xsl:with-param name="say" />
            <xsl:with-param name="number" select="substring($text, 1, 1)" />
            <xsl:with-param name="count" select="1" />
            <xsl:with-param name="tail" select="substring($text, 2)" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="sayandseerec">
        <xsl:param name="say" />
        <xsl:param name="number" />
        <xsl:param name="count" select="0" />
        <xsl:param name="tail" />
        <xsl:choose>
            <xsl:when test="string-length($tail) = 0">
                <text><xsl:value-of select="concat($say, $count, $number)" /></text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="currentnumber" select="substring($tail, 1, 1)" />
                <xsl:choose>
                    <xsl:when test="$currentnumber = $number">
                        <xsl:call-template name="sayandseerec">
                            <xsl:with-param name="say" select="$say" />
                            <xsl:with-param name="number" select="$number" />
                            <xsl:with-param name="count" select="$count + 1" />
                            <xsl:with-param name="tail" select="substring($tail, 2)" />
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="sayandseerec">
                            <xsl:with-param name="say" select="concat($say, $count, $number)" />
                            <xsl:with-param name="number" select="$currentnumber" />
                            <xsl:with-param name="count" select="1" />
                            <xsl:with-param name="tail" select="substring($tail, 2)" />
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
