/* Off-cycle payroll adjustments */
INSERT INTO payroll_adj (emp_id, amount, reason, posted_by)
-- 1. Akash gets a project bonus
VALUES (21, 2500.00, 'Project completion bonus', 24),

INSERT INTO payroll_adj (emp_id, amount, reason, posted_by)
-- 2. Riya’s salary deduction for unpaid leave
VALUES (22, -750.00, 'Excess leave deduction', 24),

INSERT INTO payroll_adj (emp_id, amount, reason, posted_by)
-- 3. Rohit receives travel reimbursement, posted by Riya
VALUES (24, 1800.00, 'Client-site travel reimbursement', 22);