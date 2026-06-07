/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-brm-insert.sql

--Student ID: 35651628
--Student Name: Surya Muni Peragas

/*
Indicate if AI was used (Yes/No):
Yes

If AI was used:
I used <<Google Gemini>>
I used these prompts:

"Based on the uploaded T1-brm-schema.sql and the supplied brm-schema-insert.sql,
create sample data for the EMPLOYEE, QUOTE, and JOB tables only.
Use the existing customers and existing truck/trailer combinations from
brm-schema-insert.sql where foreign keys are required.

The data must include at least 10 employees with at least 2 managers, 2 truck dispatchers, 
1 mechanic, and 2 drivers. It must include 30 quotes involving at least 5 customers and 
2 truck dispatchers, with at least 2 customers placing at least 2 quotes. It must include 
20 jobs involving at least 10 truck/trailer combinations, with at least 5 combinations used 
in at least 2 jobs, at least 2 quotes not converted to jobs, at least 5 jobs with a different 
cost from the quote, and at least 5 jobs with the same cost as the quote. 
Use hardcoded numeric primary keys below 100, use TO_DATE for dates between 
1 May 2026 and 31 July 2026, make the data sensible, and treat all inserts as one transaction 
with one COMMIT at the end."

*/

--------------------------------------
--INSERT INTO employee
--------------------------------------
-- The data includes managers, truck dispatchers, mechanics, and drivers.

-- Sarah Mitchell is inserted as a manager for the Task 3 scenario.
INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 1,
           'Sarah',
           'Mitchell',
           '0411111111',
           NULL,
           'B',
           NULL );

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 2,
           'Daniel',
           'Cooper',
           '0411111112',
           NULL,
           'B',
           NULL );

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 3,
           'Emma',
           'Wilson',
           '0411111113',
           NULL,
           'T',
           1 );

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 4,
           'James',
           'Brown',
           '0411111114',
           NULL,
           'T',
           1 );

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 5,
           'Olivia',
           'Martin',
           '0411111115',
           NULL,
           'M',
           2 );

-- Michael Johnson is inserted as a driver for the Task 3 scenario.
INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 6,
           'Michael',
           'Johnson',
           '0411111116',
           'LIC00000001',
           'D',
           1 );

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 7,
           'Liam',
           'Taylor',
           '0411111117',
           'LIC00000002',
           'D',
           1 );

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 8,
           'Noah',
           'Davis',
           '0411111118',
           'LIC00000003',
           'D',
           2 );

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 9,
           'Chloe',
           'Anderson',
           '0411111119',
           NULL,
           'T',
           2 );

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 10,
           'Ethan',
           'Harris',
           '0411111120',
           NULL,
           'M',
           2 );

--------------------------------------
--INSERT INTO quote
--------------------------------------
-- The quotes are spread across multiple customers and truck dispatchers.
-- Several customers have more than one quote to support Task 5 and Task 6 queries.

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 1,
           TO_DATE('01-May-2026','dd-Mon-yyyy'),
           TO_DATE('05-May-2026','dd-Mon-yyyy'),
           'Melbourne',
           'Geelong',
           850.00,
           1,
           3 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 2,
           TO_DATE('02-May-2026','dd-Mon-yyyy'),
           TO_DATE('06-May-2026','dd-Mon-yyyy'),
           'Sydney',
           'Newcastle',
           920.00,
           4,
           4 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 3,
           TO_DATE('03-May-2026','dd-Mon-yyyy'),
           TO_DATE('08-May-2026','dd-Mon-yyyy'),
           'Brisbane',
           'Gold Coast',
           780.00,
           7,
           9 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 4,
           TO_DATE('04-May-2026','dd-Mon-yyyy'),
           TO_DATE('10-May-2026','dd-Mon-yyyy'),
           'Perth',
           'Fremantle',
           690.00,
           12,
           3 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 5,
           TO_DATE('05-May-2026','dd-Mon-yyyy'),
           TO_DATE('12-May-2026','dd-Mon-yyyy'),
           'Adelaide',
           'Glenelg',
           650.00,
           18,
           4 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 6,
           TO_DATE('06-May-2026','dd-Mon-yyyy'),
           TO_DATE('15-May-2026','dd-Mon-yyyy'),
           'Melbourne',
           'Ballarat',
           1100.00,
           20,
           9 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 7,
           TO_DATE('08-May-2026','dd-Mon-yyyy'),
           TO_DATE('16-May-2026','dd-Mon-yyyy'),
           'Sydney',
           'Wollongong',
           970.00,
           1,
           3 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 8,
           TO_DATE('10-May-2026','dd-Mon-yyyy'),
           TO_DATE('18-May-2026','dd-Mon-yyyy'),
           'Brisbane',
           'Toowoomba',
           990.00,
           4,
           4 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 9,
           TO_DATE('12-May-2026','dd-Mon-yyyy'),
           TO_DATE('20-May-2026','dd-Mon-yyyy'),
           'Perth',
           'Mandurah',
           880.00,
           7,
           9 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 10,
           TO_DATE('14-May-2026','dd-Mon-yyyy'),
           TO_DATE('22-May-2026','dd-Mon-yyyy'),
           'Adelaide',
           'Port Adelaide',
           720.00,
           12,
           3 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 11,
           TO_DATE('16-May-2026','dd-Mon-yyyy'),
           TO_DATE('25-May-2026','dd-Mon-yyyy'),
           'Melbourne',
           'Bendigo',
           1250.00,
           18,
           4 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 12,
           TO_DATE('18-May-2026','dd-Mon-yyyy'),
           TO_DATE('27-May-2026','dd-Mon-yyyy'),
           'Sydney',
           'Canberra',
           1450.00,
           20,
           9 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 13,
           TO_DATE('20-May-2026','dd-Mon-yyyy'),
           TO_DATE('30-May-2026','dd-Mon-yyyy'),
           'Brisbane',
           'Sunshine Coast',
           1050.00,
           1,
           3 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 14,
           TO_DATE('22-May-2026','dd-Mon-yyyy'),
           TO_DATE('01-Jun-2026','dd-Mon-yyyy'),
           'Perth',
           'Bunbury',
           1350.00,
           4,
           4 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 15,
           TO_DATE('24-May-2026','dd-Mon-yyyy'),
           TO_DATE('03-Jun-2026','dd-Mon-yyyy'),
           'Adelaide',
           'Mount Barker',
           820.00,
           7,
           9 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 16,
           TO_DATE('26-May-2026','dd-Mon-yyyy'),
           TO_DATE('05-Jun-2026','dd-Mon-yyyy'),
           'Melbourne',
           'Shepparton',
           1380.00,
           12,
           3 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 17,
           TO_DATE('28-May-2026','dd-Mon-yyyy'),
           TO_DATE('08-Jun-2026','dd-Mon-yyyy'),
           'Sydney',
           'Parramatta',
           760.00,
           18,
           4 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 18,
           TO_DATE('30-May-2026','dd-Mon-yyyy'),
           TO_DATE('10-Jun-2026','dd-Mon-yyyy'),
           'Brisbane',
           'Ipswich',
           810.00,
           20,
           9 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 19,
           TO_DATE('01-Jun-2026','dd-Mon-yyyy'),
           TO_DATE('12-Jun-2026','dd-Mon-yyyy'),
           'Perth',
           'Joondalup',
           740.00,
           1,
           3 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 20,
           TO_DATE('03-Jun-2026','dd-Mon-yyyy'),
           TO_DATE('15-Jun-2026','dd-Mon-yyyy'),
           'Adelaide',
           'Murray Bridge',
           1150.00,
           4,
           4 );

-- Quotes 21 to 30 are intentionally not converted into jobs.
-- This provides unfulfilled quotes for later query and JSON testing.
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 21,
           TO_DATE('05-Jun-2026','dd-Mon-yyyy'),
           TO_DATE('18-Jun-2026','dd-Mon-yyyy'),
           'Melbourne',
           'Warrnambool',
           1650.00,
           7,
           9 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 22,
           TO_DATE('08-Jun-2026','dd-Mon-yyyy'),
           TO_DATE('20-Jun-2026','dd-Mon-yyyy'),
           'Sydney',
           'Penrith',
           790.00,
           12,
           3 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 23,
           TO_DATE('10-Jun-2026','dd-Mon-yyyy'),
           TO_DATE('22-Jun-2026','dd-Mon-yyyy'),
           'Brisbane',
           'Logan',
           700.00,
           18,
           4 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 24,
           TO_DATE('12-Jun-2026','dd-Mon-yyyy'),
           TO_DATE('25-Jun-2026','dd-Mon-yyyy'),
           'Perth',
           'Albany',
           1950.00,
           20,
           9 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 25,
           TO_DATE('15-Jun-2026','dd-Mon-yyyy'),
           TO_DATE('28-Jun-2026','dd-Mon-yyyy'),
           'Adelaide',
           'Victor Harbor',
           980.00,
           1,
           3 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 26,
           TO_DATE('18-Jun-2026','dd-Mon-yyyy'),
           TO_DATE('01-Jul-2026','dd-Mon-yyyy'),
           'Melbourne',
           'Traralgon',
           1320.00,
           4,
           4 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 27,
           TO_DATE('20-Jun-2026','dd-Mon-yyyy'),
           TO_DATE('05-Jul-2026','dd-Mon-yyyy'),
           'Sydney',
           'Orange',
           1750.00,
           7,
           9 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 28,
           TO_DATE('24-Jun-2026','dd-Mon-yyyy'),
           TO_DATE('10-Jul-2026','dd-Mon-yyyy'),
           'Brisbane',
           'Rockhampton',
           2100.00,
           12,
           3 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 29,
           TO_DATE('28-Jun-2026','dd-Mon-yyyy'),
           TO_DATE('15-Jul-2026','dd-Mon-yyyy'),
           'Perth',
           'Geraldton',
           1850.00,
           18,
           4 );

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 30,
           TO_DATE('01-Jul-2026','dd-Mon-yyyy'),
           TO_DATE('20-Jul-2026','dd-Mon-yyyy'),
           'Adelaide',
           'Whyalla',
           2050.00,
           20,
           9 );

--------------------------------------
--INSERT INTO job
--------------------------------------
-- These jobs use existing truck/trailer combinations from the supplied COMBINATION table.

-- Jobs with NULL job_cost test cases where the job cost equals the quote cost.
INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 1,
           TO_DATE('05-May-2026 09:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('05-May-2026 17:00','dd-Mon-yyyy hh24:mi'),
           NULL,
           'Y',
           1,
           3,
           6,
           'TRL01',
           '1HGBH41JXMN109186' );

-- Jobs with a recorded job_cost test cases where the final job cost differs from the quote.
INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 2,
           TO_DATE('06-May-2026 08:30','dd-Mon-yyyy hh24:mi'),
           TO_DATE('06-May-2026 16:30','dd-Mon-yyyy hh24:mi'),
           970.00,
           'Y',
           2,
           4,
           7,
           'TRL02',
           '2FMDK3GC8BBA12345' );

INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 3,
           TO_DATE('08-May-2026 10:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('08-May-2026 15:00','dd-Mon-yyyy hh24:mi'),
           NULL,
           'N',
           3,
           9,
           8,
           'TRL03',
           '3VWFE21C04M000001' );

INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 4,
           TO_DATE('10-May-2026 09:30','dd-Mon-yyyy hh24:mi'),
           TO_DATE('10-May-2026 14:30','dd-Mon-yyyy hh24:mi'),
           730.00,
           'Y',
           4,
           3,
           6,
           'TRL04',
           '4T1BF1FK5CU123456' );

INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 5,
           TO_DATE('12-May-2026 11:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('12-May-2026 15:30','dd-Mon-yyyy hh24:mi'),
           NULL,
           'N',
           5,
           4,
           7,
           'TRL05',
           '5FNRL5H40BB098765' );

INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 6,
           TO_DATE('15-May-2026 08:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('15-May-2026 18:00','dd-Mon-yyyy hh24:mi'),
           1180.00,
           'Y',
           6,
           9,
           8,
           'TRL06',
           '1FTFW1ET5DFC10112' );

INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 7,
           TO_DATE('16-May-2026 09:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('16-May-2026 16:00','dd-Mon-yyyy hh24:mi'),
           NULL,
           'Y',
           7,
           3,
           6,
           'TRL07',
           '2C4RDGCG8ER123789' );

INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 8,
           TO_DATE('18-May-2026 08:30','dd-Mon-yyyy hh24:mi'),
           TO_DATE('18-May-2026 17:00','dd-Mon-yyyy hh24:mi'),
           940.00,
           'N',
           8,
           4,
           7,
           'TRL08',
           '5XYKT3A69CG234567' );

INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 9,
           TO_DATE('20-May-2026 10:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('20-May-2026 16:30','dd-Mon-yyyy hh24:mi'),
           NULL,
           'Y',
           9,
           9,
           8,
           'TRL05',
           '1HGBH41JXMN109186' );

INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 10,
           TO_DATE('22-May-2026 09:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('22-May-2026 14:00','dd-Mon-yyyy hh24:mi'),
           760.00,
           'Y',
           10,
           3,
           6,
           'TRL08',
           '2FMDK3GC8BBA12345' );

-- Jobs 11 to 20 reuse earlier truck/trailer combinations.
-- This ensures several combinations are used in at least two jobs.
INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 11,
           TO_DATE('25-May-2026 08:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('25-May-2026 18:00','dd-Mon-yyyy hh24:mi'),
           NULL,
           'N',
           11,
           4,
           7,
           'TRL01',
           '1HGBH41JXMN109186' );

INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 12,
           TO_DATE('27-May-2026 07:30','dd-Mon-yyyy hh24:mi'),
           TO_DATE('27-May-2026 19:00','dd-Mon-yyyy hh24:mi'),
           1520.00,
           'Y',
           12,
           9,
           8,
           'TRL02',
           '2FMDK3GC8BBA12345' );

INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 13,
           TO_DATE('30-May-2026 09:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('30-May-2026 17:30','dd-Mon-yyyy hh24:mi'),
           NULL,
           'Y',
           13,
           3,
           6,
           'TRL03',
           '3VWFE21C04M000001' );

INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 14,
           TO_DATE('01-Jun-2026 08:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('01-Jun-2026 19:00','dd-Mon-yyyy hh24:mi'),
           1280.00,
           'N',
           14,
           4,
           7,
           'TRL04',
           '4T1BF1FK5CU123456' );

INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 15,
           TO_DATE('03-Jun-2026 10:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('03-Jun-2026 16:00','dd-Mon-yyyy hh24:mi'),
           NULL,
           'Y',
           15,
           9,
           8,
           'TRL05',
           '5FNRL5H40BB098765' );

INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 16,
           TO_DATE('05-Jun-2026 08:30','dd-Mon-yyyy hh24:mi'),
           TO_DATE('05-Jun-2026 18:30','dd-Mon-yyyy hh24:mi'),
           1420.00,
           'Y',
           16,
           3,
           6,
           'TRL06',
           '1FTFW1ET5DFC10112' );

INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 17,
           TO_DATE('08-Jun-2026 09:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('08-Jun-2026 14:00','dd-Mon-yyyy hh24:mi'),
           NULL,
           'N',
           17,
           4,
           7,
           'TRL07',
           '2C4RDGCG8ER123789' );

INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 18,
           TO_DATE('10-Jun-2026 09:30','dd-Mon-yyyy hh24:mi'),
           TO_DATE('10-Jun-2026 15:30','dd-Mon-yyyy hh24:mi'),
           850.00,
           'Y',
           18,
           9,
           8,
           'TRL08',
           '5XYKT3A69CG234567' );

INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 19,
           TO_DATE('12-Jun-2026 10:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('12-Jun-2026 15:00','dd-Mon-yyyy hh24:mi'),
           NULL,
           'Y',
           19,
           3,
           6,
           'TRL05',
           '1HGBH41JXMN109186' );

INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( 20,
           TO_DATE('15-Jun-2026 08:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('15-Jun-2026 17:00','dd-Mon-yyyy hh24:mi'),
           1200.00,
           'N',
           20,
           4,
           7,
           'TRL08',
           '2FMDK3GC8BBA12345' );

COMMIT;