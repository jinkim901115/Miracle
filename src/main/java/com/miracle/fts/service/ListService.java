package com.miracle.fts.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miracle.fts.DAO.ListDAO;
import com.miracle.fts.DTO.ListDTO;

@Service
public class ListService {

	ListDAO dao;
	
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public ListService() {
		super();
	}
	
	public List<ListDTO> list(){
		dao = sqlSession.getMapper(ListDAO.class);
		return dao.select();
	}
	
	public List<ListDTO> listCnt() {
		dao = sqlSession.getMapper(ListDAO.class);
		return dao.selectCnt();
	}
	
}
