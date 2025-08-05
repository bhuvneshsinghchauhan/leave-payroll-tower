# Authentication & Authorization Flow

## Overview
Custom authentication and role-based page access managed entirely through `lpct_pkg` package and Application Process.

## Flow
1. **Login**
   - `lpct_pkg.fn_validate_login` validates username/password.
   - Passwords hashed with SHA256 for secure storage.

2. **Role Fetch**
   - Application Process (On New Session) queries `APP_USER` and `APP_USER_ROLE` to populate `G_USER_ID` and `G_USER_ROLE`.

3. **Authorization**
   - `Is HR?` and `Is Employee?` authorization schemes restrict access to pages based on `G_USER_ROLE`.

## Security Highlights
- No plaintext passwords stored.
- Page-level authorization enforced even if user lands via bookmark.
- All logic centralized in `lpct_pkg` for maintainability.