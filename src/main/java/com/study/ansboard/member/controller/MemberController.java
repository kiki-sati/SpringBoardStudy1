package com.study.ansboard.member.controller;

import com.study.ansboard.member.service.MemberService;
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
public class MemberController {
	
	@Autowired
	private MemberService boardService;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);


}


	
	

