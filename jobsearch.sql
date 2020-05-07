drop database if exists Jobsearching;
create database Jobsearching;
use Jobsearching;

drop table if exists Applications;
drop table if exists Openings;
drop table if exists Positions;
drop table if exists Companies_Industries;
drop table if exists Offices;
drop table if exists Industries;
drop table if exists Companies;
drop table if exists People_Education;
drop table if exists Education_Levels;
drop table if exists People;
drop table if exists Professions;

create table Industries (
Industry_Id int not null auto_increment primary key,
Industry_Name varchar(255) not null
);

lock tables Industries write;
insert into Industries (Industry_Name)
values ('Investment Banking'),('Fast-Food'),('Consulting'),('Computer Hardware'),('Computer Software'),('Insurance'),('Federal Agency'),('Health Care'),('Enterprise Software'),('Education'),('Airlines'),('Internet'),('Supermarkets'),('Construction'),('Apparel'),('Real Estate'),('Telecommunications'),('Automotive Parts'),('Biotech'),('Hotels'),('Food & Beverage'),('Staffing');
unlock tables;

create table Companies (
Company_Id int not null auto_increment primary key,
Company_Name varchar(255) not null,
Company_Size mediumint
);

lock tables Companies write;
insert into Companies (Company_Name, Company_Size)
values ('Intel',10000),('Epic',5000),('Chick-fil-A',10000),('McDonalds',10000),('In-N-Out Burger',10000),('Google',10000),('Facebook',10000),('LinkedIn',10000),('Survey Monkey',500),('Slack',1000),('Hubspot',1000),('Salesforce',10000),('VMWare',10000),('Adobe',10000),('Intuit',5000),('SAP',10000),('Microsoft',10000),('Apple',10000),('NVIDIA',10000),('Hilton',10000),('Kimpton',5000),('Trader Joe\'s',10000),('HEB',10000),('Wegmans',10000),('Costco',10000),('Sammons Financial',1000),('Acuity Insurance',1000),('Bain',5000),('BCG',10000),('McKinsey',10000),('Slalom',5000),('PwC',10000),('Massachusetts General Hospital',10000),('St. Jude Children\'s Hospital',1000),('Mayo Clinic',10000),('Southwest Airlines',10000),('American Airlines',10000),('Delta Airlines',10000),('Power Home Remodeling',1000),('Taylor Morrison',1000),('Power Design',1000),('Camden Property Trust',1000),('Keller Williams',200),('Irvine Company',1000),('eXp Realty',10000),( 'AT&T',10000),( 'T-Mobile',10000),('Verizon',10000);
unlock tables;

create table Companies_Industries (
Company_Id int not null,
Industry_Id int not null,
constraint fk_Ref_Company_Id foreign key (Company_Id) references Companies (Company_Id),
constraint fk_Ref_Industry_Id foreign key (Industry_Id) references Industries (Industry_Id)
);

lock tables Companies_Industries write;
insert into Companies_Industries values (1,4),(1,5),(2,5),(3,2),(4,2),(5,2),(6,12),(6,4),(6,5),(7,12),(8,12),(9,12),(10,12),(10,5),(11,5),(12,5),(13,5),(14,5),(15,5),(16,5),(17,5),(17,4),(18,5),(18,4),(19,4),(20,20),(21,20),(22,13),(23,13),(24,13),(25,13),(26,6),(27,6),(28,3),(29,3),(30,3),(31,3),(32,3),(33,8),(34,8),(35,8),(36,11),(37,11),(38,11),(39,14),(40,14),(41,14),(42,16),(43,16),(44,16),(45,16),(46,17),(47,17),(48,17);
unlock tables;

create table Offices (
Office_Id int not null auto_increment primary key,
Company_Id int not null,
Address varchar(100) not null,
City varchar(35) not null,
State char(2),
Zip char(5),
Country char(3) not null,
Size mediumint,
constraint fk_Offices_Company_Id foreign key (Company_Id) references Companies (Company_Id)
);

lock tables Offices write;
insert into Offices (Company_Id, Address, City, State, Zip, Country)
values (1,'2200 Mission College Boulevard','Santa Clara','CA','95054','USA'),(2,'1979 Milky Way','Verona','WI','53593','USA'),(3,'5200 Buffington Road','Atlanta','GA','30349','USA'),(4,'1045 W Randolph Street','Chicago','IL','60607','USA'),(5,'4199 Campus Drive','Irvine','CA','92612','USA'),(6,'1600 Amphitheatre Parkway','Mountain View','CA','94043','USA'),(7,'1 Hacker Way','Menlo Park','CA','94025','USA'),(8,'1000 W Maude Avenue','Sunnyvale','CA','94085','USA'),(9,'One Curiosity Way','San Mateo','CA','94403','USA'),(10,'500 Howard Street','San Francisco','CA','94105','USA'),(11,'25 1st Street','Cambridge','MA','02141','USA'),(12,'415 Mission Street','San Francisco','CA','94105','USA'),(13,'3401 Hillview Avenue','Palo Alto','CA','94304','USA'),(14,'151 South Almaden Boulevard','San Jose','CA','95113','USA'),(15,'2700 Coast Avenue','Mountain View','CA','94043','USA'),(16,'3999 West Chester Pike','Newtown Square','PA','19073','USA'),(17,'1 Microsoft Way','Redmond','WA','98052','USA'),(18,'1 Infinite Loop','Cupertino','CA','95014','USA'),(19,'2701 San Tomas Expressway ','Santa Clara','CA','95050','USA'),(20,'7930 Jones Branch Drive','McLean','VA','22102','USA'),(21,'222 Kearney Street','San Francisco','CA','94108','USA'),(22,'800 S. Shamrock Avenue','Monrovia','CA','91016','USA'),(23,'646 S Flores Street','San Antonio','TX','78204','USA'),(24,'1500 Brooks Avenue','Rochester','NY','14603','USA'),(25,'999 Lake Drive','Issaquah','WA','98027','USA'),(26,'4350 Westown Parkway','West Des Moines','IA','50266','USA'),(27,'2800 South Taylor Drive','Sheboygan','WI','53081','USA'),(28,'200 Clarendon Street','Boston','MA','02116','USA'),(29,'200 Pier 4 Boulevard','Boston','MA','02210','USA'),(30,'175 Greenwich Street','New York','NY','10007','USA'),(31,'821 2nd Avenue','Seattle','WA','98104','USA'),(32,'300 Madison Avenue','New York','NY','10017','USA'),(33,'55 Fruit Street','Boston','MA','02114','USA'),(34,'262 Danny Thomas Place','Memphis','TN','38105','USA'),(35,'200 First Street SW','Rochester','MN','55905','USA'),(36,'2702 Love Field Drive','Dallas','TX','75235','USA'),(37,'1 Skyview Drive','Fort Worth','TX','76155','USA'),(38,'1030 Delta Boulevard','Atlanta','GA','30320','USA'),(39,'2501 Seaport Drive','Chester','PA','19013','USA'),(40,'4900 North Scottsdale Road','Scottsdale','AZ','85251','USA'),(41,'11600 Ninth Street North\xa0','St. Petersburg','FL','33716','USA'),(42,'11\xa0Greenway Plaza','Houston','TX','77046','USA'),(43,'1221 South Mopac Expy','Austin','TX','78746','USA'),(44,'550 Newport Center Drive','Newport Beach','CA','92660','USA'),(45,'1321 King Street','Bellingham','WA','98229','USA'),(46,'208 South Akard St','Dallas','TX','75202','USA'),(47,'12920 South East 38th Street','Bellevue','WA','98006','USA'),(48,'1095 Avenue of the Americas','New York','NY','10036','USA');
unlock tables;

create table Education_Levels (
Education_Id int not null auto_increment primary key,
Education_Name varchar(255) not null
);

lock tables Education_Levels write;
insert into Education_Levels (Education_Name)
values ('High School'),('Some College'),('Bachelor\'s'),('Masters'),('Doctorate');
unlock tables;

create table People (
Person_Id int not null auto_increment primary key,
Person_Name varchar(255) not null,
Skills text
);

lock tables People write;
insert into People (Person_Name, Skills)
values ('Erin Lockett','Python Public Speaking Git'),('Samuel Lushtak','C C++ Java'),('Katherine Madden','Teamwork C Python'),('Christian Maldonado','Data Analysis Java Leadership'),('Lucas Mobley','Public Speaking Python SQL'),('Emily Modlin','SQL Public Speaking Python'),('Margarety Wang','Public Speaking Leadership Java'),('Charlotte Oster','Pandas SQL Teamwork'),('Alina Rainsford','Microsoft Office SQL Leadership'),('Jackson Burbank','SQL Docker Database Management'),('Angel Zhou','Microsoft Office Creativity Project Management'),('Samuel Wilkins','Python SQL Lisp'),('Carrie Wentzel','Docker OOP C'),('Henk Tillman','MongoDB Git Github'),('Bianca Capretta','Java Machine Learning Music Production'),('Grace Mccamy-Miller','Object-Oriented Programming Linux Unix'),('Natalie Kiss','Excel PowerPoint Microsoft Word'),('Megan Gillfillan','Microsoft Office SQL noSQL'),('Nicholas Bornstein','Public Speaking Leadership Teamwork'),('Zachary Campo','Excel SQL Python'),('Jake Conway','Microsoft Office Data Science Data Analysis'),('Johny Ek','Google Suite Project Management PowerPoint'),('Nicholas Mayes','Amazon Web Services Google Cloud Docker'),('Adam Libresco','Pandas SQL Python'),('Josh Khoo','Microsoft Office Python Java'),('Jennifer Golden','SQL Salesforce QuickBooks'),('Isabel Giacomazzi','Microsoft Office SQL noSQL'),('Garret Gabrianelli','Microsoft Office mySQL Data Analysis'),('Ernie Bates','Excel Data Science Python'),('Lucas Silberman','Public Speaking Project Management Leadership'),('Alyssa Wilkins','Project Managment Leadership Public Speaking'),('Jane Swart','Product Management Data Analysis PowerPoint'),('Kennedy Placek\xa0','Microsoft Office iWork Google Cloud'),('Isabella Renner','Teaching Java Python'),('Julien Smith','Microsoft Office Python C'),('Quinton Wessells','noSQL Data Entry mySQL'),('Rose Friedman','Microsoft Office Data Analysis Python'),('Charlotte Guerry','Microsoft Office Java C#'),('Bernard Ojeh','Excel UI/UX Product Design'),('Ian Mott','Google Suite Front-end Development Cloud Management'),('Julia Maxwell','Microsoft Office Amazon Web Services Data Visualization'),('Anisa Lester','Microsoft Office Data Visualization Java'),('Ryan Mathieson','PowerPoint Sales Marketing'),('Anna Harleen','Public Speaking Quickbooks Cloud Management'),('Ben Joyce','Event Planning Agile Development Scrum'),('Audrey Hector','Microsoft Office Testing Prototyping'),('Jordan Garrett','Java Technical Writing CAD'),('Sarah Modlin','C++ Design Product Design'),('Kuni Migimatsu','C# SEO A/B Testing'),('Lauren Perry-Carrera','Java Email Marketing Leadership'),('Katherine Grayson','Python Public Speaking Sales');
unlock tables;

create table People_Education (
Person_Id int not null,
Education_Id int not null,
constraint fk_Ref_Person_Id foreign key (Person_Id) references People (Person_Id),
constraint fk_Ref_Education_Id foreign key (Education_Id) references Education_Levels (Education_Id)
);

lock tables People_Education write;
insert into People_Education values (1,3),(2,4),(3,3),(4,5),(5,4),(6,3),(7,2),(8,3),(9,3),(10,4),(11,3),(12,3),(13,3),(14,2),(15,2),(16,4),(17,4),(18,2),(19,1),(20,3),(21,3),(22,2),(23,4),(24,3),(25,5),(26,4),(27,5),(28,4),(29,3),(30,3),(31,2),(32,4),(33,5),(34,4),(35,5),(36,3),(37,3),(38,2),(39,2),(40,4),(41,3),(42,4),(43,3),(44,2),(45,4),(46,4),(47,4),(48,3),(49,5),(50,2),(51,3);
unlock tables;

create table Professions (
Profession_Id int not null auto_increment primary key,
Profession_Name varchar(255) not null,
Profession_Description text,
Average_Salary int
);

lock tables Professions write;
insert into Professions (Profession_Name, Profession_Description, Average_Salary)
values ('Software Engineering','Process of analyzing user requirements and then designing, building, and testing software application which will satisfy those requirements.',110000),('Data Science','Interdisciplinary field focused on extracting knowledge from data sets, which are typically large.',113000),('Data Engineering','Aspect of data science that focuses on practical applications of data collection and analysis.',102864),('Data Analytics','Science of analyzing raw data in order to make conclusions about that information.',62453),('Solution Engineering','Network engineers who provide solutions to a variety of problems that occur with software or hardware.',87469),('Consulting','Business of providing expert advice to a specific group of people.',75000),('Investment Banking','Help their clients raise money in the capital markets, provide various financial advisory services, and assist with mergers and acquisitions.',96000),('Financial Analytics ','Creation of ad hoc analysis to answer specific business questions and forecast possible future financial scenarios.',61971),('Quality Assurance Engineering','Responsible for assessing the quality of specifications and technical design documents in order to ensure timely, relevant and meaningful feedback.',56616),('Performance Engineering','Encompasses the techniques applied during a systems development life cycle to ensure the non-functional requirements for performance (such as throughput, latency, or memory usage) will be met.',110123);
unlock tables;

create table Positions (
Position_Id int not null auto_increment primary key,
Profession_Id int not null,
Office_Id int not null,
Person_Id int not null,
Salary int not null,
Start_Date date not null,
End_Date date,
constraint fk_Positions_Profession_Id foreign key (Profession_Id) references Professions (Profession_Id),
constraint fk_Positions_Office_Id foreign key (Office_Id) references Offices (Office_Id),
constraint fk_Positions_Person_Id foreign key (Person_Id) references People (Person_Id)
);

lock tables Positions write;
insert into Positions (Profession_Id, Office_Id, Person_Id, Salary, Start_Date, End_Date)
values (1,1,1,105000,'2018-04-05','2019-05-02'),(2,2,2,112000,'2018-04-08','2019-05-03'),(3,3,3,106000,'2018-04-09','2020-05-03'),(4,4,4,85000,'2018-06-08','2019-12-01'),(5,5,5,93000,'2018-07-02',null),(6,6,6,82000,'2018-08-01',null),(7,7,7,97000,'2018-08-03','2019-09-02'),(8,8,8,70000,'2018-08-09',null),(9,9,9,72000,'2018-10-02',null),(10,10,10,98000,'2018-11-02',null),(1,11,11,120000,'2018-11-02','2020-04-05'),(2,12,12,130000,'2018-11-05','2019-08-06'),(3,13,13,109000,'2018-11-08',null),(4,14,14,92000,'2018-12-04','2020-05-02'),(5,15,15,86000,'2018-12-06',null),(6,16,16,75000,'2018-12-15',null),(7,17,17,102000,'2018-12-20','2020-05-05'),(8,18,18,78500,'2019-01-02',null),(9,19,19,68000,'2019-01-10',null),(10,20,20,115000,'2019-04-03','2020-04-02'),(1,21,21,175000,'2019-04-15',null),(2,22,22,195000,'2019-06-15',null),(3,23,23,105000,'2019-08-02','2020-03-02'),(4,24,24,97000,'2019-08-15',null),(5,25,25,100000,'2019-08-16',null),(6,26,26,72000,'2019-08-16','2020-04-08'),(7,27,27,110000,'2019-09-03','2020-05-05'),(8,28,28,92000,'2019-10-02',null),(9,29,29,93000,'2020-01-02',null),(10,30,30,100000,'2020-03-02',null),(1,6,31,120000,'2017-05-30',null),(1,6,32,110000,'2014-12-03','2017-12-24'),(2,6,33,77000,'2019-05-22',null),(4,6,34,95000,'2016-10-01','2020-02-14'),(2,18,35,100000,'2020-01-17',null),(3,18,36,144000,'2013-06-06',null),(9,18,37,61000,'2011-02-15','2014-08-31'),(10,18,38,90000,'2019-05-20',null);
unlock tables;

create table Openings(
Opening_Id int not null auto_increment primary key,
Profession_Id int not null,
Office_Id int not null,
Opening_Description text not null,
constraint fk_Openings_Profession_Id foreign key (Profession_Id) references Professions (Profession_Id),
constraint fk_Openings_Office_Id foreign key (Office_Id) references Offices (Office_Id)
);

lock tables Openings write;
insert into Openings (Profession_Id, Office_Id, Opening_Description)
values (1,3,'Working on AWS.'),
    (2,4,'Building Machine Learning models. '),
    (2,7,'Analyzing Metrics.'),
    (3,8,'Building ETL pipeline.'),
    (3,9,'Developing in Scala.'),
    (6,10,'Financial and Actuarial Consulting.'),
    (7,2,'Analyzing merger and acquisition deals. '),
    (8,4,'Analyzing Financial data'),
    (9,8,'Testing applications.'),
    (10,9,'Ensuring performance throughout application lifecycle.'),
    (1,2,'Focusing on AWS Lambda Functions.'),
    (1,3,'Developing in Java.'),
    (1,4,'Developing in Kotlin.'),
    (1,7,'Developing in C.'),
    (1,8,'Developing in C#.'),
    (1,2,'Creating database tools.'),
    (1,3,'Developing in Python.'),
    (1,4,'Developing Azure tools.'),
    (1,7,'Developing back-end infrastructure tools.'),
    (1,8,'Developing in C++.'),
    (1,8,'Developing infrastructure platforms.'),
    (2,8,'Building time-series models.'),
    (3,8,'Developing pipelines on Azure. '),
    (4,2,'Creating monetization metrics.'),
    (5,3,'Working with clients on building solutions.'),
    (6,4,'Social Consulting.'),
    (7,7,'Working on healthcare acquisitions.'),
    (8,7,'Creating forecasting models.'),
    (9,4,'Testing APIs.'),
    (10,7,'Creating performance metrics.');
unlock tables;

create table Applications (
Applications_Id int not null auto_increment primary key,
Office_Id int not null,
Profession_Id int not null,
Person_Id int not null,
Offer binary not null,
Accepted binary not null,
Years_Of_Experience smallint not null,
constraint fk_Applications_Office_Id foreign key (Office_Id) references Offices (Office_Id),
constraint fk_Applications_Profession_Id foreign key (Profession_Id) references Professions (Profession_Id),
constraint fk_Applications_Person_Id foreign key (Person_Id) references People (Person_Id)
);

lock tables Applications write;
insert into Applications (Office_Id, Profession_Id, Person_Id, Offer, Accepted, Years_Of_Experience)
values (3,1,40,1,1,5),(4,2,41,0,0,7),(7,2,42,1,0,2),(8,3,43,0,0,10),(9,3,44,1,1,15),(10,6,45,0,0,13),(2,7,46,1,1,0),(4,8,47,0,0,8),(8,9,48,1,1,1),(9,10,49,1,1,5);
unlock tables;