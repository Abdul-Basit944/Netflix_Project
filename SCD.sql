select * from fact_ratings
order by rating_timestamp desc
limit 5;

select * from src_ratings
order by rating_timestamp desc
limit 5;

insert into src_ratings (user_id , movie_id , rating , rating_timestamp)
values (87587, '7152', '4.0', '2015-03-31 21:40:02.000 -0700' ) 

select * from snapshots.snap_tags
order by user_id , dbt_valid_from desc;

update src_tags
set tag = 'Mark Waters Returns' , tag_timestamp = cast( current_timestamp() as timestamp_ntz)
where user_id =18;

select * from dev.src_tags
where user_id =18;
