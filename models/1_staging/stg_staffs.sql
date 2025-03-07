
select
    staff_id,
    fist_name,
    last_name,
    email,
    phone,
    active,
    store_id,
    manager_id
from {{source('local_bike','staffs')}}
