With rating as (
    select Distinct user_id from {{ref('src_ratings')}}
),

tags as (
    select Distinct user_id from {{ref('src_tags')}}
)

Select distinct user_id
from (
    select user_id from rating
    union
    select user_id from tags
)