SELECT CURRENT_USER as username,
       table_schema, 
       table_name
FROM information_schema.table_privileges
WHERE grantee = CURRENT_USER 
AND privilege_type = 'SELECT';
