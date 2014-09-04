-------- Other Useful SQL --------
--- these were not used in the tutorial but feel free to try them out!
--- to run these queries in CartoDB:
    --- 1. open the SQL Panel in either the map or table view.
    --- 2. Delete the default "SELECT * FROM table_name" query
    --- 3. Type or copy and paste in the query
--- note that in CartoDB we don't need to end our SQL statements with a semicolon.
--- there is also a back arrow in the SQL panel to view your previous queries, this comes in quite handy.
--- and by the way this is a comment in SQL. A comment is text or code that will be ignored by the software.

--- count the number of rows in your table
SELECT count(*) FROM table_name

--- update the values for all rows in a column
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

--- DANGER! This will delete everything in your table. DANGER!
DELETE FROM table_name

--- change the data column from string to int:
ALTER TABLE table_name ALTER COLUMN column_name TYPE INT USING column_name::int

--- insert a new row into your table with new values:
INSERT INTO table_name (column1, column2, column3) values (value1, value2, value3)

--- insert a new row into your table with new values from another table:
INSERT INTO table_name(column1, column2, column3) SELECT (value1, value2, value3) FROM other_table_name