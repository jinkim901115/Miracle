DROP TABLE t_user;
DROP TABLE t_store;
DROP TABLE t_menu;
DROP TABLE t_comment;
DROP TABLE t_report;
DROP TABLE t_qna;
DROP TABLE t_answer;
DROP TABLE t_favorite;
DROP TABLE t_notice;
DROP TABLE t_auth;
DROP TABLE t_faq;


CREATE TABLE t_user (
	u_id	varchar2(20)		NOT NULL,
	u_pw	varchar2(12)		NULL,
	u_name	varchar2(10)		NULL,
	u_pn	varchar2(13)		NULL,
	u_email	varchar2(30)		NULL,
	u_addr	varchar2(200)		NULL,
	u_div	number				NULL
);



CREATE TABLE t_store (
	s_uid		number			NOT NULL,
	s_name		varchar2(30)	NULL,
	s_biznum	varchar2(12)	NULL,
	s_addr		varchar2(200)	NULL,
	s_comt		clob			NULL,
	s_opinfo	clob			NULL,
	s_lat		number			NULL,
	s_lng		number			NULL,
	s_pic		varchar2(30)	NULL,
	s_thn		varchar2(20)	NULL,
	u_id		varchar2(20)	NOT NULL
);



CREATE TABLE t_menu (
	m_uid	number			NOT NULL,
	m_name	varchar2(30)	NULL,
	m_pics	varchar2(30)	NULL,
	m_best	number			NULL,
	s_uid	number			NOT NULL
);



CREATE TABLE t_comment (
	c_uid	number			NOT NULL,
	c_content	clob		NULL,
	c_regdate	date		NULL,
	c_point	number			NULL,
	s_uid	number			NOT NULL,
	u_id	varchar2(20)	NOT NULL
);



CREATE TABLE t_report (
	u_id	varchar2(20)	NOT NULL,
	c_uid	number			NOT NULL
);



CREATE TABLE t_qna (
	q_uid	number				NOT NULL,
	q_subject	varchar2(50)	NULL,
	q_content	clob			NULL,
	q_regdate	date			NULL,
	q_category	varchar2(10)	NULL,
	q_viewcnt	number			NULL,
	u_id	varchar2(20)		NOT NULL
);



CREATE TABLE t_answer (
	a_uid	number			NOT NULL,
	a_content	clob		NULL,
	a_regdate	date		NULL,
	q_uid	number			NOT NULL,
	u_id	varchar2(20)	NOT NULL
);



CREATE TABLE t_favorite (
	s_uid	number			NOT NULL,
	u_id	varchar2(20)	NOT NULL
);



CREATE TABLE t_notice (
	n_uid	number				NOT NULL,
	n_subject	varchar2(50)	NULL,
	n_content	clob			NULL,
	n_viewcnt	number			NULL,
	n_regdate	date			NULL,
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

ALTER TABLE t_user ADD CONSTRAINT PK_T_USER PRIMARY KEY (
	u_id
);

ALTER TABLE t_store ADD CONSTRAINT PK_T_STORE PRIMARY KEY (
	s_uid
);

ALTER TABLE t_menu ADD CONSTRAINT PK_T_MENU PRIMARY KEY (
	m_uid
);

ALTER TABLE t_comment ADD CONSTRAINT PK_T_COMMENT PRIMARY KEY (
	c_uid
);

ALTER TABLE t_qna ADD CONSTRAINT PK_T_QNA PRIMARY KEY (
	q_uid
);

ALTER TABLE t_answer ADD CONSTRAINT PK_T_ANSWER PRIMARY KEY (
	a_uid
);

ALTER TABLE t_notice ADD CONSTRAINT PK_T_NOTICE PRIMARY KEY (
	n_uid
);

ALTER TABLE t_faq ADD CONSTRAINT PK_T_FAQ PRIMARY KEY (
	f_uid
);

ALTER TABLE t_store ADD CONSTRAINT FK_t_user_TO_t_store_1 FOREIGN KEY (
	u_id
)
REFERENCES t_user (
	u_id
);

ALTER TABLE t_menu ADD CONSTRAINT FK_t_store_TO_t_menu_1 FOREIGN KEY (
	s_uid
)
REFERENCES t_store (
	s_uid
);

ALTER TABLE t_comment ADD CONSTRAINT FK_t_store_TO_t_comment_1 FOREIGN KEY (
	s_uid
)
REFERENCES t_store (
	s_uid
);

ALTER TABLE t_comment ADD CONSTRAINT FK_t_user_TO_t_comment_1 FOREIGN KEY (
	u_id
)
REFERENCES t_user (
	u_id
);

ALTER TABLE t_report ADD CONSTRAINT FK_t_user_TO_t_report_1 FOREIGN KEY (
	u_id
)
REFERENCES t_user (
	u_id
);

ALTER TABLE t_report ADD CONSTRAINT FK_t_comment_TO_t_report_1 FOREIGN KEY (
	c_uid
)
REFERENCES t_comment (
	c_uid
);

ALTER TABLE t_qna ADD CONSTRAINT FK_t_user_TO_t_qna_1 FOREIGN KEY (
	u_id
)
REFERENCES t_user (
	u_id
);

ALTER TABLE t_answer ADD CONSTRAINT FK_t_qna_TO_t_answer_1 FOREIGN KEY (
	q_uid
)
REFERENCES t_qna (
	q_uid
);

ALTER TABLE t_answer ADD CONSTRAINT FK_t_user_TO_t_answer_1 FOREIGN KEY (
	u_id
)
REFERENCES t_user (
	u_id
);

ALTER TABLE t_favorite ADD CONSTRAINT FK_t_store_TO_t_favorite_1 FOREIGN KEY (
	s_uid
)
REFERENCES t_store (
	s_uid
);

ALTER TABLE t_favorite ADD CONSTRAINT FK_t_user_TO_t_favorite_1 FOREIGN KEY (
	u_id
)
REFERENCES t_user (
	u_id
);

ALTER TABLE t_notice ADD CONSTRAINT FK_t_user_TO_t_notice_1 FOREIGN KEY (
	u_id
)
REFERENCES t_user (
	u_id
);

ALTER TABLE t_auth ADD CONSTRAINT FK_t_user_TO_t_auth_1 FOREIGN KEY (
	u_id
)
REFERENCES t_user (
	u_id
);

ALTER TABLE t_faq ADD CONSTRAINT FK_t_user_TO_t_faq_1 FOREIGN KEY (
	u_id
)
REFERENCES t_user (
	u_id
);


