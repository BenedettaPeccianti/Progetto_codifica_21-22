<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"> 
    <!--indent per l'indentazione in output per rispettare le relazioni gerarchiche-->
    <!--si può anche aggiungere version="5" in xsl output-->
    <xsl:output method="html" encoding="UTF-8"  indent="yes"/>
    <!--definisce i template e l'attributo serve per collegare l'xml-->
    <xsl:template match="/">
        <html>
            <head>
                <meta name="viewport" content="width=device-width,initial-scale=1" />
                <title><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='fr']" /></title>
                
                <link  rel="stylesheet" type="text/css" href="style_prolusioni.css" />
            </head>
            <body class="main">
                <header>
                    <div id="menu">
                        <h1><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='fr']" /></h1>
                        <a href="#informazioni">Informazioni generali</a>
                        <a href="##pagina21">Pagina 21 </a>
                        <a href="##pagina22">Pagina 22</a>
                        <a href="#bibliografia">Bibliografia</a>
                        <a href="#about">About</a>
                    </div>
                </header>

                <!--info su Saussure e info generali sul manoscritto-->
                <section id="informazioni" class="info">
                    <img src="ferdinandS.jpg" alt="fotoFerdinad" />
                    <div id="bio">
                        <xsl:apply-templates select="//tei:listPerson" /> 
                    </div>
                </section>

                <section class="info">
                    <div>
                        <xsl:apply-templates select="//tei:msContents" />  
                    </div>
                </section>
                <section class="info">
                    <div>
                        <xsl:apply-templates select="//tei:physDesc" />
                    </div>
                </section>
                <section class="info"> 
                    <div>
                        <xsl:apply-templates select="//tei:history" />
                    </div>                 
                </section>
            
                <!-- foto pagine originali-->
                <section id="foto_codifica">
                    <div id="foto">
                        <xsl:apply-templates select="//tei:facsimile" />
                        <span id="desc_foto"></span>
                    </div>
                </section>

                <div id="bottoniColori">
                    <h2> Visualizza fenomeni</h2>
                    <button type="button" id="correzioni"> Correzione</button> 
                    <button type="button" id="termine"> Termine </button> 
                    <button type="button" id="glottonimo"> Glottonimo</button>
                    <button type="button" id="cancellazione"> Cancellazione</button> 
                    <button type="button" id="aggiunte">Aggiunte </button> 
                    <button type="button" id="toponimo">Toponimo</button>
                    <button type="button" id="abbreviazione">Abbreviazione </button>
                </div>

                <section id="pagine21_22">
                    <div class="pagina">
                        <xsl:attribute name="id">
                            <xsl:value-of select="//tei:div[@n='21']/@facs"/>
                        </xsl:attribute>
                        
                        <h2> La pagina 21 </h2>
                        
                        <div class="testo_pagina">
                            <div class="testo">
                                <h3>Trascrizione pagina 21</h3>
                                <xsl:apply-templates select="//tei:body/tei:div[@n = '21']" />
                            </div>
                     
                            <div class="testo">
                                <h3> Traduzione pagina 21</h3>
                                <xsl:apply-templates select="//tei:div[@type='traduzione21']" />
                            </div>
                        </div>
                    </div>

                    <!-- pagina 22-->
                    <div class="pagina">
                        <xsl:attribute name="id">
                            <xsl:value-of select="//tei:div[@n='22']/@facs" />
                        </xsl:attribute>

                        <h2> La pagina 22 </h2>
                        
                        <div class="testo_pagina">
                            <div class="testo">
                                <h3>Trascrizione pagina 22</h3>
                                <xsl:apply-templates select="//tei:body/tei:div[@n = '22']" />
                            </div>
                     
                            <div class="testo">
                                <h3> Traduzione pagina 22</h3>
                                <xsl:apply-templates select="//tei:div[@type='traduzione22']" />
                            </div>
                        </div>
                    </div>
                </section>

                <!--appendice (terminologia)-->
                
                <div id="bottTerminologia">
                    <button type="button" id="terminologia"> Clicca per vedere la terminologia</button>
                </div>

                <section id="terminol">
                    <h2>Glossario</h2>
                    <xsl:apply-templates select="//tei:back/tei:div/tei:list" />
                </section>

                <section id="bibliografia">
                    <h2> Bibliografia </h2>
                    <div class="bibliography">
                        <xsl:apply-templates select="//tei:listBibl" />
                    </div>
                </section>

                <footer id="about">
                    <h2>Informazioni sull'edizione del testo</h2>
                    <xsl:apply-templates select="//tei:editionStmt" />
                    <script src="bottoni.js" />
                </footer>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:listPerson">
        <h2> Le informazioni generali </h2>
        
        <h3>Autore</h3>
        <p><xsl:value-of select="//tei:person[@xml:id='FDS']/tei:persName" /></p>
        
        <h3>Data di nascita</h3>
        <p>Nato il <xsl:value-of select="//tei:person/tei:birth/tei:date" /> a <xsl:value-of select="//tei:person/tei:birth/tei:settlement" />. </p>
        <h3>Data di morte</h3>
        <p>Morto il <xsl:value-of select="//tei:person/tei:death/tei:date" /> a <xsl:value-of select="//tei:person/tei:death/tei:settlement" />.</p>
        <h3>Descrizione</h3>
        <p><xsl:value-of select="//tei:person/tei:note" /></p>
    </xsl:template>

    <xsl:template match="tei:msContents">
        <h2> Caratteristiche </h2>
        <h3>Autore</h3>
        <p><xsl:value-of select="//tei:persName" /></p>
        <h3>Titolo</h3>
        <p><xsl:value-of select="//tei:title" /></p>
        <h3>Conservazione</h3>
        <p>Il manoscritto si trova a <xsl:value-of select="//tei:placeName" /> in <xsl:value-of select="//tei:country" />. </p>
        <h3>Data</h3>
        <p> <xsl:value-of select="//tei:docDate" /></p>
        <h3> Lingua</h3>
        <p> <xsl:value-of select="//tei:textLang" />.</p>
    </xsl:template>

    <xsl:template match="tei:physDesc">
        <h2>Descrizione</h2>
        <h3>Grandezza documento</h3> 
        <p>Il manoscritto si compone in: <xsl:apply-templates select="//tei:extent" /></p>
        <h3>Condizioni</h3>
        <p><xsl:value-of select="//tei:condition/tei:p" /></p>
        <h3>Disposizione pagine</h3> 
        <p><xsl:value-of select="//tei:layout/tei:p" />.</p>
        <h3>Interventi sul manoscritto</h3>
        <p><xsl:value-of select="//tei:handDesc/tei:p"/></p>
        <h3>Tipo di scrittura</h3> 
        <p><xsl:value-of select="//tei:typeDesc/tei:p" />.</p>
        <h3>Numero di identificazione</h3>
        <p><xsl:value-of select="//tei:idno" /></p>

    </xsl:template>

    <xsl:template match="tei:history">
        <h2> La storia del manoscritto</h2>
        <p> <xsl:value-of select="//tei:origin" /></p>
    </xsl:template>

    
    <!--per creare il tag img in html-->
    <xsl:template match="tei:facsimile">
        <h2>Le pagine originali</h2>
        <xsl:for-each select="tei:surface">
            <xsl:element name="img">
                <xsl:attribute name="class">immagini</xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"/></xsl:attribute>
            </xsl:element>

        </xsl:for-each>
    </xsl:template>


    <!--per numerare le righe-->

    <xsl:template match="tei:lb">
        <xsl:element name="br" />
        <xsl:element name="b">
            <xsl:attribute name="id">
                <xsl:value-of select="@facs" />
            </xsl:attribute>
            <xsl:attribute name="class">numero</xsl:attribute>
            <xsl:value-of select="@n"/>
        </xsl:element>
    </xsl:template>


    <xsl:template match="tei:ab">
        <xsl:element name="br" />
        <xsl:element name="b">
            <xsl:attribute name="class">pericope</xsl:attribute><br />
            Paragrafo <xsl:value-of select="@n" />
            
        </xsl:element>
        <xsl:apply-templates/>
    </xsl:template>
    <!--bottoni-->
    <!-- correzioni editoriali fatte con choice-->

    <xsl:template match="//tei:choice/tei:orig">
        <xsl:element name="span">
            <xsl:attribute name="class">orig</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="//tei:choice/tei:reg">
        <xsl:element name="span">
            <xsl:attribute name="class">reg</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!--termini-->
    <xsl:template match="tei:term">
        <xsl:element name="span">
            <xsl:element name="a">
                <xsl:attribute name="class">terms</xsl:attribute>
                <xsl:attribute name="href"><xsl:value-of select="@ref" /></xsl:attribute>
                <xsl:apply-templates />
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <!--glottonimo-->
    <xsl:template match="tei:lang">
        <xsl:element name="span">
            <xsl:attribute name="class">lang</xsl:attribute>
            <xsl:value-of select="." />
        </xsl:element>
    </xsl:template>

    <!--cancelazioni-->
    <xsl:template match="tei:del">
        <xsl:element name="span">
            <xsl:attribute name="class">del</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!--per segnalare la cancellatura dell'autore illeggibile-->
    <xsl:template match="tei:gap">
        <xsl:element name="span">
            <xsl:attribute name="class">del</xsl:attribute>@ @ @ @ @
        </xsl:element>
    </xsl:template>

    <!--aggiunte-->
    <xsl:template match="tei:supplied">
        <xsl:element name="span">
            <xsl:attribute name="class">supplied</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!--toponimi con attributo name-->
    <xsl:template match="tei:name[@type='place']">
        <xsl:element name="span">
            <xsl:attribute name="class">toponimo</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!--abbreviazioni-->
    <xsl:template match="tei:abbr">
        <xsl:element name="span">
            <xsl:attribute name="class">abbr</xsl:attribute>
            <xsl:apply-templates  />
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:expan">
        <xsl:element name="span">
            <xsl:attribute name="class">expan</xsl:attribute>
            <xsl:apply-templates  />
        </xsl:element>
    </xsl:template>


    <!-- lista GLOSSARIO -->
    <xsl:template match="tei:list">
        <xsl:for-each select="tei:label | tei:item">
            <br /> <br />
            <b><xsl:value-of select="tei:term[@xml:lang='it']"/></b>
            
            <xsl:element name="span" >
            
                <xsl:attribute name="class">gloss</xsl:attribute>
                -<i><xsl:value-of select="tei:term[@xml:lang='fr']"/></i>
                <xsl:value-of select="tei:gloss" />
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    

    <xsl:template match="tei:listBibl">
        <xsl:element name="ul">
            <xsl:for-each select="tei:bibl">
                    <xsl:element name="li">
                        
                        <b><xsl:value-of select="tei:title"/></b>,
                        <xsl:for-each select="tei:author/tei:persName">
                            <i><xsl:value-of select="." /></i>,
                        </xsl:for-each>
                        <xsl:for-each select="tei:pubPlace/tei:placeName">
                            <xsl:value-of select="."/>,
                        </xsl:for-each>
                        <xsl:value-of select="tei:publisher"/>,
                        <xsl:value-of select="tei:date"/>
                        
                    </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:editionStmt">
        <p><xsl:value-of select="current()/tei:edition" /></p>
        <p> Il progetto è a cura di<xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='AMG']" /></p>
        <p> Il progetto è realizzato da<xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='MT']" /> e <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='BP']" /></p>
    </xsl:template>
</xsl:stylesheet>