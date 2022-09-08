package com.project.fitty.machine.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.machine.model.vo.Machine;

@Repository
public class MachineDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("machineMapper.selectListCount");
	}

	public ArrayList<Machine> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("machineMapper.selectList", null, rowBounds);
	}
	
	public int insertMachine(SqlSessionTemplate sqlSession, Machine m) {
		return sqlSession.insert("machineMapper.insertMachine", m);
	}
	
	public int deleteMachine(SqlSessionTemplate sqlSession, String mcNo) {
		return sqlSession.delete("machineMapper.deleteMachine", mcNo);
	}
	
	public int selectCheckListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("machineMapper.selectCheckListCount");
	}
	
	public ArrayList<Machine> selectCheckList(SqlSessionTemplate sqlSession, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("machineMapper.selectCheckList", null, rowBounds);
	}
}
