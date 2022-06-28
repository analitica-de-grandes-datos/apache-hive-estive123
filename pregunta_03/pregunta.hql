/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
de la tercera columna.

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/
DROP TABLE IF EXISTS datos;
CREATE TABLE datos (C1 STRING,C2 DATE,C3 INT)ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';
LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE datos;
INSERT OVERWRITE DIRECTORY 'output'
SELECT DISTINCT C3 FROM datos ORDER BY C3  LIMIT 5;

