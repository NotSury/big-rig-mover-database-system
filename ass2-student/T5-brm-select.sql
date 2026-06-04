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

-- JOIN is used to connect each quote to the customer who requested it.
-- GROUP BY groups the quote rows for each customer.
-- HAVING filters the grouped results based on quote count and average quote cost.
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



/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


