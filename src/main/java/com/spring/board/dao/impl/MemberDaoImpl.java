package com.spring.board.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.MemberDao;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertMemberInfo(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("member.member_insert", memberVo);
	}

	@Override
	public List<MemberVo> selectMemberInfo() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("member.member_select_all");
	}

	@Override
	public MemberVo userIdSelectCheck(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.userId_check", userId);
	}

	@Override
	public MemberVo selectUserIdAndPw(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.select_by_userid_and_password", memberVo);
	}

}
