

-- 2.1 เพิ่มattribute comp_phone
ALTER TABLE company
    ADD COMP_PHONE CHAR(10);

--2.2 เปลี่ยนประเภทข้อมูล
ALTER TABLE company
    alter COLUMN comp_phone NUMERIC(10) ;

--2.3ลบCompany_phone
Alter table company 
    drop column comp_phone;

--2.4ปลี่ยนขนาด
ALTER TABLE company
    alter column COMP_NAME char(20);

--3.เพิ่มข้อมูลแต่ละตาราง
    INSERT INTO Address_1
        VALUES
            ('ad01','Pakgred','Nontaburi'),
            ('ad02','Warinchumrab','Ubonratchatani'),
            ('ad03','Sangkha','Surin'),
            ('ad04','Udomsuk','Bankok');

    INSERT into QUALIFICATION
        VALUES
            ('ASP','Web_ASP'),
            ('NW','Network'),
            ('c++','c++');

    INSERT INTO COMPANY
        VALUES
        ('cp01','stou-tec','Mr.Phop','ad01'),
        ('cp02','Stark-industry','Tony','ad01'),
        ('cp03','Betasoft','Reed','ad01');

    INSERT INTO POSITION
        VALUES
            ('PS001','Technical Programmer', '1' ,25000, 3 ,'cp01'),
            ('PS003','General Manager', '3' , 35000 , 2 ,'cp01'),
            ('PS010','ICT Manager', '2' , 30000 , 1,'cp01');

    INSERT INTO APPLICANT
        VALUES
            ('ap01','โจรุโน่ โจบาน่า','ปริญญาตรี','ComSci','Men','ad02'),
            ('ap02','นีโออาร์มสตรอง ','ปริญญาตรี','DataSci','Men','ad03'),
            ('ap03','โคลัมบิน่าไฮเปอร์เซเรเนีย','ปริญญาโท','Web&Mobile','Women','ad04');

    INSERT INTO POS_AP
        VALUES
            ('ap01','PS001','2026-05-01'),
            ('ap02','PS010','2026-06-12'),
            ('ap03','PS003','2026-06-20');
            
    INSERT INTO AP_QUAL
        VALUES
            ('ap01','ASP'),
            ('ap02','NW'),
            ('ap03','MGT');

    DROP TABLE COMPANY;

    DELETE FROM POSITION
        where qual_code ='c++'
            or qual_desc = 'c++';

    update company
        set comp_person ='นายบุญมี สุขมากง'
        where comp_id ='cp03';

    update POSITION
        set pos_number = '4'
        where pos_id = 'ps010';

    --4.โชตำแหน่งที่ต้องการรับสมัคร
        select  pos_id , pos_name , pos_period , pos_salary , pos_number
        from position
        order by comp_id ASC ;
    

