-- Big Rig Mover Database System
-- T6-brm-json.sql
-- T6 - Generate customer quote documents as JSON for MongoDB

-- SQL*Plus settings: allow blank lines inside the statement, and use a wide
-- line so each JSON document prints on one untruncated line (WRAP OFF would
-- otherwise cut documents off at the default 80 character line size).
SET SQLBLANKLINES ON
SET LINESIZE 32767
SET TRIMOUT ON
SET PAGESIZE 100
SET WRAP OFF
SET HEADING OFF

SELECT
    JSON_OBJECT(
        -- Use the customer number as the MongoDB document _id
        '_id' VALUE c.cust_no,

        -- Build the customer's full name from given name and family name
                'customer_name' VALUE TRIM(c.cust_gname
                                           || ' ' || c.cust_fname),

        -- If the customer has no business name, display '-'
                'customer_business' VALUE nvl(
            c.cust_bname,
            '-'
        ),

        -- Combine the stored address fields into one address string
                'customer_address' VALUE TRIM(c.cust_street
                                              || ', '
                                              || c.cust_town
                                              || ', ' || c.cust_pcode),
                'customer_phone' VALUE c.cust_contact_no,

        -- Store customer level summary values in a nested JSON object
                'customer_stats' VALUE
            JSON_OBJECT(
            -- Count all quotes made by this customer
                'number_of_quotes' VALUE COUNT(q.quote_no),

            -- Count only quotes that have become jobs
                        'number_of_jobs' VALUE COUNT(j.job_no),

            -- Sum paid job costs. If job_cost is NULL, use quote_cost because NULL job_cost means
            -- the job cost equals the quote cost.
            -- If there are no paid jobs, display '-'
                        'total_paid_jobcost' VALUE nvl(
                    ltrim(to_char(
                        sum(
                            CASE
                                WHEN j.job_payment_made = 'Y' THEN
                                    nvl(
                                        j.job_cost,
                                        q.quote_cost
                                    )
                            END
                        ),
                        '$999,999,990.00'
                    )),
                    '-'
                ),

            -- Sum unpaid job costs. If there are no unpaid jobs, display '-'
                        'total_unpaid_jobcost' VALUE nvl(
                    ltrim(to_char(
                        sum(
                            CASE
                                WHEN j.job_payment_made = 'N' THEN
                                    nvl(
                                        j.job_cost,
                                        q.quote_cost
                                    )
                            END
                        ),
                        '$999,999,990.00'
                    )),
                    '-'
                )
            )
        FORMAT JSON,

        -- Store all quote records for the customer in a JSON array 
                'quotes' VALUE JSON_ARRAYAGG(
            JSON_OBJECT(
                'quote_no' VALUE q.quote_no,

                -- Format dates to match the required document example.
                        'quote_prepared_on' VALUE to_char(
                    q.quote_prepared_date,
                    'dd-Mon-yyyy'
                ),
                        'preferred_start_date' VALUE to_char(
                    q.quote_pref_start_date,
                    'dd-Mon-yyyy'
                ),
                        'start_location' VALUE q.quote_start_location,
                        'end_location' VALUE q.quote_end_location,

                -- Format the quote cost as currency
                        'quote_cost' VALUE ltrim(to_char(
                    q.quote_cost,
                    '$999,999,990.00'
                )),

                -- Quote assignment status that was added in task 4 is used here
                        'assigned_to_job' VALUE q.quote_assigned_job,

                -- If no job exists, display '-'
                -- If job_cost is NULL, use quote_cost because the costs are equal
                        'job_cost' VALUE
                    CASE
                        WHEN j.job_no IS NULL THEN
                            '-'
                        ELSE
                            ltrim(to_char(
                                nvl(
                                    j.job_cost,
                                    q.quote_cost
                                ),
                                '$999,999,990.00'
                            ))
                    END
            )
         ORDER BY q.quote_no)
    FORMAT JSON)
    || ','
  FROM customer c
  JOIN quote q
ON c.cust_no = q.cust_no
  LEFT OUTER JOIN job j
ON q.quote_no = j.quote_no
 GROUP BY c.cust_no,
          c.cust_gname,
          c.cust_fname,
          c.cust_bname,
          c.cust_street,
          c.cust_town,
          c.cust_pcode,
          c.cust_contact_no
 ORDER BY c.cust_no;