package com.study.ansboard.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentsVO {
    private int cmNo;
    private String cmContent;
    private String cmDate;
    private String cmWriter;
    private int bNo;
}
