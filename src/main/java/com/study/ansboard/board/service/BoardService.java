package com.study.ansboard.board.service;

import com.study.ansboard.board.vo.BoardVO;

import java.util.List;


public interface BoardService {

    List<BoardVO> list() throws Exception;

    int write(BoardVO boardVO) throws Exception;

    BoardVO view(int bNo) throws Exception;

    // 게시물 수정
    void update(BoardVO boardVO);

    // 삭제
    void delete(BoardVO boardVO) throws Exception;

}
