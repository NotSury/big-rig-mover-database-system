--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T1-brm-schema.sql

--Student ID: 35651628
--Student Name: Surya Muni Peragas

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/


/* drop table statements - do not remove*/

DROP TABLE employee CASCADE CONSTRAINTS PURGE;

DROP TABLE job CASCADE CONSTRAINTS PURGE;

DROP TABLE quote CASCADE CONSTRAINTS PURGE;

-- Task 1 Add Create table statements for the Missing TABLES below
-- Ensure all column comments, and constraints (other than FK's)
-- are included. FK constraints are to be added at the end of this script

-- EMPLOYEE

CREATE TABLE employee (
    emp_no          NUMBER(3) NOT NULL,
    emp_gname       VARCHAR2(30),
    emp_fname       VARCHAR2(30),
    emp_contact_no  CHAR(10) NOT NULL,
    emp_licenceno   VARCHAR2(11),
    emp_role        CHAR(1) NOT NULL,
    emp_no_manager  NUMBER(3)
);

-- Column comments to describe the purpose of each EMPLOYEE attribute
COMMENT ON COLUMN employee.emp_no IS
    'Employee number';

COMMENT ON COLUMN employee.emp_gname IS
    'Employee given name';

COMMENT ON COLUMN employee.emp_fname IS
    'Employee family name';

COMMENT ON COLUMN employee.emp_contact_no IS
    'Employee contact number';

COMMENT ON COLUMN employee.emp_licenceno IS
    'Employee licence number (only for drivers)';

COMMENT ON COLUMN employee.emp_role IS
    'Employee role - Manager (B), Truck Dispatcher (T), Mechanic (M), or Driver (D)';

COMMENT ON COLUMN employee.emp_no_manager IS
    'Employee number of the manager this employee reports to';

-- Primary key constraint for EMPLOYEE
ALTER TABLE employee 
    ADD CONSTRAINT employee_pk PRIMARY KEY (emp_no);

-- Employee contact number is unique
ALTER TABLE employee 
    ADD CONSTRAINT emp_contact_no_uq UNIQUE (emp_contact_no);

-- Employee drivers licence number must be unique
ALTER TABLE employee 
    ADD CONSTRAINT emp_licenceno_uq UNIQUE (emp_licenceno);

-- Restricting employee role values to valid role codes
ALTER TABLE employee 
    ADD CONSTRAINT emp_role_chk CHECK (emp_role IN ('B', 'T', 'M', 'D'));

-- Check that only drivers have licence numbers
ALTER TABLE employee ADD CONSTRAINT emp_licenceno_chk CHECK (
    ( emp_role = 'D' AND emp_licenceno IS NOT NULL )
    OR
    ( emp_role != 'D' AND emp_licenceno IS NULL)
);


-- JOB



-- QUOTE


-- Add all missing FK Constraints below here

-- /Foreign keys for employee table/
ALTER TABLE employee 
    ADD CONSTRAINT employee_employee_fk
        FOREIGN KEY (emp_no_manager)
        REFERENCES employee (emp_no);

-- /Foreign keys for job table/

-- /Foreign keys for quote table/