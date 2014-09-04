-------- Other Useful SQL --------
--- these were not used in the tutorial but feel free to try them out!

--- To use these sample queries in CartoDB:
    --- 1. open the SQL Panel in either the map or table view.
    --- 2. Delete the default "SELECT * FROM table_name" query.
    --- 3. Either type or copy and paste the query into the SQL panel.
    --- 4. Alter the names of tables and columns in your query to match your those from your data
        --- for example: change table_name to the name of your table and column_name to the name
        --- of the column you are using.
    --- 5. To run the query click the "Apply Query" button or press cmd + S (on a mac) or cntrl + S (on a PC)

--- NOTE: in CartoDB we don't need to end our SQL statements with a semicolon.

--- There is also a back arrow in the SQL panel to view your previous queries, this comes in quite handy.

--- AND by the way  double dashes (--) are used for specifiying a comment in PostgreSQL. 
    --- (A comment is text or code that will be ignored by the software.)
    --- I like to use --- for notes and -- to comment out actual code.

--- count the number of rows in your table
SELECT count(*) FROM table_name

--- only show the data where data values of given column are not null:
SELECT * FROM table_name WHERE column_name IS NOT NULL

--- update the values for all rows in a specified column
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

--- !DANGER! This will delete everything in your table. !DANGER!
DELETE FROM table_name

--- change a column's data type to an integer data type:
ALTER TABLE table_name ALTER COLUMN column_name TYPE INT USING column_name::int

--- insert a new row into your table with new values:
INSERT INTO table_name (column1, column2, column3) values (value1, value2, value3)

--- insert a new row into your table with new values from another table:
INSERT INTO table_name(table_name_column1, table_name_column2, table_name_column3) SELECT (table2_column1, table2_column2, table2_column3) FROM other_table_name

--- creating new values for a column that is a date data type:
--- NOTE: in this case it is assumed that your the date from your original column is a string and formated like "2014-07-04 18:34:21"
UPDATE table_name SET new_date_time_column = to_timestamp(date_time_string_column, 'YYYY-MM-DD HH24:MI:SS')
