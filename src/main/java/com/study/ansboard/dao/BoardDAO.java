package com.study.ansboard.dao;

import com.study.ansboard.vo.BoardVO;

import java.util.List;

public interface BoardDAO {

    List<BoardVO> list();

    BoardVO view(int bNo);

    int write(BoardVO boardVO);

    void replyShape(BoardVO boardVO);

    int replyWrite(BoardVO boardVO);
}
