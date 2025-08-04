-- Rohit is HR
INSERT INTO app_user_role (user_id, role_id)
SELECT u.user_id, r.role_id
FROM app_user u, app_role r
WHERE u.login_name = 'Rohit' AND r.role_name = 'HR';

-- Sachin is EMPLOYEE
INSERT INTO app_user_role (user_id, role_id)
SELECT u.user_id, r.role_id
FROM app_user u, app_role r
WHERE u.login_name = 'Sachin' AND r.role_name = 'EMPLOYEE';
