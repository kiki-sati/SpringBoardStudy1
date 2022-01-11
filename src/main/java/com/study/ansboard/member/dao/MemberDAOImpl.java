package com.study.ansboard.member.dao;

import com.study.ansboard.member.vo.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

    @Autowired
    private SqlSession sqlSession;
    private static final String namespace="com.study.ansboard.sqls.MemberMapper";
    

    // 회원가입
    @Override
    public void memberJoin(MemberVO memberVO) throws Exception {
        sqlSession.insert(namespace+ ".memberJoin", memberVO);

    }

    // 로그인
    @Override
    public MemberVO memberLogin(MemberVO memberVO) throws Exception {
        return sqlSession.selectOne(namespace+".memberLogin", memberVO);
    }

    @Override
    public int memIdCheck(String memId) {
        return sqlSession.selectOne(namespace+".memIdCheck", memId);
    }
}
