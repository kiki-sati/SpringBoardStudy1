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
	public String moveList(Model model) throws Exception {
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

		return "board/view";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception {
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

	// 게시물 수정 페이지 이동
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String moveUpdate(Model model, BoardVO boardVO) throws Exception {

		BoardVO board = boardService.view(boardVO.getbNo());

		model.addAttribute("board",board);
		return "board/update";
	}

	// 게시물 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO) throws Exception {
		boardService.update(boardVO);
		return "redirect:/board/view?bNo=" + boardVO.getbNo();
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(BoardVO boardVO) throws Exception {
		boardService.delete(boardVO);

		return "redirect:/board/list";
	}


}


	
	

