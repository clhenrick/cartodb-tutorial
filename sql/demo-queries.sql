-- select population density by county
 SELECT pop_sqkm, 
     round(
         pop / 
         (ST_Area(the_geom::geography)/1000000)) 
     as psqkm 
     FROM us_counties

-- select the number of tornados by county
-- solution based on answer from: http://gis.stackexchange.com/questions/54661/count-points-in-polygon-with-postgis
SELECT us_counties.cartodb_id, count(tornados.the_geom) AS total 
FROM us_counties LEFT JOIN tornados 
ON st_contains(us_counties.the_geom,tornados.the_geom) 
GROUP BY us_counties.cartodb_id