SELECT *
FROM   information_schema.tables
WHERE  table_type = 'BASE TABLE'
       AND table_schema = 'wca_development' 