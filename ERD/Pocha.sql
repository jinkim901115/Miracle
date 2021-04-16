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



CREATE TABLE t_user (
	u_id	varchar2(20)		NOT NULL,
	u_pw	varchar2(200)		NULL,
	u_name	varchar2(10)		NULL,
	u_pn	varchar2(13)		NULL,
	u_email	varchar2(30)		NULL,
	u_addr	varchar2(200)		NULL,
	enabled char(1) DEFAULT '1',
	u_regdate	DATE DEFAULT SYSDATE	NULL
);

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

CREATE TABLE t_comment (
	c_uid	number		NOT NULL,
	c_content	clob		NULL,
	c_regdate	date		NULL,
	c_point	number		NULL,
	u_id	varchar2(20)		NOT NULL,
	s_uid	number		NOT NULL
);

CREATE TABLE t_report (
	u_id	varchar2(20)		NOT NULL,
	c_uid	number		NOT NULL
);

CREATE TABLE t_qna (
	q_uid	number		NOT NULL,
	u_id	varchar2(20)		NOT NULL,
	q_subject	varchar2(50)		NULL,
	q_content	clob		NULL,
	q_regdate	date		NULL,
	q_category	varchar2(10)		NULL,
	q_viewcnt	number		NULL
);

CREATE TABLE t_answer (
	a_uid	number		NOT NULL,
	a_content	clob		NULL,
	a_regdate	date		NULL,
	q_uid	number		NOT NULL,
	u_id	varchar2(20)		NOT NULL
);

CREATE TABLE t_favorite (
	s_uid	number		NOT NULL,
	u_id	varchar2(20)		NOT NULL
);

CREATE TABLE t_notice (
	n_uid	number		NOT NULL,
	n_subject	varchar2(50)		NULL,
	n_content	clob		NULL,
	n_viewcnt	number		NULL,
	n_regdate	date		NULL,
	u_id	varchar2(20)		NOT NULL
);

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

CREATE TABLE t_menu (
	m_uid	number		NOT NULL,
	s_uid	number		NOT NULL,
	m_name	varchar2(30)		NULL,
	m_pics	varchar2(30)		NULL,
	m_best	number		NULL
);

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



SELECT u.u_id, u.u_pw, u.u_name, au.au_auth  FROM t_user u, t_auth au WHERE u.u_id = au.u_id ORDER BY u.u_id ASC;

SELECT * FROM t_user;








