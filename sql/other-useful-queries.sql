-------- Other Useful SQL Statements --------
--- these were not used in the tutorial but feel free to try them out!

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

--- delete everything in your table, DANGER!
DELETE FROM table_name

--- change the data column from string to int:
ALTER TABLE table_name ALTER COLUMN column_name TYPE INT USING column_name::int