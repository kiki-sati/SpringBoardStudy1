package com.study.ansboard.member.service;

import com.study.ansboard.member.dao.MemberDAO;
import com.study.ansboard.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAO memberDAO;


    @Override
    public void memberJoin(MemberVO memberVO) throws Exception {

    }

    @Override
    public MemberVO memberLogin(MemberVO memberVO) throws Exception {
        return memberDAO.memberLogin(memberVO);
    }
}
