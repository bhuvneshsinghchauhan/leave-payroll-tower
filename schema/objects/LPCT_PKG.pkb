create or replace package body "LPCT_PKG" as

---------------------------------------------------------------------------

FUNCTION fn_validate_login (
                                                p_username IN varchar2, 
                                                p_password IN varchar2
                                             ) RETURN BOOLEAN 
AS

l_login char(1);

BEGIN
    -- Try to find matching active user with hashed password
    SELECT 'Y'
    INTO l_login
    FROM app_user
    WHERE upper(login_name) = upper(p_username)
      AND pwd_hash   = STANDARD_HASH(p_password, 'SHA256')
      AND active_flag = 'Y';

    RETURN TRUE; -- found match → valid login

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE; -- no match → invalid login
    WHEN TOO_MANY_ROWS THEN
        -- Handle duplicate users (shouldn't happen, but safe)
        RETURN FALSE;
END fn_validate_login; 

---------------------------------------------------------------------------

PROCEDURE prc_set_user_password (
    p_user_id        IN app_user.user_id%TYPE,
    p_plain_password IN VARCHAR2
) AS
BEGIN
    UPDATE app_user
       SET pwd_hash = STANDARD_HASH(p_plain_password, 'SHA256')
     WHERE user_id = p_user_id;
     
    COMMIT; -- Optional: only if not managed by higher-level transaction
END prc_set_user_password;

---------------------------------------------------------------------------

end "LPCT_PKG";
/