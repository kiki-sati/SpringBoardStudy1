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

    /* 댓글 출력 */
    @Override
    public List<CommentsVO> getCommentList(int bNo) {
        return sqlSession.selectList(namespace+".commentList");
    }

    /* 댓글 작성 */
    @Override
    public int writeComment(CommentsVO commentVO) {
        return sqlSession.insert(namespace+".writeComment",commentVO);
    }

    /* 게시글 목록 */
    @Override
    public List<BoardVO> list() {
        return sqlSession.selectList(namespace+".list");
    }

    /* 게시글 내용 출력 */
    @Override
    public BoardVO view(int bNo) {
        return sqlSession.selectOne(namespace+".view",bNo);
    }

    /* 글 작성 */
    @Override
    public int write(BoardVO boardVO) {
        return sqlSession.insert(namespace+".write",boardVO);
    }

    /* 답글 순서 수정 */
    @Override
    public void replyShape(BoardVO boardVO) {
        sqlSession.update(namespace+".replyShape",boardVO);
    }

    /* 답글 정보 조회 */
    public BoardVO replyInfo(BoardVO boardVO) {
        return sqlSession.selectOne(namespace+".replyInfo", boardVO);
    }

    /* 답글 등록 */
    @Override
    public int writeReply(BoardVO boardVO) {
        return sqlSession.insert(namespace + ".writeReply", boardVO);
    }

}
