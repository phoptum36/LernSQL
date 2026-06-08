--เก็บที่อยู่
CREATE TABLE ADDRESS_1(
    ADDR_ID char(4) not NULL PRIMARY KEY ,
    ADDR_INFO VARCHAR(50) not NULL,
    ADDR_CHW VARCHAR(50) not NULL
);

--คุณสมบัติ
CREATE TABLE QUALIFICATION(
    QUAL_CODE VARCHAR(10) not null PRIMARY KEY,
    QUAL_DESC VARCHAR(50) not NULL
     
);
--บริษัทที่เปิดรับ
CREATE TABLE COMPANY(
    COMP_ID CHAR(4) NOT NULL PRIMARY KEY ,
    COMP_NAME VARCHAR(25) NOT NULL,
    Comp_person VARCHAR(25) NOT NULL,
    ADDR_ID char(4) not null REFERENCES ADDRESS_1(ADDR_ID) --โยงกลับไปหา address_1
);
--ตำแหน่งที่เปิด
CREATE TABLE POSITION(
    POS_ID CHAR(10) not NULL PRIMARY KEY ,
    POS_NAME VARCHAR(25)not NULL,
    POS_PERIOD char(2)not NULL,
    POS_SALARY INT not NULL,
    POS_NUMBER INT not NULL,
    COMP_ID CHAR(4) not null REFERENCES COMPANY(COMP_ID) --โยงกลับไป company  
);
--ผู้สมัคร
CREATE TABLE APPLICANT(
    AP_ID CHAR(4)  not NULL PRIMARY KEY,
    AP_NAME VARCHAR(50)not NULL,
    AP_ED VARCHAR(25)not NULL,
    AP_MAJ VARCHAR(25)not NULL,
    AP_SEX VARCHAR(10)not NULL,
    ADDR_ID CHAR(4) not null REFERENCES ADDRESS_1(ADDR_ID) --โยงกลับไปหา address_01
);
--รับสมัคร
    CREATE TABLE POS_AP(
    AP_ID CHAR(4) not NULL,
    POS_ID char(5) not NULL,
    ap_date DATE not null ,
    PRIMARY KEY (AP_ID,POS_ID) ,--คีย์หลักร่วม
    FOREIGN KEY (POS_ID)    REFERENCES POSITION(POS_ID), --โยงกลับไปหา position
    FOREIGN KEY (AP_ID)  REFERENCES APPLICANT(AP_ID) --โยงกลับไปapplicant
);
--มีคุณสมบัติ
    CREATE TABLE  AP_QUAL(
        AP_ID char(4)not NULL,
        QUAL_CODE VARCHAR(10) not NULL,
        PRIMARY KEY (AP_ID,QUAL_CODE),
        foreign key (ap_id)   references applicant(ap_id), --โยงกลับไป applicant
        foreign key (qual_code)  references qualification(qual_code) --โยงกลับไป qualification
    );
