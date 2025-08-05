# Leave & Payroll Control Tower

Mini-portal that lets employees request leave, HR adjust payroll, and admins monitor KPIs.

## Roadmap
- **Week 1:** Schema + basic Interactive Reports
- **Week 2:** Remaining tables + seed data + LEAVE_REQUEST IR
- **Week 3:** Authentication / Authorization layer
- **Week 4:** Dynamic Actions & inline JS
- **Week 5:** REST Holiday sync, APEX Automations
- **Week 6:** Dashboards + analytic SQL
- **Week 7:** Payroll Adjustment wizard (APEX collections)
- **Week 8:** Performance tuning, unit tests, docs

## Tech Stack
- Oracle APEX 24.2
- Oracle SQL & PL/SQL
- JavaScript / jQuery (planned for dynamic actions)
- HTML / CSS (planned for UI customizations)
- Git (version control)

## Project Structure
leave-payroll-tower/
├─ schema/
│ ├─ objects/ # Table DDL scripts (modular per table)
│ └─ data/ # Seed data scripts
├─ screenshots/ # IR pages and future UI screenshots
└─ docs/ # ERD and documentation


---

## Progress Log

**2025-08-01**
- Created initial database schema (EMPLOYEE, LEAVE_TYPE)
- Seeded sample employees and leave types
- Committed DDL & seed data to `schema/objects` and `schema/data`

**2025-08-02**
- Added remaining schema objects (LEAVE_REQUEST, HOLIDAY, PAYROLL_ADJ, Auth tables)
- Seeded realistic test data across all tables

**2025-08-04**
- Built Interactive Reports for EMPLOYEE, LEAVE_REQUEST, PAYROLL_ADJ
- Enabled CRUD for all three
- Added screenshots of working pages
- Added database tables relation diagram

**2025-08-05**
- Implemented custom authentication using `lpct_pkg.fn_validate_login`
- Added SHA256 password hashing via `lpct_pkg.prc_set_user_password`
- Roles and User ID are now set via Application Process (On New Session) into `G_USER_ROLE` and `G_USER_ID`
- Created `Is HR?` and `Is Employee?` authorization schemes and applied to relevant pages
- No post-login redirect; users land on Home page and page-level authorization manages access


---

## Current Features
- Modular database schema (8 tables with proper FK relationships)
- Seeded dataset for demo and testing
- CRUD-enabled Interactive Reports for:
  - Employee management
  - Leave requests
  - Payroll adjustments
- Custom authentication & authorization implemented:
  - Hashed password storage (SHA256)
  - Role-based page protection using Application Items
  - Centralized logic inside `lpct_pkg` package


---

## Upcoming Features
- [ ] Add LOVs for foreign keys in IRs (show names instead of IDs)
- [ ] Draw ERD diagram and commit to `/docs`
- [ ] Implement role-based authorization (custom login, page protection)
- [ ] Add Dynamic Actions for status highlighting & inline validation
- [ ] Integrate REST API for holiday calendar sync
- [ ] Build dashboards with analytic SQL
- [ ] Performance tuning and final documentation

---

## Screenshots
- [Employee IR](screenshots/Screenshot%202025-08-04_employee_ir.png)
- [Leave Request IR](screenshots/Screenshot%202025-08-04_leave_req_ir.png)
- [Payroll Adjustment IR](screenshots/Screenshot%202025-08-04_payroll_adj_ir.png)

---

## Docs
- [ERD Diagram](docs/erd_v1.svg)

---

## Vision
This project is part of my **Oracle APEX interview preparation and portfolio building** — showcasing end-to-end app development:
- From schema design to deployment
- Covering APEX built-in features + custom code (SQL, PL/SQL, JS)
- Following modular version-control practices for clarity and reusability
