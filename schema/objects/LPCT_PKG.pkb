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

PROCEDURE prc_sync_holidays (
  p_year    IN VARCHAR2 DEFAULT TO_CHAR(SYSDATE, 'YYYY'),
  p_country IN VARCHAR2 DEFAULT 'IN'
) AS
  l_url      VARCHAR2(500);
  l_response CLOB;
BEGIN
  l_url := 'https://date.nager.at/api/v3/PublicHolidays/' || p_year || '/' || p_country;

  l_response := apex_web_service.make_rest_request(
    p_url => l_url,
    p_http_method => 'GET',
    p_credential_static_id => 'public_holiday_api'
  );

  INSERT INTO holiday (HOLIDAY_DATE, HOLIDAY_NAME, COUNTRY_CODE)
  SELECT 
    TO_DATE(j.date_str, 'MM-DD-YYYY'),
    j.name,
    j.country_code
  FROM JSON_TABLE(
    l_response,
    '$[*]'
    COLUMNS (
      date_str     VARCHAR2(20) PATH '$.date',
      name         VARCHAR2(200) PATH '$.name',
      country_code VARCHAR2(10)  PATH '$.countryCode'
    )
  ) j;

  COMMIT;
END;

---------------------------------------------------------------------------

end "LPCT_PKG";
/