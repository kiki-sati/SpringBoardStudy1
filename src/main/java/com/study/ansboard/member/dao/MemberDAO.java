package com.study.ansboard.member.dao;

import com.study.ansboard.member.vo.LoginDTO;
import com.study.ansboard.member.vo.MemberVO;

import java.sql.Date;


public interface MemberDAO {

    // 회원가입
    void memberJoin(MemberVO memberVO) throws Exception;

    // 로그인
    MemberVO memberLogin(LoginDTO loginDTO) throws Exception;

    // 아이디 중복 검사
    int memIdCheck(String memId);

    // 세션키 검증
    MemberVO checkUserWithSessionKey(String value) throws Exception;

    // 로그인 이력 입력
    int insertLoginInfo(MemberVO memberVO) throws Exception;

}
