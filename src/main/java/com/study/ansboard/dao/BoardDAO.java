package com.study.ansboard.dao;

import com.study.ansboard.vo.BoardVO;
import com.study.ansboard.vo.CommentsVO;

import java.util.List;

public interface BoardDAO {



    List<BoardVO> list();

    BoardVO view(int bNo);

    int write(BoardVO boardVO);

    int writeComment(CommentsVO commentVO);

    void replyShape(BoardVO boardVO);

    int writeReply(BoardVO boardVO);

    List<CommentsVO> getCommentList(int bNo);
}
