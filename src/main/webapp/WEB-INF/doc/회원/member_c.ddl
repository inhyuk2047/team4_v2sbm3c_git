/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
    memberno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    id                                VARCHAR2(20)     NOT NULL,
    passwd                            VARCHAR2(60)     NOT NULL,
    mname                             VARCHAR2(30)     NOT NULL,
    age                               NUMBER(5)    NOT NULL,
    school_name                       VARCHAR2(80)     NOT NULL,
    tel                               VARCHAR2(14)     NOT NULL,
    zipcode                           VARCHAR2(5)    NULL ,
    address1                          VARCHAR2(80)     NULL ,
    address2                          VARCHAR2(50)     NULL ,
    mdate                             DATE     NOT NULL,
    grade                             VARCHAR2(1)    NOT NULL
);

COMMENT ON TABLE member is '회원';
COMMENT ON COLUMN member.memberno is '회원번호';
COMMENT ON COLUMN member.id is '아이디';
COMMENT ON COLUMN member.passwd is '패스워드';
COMMENT ON COLUMN member.mname is '성명';
COMMENT ON COLUMN member.age is '나이';
COMMENT ON COLUMN member.school_name is '학교';
COMMENT ON COLUMN member.tel is '전화번호';
COMMENT ON COLUMN member.zipcode is '우편번호';
COMMENT ON COLUMN member.address1 is '주소1';
COMMENT ON COLUMN member.address2 is '주소2';
COMMENT ON COLUMN member.mdate is '가입일';
COMMENT ON COLUMN member.grade is '등급';

/* Sequence 생성 SQL */
DROP SEQUENCE member_seq;
CREATE SEQUENCE member_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지

  
 /* 등록 3건 이상 */
INSERT INTO member(memberno, id, passwd, mname, age, school_name, tel, zipcode, address1, address2, mdate, grade)
VALUES(member_seq.nextval, 'user1', '1234', 'M');

INSERT INTO member(memberno, id, passwd, mname, age, school_name, tel, zipcode, address1, address2, mdate, grade)
VALUES(member_seq.nextval, 'user2', '1234', 'M');

INSERT INTO member(memberno, id, passwd, mname, age, school_name, tel, zipcode, address1, address2, mdate, grade)
VALUES(member_seq.nextval, 'user3', '1234', 'M');

/* 회원 전체 조회 */
SELECT * 
FROM member

/* 중복 id 체크 */
SELECT COUNT(*)
FROM member
WHERE id = 'user1'

/* 회원 번호 별 조회 */
SELECT *
FROM memberno
WHERE memberno = 1

/* 패스워드 수정 */
UPDATE member
SET passwd = '5678'
WHERE memberno = 1

/* 회원 탈퇴 */
DELETE
FROM member
WHERE memberno = 1

COMMIT;
 
  
