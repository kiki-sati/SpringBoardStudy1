package com.study.ansboard.member.vo;

public class LoginDTO {

    private String memId;
    private String memPw;
    private String memCookie;

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

    public String getMemCookie() {
        return memCookie;
    }

    public void setMemCookie(String memCookie) {
        this.memCookie = memCookie;
    }

    @Override
    public String toString() {
        return "LoginDTO{" +
                "memId='" + memId + '\'' +
                ", memPw='" + memPw + '\'' +
                ", memCookie='" + memCookie + '\'' +
                '}';
    }
}


