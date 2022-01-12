package com.study.ansboard.member.vo;

public class LoginDTO {

    private String memId;
    private String memPw;
    private boolean useCookie;

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

    public boolean isUseCookie() {
        return useCookie;
    }

    public void setUseCookie(boolean useCookie) {
        this.useCookie = useCookie;
    }

    @Override
    public String toString() {
        return "LoginDTO{" +
                "memId='" + memId + '\'' +
                ", memPw='" + memPw + '\'' +
                ", useCookie=" + useCookie +
                '}';
    }
}


