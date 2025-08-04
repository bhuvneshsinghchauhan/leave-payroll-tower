insert into LEAVE_REQUEST (EMP_ID,TYPE_ID,START_DATE,END_DATE,STATUS,APPROVER_ID,REQUESTED_ON)
-- 1. Riya asks for casual leave, still pending
values (22, 1,  '08-20-2025',  '08-22-2025', 'PENDING', NULL, '08-19-2025');

insert into LEAVE_REQUEST (EMP_ID,TYPE_ID,START_DATE,END_DATE,STATUS,APPROVER_ID,REQUESTED_ON)
-- 2. Akash took sick leave, HR (Rohit) approved it
values (21, 2,  '07-10-2025',  '07-12-2025', 'APPROVED', 24,'07-10-2025');

insert into LEAVE_REQUEST (EMP_ID,TYPE_ID,START_DATE,END_DATE,STATUS,APPROVER_ID,REQUESTED_ON)
-- 3. Sachin’s single-day casual leave was rejected by HR
values (25, 1,  '08-05-2025',  '08-05-2025', 'REJECTED', 24,'08-05-2025');

insert into LEAVE_REQUEST (EMP_ID,TYPE_ID,START_DATE,END_DATE,STATUS,APPROVER_ID,REQUESTED_ON)
-- 4. Seema’s bereavement leave already approved
values (2, 21,  '09-01-2025',  '09-10-2025', 'APPROVED', 24,'08-31-2025');

insert into LEAVE_REQUEST (EMP_ID,TYPE_ID,START_DATE,END_DATE,STATUS,APPROVER_ID,REQUESTED_ON)
-- 5. HR guy Rohit requests Diwali week off; pending HR head approval
values (24, 1,  '08-20-2025',  '10-23-2025', 'PENDING', NULL,'10-10-2025');