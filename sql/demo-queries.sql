-------- SQL used in the tutorial --------

--- select population density by county
 SELECT pop_sqkm, 
     round(
         pop / 
         (ST_Area(the_geom::geography)/1000000)) 
     as psqkm 
     FROM us_counties

--- select the number of tornados by county
--- solution based on answer from: http://gis.stackexchange.com/questions/54661/count-points-in-polygon-with-postgis
SELECT us_counties.cartodb_id, count(tornados.the_geom) AS total 
FROM us_counties LEFT JOIN tornados 
ON st_contains(us_counties.the_geom,tornados.the_geom) 
GROUP BY us_counties.cartodb_id

--- easier way:
UPDATE us_countries SET tornados_by_county = 
    (
        SELECT count(1) FROM tornados 
        WHERE st_contains(us_counties.the_geom, tornados.the_geom) 
    )

-------- Other Useful SQL Statements --------
--- these were not used in the tutorial but feel free to try them out!

--- count the number of records in your table
SELECT count(*) FROM table_name

--- update the values in a column
UPDATE table_name SET column_name = some_value

--- add a new column. you must specify a data type such as INT for integer or TEXT for string
ALTER TABLE table_name ADD COLUMN new_column_name data_type

--- convert a decimal field to a percent in a string field. Useful for creating a label in an info window.
UPDATE table_name SET value_percent = (decimal_value * 100) || '%'

--- select all unique values from a column:
SELECT distinct(column_name) FROM table_name

--- count the number of distinct values from a column
SELECT count(distinct(column_name)) FROM table_name

--- to turn the values from the above query into a comma delimited string:
SELECT string_agg(distinct(coulmn_name), '\',\' ') FROM table_name

--- delete everything in your table, DANGER!
DELETE FROM table_name