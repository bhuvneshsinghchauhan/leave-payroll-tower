-- === APP_USER_ROLE ===
CREATE TABLE app_user_role (
    user_id    NUMBER NOT NULL,
    role_id    NUMBER NOT NULL,
    granted_on DATE   DEFAULT SYSDATE,
    CONSTRAINT pk_user_role PRIMARY KEY (user_id, role_id),
    CONSTRAINT fk_ur_user FOREIGN KEY (user_id) REFERENCES app_user(user_id),
    CONSTRAINT fk_ur_role FOREIGN KEY (role_id) REFERENCES app_role(role_id)
);
