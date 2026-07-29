show databases;
use mountain;
show tables;
select * from water limit 3;
 
-- BASIC SQL QUESTIONS

-- 1. Display all records from the table

-- 2. Show all villages affected by Fluoride contamination

-- 3. Show all habitations affected by Salinity

-- 4. Find all records from EAST GODAVARI district

-- 5. Display village names and quality parameters only

-- 6. Find all villages under the PRATHIPADU block

-- 7. Count the total number of records in the dataset

-- 8. Count how many villages are affected by Fluoride

-- 9. Count how many villages are affected by Salinity

-- 10. Display distinct district names

------------------------------------------------------------

-- INTERMEDIATE SQL QUESTIONS

-- 11. Count affected villages district-wise

-- 12. Count affected villages block-wise

-- 13. Find the number of habitations in each Panchayat

-- 14. Find blocks having more than 5 affected villages

-- 15. Find villages with both Fluoride and Salinity contamination

-- 16. Show records ordered by Village_Name

-- 17. Show records ordered by Year descending

-- 18. Find duplicate village entries

-- 19. Find duplicate habitation entries

-- 20. Count contamination types district-wise

------------------------------------------------------------

-- FILTERING QUESTIONS

-- 21. Find all villages starting with letter 'P'

-- 22. Find habitation names containing 'KONDA'

-- 23. Find records where Panchayat_Name contains 'KADI'

-- 24. Find all Fluoride-affected villages in PRATHIPADU block

-- 25. Find all Salinity-affected villages in KADIAM block

-- 26. Find villages not affected by Fluoride

-- 27. Find records from year 2009

-- 28. Find all records except Salinity contamination

------------------------------------------------------------

-- AGGREGATION QUESTIONS

-- 29. Find the total number of villages in each block

-- 30. Find the total number of Panchayats in each district

-- 31. Find the most affected block

-- 32. Find the least affected Panchayat

-- 33. Count villages by contamination type

-- 34. Find the percentage of Fluoride cases

-- 35. Find the average number of villages per block

------------------------------------------------------------

-- ADVANCED SQL QUESTIONS

-- 36. Rank blocks based on contamination count

-- 37. Find top 3 most affected Panchayats

-- 38. Find the second highest affected block

-- 39. Use CASE statement to categorize contamination severity

-- 40. Find cumulative contamination count district-wise

-- 41. Create a view for Fluoride-affected villages

-- 42. Create a stored procedure to fetch village details

-- 43. Find villages sharing the same Panchayat

-- 44. Find records where Village_Name and Habitation_Name are different

-- 45. Find Panchayats having more Salinity than Fluoride cases

------------------------------------------------------------

-- DATA CLEANING QUESTIONS

-- 46. Remove duplicate records

-- 47. Trim extra spaces from village names

-- 48. Convert Year column into DATE format

-- 49. Replace NULL values in Quality_Parameter

-- 50. Standardize district names to uppercase

------------------------------------------------------------

-- REPORTING QUESTIONS

-- 51. Generate district-wise contamination summary

-- 52. Generate yearly contamination report

-- 53. Find contamination trend over years

-- 54. Generate block-wise Fluoride report

-- 55. Generate Panchayat-wise Salinity report

-- 56. Find total affected habitations in Andhra Pradesh

-- 57. Find districts with multiple contamination types

-- 58. Find villages with highest contamination occurrences

-- 59. Create monthly contamination summary

-- 60. Generate dashboard-ready summary query
 
-- start-- 


-- 1. Display all records from the table;
select * from water;

-- Show all villages affected by Fluoride contamination

SELECT `Village`,`State`
FROM water
WHERE `Quality` = 'Fluoride';

-- 3. Show all habitations affected by Salinity
SELECT `Village`,`State`
FROM water
WHERE `Quality` = 'Salinity';

-- 4. Find all records from EAST GODAVARI district
SELECT `Village`,`State`
FROM water
WHERE `District` = "EAST GODAVARI(04)";

-- 5. Display village names and quality parameters only

select `Village`,`Quality`
 from water;

-- 6. Find all villages under the PRATHIPADU block

select Block ,State from 
water where Block 
="PRATHIPADU(10)";
 
-- 7. Count the total number of records in the dataset

select count(*) as total_records from water;

-- 8. Count how many villages are affected by Fluoride

select  count(*),village from 
water group by village 
order by village limit 5 ;

select count(*),Quality from 
water group by Quality 
order by Quality asc limit 5;

-- Count how many villages are affected by Salinity

select count(*),state
 from water  where Quality 
 ="Salinity" group by state;
 
 
-- 10. Display distinct district names.
 
 select distinct  district from water;



-- INTERMEDIATE SQL QUESTIONS

-- 11. Count affected villages district-wise
select district, count(*) from water group by district;
select state, count(*) from water group by state;

-- Count affected villages block-wise
select Block, count(*) from water group by Block;

-- Find the number of habitations in each Panchayat

select Panchayat, count(Habitation
) from water group by Panchayat;


-- Find blocks having more than 5 affected villages

Select Block ,village from water  limit 5;

SELECT Block,
       COUNT(DISTINCT village) AS affected_villages
FROM water
GROUP BY Block
HAVING COUNT(DISTINCT village) > 5;

SELECT BLOCK,
COUNT(distinct VILLAGE) AS TOTAL_NUMBER 
FROM WATER group by BLOCK 
having count(distinct village)>5;

-- 15. Find villages with both Fluoride and Salinity contamination

select Village,quality,state
 from water where Quality 
 in ('Fluoride','Salinity');
 

-- 16. Show records ordered by Village.

 select * from 
 water order by year asc;
 
 -- 17. Show records ordered by Year descending
 
 select * from water order by  year desc;
 
 
-- 18. Find duplicate village entries

select distinct
 village from water;

-- 19. Find duplicate habitation entries

select distinct 
Habitation from water;

-- 20. Count contamination types district-wise
select District, count(*) 
from water 
group by District ;

-- FILTERING QUESTIONS

-- 21. Find all villages starting with letter 'P'

select * from water 
where  village Like "P%";

-- 22. Find habitation names containing 'KONDA'

select * from water
 where Habitation Like 'KONDA%';

-- 23. Find records where Panchayat_Name contains 'KADI'

SELECT * FROM WATER 
WHERE PANCHAYAT LIKE 'KADI%';

-- 24. Find all Fluoride-affected villages in PRATHIPADU block
  
SELECT *
FROM Water where
Block = 'PRATHIPADU'
AND Quality = 'Fluoride';

-- 25. Find all Salinity-affected villages in KADIAM block

-- 26. Find villages not affected by Fluoride

SELECT Village from
water where Quality <> "Fluoride";

-- 27. Find records from year 2009

select * from water where year ="01-04-2009";


-- 28. Find all records except Salinity contamination
select * from 
water where Quality
<>"Salinity";

-- AGGREGATION QUESTIONS

-- 29. Find the total number of villages in each block

SELECT 
    block,
    COUNT(DISTINCT village) AS total_villages
FROM water
GROUP BY block
ORDER BY total_villages DESC;


select block, count(distinct village) 
as total_village 
from water 
group by block
order by total_village 
desc;

select State , count(distinct District)
as total_district from water group by state order by total_district;

-- 30. Find the total number of Panchayats in each district

select district ,count(distinct panchayat)
 as total_panchayat 
 from water group by
 district order by total_panchayat like "B%" desc;
; 
 
 -- 31. Find the most affected block
 
 select BLOCK from water order by  BLOCK desc;
 
 -- 32. Find the least affected Panchayat
 
 select village from water order by panchayat desc;
 
 -- 33. Count villages by contamination type (not found).
 
 select  Quality, count(*) 
as village_name 
from water 
group by Quality;

-- 35.Find the average number of villages per block

select Block, avg(distinct BLOCK) as avg_village from water
group by Block  order by avg_village desc; 


-- DATA CLEANING QUESTIONS

-- 46. Remove duplicate records

select distinct * from  water ;



-- 47. Trim extra spaces from village names

select trim( village) from water;

-- 48. Convert Year column into DATE format.

SELECT STR_TO_DATE(CONCAT(Year, '-01-01'), '%Y-%m-%d')
FROM water;

-- 49. Replace NULL values in Quality_Parameter

SELECT Quality 
FROM water
WHERE Quality IS NULL;

-- 50. Standardize district names to uppercase

select upper (district) from water;
select lower (district) from water;
 
 -- REPORTING QUESTIONS
 

 -- 51. Generate district-wise contamination summary.

SELECT 
    district,
    COUNT(*) AS total_sales,

    SUM(CASE 
            WHEN Quality = 'Contaminated' THEN 1 
            ELSE 0 
        END) AS Contaminated_Samples,

    SUM(CASE 
            WHEN Quality = 'Safe' THEN 1 
            ELSE 0 
        END) AS Safe_Samples,

    ROUND(
        SUM(CASE 
                WHEN Quality = 'Contaminated' THEN 1 
                ELSE 0 
            END) * 100.0 / COUNT(*),
        2
    ) AS Contaminated_percentage

FROM WATER

GROUP BY district

ORDER BY Contaminated_percentage DESC;


-- 54. Generate Block-wise Fluoride Report

SELECT 
    state,
    Quality,
    district,
    COUNT(*) AS total_number,
    AVG(district) AS avg_district,
    MAX(district) AS MAX_district,
    MIN(district) AS MIN_district
FROM WATER
GROUP BY 
    state,
    Quality,
    district
ORDER BY 
    state;

-- 55. Generate Panchayat-wise Salinity report

select
State,
District,Village,count(*) as Total_number,
avg(Panchayat) AS avg_Panchayat,
max(Panchayat) AS MAX_Panchayat,
MIN(Panchayat) AS MIN_Panchayat,
std(Panchayat) AS STD_Panchayat,
sum(Panchayat) AS SUM_Panchayat
FROM WATER group by State,district,village
order by
State,district,village;

-- 56. Find total affected habitations in Andhra Pradesh
SELECT Habitation
FROM WATER
WHERE State = 'ANDHRA PRADESH';

-- 57. Find districts with multiple contamination types
SELECT 
    BLOCK,
    COUNT(DISTINCT village) AS total_villages
FROM water
GROUP BY BLOCK
HAVING COUNT(distinct village) <> 10;


-- 58. Find villages with highest contamination occurrences

SELECT 
    VILLAGE,
    COUNT(*) AS total_number
FROM water
GROUP BY VILLAGE
ORDER BY total_number DESC;

-- new question
-- Show all Arsenic contaminated villages.

select village  from water 
where Quality
="Arsenic";

-- Show all Iron contaminated villages.
select village from water where Quality ="Iron";

-- Count total contamination cases district-wise.

select district,count(*)
 as total_number from water group by 
 district order by district ;
 
 -- Find distinct contamination types.
 
 select distinct (district) from water;
 
 
-- Find top 5 districts with highest contamination.

select * from water limit 3;
select district,count(*) as total_number
 from water group by district 
 order by total_number desc;
 
 -- Find villages having both Iron and Arsenic contamination.
 
 select * from water 
 where Quality IN("iron","Arsenic");


-- Show duplicate village names.

SELECT distinct (village) from water;

-- Count contamination type state-wise.
select  state, count(*) as total_number 
from water group by state
order by total_number desc;

-- Find total Arsenic cases in Assam.

SELECT * FROM water
WHERE State = 'Assam' AND Quality = 'Arsenic';

-- Find total Iron cases in Assam.
SELECT * FROM water
WHERE State = 'Assam' AND Quality = 'Iron';

-- Show villages starting with letter ‘K’.
SELECT * From water
Where Village like "K%";

-- Find blocks having more than 10 contamination cases.
Select Block, count(*) as Contamination
From water group by 
block having 
count(*)>10 order by  
Contamination desc;

-- Rank districts based on contamination count.

SELECT District,
       COUNT(*) AS contamination_count,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_no
FROM water
GROUP BY District
;
 
 SELECT District,
       COUNT(*) AS contamination_count,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_no
FROM water
GROUP BY District
;
-- Find percentage contribution of each contaminant.  NOT FOUND
 
-- Find district with highest Arsenic contamination. 
 
SELECT district ,count(*) as
              total_number from water  where Quality =
 "Arsenic"  group by district order by total_number  desc;
 
 -- Count unique villages district-wise.
select distinct village from water;

-- Find contamination count village-wise.

select village ,count(*) as
				           total_number
from water 
          group by  village 
          order by total_number desc;
 
-- Find villages with repeated contamination records.

select village, count(*) as total_number
       from water 
		group by village 
           having count(*)>1 
                order by village desc;

-- Create summary table for contamination analysis.

select State
,district,Panchayat,
count(*) as total_number,
avg(district) as avg_district,
min(district) as min_district,
max(district) as max_district
from water 
group by state, Panchayat,District
order by state, Panchayat,District desc;

-- Show contamination data sorted by district and block.
 
-- Find blocks where only Arsenic contamination exists

 SELECT block
FROM contamination_table
GROUP BY block
HAVING 
    SUM(CASE WHEN contaminant = 'Arsenic' THEN 1 ELSE 0 END) > 0
    AND
    SUM(CASE WHEN contaminant <> 'Arsenic' THEN 1 ELSE 0 END) = 0;
 
 -- Find blocks where only Iron contamination exists.
 
 select block
 from water group by block
 having 
		sum(case when Quality ="iron" then 1 else 0 end ) >0
        and 
        sum(case when Quality <> "iron" then 1 else 0 end )= 0;
        
-- Find districts containing both contamination types.        


-- Count total records in the table.
SELECT count(*) 
FROM WATER;

-- Find null or blank records in village column.

SELECT village 
FROM water 
WHERE village IS NULL;

-- Find longest village name.

SELECT VILLAGE FROM WATER 
		order by LENGTH(VILLAGE) 
					DESC LIMIT 1;
-- Find shortest village name.                    
SELECT VILLAGE FROM
				WATER
	ORDER BY LENGTH(VILLAGE) ASC LIMIT 1;
 
 -- Export district-wise contamination summary.
select State
,district,Panchayat,
count(*) as total_number,
avg(district) as avg_district,
min(district) as min_district,
max(district) as max_district
from water 
group by state, Panchayat,District
order by state, Panchayat,District desc;


-- Find top contaminated blocks.
Select block from water 
order by block desc;  		

-- Find average contamination cases per district.		
SELECT 
    district,
    COUNT(*) AS Total_number
FROM water
GROUP BY district;

-- Show first 10 records from table.
select * from water limit 10;

-- Find contamination distribution by state.																										
select State
,district,Panchayat,
count(*) as total_number,
avg(district) as avg_district,
min(district) as min_district,
max(district) as max_district
from water 
group by state, Panchayat,District
order by state, Panchayat,District desc; 

-- Find villages ending with “PARA”

select * from water
 where village  
             like "%PARA";  
            
 
-- Find villages containing “NAGA”.
	select * from water
 where village  
             like "%NAGA%";  
             
 -- Create view for Arsenic contaminated villages.            
 select * from water where Quality="Arsenic";
 
 -- comp-- 
 select * from water where Quality="Arsenic";

             		