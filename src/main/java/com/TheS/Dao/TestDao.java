package com.TheS.Dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("theDao")
public class TestDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<Map<String, Object>> test () {
		String sql = "SELECT * FROM test";
		try {
			return jdbcTemplate.queryForList(sql);
		} catch (DataAccessException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return new ArrayList<Map<String,Object>>();
	}
	
	
}
