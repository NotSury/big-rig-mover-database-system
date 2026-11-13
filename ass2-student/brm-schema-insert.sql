/*
  Big Rig Mover Database System
  brm-schema-insert.sql - base tables and seed data

  Creates the four "base" tables that the rest of the project builds on
  (CUSTOMER, TRUCK, TRAILER, COMBINATION) and loads them with fictional
  sample data. Run this script first, then T1 to T6 in order.

  All names, addresses, vehicle identifiers and costs in this file are
  invented for demonstration purposes. Phone numbers use the range that
  the Australian Communications and Media Authority reserves for fiction.
*/

SET ECHO ON

-- Drop the base tables if they already exist so the script can be re-run.
-- CASCADE CONSTRAINTS also removes foreign keys from the T1 tables that
-- reference these tables. ORA-00942 (table does not exist) is ignored.
BEGIN
    FOR t IN (
        SELECT table_name
          FROM user_tables
         WHERE table_name IN ( 'COMBINATION', 'CUSTOMER', 'TRAILER', 'TRUCK' )
    ) LOOP
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS PURGE';
    END LOOP;
END;
/

--------------------------------------
-- CUSTOMER
-- A person or business that requests quotes.
--------------------------------------
CREATE TABLE customer (
    cust_no         NUMBER(4)    NOT NULL,
    cust_gname      VARCHAR2(30),
    cust_fname      VARCHAR2(30),
    cust_bname      VARCHAR2(40),
    cust_contact_no CHAR(10)     NOT NULL,
    cust_street     VARCHAR2(40) NOT NULL,
    cust_town       VARCHAR2(30) NOT NULL,
    cust_pcode      CHAR(4)      NOT NULL,
    CONSTRAINT customer_pk PRIMARY KEY ( cust_no ),
    -- every customer needs at least one name to be identifiable
    CONSTRAINT customer_name_chk CHECK ( cust_gname IS NOT NULL
                                         OR cust_fname IS NOT NULL
                                         OR cust_bname IS NOT NULL )
);

COMMENT ON TABLE customer IS 'Individuals and businesses that request removal quotes';
COMMENT ON COLUMN customer.cust_no IS 'Customer number (surrogate key)';
COMMENT ON COLUMN customer.cust_gname IS 'Given name of the customer or business contact';
COMMENT ON COLUMN customer.cust_fname IS 'Family name of the customer or business contact';
COMMENT ON COLUMN customer.cust_bname IS 'Trading name, only recorded for business customers';
COMMENT ON COLUMN customer.cust_contact_no IS 'Ten digit contact phone number';
COMMENT ON COLUMN customer.cust_street IS 'Street address';
COMMENT ON COLUMN customer.cust_town IS 'Town or suburb';
COMMENT ON COLUMN customer.cust_pcode IS 'Four digit Australian postcode';

--------------------------------------
-- TRUCK
-- A prime mover owned by the company, identified by its VIN.
--------------------------------------
CREATE TABLE truck (
    truck_vin              CHAR(17)    NOT NULL,
    truck_rego             CHAR(6)     NOT NULL,
    truck_kms              NUMBER(6)   NOT NULL,
    truck_last_service_kms NUMBER(6),
    truck_purchase_cost    NUMBER(8,2) NOT NULL,
    truck_date_purchased   DATE        NOT NULL,
    CONSTRAINT truck_pk PRIMARY KEY ( truck_vin ),
    CONSTRAINT truck_rego_uq UNIQUE ( truck_rego ),
    CONSTRAINT truck_kms_chk CHECK ( truck_kms >= 0 ),
    -- a service can only have happened at or before the current odometer reading
    CONSTRAINT truck_service_kms_chk CHECK ( truck_last_service_kms IS NULL
                                             OR truck_last_service_kms BETWEEN 0 AND truck_kms ),
    CONSTRAINT truck_cost_chk CHECK ( truck_purchase_cost > 0 )
);

COMMENT ON TABLE truck IS 'Prime movers in the company fleet';
COMMENT ON COLUMN truck.truck_vin IS 'Vehicle Identification Number (17 characters)';
COMMENT ON COLUMN truck.truck_rego IS 'Registration plate';
COMMENT ON COLUMN truck.truck_kms IS 'Current odometer reading in kilometres';
COMMENT ON COLUMN truck.truck_last_service_kms IS 'Odometer reading at the last service (NULL if never serviced)';
COMMENT ON COLUMN truck.truck_purchase_cost IS 'Price paid for the truck';
COMMENT ON COLUMN truck.truck_date_purchased IS 'Date the truck was bought';

--------------------------------------
-- TRAILER
--------------------------------------
CREATE TABLE trailer (
    trailer_code           CHAR(5)     NOT NULL,
    trailer_purchase_cost  NUMBER(8,2) NOT NULL,
    trailer_date_purchased DATE        NOT NULL,
    CONSTRAINT trailer_pk PRIMARY KEY ( trailer_code ),
    CONSTRAINT trailer_cost_chk CHECK ( trailer_purchase_cost > 0 )
);

COMMENT ON TABLE trailer IS 'Trailers that can be towed by the trucks';
COMMENT ON COLUMN trailer.trailer_code IS 'Fleet code for the trailer';
COMMENT ON COLUMN trailer.trailer_purchase_cost IS 'Price paid for the trailer';
COMMENT ON COLUMN trailer.trailer_date_purchased IS 'Date the trailer was bought';

--------------------------------------
-- COMBINATION
-- The truck/trailer pairings that are approved to work together.
-- Jobs (T1) must use one of these pairings.
--------------------------------------
CREATE TABLE combination (
    truck_vin    CHAR(17) NOT NULL,
    trailer_code CHAR(5)  NOT NULL,
    CONSTRAINT combination_pk PRIMARY KEY ( trailer_code, truck_vin ),
    CONSTRAINT truck_combination_fk FOREIGN KEY ( truck_vin )
        REFERENCES truck ( truck_vin ),
    CONSTRAINT trailer_combination_fk FOREIGN KEY ( trailer_code )
        REFERENCES trailer ( trailer_code )
);

COMMENT ON TABLE combination IS 'Approved truck and trailer pairings';
COMMENT ON COLUMN combination.truck_vin IS 'VIN of the truck in the pairing';
COMMENT ON COLUMN combination.trailer_code IS 'Code of the trailer in the pairing';

--------------------------------------
-- Seed data: CUSTOMER
-- Includes individuals (no business name), businesses, and customers
-- with only a given name or only a family name recorded.
--------------------------------------
INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (1, 'Nadia', 'Okafor', 'Kettle & Crate Catering', '0491570006', '210 Swanston Street', 'Melbourne', '3000');

INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (2, 'Tomasz', NULL, 'Ridgeline Timber Supplies', '0491570156', '8 Kent Street', 'Sydney', '2000');

INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (3, NULL, 'Abernethy', 'Coastline Surf Co.', '0491570157', '14 Marine Terrace', 'Fremantle', '6160');

INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (4, 'Leon', 'Fairweather', NULL, '0491570158', '33 Lygon Street', 'Melbourne', '3053');

INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (5, 'Priya', 'Raman', NULL, '0491570159', '5 Boundary Street', 'Brisbane', '4101');

INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (6, 'Callum', 'Hendry', NULL, '0491570110', '71 Beaufort Street', 'Perth', '6000');

INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (7, 'Mei', 'Tanaka', 'Bluegum Pottery Studio', '0491570313', '19 Orchid Avenue', 'Surfers Paradise', '4217');

INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (8, 'Rosalind', NULL, 'Ember Glassworks', '0491570737', '402 Smith Street', 'Collingwood', '3066');

INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (9, NULL, 'Vasquez', 'Southern Cross Seedlings', '0491571266', '27 Grote Street', 'Adelaide', '5000');

INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (10, NULL, 'Lindqvist', NULL, '0491571491', '12 Magill Road', 'Norwood', '5067');

INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (11, 'Hamish', 'Doyle', NULL, '0491571804', '88 Brunswick Street', 'Fortitude Valley', '4006');

INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (12, 'Ingrid', 'Solberg', 'Northbound Book Exchange', '0491572549', '61 Oxford Street', 'Leederville', '6007');

INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (13, 'Desmond', NULL, 'Harbourline Marine Parts', '0491572665', '150 Wickham Street', 'Brisbane', '4000');

INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (14, NULL, 'Mbeki', 'Highrise Cold Storage', '0491572983', '9 Glebe Point Road', 'Glebe', '2037');

INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (15, 'Arjun', NULL, NULL, '0491573770', '42 Albany Highway', 'Victoria Park', '6100');

INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (16, 'Fiona', 'McAllister', NULL, '0491573087', '6 Darling Street', 'Balmain', '2041');

INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (17, 'Kwame', 'Asante', NULL, '0491574118', '230 Sydney Road', 'Brunswick', '3056');

INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (18, 'Harriet', 'Calloway', 'Saltbush Provisions', '0491574632', '115 Port Road', 'Adelaide', '5007');

INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (19, 'Elias', 'Novak', NULL, '0491575254', '17 The Parade', 'Norwood', '5067');

INSERT INTO customer (cust_no, cust_gname, cust_fname, cust_bname, cust_contact_no, cust_street, cust_town, cust_pcode)
VALUES (20, 'Zara', 'Whitlock', NULL, '0491575789', '58 Church Street', 'Parramatta', '2150');

--------------------------------------
-- Seed data: TRUCK
-- Fictional VINs. Newer trucks have not had their first service yet,
-- so truck_last_service_kms is NULL for them.
--------------------------------------
INSERT INTO truck (truck_vin, truck_rego, truck_kms, truck_last_service_kms, truck_purchase_cost, truck_date_purchased)
VALUES ('6BRHV40A1PM100101', 'HV101K', 162400, 155000, 189500.00, TO_DATE('14-Feb-2023', 'dd-Mon-yyyy'));

INSERT INTO truck (truck_vin, truck_rego, truck_kms, truck_last_service_kms, truck_purchase_cost, truck_date_purchased)
VALUES ('6BRHV40A3NM100214', 'HV214K', 241750, 240100, 176000.00, TO_DATE('03-Aug-2022', 'dd-Mon-yyyy'));

INSERT INTO truck (truck_vin, truck_rego, truck_kms, truck_last_service_kms, truck_purchase_cost, truck_date_purchased)
VALUES ('6BRHV38C7LM100327', 'HV327L', 398200, 390000, 142750.00, TO_DATE('21-Sep-2020', 'dd-Mon-yyyy'));

INSERT INTO truck (truck_vin, truck_rego, truck_kms, truck_last_service_kms, truck_purchase_cost, truck_date_purchased)
VALUES ('6BRHV52B2RM100438', 'HV438M', 64300, 60000, 214900.00, TO_DATE('09-May-2024', 'dd-Mon-yyyy'));

INSERT INTO truck (truck_vin, truck_rego, truck_kms, truck_last_service_kms, truck_purchase_cost, truck_date_purchased)
VALUES ('6BRHV40A5NM100542', 'HV542K', 205900, 200500, 171300.00, TO_DATE('27-Jan-2022', 'dd-Mon-yyyy'));

INSERT INTO truck (truck_vin, truck_rego, truck_kms, truck_last_service_kms, truck_purchase_cost, truck_date_purchased)
VALUES ('6BRHV52B9SM100655', 'HV655M', 9800, NULL, 228400.00, TO_DATE('18-Nov-2025', 'dd-Mon-yyyy'));

INSERT INTO truck (truck_vin, truck_rego, truck_kms, truck_last_service_kms, truck_purchase_cost, truck_date_purchased)
VALUES ('6BRHV38C4PM100763', 'HV763L', 118650, 110000, 156200.00, TO_DATE('30-Jun-2023', 'dd-Mon-yyyy'));

INSERT INTO truck (truck_vin, truck_rego, truck_kms, truck_last_service_kms, truck_purchase_cost, truck_date_purchased)
VALUES ('6BRHV52B6RM100871', 'HV871M', 47100, 45000, 219750.00, TO_DATE('12-Mar-2024', 'dd-Mon-yyyy'));

INSERT INTO truck (truck_vin, truck_rego, truck_kms, truck_last_service_kms, truck_purchase_cost, truck_date_purchased)
VALUES ('6BRHV40A8SM100986', 'HV986K', 14250, NULL, 198600.00, TO_DATE('06-Oct-2025', 'dd-Mon-yyyy'));

INSERT INTO truck (truck_vin, truck_rego, truck_kms, truck_last_service_kms, truck_purchase_cost, truck_date_purchased)
VALUES ('6BRHV38C0LM101094', 'HV094L', 452300, 449800, 139900.00, TO_DATE('11-Apr-2020', 'dd-Mon-yyyy'));

--------------------------------------
-- Seed data: TRAILER
--------------------------------------
INSERT INTO trailer (trailer_code, trailer_purchase_cost, trailer_date_purchased)
VALUES ('TRL01', 61200.00, TO_DATE('02-Mar-2023', 'dd-Mon-yyyy'));

INSERT INTO trailer (trailer_code, trailer_purchase_cost, trailer_date_purchased)
VALUES ('TRL02', 58750.00, TO_DATE('19-Aug-2022', 'dd-Mon-yyyy'));

INSERT INTO trailer (trailer_code, trailer_purchase_cost, trailer_date_purchased)
VALUES ('TRL03', 44300.00, TO_DATE('07-Oct-2020', 'dd-Mon-yyyy'));

INSERT INTO trailer (trailer_code, trailer_purchase_cost, trailer_date_purchased)
VALUES ('TRL04', 72900.00, TO_DATE('23-May-2024', 'dd-Mon-yyyy'));

INSERT INTO trailer (trailer_code, trailer_purchase_cost, trailer_date_purchased)
VALUES ('TRL05', 56400.00, TO_DATE('15-Feb-2022', 'dd-Mon-yyyy'));

INSERT INTO trailer (trailer_code, trailer_purchase_cost, trailer_date_purchased)
VALUES ('TRL06', 78100.00, TO_DATE('29-Nov-2025', 'dd-Mon-yyyy'));

INSERT INTO trailer (trailer_code, trailer_purchase_cost, trailer_date_purchased)
VALUES ('TRL07', 51850.00, TO_DATE('11-Jul-2023', 'dd-Mon-yyyy'));

INSERT INTO trailer (trailer_code, trailer_purchase_cost, trailer_date_purchased)
VALUES ('TRL08', 63500.00, TO_DATE('04-Apr-2024', 'dd-Mon-yyyy'));

INSERT INTO trailer (trailer_code, trailer_purchase_cost, trailer_date_purchased)
VALUES ('TRL09', 49990.00, TO_DATE('26-Jan-2021', 'dd-Mon-yyyy'));

INSERT INTO trailer (trailer_code, trailer_purchase_cost, trailer_date_purchased)
VALUES ('TRL10', 39500.00, TO_DATE('13-Sep-2019', 'dd-Mon-yyyy'));

--------------------------------------
-- Seed data: COMBINATION
-- 16 approved pairings. The first eleven are used by jobs in T2/T3;
-- the remaining five are never used, which T5(c) reports as 'Never Used'.
--------------------------------------
INSERT INTO combination (truck_vin, trailer_code) VALUES ('6BRHV40A1PM100101', 'TRL01');
INSERT INTO combination (truck_vin, trailer_code) VALUES ('6BRHV40A1PM100101', 'TRL05');
INSERT INTO combination (truck_vin, trailer_code) VALUES ('6BRHV40A1PM100101', 'TRL08');
INSERT INTO combination (truck_vin, trailer_code) VALUES ('6BRHV40A3NM100214', 'TRL02');
INSERT INTO combination (truck_vin, trailer_code) VALUES ('6BRHV40A3NM100214', 'TRL08');
INSERT INTO combination (truck_vin, trailer_code) VALUES ('6BRHV38C7LM100327', 'TRL03');
INSERT INTO combination (truck_vin, trailer_code) VALUES ('6BRHV52B2RM100438', 'TRL04');
INSERT INTO combination (truck_vin, trailer_code) VALUES ('6BRHV40A5NM100542', 'TRL05');
INSERT INTO combination (truck_vin, trailer_code) VALUES ('6BRHV52B9SM100655', 'TRL06');
INSERT INTO combination (truck_vin, trailer_code) VALUES ('6BRHV38C4PM100763', 'TRL07');
INSERT INTO combination (truck_vin, trailer_code) VALUES ('6BRHV40A8SM100986', 'TRL08');

INSERT INTO combination (truck_vin, trailer_code) VALUES ('6BRHV38C7LM100327', 'TRL09');
INSERT INTO combination (truck_vin, trailer_code) VALUES ('6BRHV52B2RM100438', 'TRL02');
INSERT INTO combination (truck_vin, trailer_code) VALUES ('6BRHV52B6RM100871', 'TRL09');
INSERT INTO combination (truck_vin, trailer_code) VALUES ('6BRHV52B9SM100655', 'TRL10');
INSERT INTO combination (truck_vin, trailer_code) VALUES ('6BRHV38C0LM101094', 'TRL10');

COMMIT;

SET ECHO OFF
