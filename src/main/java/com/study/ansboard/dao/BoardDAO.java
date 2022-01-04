package com.study.ansboard.dao;

import com.study.ansboard.vo.BoardVO;
import com.study.ansboard.vo.CommentsVO;

import java.util.List;

public interface BoardDAO {

    List<BoardVO> list();

    BoardVO view(int bNo);

    int write(BoardVO boardVO);

    void replyShape(BoardVO boardVO);

    int writeReply(BoardVO boardVO);

    /* 조회수 증가 */
    void viewCnt(int bNo);
}
