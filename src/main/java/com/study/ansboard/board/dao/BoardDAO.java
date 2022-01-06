package com.study.ansboard.board.dao;

import com.study.ansboard.board.vo.BoardVO;

import java.util.List;

public interface BoardDAO {

    List<BoardVO> list();

    BoardVO view(int bNo);

    int write(BoardVO boardVO);

    void replyShape(BoardVO boardVO);

    int writeReply(BoardVO boardVO);

    // 조회수 증가
    void viewCnt(int bNo);

    // 게시물 수정
    void update(BoardVO boardVO);

    // 삭제
    void delete(BoardVO boardVO);

}
