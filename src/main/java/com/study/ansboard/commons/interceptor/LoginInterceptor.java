package com.study.ansboard.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInterceptor extends HandlerInterceptorAdapter {

    public static final String LOGIN = "login";
    private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);


    /*
    자동로그인의 처리는 Session과 Cookie를 이용하여 처리합니다. 로그인 유지 기능이 사용되는 경우는 HttpSession에 login이란 이름으로 보관된 객체가 없지만 loginCookie가 존재하고,
    이 경우 Interceptor에서 설정한 7일의 기간 사이에 접속한 적이 있다는 것을 확인한 뒤 과거의 로그인 시점에 기록된 정보를 이용해 다시 HttpSession에 login이란 이름으로 UserVO 객체를 보관해주어야 합니다.
    이러한 개념을 바탕으로 User가 loginCookie를 가지고 있다면 그 값이 과거 로그인한 시점의 SessionId 라는 것을 알 수 있으며,
    loginCookie 값을 사용해 DB에서 UserVO의 정보를 읽어온 뒤 이를 HttpSession에 보관하도록 하겠습니다.
    */

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
       
    	HttpSession httpSession = request.getSession();
        logger.info("modelAndView >> " + modelAndView);
        ModelMap modelMap = modelAndView.getModelMap();
        Object memberVO = modelMap.get("member");

        if (memberVO != null) {
            logger.info("new login success");
            httpSession.setAttribute(LOGIN, memberVO);

            Object destination = httpSession.getAttribute("returnUrl");
            response.sendRedirect(destination != null ? (String) destination : "/board/list");
        }

    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession httpSession = request.getSession(); // 기존의 로그인 정보 제거
        if (httpSession.getAttribute(LOGIN) != null) {
            logger.info("clear login data before");
            httpSession.removeAttribute(LOGIN);
        }
        return true;
    }


    /*
    LoginInterceptor의 postHandle() 메서드는 httpSession에 컨트롤러에서 저장한 user를 저장하고,
    /로 리다이렉트를 한다. 그리고 preHandle() 메서드는 기존의 로그인 정보가 있을 경우 초기화하는 역할을 수행한다.
    */


}
