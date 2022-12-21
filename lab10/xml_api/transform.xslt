<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!--xsl:template говорит о том, что тут будет замена. match показывает, к какой части документа это применимо-->
    <xsl:template match="/">
        <!--Внутри шаблона пишем наше преобразование-->

        <html>
        <head>
            <title>Response</title>
        </head>
        <body>
            <table>
                <thead>
                    <tr>
                      <th>#</th>
                      <th>Палиндром</th>
                      <th>Квадрат</th>
                    </tr>
                </thead>
                <tbody>
                    <!--Цикл-->
                    <xsl:for-each select="objects/object">
                      <!--Создание переменной-->
                        <xsl:variable name="counter" select="position()"/>
                        <tr>
                            <th>
                                <!--Извлекаем значение из переменной (обратите внимание на $)-->
                                <xsl:value-of select="$counter"></xsl:value-of>
                            </th>
                            <th>
                                <!--Извлекаем значение из XML-тега-->
                                <xsl:value-of select="palindrom"></xsl:value-of>
                            </th>
                            <th>
                                <xsl:value-of select="square"></xsl:value-of>
                            </th>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>