package com.study.ansboard.board.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {
    private int startRow;
    private int endRow;
    private int pageSize;
    private int count;
    private int pageNum;
    private int pageCount;
    private int pageBlock;
    private int startPage;
    private int endPage;

    public void pageInit() {
        setPageCount(count / pageSize + (count % pageSize == 0 ? 0 : 1));
        setStartPage(((pageNum - 1) / pageBlock) * pageBlock + 1);
        int endPage = startPage + pageBlock - 1;
        if (endPage > pageCount) {
            endPage = pageCount;
        }
        setEndPage(endPage);
    }
}
