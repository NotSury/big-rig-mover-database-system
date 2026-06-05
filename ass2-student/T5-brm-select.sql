--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T5-brm-select.sql

--Student ID: 35651628
--Student Name: Surya Muni Peragas

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


/*
    -- JOIN is used to connect each quote to the customer who requested it.
    -- GROUP BY groups the quote rows for each customer.
    -- HAVING filters the grouped results based on quote count and average quote cost.
*/

SELECT 
    c.cust_no,
    NVL(c.cust_bname, TRIM(c.cust_gname || ' ' || c.cust_fname)) AS customer_name,
    COUNT(q.quote_no) AS num_quotes,
    LTRIM(to_char(AVG(q.quote_cost), '$999,999,990.00')) AS avg_quoted_cost

FROM customer c
JOIN quote q
ON c.cust_no = q.cust_no

GROUP BY
    c.cust_no,
    NVL(c.cust_bname, TRIM(c.cust_gname || ' ' || c.cust_fname))

HAVING COUNT(q.quote_no) > 1
AND AVG(q.quote_cost) > (
    SELECT AVG(quote_cost)
    FROM quote
)
ORDER BY 
    AVG(q.quote_cost) DESC,
    c.cust_no;

/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

/*
    -- The employee table is joined to itself to find each employee's manager name
    -- LEFT OUTER JOIN is used so managers with no manager still appear
    -- A correlated subquery counts the number of jobs scheduled by each employee
    -- The job count is only displayed for Truck Dispatchers
*/
SELECT
    e.emp_no,
    TRIM(e.emp_gname || ' ' || e.emp_fname) AS emp_name,
    CASE e.emp_role
        WHEN 'B' THEN 'Manager'
        WHEN 'T' THEN 'Truck Dispatcher'
        WHEN 'M' THEN 'Mechanic'
        WHEN 'D' THEN 'Driver'
    END AS emp_role_full,
    NVL(TRIM(m.emp_gname || ' ' || m.emp_fname), 'No Manager') AS manager_name,
    CASE 
        WHEN e.emp_role = 'T' THEN to_char((
            SELECT COUNT(*)
            FROM job j
            WHERE j.sched_emp_no = e.emp_no
        ))
    END AS jobs_dispatched
FROM employee e
    LEFT OUTER JOIN employee m
        ON e.emp_no_manager = m.emp_no
ORDER BY
    e.emp_no;

/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    c.truck_vin,

    -- RPAD is used so the full column heading is displayed
    RPAD(t.truck_rego, 10) AS truck_rego,
    RPAD(c.trailer_code, 12) AS trailer_code,

    -- Format trailer purchase cost as a right-aligned currency value
    LPAD(LTRIM(TO_CHAR(tr.trailer_purchase_cost, '$999,999,990.00')), 21) AS trailer_purchase_cost,
    -- Count the number of jobs assigned to each truck/trailer combination
    COUNT(j.job_no) AS num_jobs,

    -- Show total quoted cost for used combinations.
    -- If the combination has no jobs, show 'No jobs' instead.
    LPAD(NVL(LTRIM(TO_CHAR(SUM(q.quote_cost), '$999,999,990.00')), 'No jobs'), 17) AS total_quoted_cost,
    CASE
        WHEN COUNT(j.job_no) = 0 THEN 'Never Used'
        -- Compare against the average number of jobs for used combinations only
        WHEN COUNT(j.job_no) > (
            SELECT AVG(job_count)
            FROM (
                SELECT COUNT(*) AS job_count
                FROM job
                GROUP BY truck_vin, trailer_code
            )
        ) THEN 'High Use'
        ELSE 'Standard Use'
    END AS usage

FROM combination c

-- Get truck registration number 
JOIN truck t
ON c.truck_vin = t.truck_vin

-- Get trailer purchase cost
JOIN trailer tr
ON c.trailer_code = tr.trailer_code

-- LEFT OUTER JOIN keeps combinations with no jobs.
LEFT OUTER JOIN job j
ON c.truck_vin = j.truck_vin
AND c.trailer_code = j.trailer_code

-- Get quote costs for jobs linked to each combination.
LEFT OUTER JOIN quote q
ON j.quote_no = q.quote_no

GROUP BY
    c.truck_vin,
    t.truck_rego,
    c.trailer_code,
    tr.trailer_purchase_cost
    
ORDER BY
    COUNT(j.job_no) DESC,
    c.truck_vin,
    c.trailer_code;
