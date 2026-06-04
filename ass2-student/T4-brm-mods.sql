--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-brm-mods.sql

--Student ID: 35651628
--Student Name: Surya Muni Peragas

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

--4(a)
-- Add new columns to the QUOTE table
-- quote_assigned_job stores whether the quote is assigned to a job
-- reason_not_converted stores the reason if the quote is not converted to a job
ALTER TABLE quote ADD (
    quote_assigned_job      CHAR(1) DEFAULT 'N' NOT NULL,
    reason_not_converted    VARCHAR2(200)
);

-- Comments for new QUOTE attributes

COMMENT ON COLUMN quote.quote_assigned_job IS 
    'Flag to show whether the quote has been assigned to a job (Y or N)';

COMMENT ON COLUMN quote.reason_not_converted IS 
    'Reason why the quote was not converted to a job';

-- Restrict the quote assignment status to valid values which are 'Y' or 'N'
ALTER TABLE quote
    ADD CONSTRAINT quote_assigned_job_chk 
        CHECK ( quote_assigned_job IN ('Y', 'N') );

-- Mark quotes as assigned if their quote number appears in the JOB table
UPDATE quote
SET quote_assigned_job = 'Y'
WHERE quote_no IN (
    SELECT quote_no
    FROM job
);

-- Mark quotes as not assigned if their quote number does not appear in the JOB table
UPDATE quote
SET quote_assigned_job = 'N'
WHERE quote_no NOT IN (
    SELECT quote_no
    FROM job
);

COMMIT;

-- Show the updated QUOTE table structure after adding the new columns
DESC quote;

-- Show the current assignment status for each quote
SELECT 
    quote_no,
    quote_assigned_job,
    reason_not_converted
FROM quote
ORDER BY quote_no;

--4(b)

-- Create table to store each truck service event
CREATE TABLE truck_service (
    service_no          NUMBER(5) NOT NULL,
    truck_vin           CHAR(17) NOT NULL,
    service_start_dt    DATE NOT NULL,
    service_end_dt      DATE 
);

-- Comments for truck_service attributes
COMMENT ON COLUMN truck_service.service_no IS
    'Truck service number';

COMMENT ON COLUMN truck_service.truck_vin IS
    'Vehicle Identification Number (VIN) of the truck being serviced';

COMMENT ON COLUMN truck_service.service_start_dt IS
    'Start date and time of the truck service';

COMMENT ON COLUMN truck_service.service_end_dt IS
    'End date and time of the truck service';

-- Primary key constraint for truck_service
ALTER TABLE truck_service
    ADD CONSTRAINT truck_service_pk PRIMARY KEY ( service_no );

-- Ensure the service end time is after the service start time
ALTER TABLE truck_service
    ADD CONSTRAINT service_end_dt_chk
        CHECK ( service_end_dt IS NULL OR service_end_dt > service_start_dt);

-- Create a lookup table for the types of service tasks
-- New task types can be added later without changing the table structure
CREATE TABLE service_task (
    service_task_code       CHAR(3) NOT NULL,
    service_task_name       VARCHAR2(50) NOT NULL
);

-- Comments for SERVICE_TASK attributes
COMMENT ON COLUMN service_task.service_task_code IS
    'Identifier for service task type';

COMMENT ON COLUMN service_task.service_task_name IS
    'Name of the service task type';

-- Primary key constraint for service_task
ALTER TABLE service_task
    ADD CONSTRAINT service_task_pk PRIMARY KEY ( service_task_code );

-- Each service task name must be unique
ALTER TABLE service_task
    ADD CONSTRAINT service_task_name_uq UNIQUE ( service_task_name );

-- Create table to store the tasks completed within each truck service
CREATE TABLE truck_service_task (
    service_no              NUMBER(5) NOT NULL,
    service_task_code       CHAR(3) NOT NULL,
    mechanic_emp_no         NUMBER(3) NOT NULL,
    service_task_note       VARCHAR2(200) NOT NULL
);

-- Comments for TRUCK_SERVICE_TASK attributes
COMMENT ON COLUMN truck_service_task.service_no IS
    'Truck service number this task belongs to';

COMMENT ON COLUMN truck_service_task.service_task_code IS
    'Identifier for the service task type';

COMMENT ON COLUMN truck_service_task.mechanic_emp_no IS
    'Employee number of the mechanic assigned to the service task';

COMMENT ON COLUMN truck_service_task.service_task_note IS
    'Free text note explaining the service task';

-- Primary key constraint for truck_service_task
ALTER TABLE truck_service_task
    ADD CONSTRAINT truck_service_task_pk PRIMARY KEY ( service_no, service_task_code );

/*
    FOREIGN KEYS
*/

-- Foreign Keys for truck_service table
ALTER TABLE truck_service
    ADD CONSTRAINT truck_truck_service_fk
        FOREIGN KEY ( truck_vin )
        REFERENCES truck ( truck_vin );

-- Foreign keys for truck_service_task table
ALTER TABLE truck_service_task 
    ADD CONSTRAINT truck_service_truck_service_task_fk
        FOREIGN KEY ( service_no )
        REFERENCES truck_service ( service_no );

ALTER TABLE truck_service_task
    ADD CONSTRAINT service_task_truck_service_task_fk
        FOREIGN KEY ( service_task_code )
        REFERENCES service_task ( service_task_code );

ALTER TABLE truck_service_task
    ADD CONSTRAINT employee_truck_service_task_fk
        FOREIGN KEY ( mechanic_emp_no )
        REFERENCES employee ( emp_no );

COMMIT;

-- Show the structure of the new truck service table
DESC truck_service;

-- Show the structure of the new service task table
DESC service_task;

-- Show the structure of the new truck service task table
DESC truck_service_task;