package com.spring.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.HomeController;
import com.spring.board.service.MemberService;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.MemberVo;
import com.spring.board.vo.PageVo;
import com.spring.common.CommonUtil;

@Controller
public class BoardController {
	
	@Autowired 
	boardService boardService;
	
	@Autowired
	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardList(Locale locale, Model model, PageVo pageVo, HttpSession session) throws Exception{
		
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		List<ComCodeVo> comCodeList = new ArrayList<ComCodeVo>();

		ComCodeVo comCodeVo = new ComCodeVo();

		comCodeVo.setCodeType("menu");
		comCodeList = boardService.codeNameSelect(comCodeVo);
		
		String userId = (String) session.getAttribute("userId");

		if (userId != null) {
			MemberVo memberVo = new MemberVo();
			memberVo = memberService.readUserId(userId);
			System.out.println(memberVo.toString());
			model.addAttribute("memberVo", memberVo);
			
		}
		
		int page = 1;
		int totalCnt = 0;
		
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);;
		}
		
		boardList = boardService.SelectBoardList(pageVo);
		totalCnt = boardService.selectBoardCnt();
		
		model.addAttribute("comCodeList", comCodeList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", page);
		
		return "board/boardList";
	}
	
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum,
			HttpSession session) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		String userId = (String) session.getAttribute("userId");
		if (userId != null) {
			MemberVo memberVo = new MemberVo();
			memberVo = memberService.readUserId(userId);
			model.addAttribute("meberVo", memberVo);
			
		}
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		return "board/boardView";
	}
	
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model, HttpSession session) throws Exception{
		
		List<ComCodeVo> comCodeList = new ArrayList<ComCodeVo>();
		
		ComCodeVo comCodeVo = new ComCodeVo();
		comCodeVo.setCodeType("menu");
		comCodeList = boardService.codeNameSelect(comCodeVo);
		String userId = (String) session.getAttribute("userId");
		MemberVo memberVo = new MemberVo();
		
		if (userId != null) {
			memberVo = memberService.readUserId(userId);
		}
		
		model.addAttribute("comCodeList", comCodeList);
		model.addAttribute("memberVo", memberVo);
		
		return "board/boardWrite";
	}
	
//	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
//	@ResponseBody
//	public String boardWriteAction(
////			@RequestBody UserInfoVo userInfoVo,
//			HttpServletRequest request,
////			@RequestParam(value = "boardType[]") String[] boardType,
////			@RequestParam(value = "boardTitle[]") String[] boardTitle,
////			@RequestParam(value = "boardComment[]") String[] boardComment,
//			HttpSession session
//			) throws Exception{
//		
//		
////		System.out.println(userInfoVo.getBoardType());
////		System.out.println(userInfoVo.getBoardTitle());
////		System.out.println(userInfoVo.getBoardComment());
////		
//		String userId = (String) session.getAttribute("userId");
//		String userName = null;
//		BoardVo boardVo = new BoardVo();
//		int resultCnt = 0;
//		
//		if (userId != null) {
//			MemberVo memberVo = memberService.readUserId(userId);
//			userName = memberVo.getUserName();
//		}
//		
//	
//		
////		for (int i = 0; i < boardComment.length; i++) {
////			boardVo.setBoardType(boardType[i]);
////			boardVo.setBoardTitle(boardTitle[i]);
////			boardVo.setBoardComment(boardComment[i]);
////			boardVo.setCreator(userName);
////			resultCnt = boardService.boardInsert(boardVo);
////			
////		}
//		
//		HashMap<String, String> result = new HashMap<String, String>();
//		CommonUtil commonUtil = new CommonUtil();
//		
//		result.put("success", (resultCnt > 0)?"Y":"N");
//		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
//		
//		System.out.println("callbackMsg::"+callbackMsg);
//		
//		return callbackMsg;
//	}
	
	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(Locale locale, BoardVo boardVo) throws Exception{
	
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		int resultCnt = 0;
		
		List<BoardVo> list = boardVo.getBoardVoList();
		
		logger.info(boardVo.getCreator());
		
		for (BoardVo vo : list) {
			logger.info(vo.toString());
			vo.setCreator(boardVo.getCreator());
			resultCnt = boardService.boardInsert(vo);
		}
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	
	
	
	
	@RequestMapping(value = "/board/boardUpdate.do", method = RequestMethod.GET)
	public void boardUpdate(Model model, String boardType, Integer boardNum) throws Exception {
		logger.info("update page call");
		logger.info(boardType + " , " + boardNum);
		BoardVo boardVo = null;
		
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
	}
	
	@RequestMapping(value="/board/boardUpdateAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardUpdateAction(BoardVo boardVo) throws Exception {
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = boardService.boardUpdate(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value="/board/boardDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardDelete(BoardVo boardVo) throws Exception {
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = boardService.boardDelete(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value="/board/boardListSearch.do", method = RequestMethod.POST)
	public String boardListSearch(
			@RequestParam(value = "codeId[]") String[] codeId, Model model) throws Exception {
		
		PageVo pageVo = new PageVo();
		HashMap<String, Object> result = new HashMap<String, Object>();
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		
		pageVo.setCodeId(codeId);
		boardList = boardService.SelectBoardList(pageVo);
		
		result.put("boardList", boardList);
		
		model.addAttribute("boardList", boardList);
		
		return "/board/ajaxReturn";
	}
	
	
	@RequestMapping(value="/board/register.do", method = RequestMethod.GET)
	public void registerGet(Model model) throws Exception {
		
		List<ComCodeVo> comCodeList = new ArrayList<ComCodeVo>();
		ComCodeVo comCodeVo = new ComCodeVo();
		comCodeVo.setCodeType("phone");
		
		comCodeList = boardService.codeNameSelect(comCodeVo);
		
		model.addAttribute("comCodeList", comCodeList);
		
		logger.info("회원가입 페이지 호출");
	}
	
	@RequestMapping(value="/board/registerAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String registerPost(Model model, MemberVo memberVo) throws IOException {
		logger.info("memberVo = " + memberVo.toString());
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = memberService.createMember(memberVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value="/board/userid_check.do", method = RequestMethod.POST)
	@ResponseBody
	public String userIdChkPost(String userId) throws IOException {

		System.out.println(userId);
		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
		
		MemberVo memberVo = memberService.readUserId(userId);

		result.put("success", (memberVo != null)?"Y":"N");
		result.put("users", memberVo);
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/board/login.do", method = RequestMethod.GET)
	public void loginGet(Model model) {
		logger.info("로그인 페이지 호출");
	}
	
	@RequestMapping(value = "/board/loginAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String loginfAction(MemberVo memberVo, HttpSession session) throws IOException {
		
		System.out.println(memberVo.getUserId() + " + " + memberVo.getUserPw());
		HashMap<String, String> map = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
	
		MemberVo result = memberService.readUserIdAndPw(memberVo);
		
		session.setAttribute("userId", result.getUserId());
		session.setMaxInactiveInterval(1800);
	
		map.put("success", (result != null)?"Y":"N");
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ", map);

		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	
	@RequestMapping(value = "/board/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		session.removeAttribute("userId");
		
		return "redirect:/board/boardList.do";
	}
	
}
