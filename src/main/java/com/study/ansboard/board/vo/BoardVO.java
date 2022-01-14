package com.study.ansboard.board.vo;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class BoardVO {
    private int bNo;
    private String title;
    private String content;
    private String writer;
    private int gNo;
    private int step;
    private int indent;
    private int viewCnt;
    private String regDate;
    private String editDate;
    private String boardParentSeq;

    // 댓글
    private int cmNo;
    private String cmContent;
    private String cmDate;
    private String cmWriter;
    private String bNo2;

    public int getbNo() {
        return bNo;
    }

    public void setbNo(int bNo) {
        this.bNo = bNo;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public int getgNo() {
        return gNo;
    }

    public void setgNo(int gNo) {
        this.gNo = gNo;
    }

    public int getStep() {
        return step;
    }

    public void setStep(int step) {
        this.step = step;
    }

    public int getIndent() {
        return indent;
    }

    public void setIndent(int indent) {
        this.indent = indent;
    }

    public int getViewCnt() {
        return viewCnt;
    }

    public void setViewCnt(int viewCnt) {
        this.viewCnt = viewCnt;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public String getEditDate() {
        return editDate;
    }

    public void setEditDate(String editDate) {
        this.editDate = editDate;
    }

    public String getBoardParentSeq() {
        return boardParentSeq;
    }

    public void setBoardParentSeq(String boardParentSeq) {
        this.boardParentSeq = boardParentSeq;
    }

    public int getCmNo() {
        return cmNo;
    }

    public void setCmNo(int cmNo) {
        this.cmNo = cmNo;
    }

    public String getCmContent() {
        return cmContent;
    }

    public void setCmContent(String cmContent) {
        this.cmContent = cmContent;
    }

    public String getCmDate() {
        return cmDate;
    }

    public void setCmDate(String cmDate) {
        this.cmDate = cmDate;
    }

    public String getCmWriter() {
        return cmWriter;
    }

    public void setCmWriter(String cmWriter) {
        this.cmWriter = cmWriter;
    }

    public String getbNo2() {
        return bNo2;
    }

    public void setbNo2(String bNo2) {
        this.bNo2 = bNo2;
    }

    @Override
    public String toString() {
        return "BoardVO{" +
                "bNo=" + bNo +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", writer='" + writer + '\'' +
                ", gNo=" + gNo +
                ", step=" + step +
                ", indent=" + indent +
                ", viewCnt=" + viewCnt +
                ", regDate='" + regDate + '\'' +
                ", editDate='" + editDate + '\'' +
                ", boardParentSeq='" + boardParentSeq + '\'' +
                ", cmNo=" + cmNo +
                ", cmContent='" + cmContent + '\'' +
                ", cmDate='" + cmDate + '\'' +
                ", cmWriter='" + cmWriter + '\'' +
                '}';
    }
}
