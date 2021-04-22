DROP TABLE t_user CASCADE CONSTRAINT;
DROP TABLE t_store CASCADE CONSTRAINT;
DROP TABLE t_comment CASCADE CONSTRAINT;
DROP TABLE t_report CASCADE CONSTRAINT;
DROP TABLE t_qna CASCADE CONSTRAINT;
DROP TABLE t_answer CASCADE CONSTRAINT;
DROP TABLE t_favorite CASCADE CONSTRAINT;
DROP TABLE t_notice CASCADE CONSTRAINT;
DROP TABLE t_auth CASCADE CONSTRAINT;
DROP TABLE t_faq CASCADE CONSTRAINT;
DROP TABLE t_menu CASCADE CONSTRAINT;
DROP TABLE t_file CASCADE CONSTRAINT;
DROP SEQUENCE t_store_seq;
DROP SEQUENCE t_comment_seq;
DROP SEQUENCE t_qna_seq;
DROP SEQUENCE t_answer_seq;
DROP SEQUENCE t_notice_seq;
DROP SEQUENCE t_faq_seq;
DROP SEQUENCE t_menu_seq;
DROP SEQUENCE t_file_seq;

CREATE TABLE t_user (
	u_id	varchar2(20)		NOT NULL,
	u_pw	varchar2(200)		NULL,
	u_name	varchar2(100)		NULL,
	u_pn	varchar2(13)		NULL,
	u_pn2	varchar2(13)		NULL,
	u_pn3	varchar2(13)		NULL,
	u_email	varchar2(30)		NULL,
	u_email2	varchar2(30)		NULL,
	u_addr	varchar2(200)		NULL,
	u_addr2	varchar2(100)		NULL,
	u_addr3	varchar2(100)		NULL,
	enabled char(1) DEFAULT '1',
	u_regdate	DATE DEFAULT SYSDATE	NULL
);

SELECT * FROM T_USER ;

CREATE TABLE t_store (
	s_uid	number		NOT NULL,
	s_name	varchar2(30)		NULL,
	s_biznum	varchar2(12)		NULL,
	s_addr	varchar2(200)		NULL,
	s_comt	clob		NULL,
	s_opinfo	clob		NULL,
	s_lat	number		NULL,
	s_lng	number		NULL,
	s_pic	varchar2(30)		NULL,
	s_thn	varchar2(20)		NULL,
	u_id	varchar2(20)		NOT NULL
);
CREATE SEQUENCE t_store_seq;


CREATE TABLE t_comment (
	c_uid	number		NOT NULL,
	c_content	clob		NULL,
<<<<<<< HEAD
	c_regdate	date	default	SYSDATE,
=======
	c_regdate	DATE 	DEFAULT Sysdate,
>>>>>>> branch 'master' of https://github.com/YoungKwang-Park/Miracle7.git
	c_point	number		NULL,
	u_id	varchar2(20)		NOT NULL,
	s_uid	number		NOT NULL
);
CREATE SEQUENCE t_comment_seq;


CREATE TABLE t_report (
	u_id	varchar2(20)		NOT NULL,
	c_uid	number		NOT NULL
);

CREATE TABLE t_qna (
	q_uid	number		NOT NULL,
	u_id	varchar2(20)		NOT NULL,
	q_subject	varchar2(100)		NULL,
	q_content	clob		NULL,
	q_regdate	date		DEFAULT SYSDATE,
	q_category	varchar2(30)		NULL,
	q_viewcnt	number		DEFAULT 0
);
CREATE SEQUENCE t_qna_seq;

CREATE TABLE t_answer (
	a_uid	number		NOT NULL,
	a_content	clob		NULL,
	a_regdate	date	DEFAULT SYSDATE,
	q_uid	number		NOT NULL,
	u_id	varchar2(20)		NOT NULL
);

CREATE SEQUENCE t_answer_seq;


CREATE TABLE t_favorite (
	s_uid	number		NOT NULL,
	u_id	varchar2(20)		NOT NULL
);

CREATE TABLE t_notice (
	n_uid	number		NOT NULL,
	n_subject	varchar2(50)		NULL,
	n_content	clob		NULL,
	n_viewcnt	number		DEFAULT '0',
	n_regdate	date		DEFAULT SYSDATE,
	u_id	varchar2(20)		NOT NULL
);

CREATE SEQUENCE t_notice_seq;


CREATE TABLE t_auth (
	au_auth	varchar2(20)		NULL,
	u_id	varchar2(20)		NOT NULL
);

CREATE TABLE t_faq (
	f_uid	number		NOT NULL,
	f_subject	varchar2(50)		NULL,
	f_content	clob		NULL,
	f_viewcnt	number		NULL,
	u_id	varchar2(20)		NOT NULL
);
CREATE SEQUENCE t_faq_seq;


CREATE TABLE t_menu (
	m_uid	number		NOT NULL,
	s_uid	number		NOT NULL,
	m_name	varchar2(30)		NULL,
	m_pics	varchar2(30)		NULL,
	m_best	number		NULL
);
CREATE SEQUENCE t_menu_seq;

CREATE TABLE t_file (
	f_uid	NUMBER	NOT NULL,
	f_name	varchar2(500)	NULL,
	f_sname	varchar2(500)	NULL,
	f_url	varchar2(500)	NULL,
	f_thurl	varchar2(500)	NULL,
	f_regdate	DATE	DEFAULT SYSDATE,
	s_uid	NUMBER NOT NULL
);
CREATE SEQUENCE t_file_seq;


ALTER TABLE t_user ADD CONSTRAINT PK_T_USER PRIMARY KEY (
	u_id
);

ALTER TABLE t_store ADD CONSTRAINT PK_T_STORE PRIMARY KEY (
	s_uid
);

ALTER TABLE t_comment ADD CONSTRAINT PK_T_COMMENT PRIMARY KEY (
	c_uid
);

ALTER TABLE t_report ADD CONSTRAINT PK_T_REPORT PRIMARY KEY (
	u_id,
	c_uid
);

ALTER TABLE t_qna ADD CONSTRAINT PK_T_QNA PRIMARY KEY (
	q_uid
);

ALTER TABLE t_answer ADD CONSTRAINT PK_T_ANSWER PRIMARY KEY (
	a_uid
);

ALTER TABLE t_favorite ADD CONSTRAINT PK_T_FAVORITE PRIMARY KEY (
	s_uid,
	u_id
);

ALTER TABLE t_notice ADD CONSTRAINT PK_T_NOTICE PRIMARY KEY (
	n_uid
);

ALTER TABLE t_auth ADD CONSTRAINT PK_T_AUTH PRIMARY KEY (
	au_auth,
	u_id
);

ALTER TABLE t_faq ADD CONSTRAINT PK_T_FAQ PRIMARY KEY (
	f_uid
);

ALTER TABLE t_menu ADD CONSTRAINT PK_T_MENU PRIMARY KEY (
	m_uid,
	s_uid
);

ALTER TABLE t_file ADD CONSTRAINT PK_T_FILE PRIMARY KEY (
	f_uid,
	s_uid
);

ALTER TABLE t_store ADD CONSTRAINT FK_t_user_TO_t_store_1 FOREIGN KEY (
	u_id
)
REFERENCES t_user (
	u_id
) ON DELETE CASCADE;

ALTER TABLE t_comment ADD CONSTRAINT FK_t_user_TO_t_comment_1 FOREIGN KEY (
	u_id
)
REFERENCES t_user (
	u_id
) ON DELETE SET NULL;

ALTER TABLE t_comment ADD CONSTRAINT FK_t_store_TO_t_comment_1 FOREIGN KEY (
	s_uid
)
REFERENCES t_store (
	s_uid
) ON DELETE CASCADE;

ALTER TABLE t_report ADD CONSTRAINT FK_t_user_TO_t_report_1 FOREIGN KEY (
	u_id
)
REFERENCES t_user (
	u_id
) ON DELETE SET NULL;

ALTER TABLE t_report ADD CONSTRAINT FK_t_comment_TO_t_report_1 FOREIGN KEY (
	c_uid
)
REFERENCES t_comment (
	c_uid
) ON DELETE CASCADE;

ALTER TABLE t_qna ADD CONSTRAINT FK_t_user_TO_t_qna_1 FOREIGN KEY (
	u_id
)
REFERENCES t_user (
	u_id
) ON DELETE CASCADE;

ALTER TABLE t_answer ADD CONSTRAINT FK_t_qna_TO_t_answer_1 FOREIGN KEY (
	q_uid
)
REFERENCES t_qna (
	q_uid
) ON DELETE CASCADE;

ALTER TABLE t_answer ADD CONSTRAINT FK_t_user_TO_t_answer_1 FOREIGN KEY (
	u_id
)
REFERENCES t_user (
	u_id
) ON DELETE SET NULL;

ALTER TABLE t_favorite ADD CONSTRAINT FK_t_store_TO_t_favorite_1 FOREIGN KEY (
	s_uid
)
REFERENCES t_store (
	s_uid
) ON DELETE CASCADE;

ALTER TABLE t_favorite ADD CONSTRAINT FK_t_user_TO_t_favorite_1 FOREIGN KEY (
	u_id
)
REFERENCES t_user (
	u_id
) ON DELETE CASCADE;

ALTER TABLE t_notice ADD CONSTRAINT FK_t_user_TO_t_notice_1 FOREIGN KEY (
	u_id
)
REFERENCES t_user (
	u_id
) ON DELETE CASCADE;

ALTER TABLE t_auth ADD CONSTRAINT FK_t_user_TO_t_auth_1 FOREIGN KEY (
	u_id
)
REFERENCES t_user (
	u_id
) ON DELETE CASCADE;

ALTER TABLE t_faq ADD CONSTRAINT FK_t_user_TO_t_faq_1 FOREIGN KEY (
	u_id
)
REFERENCES t_user (
	u_id
) ON DELETE CASCADE;

ALTER TABLE t_menu ADD CONSTRAINT FK_t_store_TO_t_menu_1 FOREIGN KEY (
	s_uid
)
REFERENCES t_store (
	s_uid
) ON DELETE CASCADE;

ALTER TABLE t_file ADD CONSTRAINT FK_t_store_TO_t_file_1 FOREIGN KEY (
	s_uid
)
REFERENCES t_store (
	s_uid
) ON DELETE CASCADE;


INSERT INTO t_qna (q_uid, u_id, q_subject, q_content, q_category) VALUES (t_qna_seq.nextval, 'admin1', '제목', '내용', '이용문의'); 
INSERT INTO t_menu (m_uid, s_uid, m_name) VALUES (t_menu_seq.nextval, 2, '떡볶이');
INSERT INTO t_store (s_uid, s_name, s_biznum, s_addr, s_comt, s_opinfo, u_id) VALUES (?, ?, ?, ?, ?, ?, ?)


SELECT u.u_id, u.u_pw, u.u_name, au.au_auth  FROM t_user u, t_auth au WHERE u.u_id = au.u_id AND u.u_id LIKE '%t%' ORDER BY u.u_id ASC;
SELECT *  FROM t_user u, t_auth au WHERE u.u_id = au.u_id ORDER BY u.u_id ASC;
SELECT * FROM t_user WHERE u_id LIKE '%%';
SELECT * FROM t_auth;
SELECT * FROM t_notice;
SELECT * FROM T_STORE s, t_user u WHERE s.U_ID = u.U_ID ;
SELECT * FROM t_store s, t_menu m, t_user u WHERE s.s_uid = m.s_uid AND s.u_id = u.u_id;
SELECT count(s.s_uid) FROM t_store s, t_menu m WHERE s.s_uid = m.s_uid AND m.m_name LIKE '%%';
SELECT s.s_uid, m.m_name FROM t_store s, t_menu m WHERE s.s_uid = m.s_uid AND m.m_name LIKE '%9%';
SELECT * FROM t_menu WHERE m_name LIKE '%%';
SELECT * FROM t_store;
SELECT * FROM t_file;

 AND m.m_name LIKE '%'||##{search}#||'%'




SELECT count(s.s_uid) cnt FROM t_store s, t_menu m WHERE s.s_uid = m.s_uid;

		SELECT
			s.s_uid suid,
			s.s_name sname,
			s.s_biznum sbiznum,
			s.s_addr saddr,
			s.s_comt scomt,
			s.s_opinfo sopinfo,
			m.m_uid muid,
			m.m_name mname
		FROM
			t_store s, t_menu m
		WHERE
			s.s_uid = m.s_uid;
		
		
		
		SELECT a,b,c,d 
		FROM 
			(
				SELECT 
					a,b,c,d,
					ROW_NUMBER() OVER (PARTITION BY a ORDER BY d desc) rn
				FROM eeeee		
			)
		WHERE rn <= 3
		ORDER BY a,d DESC, c;
	
		SELECT  Q_UID,  
				Q_CATEGORY,
		        Q_SUBJECT, 
		        Q_CONTENT,
		        U_ID,
		        Q_VIEWCNT, 
		        Q_REGDATE
		 FROM ( 
		        SELECT Q_UID,
		               Q_CATEGORY, 
		               Q_SUBJECT, 
		               Q_CONTENT, 
		               U_ID, 
		               Q_VIEWCNT,
		               Q_REGDATE, 
		               ROW_NUMBER() OVER(PARTITION BY Q_UID ORDER BY Q_UID DESC) AS RNUM
		         FROM T_QNA 
		         WHERE 1=1 
		       ) 
		WHERE RNUM BETWEEN 1 AND 3
		ORDER BY Q_UID DESC;
	
	
	SELECT
			s_uid, 
			s_name, 
			s_biznum, 
			s_addr, 
			s_comt, 
			s_opinfo, 
			m_uid, 
			m_name 
	FROM (
		SELECT	
			s.s_uid, 
			s_name, 
			s_biznum, 
			s_addr, 
			s_comt, 
			s_opinfo, 
			m_uid, 
			m_name,
			ROW_NUMBER() OVER(PARTITION BY s.S_UID ORDER BY s.S_UID DESC) AS RNUM				
		FROM t_store s, T_MENU m	
		WHERE 1=1
		) 
	WHERE RNUM BETWEEN 1 AND 3
	ORDER BY s_uid DESC;
		
	
		SELECT
			s.s_uid, 
			s.s_name, 
			s.s_biznum, 
			s.s_addr,
			s.s_comt,
			s.s_opinfo,
			m.m_uid,
			m.m_name,
		ROW_NUMBER() over(ORDER BY s.S_UID ) AS RNUM	
		FROM
			t_store s, t_menu m
		WHERE s.s_uid = m.s_uid;
		
		
	


		SELECT	s_uid, 
				s_name, 
				s_biznum, 
				s_addr, 
				s_comt, 
				s_opinfo, 
				m_uid, 
				m_name,
			ROW_NUMBER() OVER(ORDER BY s_UID DESC) AS RNUM				
		FROM t_store s, t_menu m
		WHERE s.s_uid = m.s_uid;

		
	
		        SELECT Q_UID,
		               Q_CATEGORY, 
		               Q_SUBJECT, 
		               Q_CONTENT, 
		               U_ID, 
		               Q_VIEWCNT,
		               Q_REGDATE, 
		               ROW_NUMBER() OVER(ORDER BY Q_UID DESC) AS RNUM
		         FROM T_QNA;    
		        
		       SELECT	
			s.s_uid, 
			s_name, 
			s_biznum, 
			s_addr, 
			s_comt, 
			s_opinfo, 
			m_uid, 
			m_name,
			ROW_NUMBER() OVER(PARTITION BY s.S_UID ORDER BY s.S_UID DESC) AS RNUM				
		FROM t_store s, T_MENU m;

