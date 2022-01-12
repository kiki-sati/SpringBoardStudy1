package com.study.ansboard.member.service;

import com.study.ansboard.member.vo.LoginDTO;
import com.study.ansboard.member.vo.MemberVO;

import java.sql.Date;

public interface MemberService {
    // 회원가입
    void memberJoin(MemberVO memberVO) throws Exception;

    // 로그인
    MemberVO memberLogin(LoginDTO loginDTO) throws Exception;

    // 아이디 중복 검사
    int memIdCheck(String memId);

    void keepLogin(String memId, String sessionId, Date sessionLimit) throws Exception;

    MemberVO checkLoginBefore(String value) throws Exception;

}
