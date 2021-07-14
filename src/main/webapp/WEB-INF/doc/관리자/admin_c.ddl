/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE admin(
    adminno                           NUMBER(10)     NOT NULL    PRIMARY KEY,
    id                                VARCHAR2(20)     NOT NULL,
    passwd                            VARCHAR2(60)     NOT NULL,
    grade                             VARCHAR2(1)    DEFAULT 'A'     NOT NULL
);

COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.adminno is '관리자번호';
COMMENT ON COLUMN admin.id is '아이디';
COMMENT ON COLUMN admin.passwd is '패스워드';
COMMENT ON COLUMN admin.grade is '등급';

/* Sequence 생성 SQL */
DROP SEQUENCE admin_seq;
CREATE SEQUENCE admin_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
  
 /* 등록 3건 이상 */
INSERT INTO admin(adminno, id, passwd, grade)
VALUES(admin_seq.nextval, 'admin1', '1234', 'A');

INSERT INTO admin(adminno, id, passwd, grade)
VALUES(admin_seq.nextval, 'admin2', '1234', 'A');

INSERT INTO admin(adminno, id, passwd, grade)
VALUES(admin_seq.nextval, 'admin3', '1234', 'A');
 
/* 관리자 전체 조회 */
SELECT * 
FROM admin

SELECT COUNT(*)
FROM admin
WHERE id = 'admin1'

/* 관리자 번호 별 조회 */
SELECT *
FROM admin
WHERE adminno = 1

/* 수정 */
UPDATE admin
SET passwd = '5678'
WHERE adminno = 1

/* 삭제 */
DELETE
FROM admin
WHERE adminno = 1

COMMIT;
 