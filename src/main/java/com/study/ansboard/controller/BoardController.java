package com.study.ansboard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.study.ansboard.service.BoardService;

import javax.inject.Inject;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String moveList() {
		logger.info("move list");
		
		return "board/list";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String moveWrite() {
		logger.info("move write");
		
		return "board/write";
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String moveView() {
		logger.info("move view");
		
		return "board/view";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write() {
		logger.info("write");

		return "";
	}


	
	

}
