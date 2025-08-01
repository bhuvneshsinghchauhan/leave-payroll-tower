insert into employee (first_name,last_name,email,doj,dept_code)
values ('Akash','Singh','akash@corp.local','01-15-2022','FIN'); 
--Here I got earlier not a valid month error as date was like this '2022-01-15' YYYY-MM-DD, then I ran select sysdate from dual to check how date are stored in workspace and then inserted in that format and it works

insert into employee (first_name,last_name,email,doj,dept_code)
values ('Riya','Sharma','riya@corp.local','05-10-2022','PRL');

insert into employee (first_name,last_name,email,doj,dept_code)
values ('Seema','Verma','seema@corp.local','07-18-2021','OPS');

insert into employee (first_name,last_name,email,doj,dept_code)
values ('Rohit','Kumar','rohit@corp.local','08-20-2024','HR');

insert into employee (first_name,last_name,email,doj,dept_code)
values ('Sachin','Jain','sachin@corp.local','01-19-2023','IT');

insert into leave_type (type_name,max_days_annual) 
values ('casual','10');

insert into leave_type(type_name,max_days_annual)
values('paid','15');

insert into leave_type(type_name,max_days_annual)
values('bereavement','5');