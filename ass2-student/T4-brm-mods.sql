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
