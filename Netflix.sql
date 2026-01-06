create database netflix;
use netflix;
select * from titles;
-- count total numbers of records 
select count(*) as total_records from titles;
-- distribution of types
select type,count(*)as count from titles 
group by type
order by count desc; 

--
select rating,count(*)as count from titles 
group by rating
order by count desc; 

select release_year,count(*)as count from titles 
group by release_year
order by release_year desc; 

-- top 10 most common director 
select director,count(*)as count from titles 
group by director
order by count desc; 

select country,count(*)as count from titles 
group by country
order by count desc
limit 10;

-- 
select date_format(str_to_date(date_added,'%b %d,%Y'),'%Y-%m')as month,count(*)as count
from titles
group by month
order by month;

-- records added per year 
select year(str_to_date(date_added,'%b %d,%Y'))as year,count(*)as count
from titles
group by year
order by year;

-- count dramas records
select count(*)as count from titles
where listed_in like '%dramas%';

-- average duration of movies/shows
select avg(cast(substring_index(duration,' ', 1)as unsigned))as average_duration
from titles
where duration regexp'[0-9]+ min$';

-- find records with no director info
select count(*) as count from titles
where director=""; 

-- records relase in last 5 year
select * from titles
where release_year>=year(curdate())-5; 

-- records for india country
select type,title from titles
 where country ='india'; 


-- find records which have season
 select * from titles
 where duration like'%seasons%';
 
-- record which have more seasons
select * from titles
where duration like'%seasons%'
and cast(substring_index(substring_index(duration,' ',1),' ',-1)as unsigned)>2; 

select * from titles
where duration like'%seasons%'
and cast(substring_index(substring_index(duration,' ',1),' ',-1)as unsigned)>3;   