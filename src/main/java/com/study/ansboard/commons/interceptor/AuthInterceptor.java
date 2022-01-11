package com.study.ansboard.commons.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthInterceptor extends HandlerInterceptorAdapter {
    private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession httpSession = request.getSession();
        if (httpSession.getAttribute("login") == null) {
            logger.info("current user is not logged");
            saveDestination(request);
            response.sendRedirect("/board/list");
            return false;
        }
        return true;
    }

    //사용자가 원하던 페이지가 무엇이었는지 보관했다가, 로그인 성공 후 해당 페이지로 이동 시켜주기
    // 페이지 요청 정보 저장
    private void saveDestination(HttpServletRequest request) {
        String uri = request.getRequestURI();
        String query = request.getQueryString();
        if (query == null || query.equals("null")) {
            query = "";
        } else {
            query = "?" + query;
        }
        if (request.getMethod().equals("GET")) {
            logger.info("detination : " + (uri + query));
            request.getSession().setAttribute("detination", uri + query);
        }
    }



}
