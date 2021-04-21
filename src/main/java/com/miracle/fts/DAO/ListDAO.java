package com.miracle.fts.DAO;

import java.util.List;

import com.miracle.fts.DTO.ListDTO;

public interface ListDAO {
	List<ListDTO> select();
	
//	int selectCnt(ListDTO dto);
}
