-------- SQL used in the tutorial --------
--- to run these queries in CartoDB:
    --- 1. open the SQL Panel in either the map or table view.
    --- 2. Delete the default "SELECT * FROM table_name" query
    --- 3. Type or copy and paste in the query
--- note that in CartoDB we don't need to end our SQL statements with a semicolon.
--- there is also a back arrow in the SQL panel to view your previous queries, this comes in quite handy.
--- and by the way this is a comment in SQL. A comment is text or code that will be ignored by the software.

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
