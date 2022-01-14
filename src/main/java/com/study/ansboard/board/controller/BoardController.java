package com.study.ansboard.board.controller;

import com.study.ansboard.board.service.BoardService;
import com.study.ansboard.board.vo.BoardVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	// 목록 페이지 이동
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String moveList(Model model) throws Exception {
		logger.info("move list");
		List<BoardVO> list = boardService.list();
		model.addAttribute("list", list);
		return "board/list";
	}

	// 상세 페이지 이동
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String moveView(Model model, @RequestParam int bNo) throws Exception {
		logger.info("move view");
		BoardVO board = boardService.view(bNo);
		model.addAttribute("board", board);

		return "board/view";
	}

	// 글 작성
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception {
		logger.info("write");
		logger.info(boardVO.toString());
		int result = boardService.write(boardVO);
		return "redirect:/board/list";
	}

	// 답글 처리
	@RequestMapping(value = "/writeReply", method = RequestMethod.GET)
	public String writeReply(Model model, BoardVO boardVO) {
		logger.info("move writeReply");
		model.addAttribute("board", boardVO);
		return "board/writeReply";
	}

	// 작성 페이지 이동
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String moveWrite(Model model, BoardVO boardVO) {
		logger.info("move write");
		model.addAttribute("board", boardVO);
		return "board/write";
	}

	// 수정 페이지 이동
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String moveUpdate(Model model, BoardVO boardVO) throws Exception {

		BoardVO board = boardService.view(boardVO.getbNo());

		model.addAttribute("board", board);
		return "board/update";
	}

	// 수정 처리
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO) throws Exception {
		logger.info("수정 됨");
		boardService.update(boardVO);
		return "redirect:/board/view?bNo=" + boardVO.getbNo();

	}

	// 삭제 처리
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(BoardVO boardVO) throws Exception {

		logger.info("삭제 됨");
		boardService.delete(boardVO);

		return "redirect:/board/list";
	}




}


	
	

