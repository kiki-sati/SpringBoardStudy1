package com.study.ansboard.controller;

import com.study.ansboard.dao.BoardDAO;
import com.study.ansboard.vo.BoardVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.study.ansboard.service.BoardService;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
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


	
	

}
