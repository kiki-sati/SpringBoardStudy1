package com.study.ansboard.dao;

import com.study.ansboard.vo.BoardVO;
import com.study.ansboard.vo.CommentsVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDAOImpl implements BoardDAO{

    @Autowired
    private SqlSession sqlSession;
    private static final String namespace="com.study.ansboard.sqls.BoardMapper";

    @Override
    public int writeComment(CommentsVO commentVO) {
        return sqlSession.insert(namespace+".writeComment",commentVO);
    }

    @Override
    public List<BoardVO> list() {
        return sqlSession.selectList(namespace+".list");
    }

    @Override
    public BoardVO view(int bNo) {
        return sqlSession.selectOne(namespace+".view",bNo);
    }

    @Override
    public int write(BoardVO boardVO) {
        return sqlSession.insert(namespace+".write",boardVO);
    }

    @Override
    public void replyShape(BoardVO boardVO) {
        sqlSession.update(namespace+".replyShape",boardVO);
    }

    @Override
    public int writeReply(BoardVO boardVO) {
        return sqlSession.insert(namespace + ".writeReply", boardVO);
    }

    @Override
    public List<CommentsVO> getCommentList(int bNo) {
        return sqlSession.selectList(namespace+".commentList");
    }


}
