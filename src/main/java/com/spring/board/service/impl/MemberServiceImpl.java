package com.spring.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.MemberDao;
import com.spring.board.service.MemberService;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public int createMember(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return memberDao.insertMemberInfo(memberVo);
	}

	@Override
	public List<MemberVo> readMember() {
		// TODO Auto-generated method stub
		return memberDao.selectMemberInfo();
	}

	@Override
	public MemberVo readUserId(String userId) {
		// TODO Auto-generated method stub
		return memberDao.userIdSelectCheck(userId);
	}

	@Override
	public MemberVo readUserIdAndPw(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return memberDao.selectUserIdAndPw(memberVo);
	}

}
