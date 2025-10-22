{{
    config(
        materialized='ephemeral'
    )   
}}
-- emphemeral is used for CTEs that are only needed during model execution 
--it help us to use it in other models without creating a separate table

with movies as (
    select * from {{ ref('dim_movies') }}
),

tags as (
    select * from {{ ref('dim_genome_tags') }}
),

scores as (
    select * from {{ ref('fact_genome_scores') }}
)

select 
    m.movie_id,
    m.movie_title,
    m.genres,
    t.tag,
    s.relevance
from movies m
left join scores s
    on m.movie_id = s.movie_id
left join tags t
    on s.tag_id = t.tag_id