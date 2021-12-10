select routine_schema as database_name,
       routine_name,
       routine_type as type,
       data_type as return_type,
       routine_definition as definition
from information_schema.routines
where routine_schema not in ('sys', 'information_schema',
                             'mysql', 'performance_schema')
    -- and r.routine_schema = 'database_name' -- put your database name here
order by routine_schema,
         routine_name;