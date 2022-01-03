package com.study.ansboard.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.study.ansboard.vo.BoardVO;
import com.study.ansboard.vo.CommentsVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.study.ansboard.service.BoardService;

import java.util.List;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String moveList(Model model,@RequestParam(value = "pageNum", defaultValue = "1")int pageNum) throws Exception {
		logger.info("move list");
		List<BoardVO> list = boardService.list();
		model.addAttribute("list",list);
		return "board/list";
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String moveView(Model model, @RequestParam int bNo) throws Exception {
		logger.info("move view");
		BoardVO board = boardService.view(bNo);
		model.addAttribute("board", board);

		// 댓글 출력
		List<CommentsVO> commList = boardService.getCommentList(bNo);
		model.addAttribute("commList", commList);

		return "board/view";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(BoardVO boardVO ) throws Exception {
		logger.info("write");
		logger.info(boardVO.toString());
		int result = boardService.write(boardVO);
		return "redirect:/board/list";
	}

	@RequestMapping(value="/writeReply", method=RequestMethod.GET)
	public String writeReply(Model model,BoardVO boardVO) {
		logger.info("move writeReply");
		model.addAttribute("board", boardVO);
		return "board/writeReply";
	}


	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String moveWrite(Model model, BoardVO boardVO) {
		logger.info("move write");
		model.addAttribute("board", boardVO);
		return "board/write";
	}

	// 댓글 등록
	@RequestMapping("/writeComment")
	@ResponseBody
	public int writeComment(@ModelAttribute CommentsVO commentVO) {
		int result = 0;

		System.out.println("commentVO >> " + commentVO.getCmContent());
		try {
			result = boardService.writeComment(commentVO);
		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		}
		return result;
	}

	// 댓글 리스트 ajax
	@RequestMapping(value = "/selectCommList", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectReplyList(int postIdx, Model model) throws Exception {

		// ajax에서 에러를 처리해줌으로throws Exception
		// try catch를 안해줘도됨(다른방법도 있음)
		List<CommentsVO> commList = boardService.getCommentList(postIdx);

		model.addAttribute("commCount", commList.size());

		// JSON으로 담아도 되지만 편한 방법인 GSON으로 사용

		// yyyy-MM-dd hh:mm:ss
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd hh:mm").create();

		return gson.toJson(commList);
	}


}


	
	

