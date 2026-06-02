/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-brm-insert.sql

--Student ID: 35651628
--Student Name: Surya Muni Peragas

/*
Indicate if AI was used (Yes/No):

If AI was used:
I used <<specify the GenAI tool here>>
I used these prompts:
*/

--------------------------------------
--INSERT INTO employee
--------------------------------------

INSERT INTO employee VALUES (
    1, 'Sarah', 'Mitchell', '0411111111',
    NULL, 'B', NULL
);

INSERT INTO employee VALUES (
    2, 'Daniel', 'Cooper', '0411111112',
    NULL, 'B', NULL
);

INSERT INTO employee VALUES (
    3, 'Emma', 'Wilson', '0411111113',
    NULL, 'T', 1
);

INSERT INTO employee VALUES (
    4, 'James', 'Brown', '0411111114',
    NULL, 'T', 1
);

INSERT INTO employee VALUES (
    5, 'Olivia', 'Martin', '0411111115',
    NULL, 'M', 2
);

INSERT INTO employee VALUES (
    6, 'Michael', 'Johnson', '0411111116',
    'LIC00000001', 'D', 1
);

INSERT INTO employee VALUES (
    7, 'Liam', 'Taylor', '0411111117',
    'LIC00000002', 'D', 1
);

INSERT INTO employee VALUES (
    8, 'Noah', 'Davis', '0411111118',
    'LIC00000003', 'D', 2
);

INSERT INTO employee VALUES (
    9, 'Chloe', 'Anderson', '0411111119',
    NULL, 'T', 2
);

INSERT INTO employee VALUES (
    10, 'Ethan', 'Harris', '0411111120',
    NULL, 'M', 2
);

--------------------------------------
--INSERT INTO quote
--------------------------------------

INSERT INTO quote VALUES (
    1, TO_DATE('01-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('05-May-2026', 'dd-Mon-yyyy'),
    'Melbourne', 'Geelong', 850.00, 1, 3
);

INSERT INTO quote VALUES (
    2, TO_DATE('02-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('06-May-2026', 'dd-Mon-yyyy'),
    'Sydney', 'Newcastle', 920.00, 4, 4
);

INSERT INTO quote VALUES (
    3, TO_DATE('03-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('08-May-2026', 'dd-Mon-yyyy'),
    'Brisbane', 'Gold Coast', 780.00, 7, 9
);

INSERT INTO quote VALUES (
    4, TO_DATE('04-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('10-May-2026', 'dd-Mon-yyyy'),
    'Perth', 'Fremantle', 690.00, 12, 3
);

INSERT INTO quote VALUES (
    5, TO_DATE('05-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('12-May-2026', 'dd-Mon-yyyy'),
    'Adelaide', 'Glenelg', 650.00, 18, 4
);

INSERT INTO quote VALUES (
    6, TO_DATE('06-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('15-May-2026', 'dd-Mon-yyyy'),
    'Melbourne', 'Ballarat', 1100.00, 20, 9
);

INSERT INTO quote VALUES (
    7, TO_DATE('08-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('16-May-2026', 'dd-Mon-yyyy'),
    'Sydney', 'Wollongong', 970.00, 1, 3
);

INSERT INTO quote VALUES (
    8, TO_DATE('10-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('18-May-2026', 'dd-Mon-yyyy'),
    'Brisbane', 'Toowoomba', 990.00, 4, 4
);

INSERT INTO quote VALUES (
    9, TO_DATE('12-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('20-May-2026', 'dd-Mon-yyyy'),
    'Perth', 'Mandurah', 880.00, 7, 9
);

INSERT INTO quote VALUES (
    10, TO_DATE('14-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('22-May-2026', 'dd-Mon-yyyy'),
    'Adelaide', 'Port Adelaide', 720.00, 12, 3
);

INSERT INTO quote VALUES (
    11, TO_DATE('16-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('25-May-2026', 'dd-Mon-yyyy'),
    'Melbourne', 'Bendigo', 1250.00, 18, 4
);

INSERT INTO quote VALUES (
    12, TO_DATE('18-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('27-May-2026', 'dd-Mon-yyyy'),
    'Sydney', 'Canberra', 1450.00, 20, 9
);

INSERT INTO quote VALUES (
    13, TO_DATE('20-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('30-May-2026', 'dd-Mon-yyyy'),
    'Brisbane', 'Sunshine Coast', 1050.00, 1, 3
);

INSERT INTO quote VALUES (
    14, TO_DATE('22-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('01-Jun-2026', 'dd-Mon-yyyy'),
    'Perth', 'Bunbury', 1350.00, 4, 4
);

INSERT INTO quote VALUES (
    15, TO_DATE('24-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('03-Jun-2026', 'dd-Mon-yyyy'),
    'Adelaide', 'Mount Barker', 820.00, 7, 9
);

INSERT INTO quote VALUES (
    16, TO_DATE('26-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('05-Jun-2026', 'dd-Mon-yyyy'),
    'Melbourne', 'Shepparton', 1380.00, 12, 3
);

INSERT INTO quote VALUES (
    17, TO_DATE('28-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('08-Jun-2026', 'dd-Mon-yyyy'),
    'Sydney', 'Parramatta', 760.00, 18, 4
);

INSERT INTO quote VALUES (
    18, TO_DATE('30-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('10-Jun-2026', 'dd-Mon-yyyy'),
    'Brisbane', 'Ipswich', 810.00, 20, 9
);

INSERT INTO quote VALUES (
    19, TO_DATE('01-Jun-2026', 'dd-Mon-yyyy'),
    TO_DATE('12-Jun-2026', 'dd-Mon-yyyy'),
    'Perth', 'Joondalup', 740.00, 1, 3
);

INSERT INTO quote VALUES (
    20, TO_DATE('03-Jun-2026', 'dd-Mon-yyyy'),
    TO_DATE('15-Jun-2026', 'dd-Mon-yyyy'),
    'Adelaide', 'Murray Bridge', 1150.00, 4, 4
);

INSERT INTO quote VALUES (
    21, TO_DATE('05-Jun-2026', 'dd-Mon-yyyy'),
    TO_DATE('18-Jun-2026', 'dd-Mon-yyyy'),
    'Melbourne', 'Warrnambool', 1650.00, 7, 9
);

INSERT INTO quote VALUES (
    22, TO_DATE('08-Jun-2026', 'dd-Mon-yyyy'),
    TO_DATE('20-Jun-2026', 'dd-Mon-yyyy'),
    'Sydney', 'Penrith', 790.00, 12, 3
);

INSERT INTO quote VALUES (
    23, TO_DATE('10-Jun-2026', 'dd-Mon-yyyy'),
    TO_DATE('22-Jun-2026', 'dd-Mon-yyyy'),
    'Brisbane', 'Logan', 700.00, 18, 4
);

INSERT INTO quote VALUES (
    24, TO_DATE('12-Jun-2026', 'dd-Mon-yyyy'),
    TO_DATE('25-Jun-2026', 'dd-Mon-yyyy'),
    'Perth', 'Albany', 1950.00, 20, 9
);

INSERT INTO quote VALUES (
    25, TO_DATE('15-Jun-2026', 'dd-Mon-yyyy'),
    TO_DATE('28-Jun-2026', 'dd-Mon-yyyy'),
    'Adelaide', 'Victor Harbor', 980.00, 1, 3
);

INSERT INTO quote VALUES (
    26, TO_DATE('18-Jun-2026', 'dd-Mon-yyyy'),
    TO_DATE('01-Jul-2026', 'dd-Mon-yyyy'),
    'Melbourne', 'Traralgon', 1320.00, 4, 4
);

INSERT INTO quote VALUES (
    27, TO_DATE('20-Jun-2026', 'dd-Mon-yyyy'),
    TO_DATE('05-Jul-2026', 'dd-Mon-yyyy'),
    'Sydney', 'Orange', 1750.00, 7, 9
);

INSERT INTO quote VALUES (
    28, TO_DATE('24-Jun-2026', 'dd-Mon-yyyy'),
    TO_DATE('10-Jul-2026', 'dd-Mon-yyyy'),
    'Brisbane', 'Rockhampton', 2100.00, 12, 3
);

INSERT INTO quote VALUES (
    29, TO_DATE('28-Jun-2026', 'dd-Mon-yyyy'),
    TO_DATE('15-Jul-2026', 'dd-Mon-yyyy'),
    'Perth', 'Geraldton', 1850.00, 18, 4
);

INSERT INTO quote VALUES (
    30, TO_DATE('01-Jul-2026', 'dd-Mon-yyyy'),
    TO_DATE('20-Jul-2026', 'dd-Mon-yyyy'),
    'Adelaide', 'Whyalla', 2050.00, 20, 9
);

--------------------------------------
--INSERT INTO job
--------------------------------------


