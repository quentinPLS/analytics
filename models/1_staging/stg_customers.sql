
select 
    customer_id,
    CONCAT(first_name, ' ', last_name),
    phone,
    email,
    UPPER(street),
    UPPER(city),
    UPPER(state),
    CAST(zip_code as VARCHAR(5))

from {{source('local_bike', 'customers')}}