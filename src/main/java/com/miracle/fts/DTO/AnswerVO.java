package com.miracle.fts.DTO;

import java.util.Date;

public class AnswerVO {

	private int q_uid;
	private int a_uid;
	private String a_content;
	private String a_writer;
	private Date a_regdate;
	

	

	public int getQ_uid() {
		return q_uid;
	}
	
	public void setQ_uid(int q_uid) {
		this.q_uid = q_uid;
	}
	
	public int getA_uid() {
		return a_uid;
	}
	
	public void setA_uid(int a_uid) {
		this.a_uid = a_uid;
	}
	
	public String getA_content() {
		return a_content;
	}
	
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	
	public String getA_writer() {
		return a_writer;
	}
	
	public void setA_writer(String a_writer) {
		this.a_writer = a_writer;
	}
	
	public Date getA_regdate() {
		return a_regdate;
	}
	
	public void setA_regdate(Date a_regdate) {
		this.a_regdate = a_regdate;
	}
	
	@Override
	public String toString() {
		return "AnswerVO [q_uid=" + q_uid + ", a_uid=" + a_uid + ", a_content=" + a_content + ", a_writer=" + a_writer + ", a_regdate="
						+ a_regdate + "]";
	}
	
		
}
		
		