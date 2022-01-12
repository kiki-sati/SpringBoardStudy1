package com.study.ansboard.member.controller;

import com.study.ansboard.member.service.MemberService;
import com.study.ansboard.member.vo.LoginDTO;
import com.study.ansboard.member.vo.MemberVO;
import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

    @Autowired
    private MemberService memberService;
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    // 회원가입 페이지
    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public String getJoinForm() throws Exception {
        logger.info("get LoginForm");
        return "/register/join";
    }

    // 회원가입 처리
    @RequestMapping(value = "/join", method = RequestMethod.POST)
    public String join(MemberVO memberVO, RedirectAttributes redirectAttributes) throws Exception {
        logger.info("post register");

        // 파라미터로 넘어온 회원의 객체정보(MemberVO) 중에서 비밀번호(MemPw)를 암호화 하는 작업을 수행.
        // BCrypt.hashpw()메서드는 위와 같이 첫번째 파라미터에는 암호화할 비밀번호를 두번째 파라미터는 BCrypt.gensalt()를 받고 암호화된 비밀번호를 반환.
        // 이렇게 암호화된 비밀번호를 다시 회원 객체에 저장하고 서비스의 회원가입 메서드를 호출
        String hashedPw = BCrypt.hashpw(memberVO.getMemPw(), BCrypt.gensalt());
        memberVO.setMemPw(hashedPw);
        memberService.memberJoin(memberVO);
        redirectAttributes.addFlashAttribute("msg", "REGISTERED");

        return "redirect:/member/loginPost";
    }

    // 아이디 중복 검사
    @RequestMapping(value = "/memIdCheck", method = RequestMethod.POST)
    @ResponseBody
    public String memIdCheckPOST(String memId) throws Exception {

        logger.info("memberIdChk() 진입");

        int result = memberService.memIdCheck(memId);

        logger.info("결과값 = " + result);

        if (result != 0) {
            return "fail";    // 중복 아이디가 존재
        } else {
            return "success";    // 중복 아이디 x
        }
    }

    // 로그인 페이지
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
        return "/login";
    }


    // 로그인 처리
    @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
    public void loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {

        MemberVO memberVO = memberService.memberLogin(loginDTO);

        if (memberVO == null || !BCrypt.checkpw(loginDTO.getMemPw(), memberVO.getMemPw())) {
            return;
        }

        model.addAttribute("member", memberVO);

        // 로그인 유지를 선택할 경우
        if (loginDTO.isUseCookie()) {
            int amount = 60 * 60 * 24 * 7; // 7일
            Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount)); // 로그인 유지기간 설정
            memberService.keepLogin(memberVO.getMemId(), httpSession.getId(), sessionLimit);
        }
    }

    // 로그아웃 처리
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception {
        Object object = httpSession.getAttribute("login");
        if (object != null) {
            MemberVO memberVO = (MemberVO) object;
            httpSession.removeAttribute("login");
            httpSession.invalidate();
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
            if (loginCookie != null) {
                loginCookie.setPath("/");
                loginCookie.setMaxAge(0);
                response.addCookie(loginCookie);
                memberService.keepLogin(memberVO.getMemId(), "none", new Date(System.currentTimeMillis()));
            }
        }
        return "/member/logout";


    }

    // 로그아웃 처리
/*    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception {
        Object object = httpSession.getAttribute("login");
        if (object != null) {
            MemberVO memberVO = (MemberVO) object;
            httpSession.removeAttribute("login");
            httpSession.invalidate();
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
            if (loginCookie != null) {
                loginCookie.setPath("/");
                loginCookie.setMaxAge(0);
                response.addCookie(loginCookie);
                userService.keepLogin(memberVO.getUserId(), "none", new Date());
            }
        }
        return "/user/logout";*/




/*    @RequestMapping(value = "/login", method = RequestMethod.POST)
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
    }*/

/*
    // 로그아웃
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) throws Exception {

        // 세션  초기화
        session.invalidate();

        return "redirect:/login";
    }
*/


}



	
	

