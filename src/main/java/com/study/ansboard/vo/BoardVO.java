package com.study.ansboard.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {
    private int bNO;
    private String title;
    private String content;
    private String writer;
    private int gNo;
    private int step;
    private int indent;
    private int viewCnt;
    private String regDate;
    private String editDate;
}
