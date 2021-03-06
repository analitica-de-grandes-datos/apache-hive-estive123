/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Construya una consulta que ordene la tabla por letra y valor (3ra columna).

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/

DROP TABLE IF EXISTS datos;
DROP TABLE IF EXISTS ordenada;
CREATE TABLE datos (C1 STRING,C2 DATE,C3 INT)ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';
LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE datos;
CREATE TABLE ordenada
AS
SELECT * FROM datos ORDER BY C1, C3, C2;
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM ordenada;
