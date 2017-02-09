<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"/>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/>
                <title>Formularios</title>
            </head>
            <body>
                <center>
                    <div class="jumbotron text-center">
                        <h1>*- Correcion Examen -*</h1>
                    </div>
                    <hr/>
                    <table class="table">
                        <tr>
                            <td>-&gt;PREGUNTAS<xsl:value-of select="title"/>
                            </td>
                            <td>
                                <span class="glyphicon glyphicons-edit"/>-&gt;TU RESPUESTA<xsl:value-of select="respuesta"/>
                            </td>
                            <td>
                                <span class="glyphicon glyphicons-ok"/>-&gt;RESPUESTA CORRECTA<xsl:value-of select="answer"/>
                            </td>
                            <td>-&gt;CALIFICACION<xsl:value-of select="puntos"/>
                            </td>
                        </tr>
                        <xsl:for-each select="questions/question">
                            <tr>
                                <td>
                                    <xsl:value-of select="title"/>
                                </td>
                                <td>
                                    <xsl:value-of select="answer"/>
                                </td>
                                <td>
                                    <xsl:value-of select="respuesta"/>
                                </td>
                                <td>
                                    <xsl:value-of select="puntos"/>
                                    <xsl:if test="cartel/@imagen ='si'"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                    <div class="jumbotron text-center">
                        <p>---&gt;&gt; NOTA FINAL: <xsl:value-of select="sum(//puntos)"/>
                        </p>
                        <a href="index.html" class="btn btn-primary btn-block">Realizar Examen Otra Vez</a>
                    </div>
                </center>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>