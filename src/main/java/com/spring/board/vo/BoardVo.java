package com.spring.board.vo;

import java.util.Arrays;
import java.util.List;

public class BoardVo {
	
	private String  codeName;
	private String 	boardType;
	private int 	boardNum;
	private String 	boardTitle;
	private String 	boardComment;
	private String 	creator;
	private String	modifier;
	private int totalCnt;

	private List<BoardVo> boardVoList;
	
	public BoardVo() {
		// TODO Auto-generated constructor stub
	}

	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardComment() {
		return boardComment;
	}

	public void setBoardComment(String boardComment) {
		this.boardComment = boardComment;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public List<BoardVo> getBoardVoList() {
		return boardVoList;
	}

	public void setBoardVoList(List<BoardVo> boardVoList) {
		this.boardVoList = boardVoList;
	}

	@Override
	public String toString() {
		return "BoardVo [codeName=" + codeName + ", boardType=" + boardType + ", boardNum=" + boardNum + ", boardTitle="
				+ boardTitle + ", boardComment=" + boardComment + ", creator=" + creator + ", modifier=" + modifier
				+ ", totalCnt=" + totalCnt + ", boardVoList=" + boardVoList + "]";
	}

	public BoardVo(String codeName, String boardType, int boardNum, String boardTitle, String boardComment,
			String creator, String modifier, int totalCnt, List<BoardVo> boardVoList) {
		super();
		this.codeName = codeName;
		this.boardType = boardType;
		this.boardNum = boardNum;
		this.boardTitle = boardTitle;
		this.boardComment = boardComment;
		this.creator = creator;
		this.modifier = modifier;
		this.totalCnt = totalCnt;
		this.boardVoList = boardVoList;
	}
	
	
}
