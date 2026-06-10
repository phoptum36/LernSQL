

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
    
    --5.แสดงข้อมูลผู้สมัคร 
        select ap_id , ap_name , ap_ed , ap_maj , ap_sex , addr_id
        from applicant
        where  Ap_name Like 'A%'
        OR     ap_name  LiKe '%Y%' ;

    --6.หา POS_SALARY ,Max Min Average Count
        SELECT Max(pos_salary) as MaxSalary,
               Min(pos_salary) as MinSalary,
               AVG(pos_salary) as AverageSalary,
               Count(Pos_number) as CountPosition
            from position ;

    --7.แสดงข้อมูลไม่ซ้ำ
        SELECT distinct addr_chw  --แสดงchw ไม่ซ้ำ
            from address_1 , Applicant   --จากสองตาราง
            where address_1.addr_id = applicant.addr_id   --เงื่อนไขตรงกันและ เพศชาย
            AND ap_sex ='Men' ; 

    --8.    แสดง Pos_Id Pos_name Pos_salary Pos_period โดย Pos_salary 20k++
        select pos_id , pos_name , pos_salary , pos_period
            from position            
            where pos_salary >= 20000 
                and pos_period >= 1  
                and pos_period <=3 ;
            
--9. แสดง app_maj และcout(*)
        select ap_maj ,COUNT(*) as Number_Pos
        FROM applicant
        group by ap_maj;
       
    --10.แสดง Comp_name , Pos_name  
        select Comp_name , pos_name
        from COMPANY , POSITION
        where company.comp_id = position.comp_id ;


