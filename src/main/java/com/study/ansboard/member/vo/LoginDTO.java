package com.study.ansboard.member.vo;

public class LoginDTO {

    private String memId;
    private String memPw;
    private String memNo;

    public String getMemId() {
        return memId;
    }

    public void setMemId(String memId) {
        this.memId = memId;
    }

    public String getMemPw() {
        return memPw;
    }

    public void setMemPw(String memPw) {
        this.memPw = memPw;
    }

    public String getMemNo() {
        return memNo;
    }

    public void setMemNo(String memNo) {
        this.memNo = memNo;
    }

    @Override
    public String toString() {
        return "LoginDTO{" +
                "memId='" + memId + '\'' +
                ", memPw='" + memPw + '\'' +
                '}';
    }
}


