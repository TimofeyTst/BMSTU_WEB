<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!--xsl:template говорит о том, что тут будет замена. match показывает, к какой части документа это применимо-->
    <xsl:template match="/">
        <!--Внутри шаблона пишем наше преобразование-->

        <html>
        <head>
            <title>Browser response</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" 
                crossorigin="anonymous"></link>
        </head>
        <body>
            <div class="container">
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
            </div>
        </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>