<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns="http://www.w3.org/1999/xhtml">

  <xsl:output method="xml"
              doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
              doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
              encoding="UTF-8"
              indent="yes"
  />

  <xsl:template match="kontakty">
    <html>
      <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <meta name="author" content="Marketa Elederova, e-mail: 445491@mail.muni.cz"/>
        <link rel="stylesheet" href="kontakty.css" type="text/css" media="screen"/>
        <title>Kontakty</title>
      </head>
      <body>
        <h1 id="contacts-title">Kontakty</h1>
        <xsl:apply-templates>
          <xsl:sort select="prijmeni"/>
          <xsl:sort select="jmeno"/>
        </xsl:apply-templates>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="kontakt">
    <div class="contact">
      <xsl:apply-templates/>
    </div>
  </xsl:template>


  <xsl:template match="osoba">
      <h2><xsl:apply-templates/></h2>
  </xsl:template>

  <xsl:template match="titul_pred">
    <xsl:value-of select="."/>
    <xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="jmeno">
    <xsl:value-of select="."/>
    <xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="prijmeni">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="titul_za">
    <xsl:text> </xsl:text>
    <xsl:value-of select="."/>
  </xsl:template>


  <xsl:template match="emaily">
      <h3>Email</h3>
      <ul>
        <xsl:apply-templates/>
      </ul>
  </xsl:template>

  <xsl:template match="tel_cisla">
      <h3>Telefon</h3>
      <ul>
        <xsl:apply-templates/>
      </ul>
  </xsl:template>

  <xsl:template match="web_stranky">
      <h3>Web</h3>
      <ul>
        <xsl:apply-templates/>
      </ul>
  </xsl:template>

  <xsl:template match="dalsi_kontakt">
      <h3><xsl:value-of select="jmeno_sluzby"/></h3>
      <ul>
        <xsl:apply-templates/>
      </ul>
  </xsl:template>

  <xsl:template match="jmeno_sluzby"/>

  <xsl:template match="postovni_adresy">
      <h3>Adresa</h3>
      <ul>
        <xsl:apply-templates/>
      </ul>
  </xsl:template>

  <xsl:template match="poznamky">
      <h3>Poznámky</h3>
      <ul>
        <xsl:apply-templates/>
      </ul>
  </xsl:template>

  <xsl:template match="email">
    <li>
      <a>
        <xsl:attribute name="href">mailto:<xsl:value-of select="."/></xsl:attribute>
        <xsl:value-of select="."/>
      </a>
      <xsl:call-template name="typKontaktu">
        <xsl:with-param name="typ"><xsl:value-of select="@typ"/></xsl:with-param>
      </xsl:call-template>
    </li>
  </xsl:template>

  <xsl:template match="web_stranka">
    <li>
      <a>
        <xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute>
        <xsl:value-of select="."/>
      </a>
      <xsl:call-template name="typKontaktu">
        <xsl:with-param name="typ"><xsl:value-of select="@typ"/></xsl:with-param>
      </xsl:call-template>
    </li>
  </xsl:template>

  <xsl:template match="tel_cislo | id_uzivatele">
    <li>
      <xsl:value-of select="."/>
      <xsl:call-template name="typKontaktu">
        <xsl:with-param name="typ"><xsl:value-of select="@typ"/></xsl:with-param>
      </xsl:call-template>
    </li>
  </xsl:template>

  <xsl:template match="postovni_adresa">
    <li>
      <xsl:value-of select="ulice"/><xsl:text> </xsl:text>
      <xsl:value-of select="cislo_popisne"/><xsl:text>, </xsl:text>
      <xsl:value-of select="psc"/><xsl:text> </xsl:text>
      <xsl:value-of select="mesto"/>
      <xsl:call-template name="typKontaktu">
        <xsl:with-param name="typ"><xsl:value-of select="@typ"/></xsl:with-param>
      </xsl:call-template>
    </li>
  </xsl:template>

  <xsl:template match="poznamka">
    <li>
      <xsl:value-of select="."/>
    </li>
  </xsl:template>

  <xsl:template name="typKontaktu">
    <xsl:param name="typ"/>
    <span class="contact_type">
    <xsl:choose>
      <xsl:when test="$typ='osobni'"> (osobní)</xsl:when>
      <xsl:when test="$typ='pracovni'"> (pracovní)</xsl:when>
      <xsl:when test="$typ='jiny'"> (jiný)</xsl:when>
    </xsl:choose>
    </span>
  </xsl:template>

</xsl:stylesheet>
