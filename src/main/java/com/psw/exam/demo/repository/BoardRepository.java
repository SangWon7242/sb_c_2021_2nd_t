package com.psw.exam.demo.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.psw.exam.demo.vo.Board;

@Mapper
public interface BoardRepository {
	
	@Select("""
			SELECT *
			FROM board AS B
			WHERE B.id = #{id}
			AND B.delStatus = 0
			""")
	Board getBoardById(@Param("id") int id);
	
}
