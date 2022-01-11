package com.study.ansboard.member.controller;

import com.study.ansboard.member.service.MemberService;
import com.study.ansboard.member.vo.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

    @Autowired
    private MemberService memberService;
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    // 회원가입 get
    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public String getJoinForm() throws Exception {
        logger.info("get LoginForm");
        return "/register/join";
    }

    // 회원가입 post
    @RequestMapping(value = "/join", method = RequestMethod.POST)
    public String join(MemberVO memberVO) throws Exception {
        logger.info("post register");

        memberService.memberJoin(memberVO);

        return "redirect:/";
    }

	// 아이디 중복 검사
	@RequestMapping(value = "/memIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public String memIdCheckPOST(String memId) throws Exception{

		logger.info("memberIdChk() 진입");

		int result = memberService.memIdCheck(memId);

		logger.info("결과값 = " + result);

		if(result != 0) {
			return "fail";	// 중복 아이디가 존재
		} else {
			return "success";	// 중복 아이디 x
		}
	}

    // 로그인
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(MemberVO memberVO, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
        logger.info("post login");

        HttpSession session = req.getSession();
        MemberVO login = memberService.memberLogin(memberVO);

        if (login == null) {
            session.setAttribute("member", null);
            rttr.addFlashAttribute("msg", false);
        } else {
            session.setAttribute("member", login);
        }

        return "redirect:/board/list";
    }

    // 로그아웃
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) throws Exception {

        // 세션  초기화
        session.invalidate();

        return "redirect:/";
    }



}



	
	

