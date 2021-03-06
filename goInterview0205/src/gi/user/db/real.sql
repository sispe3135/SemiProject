CREATE TABLE TB_USER
(
    ID_GUBUN    VARCHAR2(20)    NOT NULL, 
    ID_SEQ      NUMBER          NOT NULL, 
    ID          VARCHAR2(50)    NOT NULL, 
    PW          VARCHAR2(50)    NOT NULL, 
    EMAIL       VARCHAR2(50)    NOT NULL, 
    PHONE       VARCHAR2(50)    NOT NULL, 
    TG_NO       VARCHAR2(20)    NULL, 
    TG_YN       CHAR(1)         NOT NULL, 
    USER_YN     CHAR(1)         NOT NULL, 
    AP_RSLT     VARCHAR2(20)    NULL, 
    OUT_RS      VARCHAR2(20)    NULL, 
    DAL_CNT     NUMBER          NULL, 
    CONSTRAINT TB_USER_PK PRIMARY KEY (ID)
)
/
drop SEQUENCE TB_USER_SEQ;
CREATE SEQUENCE TB_USER_SEQ
START WITH 1
INCREMENT BY 1;
/

DRop table tb_user;
CREATE OR REPLACE TRIGGER TB_USER_AI_TRG
BEFORE INSERT ON TB_USER 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT TB_USER_SEQ.NEXTVAL
    INTO :NEW.ID_SEQ
    FROM DUAL;
END;
/
INSERT INTO TB_USER
    (ID_GUBUN, 
    ID_SEQ,
    ID, 
    PW, 
    EMAIL, 
    PHONE, 
    TG_NO, 
    TG_YN, 
    USER_YN, 
    AP_RSLT, 
    OUT_RS, 
    DAL_CNT)
VALUES
    ('USER', 
    TB_USER_SEQ.NEXTVAL,
    '6', 
    '1', 
    'EMAIL 1', 
    'PHONE 1', 
    'TG_NO 1', 
    'Y', 
    'Y', 
    'AP_RSLT 1', 
    'OUT_RS 1', 
    1);

select * from tb_user;

--DROP TRIGGER TB_USER_AI_TRG;
/

--DROP SEQUENCE TB_USER_SEQ;
/

COMMENT ON TABLE TB_USER IS '회원 테이블'
/

COMMENT ON COLUMN TB_USER.ID_GUBUN IS 'USER, ADMIN, BLOCK'
/

COMMENT ON COLUMN TB_USER.ID_SEQ IS '회원SEQ'
/

COMMENT ON COLUMN TB_USER.ID IS '아이디'
/

COMMENT ON COLUMN TB_USER.PW IS '비밀번호'
/

COMMENT ON COLUMN TB_USER.EMAIL IS '이메일'
/

COMMENT ON COLUMN TB_USER.PHONE IS '휴대폰'
/

COMMENT ON COLUMN TB_USER.TG_NO IS '텔레그램 유저넘버'
/

COMMENT ON COLUMN TB_USER.TG_YN IS '텔레그램 수신동의'
/

COMMENT ON COLUMN TB_USER.USER_YN IS '가입/탈퇴'
/

COMMENT ON COLUMN TB_USER.AP_RSLT IS '적성검사 결과'
/

COMMENT ON COLUMN TB_USER.OUT_RS IS '탈퇴사유'
/

COMMENT ON COLUMN TB_USER.DAL_CNT IS '달풍선 갯수'
/