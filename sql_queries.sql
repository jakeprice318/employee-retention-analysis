/*
select *
from employee_clean
*/

/*
SELECT 
	age,
	city
FROM employee_clean
*/
/*
SELECT
	gender as Gender,
    count(*) as Amount
FROM employee_clean
group by gender
*/

/*
-- 1
SELECT 
	payment_tier,
    count(*)
FROM employee_clean
GROUP BY payment_tier
ORDER BY payment_tier
-- 2
SELECT
	ever_benched,
    count(*) as number_of_employees
FROM employee_clean	
GROUP BY ever_benched
-- 3
SELECT
	avg(age) as average_age
FROM employee_clean
*/
/*
SELECT
	gender as Gender,
    count(*) as Amount
FROM employee_clean
group by gender
*/
/*
SELECT
	city,
    count(*) as number_of_employees
FROM employee_clean
Group by city
order by count(*) desc
*/
/*
SELECT
	ever_benched,
    count(*)
FROM employee_clean
group by ever_benched
*/
/*
SELECT
		leave_or_not,
		count(*) as count
FROM employee_clean
WHERE ever_benched = "Yes"
GROUP BY  leave_or_not
*/
/*
SELECT
	ever_benched,
    leave_or_not,
    count(*) as count
FROM employee_clean
GROUP BY ever_benched, leave_or_not
ORDER BY count desc
*/
/*
SELECT 
	payment_tier,
    leave_or_not,
    count(*) as count
FROM employee_clean
GROUP BY payment_tier, leave_or_not
ORDER BY count desc
*/
/*
SELECT 
	case 
		when leave_or_not = 0 then "stayed"
        when leave_or_not = 1 then "left"
        end as employee_status,
	count(*) as employee_count,
	round(count(*) * 100 / sum(count(*)) over (),2) as percentage
FROM employee_clean
GROUP BY employee_status
*/

-- Does payment tier affect employee retention?
/*
SELECT 
	payment_tier as Payment_Tier,
    case leave_or_not when 0 then "Stayed" when 1 then "Left" else NULL end as Employee_Status,
    count(*) as Employee_Count
FROM employee_clean
GROUP BY payment_tier, leave_or_not
ORDER BY Employee_Count desc
*/
-- Do employees who leave have less experience in their current domain than employees who stay?
/*
SELECT 
	CASE leave_or_not
		WHEN "0" THEN "Stayed" 
        WHEN "1" THEN "Left" 
        ELSE NULL END as Employee_Status,
   ROUND(AVG(experience_in_current_domain),2) as Average_Experience
FROM employee_clean
GROUP BY Employee_Status
*/

-- Does age appear related to employee retention?
/*
SELECT 
	CASE leave_or_not when 0 then "Stayed" when 1 then "Left" ELSE NULL END as Employee_Status,
    ROUND(AVG(age),2) as Average_Age
FROM employee_clean
GROUP BY Employee_Status
*/

-- Does education level appear to influence employee retention?
/*
SELECT
	CASE leave_or_not when 0 then "Stayed" when 1 then "Left" else null end as Employee_Status,
    education as Education,
    COUNT(*) as Employee_Count
FROM employee_clean
GROUP BY Employee_Status, Education
ORDER BY Employee_Count desc
*/

-- Is employee retention different between genders?
/*
select 
	case leave_or_not when 0 then "Stayed" when 1 then "Left" else null end as Employee_Status,
    gender as Gender,
    count(*) as Employee_Count,
    round(count(*)*100/sum(count(*))over(partition by gender),2) as percentage
from employee_clean
group by Employee_Status, gender
*/

-- Does employee retention rate vary by city?
/*
select 
	case leave_or_not when 0 then "Stayed" when 1 then "Left" else null end as Employee_Status,
    city as City,
    count(*) as Employee_Count,
    round(count(*)*100/sum(count(*))over(partition by city),2) AS percentage
from employee_clean
group by Employee_Status, city
order by city
*/

-- Are employees who have been ever benched more likely to leave the company?

/*
select 
	case leave_or_not when 0 then "Stayed" when 1 then "Left" else null end as Employee_Status,
    ever_benched as ever_benched,
    count(*) as Employee_Count,
    round(count(*) *100 / sum(count(*)) over(partition by ever_benched),2) as percentage
from employee_clean
group by Employee_Status, ever_benched
*/

-- FINDINGS
-- 1. Age isnt related to retention
-- 2. Experience isnt related to retention
-- 3. Payment tier 2 Employees had 60% leave rate. In tier 1 37% and tier 3 28%. 
-- 4. Female Employees have a substantially higher leave rate(47%) than male employees(26%).
-- 5. Employees are far more likely to stay(73%) in Bangalore than leave(27%).
-- 6. Employees are far more likely to stay(68%) in New Delhi than leave(32%).
-- 7. Employees that have been benched have a noticeably higher leave rate(45%) than employees who have never been benched(33%).