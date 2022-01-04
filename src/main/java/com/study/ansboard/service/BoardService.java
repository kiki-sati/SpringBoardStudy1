package com.study.ansboard.service;

import com.study.ansboard.vo.BoardVO;
import com.study.ansboard.vo.CommentsVO;

import java.util.List;


public interface BoardService {

    List<BoardVO> list() throws Exception;

    int write(BoardVO boardVO) throws Exception;

    BoardVO view(int bNo) throws Exception;

}
