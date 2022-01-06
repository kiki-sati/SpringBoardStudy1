package com.study.ansboard.member.dao;

import com.study.ansboard.member.vo.MemberVO;


public interface MemberDAO {

    // 회원가입
    void memberJoin(MemberVO memberVO) throws Exception;

    // 로그인
    MemberVO memberLogin(MemberVO memberVO) throws Exception;
}
