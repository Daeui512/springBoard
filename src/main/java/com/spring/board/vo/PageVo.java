package com.spring.board.vo;

import java.util.Arrays;

public class PageVo {
	
	private int pageNo = 1;
	private String[] codeId;
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public String[] getCodeId() {
		return codeId;
	}
	public void setCodeId(String[] codeId) {
		this.codeId = codeId;
	}
	
	@Override
	public String toString() {
		return "PageVo [pageNo=" + pageNo + ", codeId=" + Arrays.toString(codeId) + "]";
	}
	
	
	
}
