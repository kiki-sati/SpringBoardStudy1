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

    MemberVO checkLoginBefore(String value) throws Exception;

    // 로그인 이력 입력
    int insertLoginInfo(MemberVO memberVO) throws Exception;

    // 회원 정보 수정
    void memberUpdate (MemberVO memberVO) throws Exception;

}
