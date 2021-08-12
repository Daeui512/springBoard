package com.spring.board.service;

import java.util.List;

import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.MemberVo;

public interface MemberService {
	
	public abstract int createMember(MemberVo memberVo);
	
	public abstract List<MemberVo> readMember();
	
	public abstract MemberVo readUserId(String userId);
	
	public abstract MemberVo readUserIdAndPw(MemberVo memberVo);
}
