package com.study.ansboard.member.service;

import com.study.ansboard.member.dao.MemberDAO;
import com.study.ansboard.member.vo.LoginDTO;
import com.study.ansboard.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAO memberDAO;


    @Override
    public void memberJoin(MemberVO memberVO) throws Exception {
         memberDAO.memberJoin(memberVO);
    }

    @Override
    public MemberVO memberLogin(LoginDTO loginDTO) throws Exception {
        return memberDAO.memberLogin(loginDTO);
    }

    @Override
    public int memIdCheck(String memId) {
        return memberDAO.memIdCheck(memId);
    }


    @Override
    public MemberVO checkLoginBefore(String value) throws Exception {
        return memberDAO.checkUserWithSessionKey(value);
    }

    @Override
    public int insertLoginInfo(MemberVO memberVO) throws Exception {
        return memberDAO.insertLoginInfo(memberVO);
    }


}
