/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE admin(
		adminno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		id                            		VARCHAR2(20)		 NOT NULL,
		passwd                        		VARCHAR2(60)		 NOT NULL,
		grade                         		VARCHAR2(1)		 DEFAULT 'A'		 NOT NULL
);

COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.adminno is '관리자번호';
COMMENT ON COLUMN admin.id is '아이디';
COMMENT ON COLUMN admin.passwd is '패스워드';
COMMENT ON COLUMN admin.grade is '등급';


/**********************************/
/* Table Name: 게시판 */
/**********************************/
CREATE TABLE board(
		boardno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		adminno                       		NUMBER(10)		 NOT NULL,
		bname                         		VARCHAR2(50)		 NOT NULL,
		bseqno                        		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		bmode                         		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE board is '게시판';
COMMENT ON COLUMN board.boardno is '게시판 번호';
COMMENT ON COLUMN board.adminno is '관리자번호';
COMMENT ON COLUMN board.bname is '게시판명';
COMMENT ON COLUMN board.bseqno is '출력 순서';
COMMENT ON COLUMN board.bmode is '출력 모드';
COMMENT ON COLUMN board.rdate is '생성일';


/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		memberno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		id                            		VARCHAR2(20)		 NOT NULL,
		passwd                        		VARCHAR2(60)		 NOT NULL,
		mname                         		VARCHAR2(30)		 NOT NULL,
		age                           		INTEGER(3)		 NOT NULL,
		school_name                   		VARCHAR2(80)		 NOT NULL,
		tel                           		VARCHAR2(14)		 NOT NULL,
		zipcode                       		VARCHAR2(5)		 NULL ,
		address1                      		VARCHAR2(80)		 NULL ,
		address2                      		VARCHAR2(50)		 NULL ,
		mdate                         		DATE		 NOT NULL
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


/**********************************/
/* Table Name: 글 */
/**********************************/
CREATE TABLE writes(
		writesno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		boardno                       		NUMBER(10)		 NOT NULL,
		adminno                       		NUMBER(10)		 NULL ,
		memberno                      		NUMBER(10)		 NULL ,
		title                         		VARCHAR2(300)		 NOT NULL,
		content                       		CLOB(4000)		 NOT NULL,
		pw                            		VARCHAR2(15)		 NOT NULL,
		word                          		VARCHAR2(300)		 NULL ,
		rdate                         		DATE		 NOT NULL,
		file1                         		VARCHAR2(100)		 NULL ,
		file1saved                    		VARCHAR2(100)		 NULL ,
		size1                         		VARCHAR2(100)		 NULL ,
		wmode                         		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		thumb1                        		VARCHAR2(100)		 NULL ,
		passwd                        		VARCHAR2(20)		 NOT NULL,
  FOREIGN KEY (boardno) REFERENCES board (boardno),
  FOREIGN KEY (adminno) REFERENCES admin (adminno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE writes is '글';
COMMENT ON COLUMN writes.writesno is '글 번호';
COMMENT ON COLUMN writes.boardno is '게시판 번호';
COMMENT ON COLUMN writes.adminno is '관리자번호';
COMMENT ON COLUMN writes.memberno is '회원번호';
COMMENT ON COLUMN writes.title is '제목';
COMMENT ON COLUMN writes.content is '내용';
COMMENT ON COLUMN writes.pw is '패스워드';
COMMENT ON COLUMN writes.word is '검색어';
COMMENT ON COLUMN writes.rdate is '등록일';
COMMENT ON COLUMN writes.file1 is '메인이미지';
COMMENT ON COLUMN writes.file1saved is '실제 저장된 메인 이미지';
COMMENT ON COLUMN writes.size1 is '메인 이미지 크기';
COMMENT ON COLUMN writes.wmode is '출력모드';
COMMENT ON COLUMN writes.thumb1 is '썸네일';
COMMENT ON COLUMN writes.passwd is '패스워드';


/**********************************/
/* Table Name: 성적 정보 */
/**********************************/
CREATE TABLE score(
		score                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL,
		tname                         		VARCHAR2(300)		 NOT NULL,
		kor                           		NUMBER(10)		 DEFAULT 1		 NOT NULL,
		eng                           		NUMBER(10)		 DEFAULT 1		 NOT NULL,
		matha                         		NUMBER(10)		 NULL ,
		mathb                         		NUMBER(10)		 NULL ,
		han                           		NUMBER(10)		 NOT NULL,
		tam1                          		NUMBER(10)		 DEFAULT 1		 NULL ,
		tam2                          		NUMBER(10)		 DEFAULT 1		 NULL ,
		lang2                         		NUMBER(10)		 NULL ,
		sword                         		VARCHAR2(10)		 NULL ,
		rdate                         		DATE		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE score is '성적 정보';
COMMENT ON COLUMN score.score is '성적 번호';
COMMENT ON COLUMN score.memberno is '회원번호';
COMMENT ON COLUMN score.tname is '시험명';
COMMENT ON COLUMN score.kor is '국어';
COMMENT ON COLUMN score.eng is '영어';
COMMENT ON COLUMN score.matha is '수학 가';
COMMENT ON COLUMN score.mathb is '수학 나';
COMMENT ON COLUMN score.han is '한국사';
COMMENT ON COLUMN score.tam1 is '탐구1';
COMMENT ON COLUMN score.tam2 is '탐구2';
COMMENT ON COLUMN score.lang2 is '제2 외국어';
COMMENT ON COLUMN score.sword is '검색어';
COMMENT ON COLUMN score.rdate is '등록일';


/**********************************/
/* Table Name: 대학정보 */
/**********************************/
CREATE TABLE unvi(
		unvino                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		location                      		VARCHAR2(20)		 NOT NULL,
		unviname                      		VARCHAR2(30)		 NOT NULL
);

COMMENT ON TABLE unvi is '대학정보';
COMMENT ON COLUMN unvi.unvino is '대학번호';
COMMENT ON COLUMN unvi.location is '지역';
COMMENT ON COLUMN unvi.unviname is '대학이름';


/**********************************/
/* Table Name: 학과정보 */
/**********************************/
CREATE TABLE dept(
		deptno                        		NUMBER(10)		 NOT NULL,
		unvino                        		NUMBER(10)		 NOT NULL,
		dept_type                     		VARCHAR2(30)		 NOT NULL,
		dept_name                     		VARCHAR2(50)		 NOT NULL,
  PRIMARY KEY (deptno, unvino),
  FOREIGN KEY (unvino) REFERENCES unvi (unvino)
);

COMMENT ON TABLE dept is '학과정보';
COMMENT ON COLUMN dept.deptno is '학과번호';
COMMENT ON COLUMN dept.unvino is '대학번호';
COMMENT ON COLUMN dept.dept_type is '학과계열';
COMMENT ON COLUMN dept.dept_name is '학과이름';


/**********************************/
/* Table Name: 입시정보 */
/**********************************/
CREATE TABLE ipsi_info(
		ipsi_infono                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		unvino                        		NUMBER(10)		 NOT NULL,
		deptno                        		NUMBER(10)		 NOT NULL,
		ref_subject                   		NUMBER(10)		 NOT NULL,
		kor_rate                      		NUMBER(10)		 NOT NULL,
		mat_rate                      		NUMBER(10)		 NOT NULL,
		eng_rate                      		INTEGER(10)		 NOT NULL,
		tam_rate                      		INTEGER(10)		 NOT NULL,
		his_rate                      		INTEGER(10)		 NOT NULL,
		etc_rate                      		INTEGER(10)		 NOT NULL,
		eng_tb                        		VARCHAR2(20)		 NOT NULL,
		his_tb                        		VARCHAR2(20)		 NOT NULL,
  FOREIGN KEY (deptno,unvino) REFERENCES dept (deptno,unvino)
);

COMMENT ON TABLE ipsi_info is '입시정보';
COMMENT ON COLUMN ipsi_info.ipsi_infono is '입시정보번호';
COMMENT ON COLUMN ipsi_info.unvino is '대학번호';
COMMENT ON COLUMN ipsi_info.deptno is '학과번호';
COMMENT ON COLUMN ipsi_info.ref_subject is '반영과목';
COMMENT ON COLUMN ipsi_info.kor_rate is '국어반영비율';
COMMENT ON COLUMN ipsi_info.mat_rate is '수학반영비율';
COMMENT ON COLUMN ipsi_info.eng_rate is '영어반영비율';
COMMENT ON COLUMN ipsi_info.tam_rate is '탐구반영비율';
COMMENT ON COLUMN ipsi_info.his_rate is '한국사반영비율';
COMMENT ON COLUMN ipsi_info.etc_rate is '제2외/한_반영비율';
COMMENT ON COLUMN ipsi_info.eng_tb is '영어환산테이블';
COMMENT ON COLUMN ipsi_info.his_tb is '한국사환산테이블';


/**********************************/
/* Table Name: 가산점항목 */
/**********************************/
CREATE TABLE add_point(
		add_point_no                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		deptno                        		NUMBER(10)		 NOT NULL,
		unvino                        		NUMBER(10)		 NOT NULL,
		add_point_name                		VARCHAR2(20)		 NOT NULL,
		add_point_score               		VARCHAR2(20)		 NOT NULL,
  FOREIGN KEY (deptno,unvino) REFERENCES dept (deptno,unvino)
);

COMMENT ON TABLE add_point is '가산점항목';
COMMENT ON COLUMN add_point.add_point_no is '가산점항목번호';
COMMENT ON COLUMN add_point.deptno is '학과번호';
COMMENT ON COLUMN add_point.unvino is '대학번호';
COMMENT ON COLUMN add_point.add_point_name is '가산점항목이름';
COMMENT ON COLUMN add_point.add_point_score is '가산점점수';


/**********************************/
/* Table Name: 평가결과 */
/**********************************/
CREATE TABLE result(
		resultno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL,
		adminno                       		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE result is '평가결과';
COMMENT ON COLUMN result.resultno is '평가번호';
COMMENT ON COLUMN result.memberno is '회원번호';
COMMENT ON COLUMN result.adminno is '관리자번호';


/**********************************/
/* Table Name: 평가결과상세 */
/**********************************/
CREATE TABLE detail(
		detailno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		resultno                      		NUMBER(10)		 NOT NULL,
		mid_unvi                      		VARCHAR2(50)		 NOT NULL,
		up_unvi                       		VARCHAR2(50)		 NOT NULL,
		down_unvi                     		VARCHAR2(50)		 NOT NULL,
		info                          		VARCHAR2(5000)		 NOT NULL,
  FOREIGN KEY (resultno) REFERENCES result (resultno)
);

COMMENT ON TABLE detail is '평가결과상세';
COMMENT ON COLUMN detail.detailno is '평가상세번호';
COMMENT ON COLUMN detail.resultno is '평가번호';
COMMENT ON COLUMN detail.mid_unvi is '적정대학';
COMMENT ON COLUMN detail.up_unvi is '상향대학';
COMMENT ON COLUMN detail.down_unvi is '하향대학';
COMMENT ON COLUMN detail.info is '평가자의말';


