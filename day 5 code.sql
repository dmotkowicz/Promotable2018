select * from danmotkowicz.titanic where name like '%John'

select * from danmotkowicz.movies;

-- Create the table
CREATE TABLE danmotkowicz.airbnb
(
    room_id bigint NOT NULL,
	survey_id integer,
    host_id integer,
    room_type text COLLATE pg_catalog."default",
	country text COLLATE pg_catalog."default",
	city text COLLATE pg_catalog."default",
	borough text COLLATE pg_catalog."default",
    neighborhood text COLLATE pg_catalog."default",
    reviews integer,
    overall_satisfaction real,
    accommodates integer,
    bedrooms real,
    bathrooms real,
    price integer,
    minstay integer,
    name text COLLATE pg_catalog."default",
    created_date timestamp with time zone,
	latitude float8,
	longitude float8,
	location text COLLATE pg_catalog."default",
    CONSTRAINT airbnb_pkey PRIMARY KEY (room_id)
)

select * from danmotkowicz.airbnb;

--Profile the data
select count (*)
from danmotkowicz.airbnb

select *
from danmotkowicz.airbnb

--Min & Max Price
select 
	MAX(price) as maximum_price
from danmotkowicz.airbnb

select 
	min (price) AS minimum_price
from danmotkowicz.airbnb

select 
	sum (bedrooms) as sum_bedrooms
from danmotkowicz.airbnb

select 
	sum (bedrooms) as sum_bedrooms_girdwood
from danmotkowicz.airbnb where neighborhood = 'Girdwood'

select 
	count (*) as units
from danmotkowicz.airbnb where neighborhood = 'Girdwood'

--Average Review
SELECT
	Round (AVG(reviews),1) as avg_reviews
from danmotkowicz.airbnb; 

select
	distinct (overall_satisfaction)
from danmotkowicz.airbnb
order by overall_satisfaction desc

select
	avg (overall_satisfaction) as avg_overall_satisfaction
from danmotkowicz.airbnb
where overall_satisfaction > 0;

--Find the average and maximum price by room_type and accommodates for all units in Girdwood neighborhood
Select 
	room_type,
	accommodates,
	AVG (price) as average_price,
	MAX (price) as max_price
FROM danmotkowicz.airbnb
WHERE neighborhood = 'Girdwood'
Group by 
	room_type,
	accommodates
ORDER BY
	room_type,
	accommodates
;

--highest review in a neighborhood by neighborhood
SELECT 
	neighborhood,
	MAX(reviews)as highest_review
FROM danmotkowicz.airbnb
Group by
	neighborhood
Order by MAX(reviews)desc
;