create or replace package "LPCT_PKG" as

FUNCTION fn_validate_login (
                                p_username IN varchar2, 
                                p_password IN varchar2
                            ) RETURN BOOLEAN ;
                            
PROCEDURE prc_set_user_password (
    p_user_id        IN app_user.user_id%TYPE,
    p_plain_password IN VARCHAR2
);

PROCEDURE prc_sync_holidays (
  p_year    IN VARCHAR2 DEFAULT TO_CHAR(SYSDATE, 'YYYY'),
  p_country IN VARCHAR2 DEFAULT 'IN'
);

end "LPCT_PKG";
/