package com.spring.board.dao;

import java.util.List;

import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.MemberVo;

public interface MemberDao {
	
	public abstract int insertMemberInfo(MemberVo memberVo);
	
	public abstract List<MemberVo> selectMemberInfo();
	
	public abstract MemberVo userIdSelectCheck(String userId);
	
	public abstract MemberVo selectUserIdAndPw(MemberVo memberVo);

}
