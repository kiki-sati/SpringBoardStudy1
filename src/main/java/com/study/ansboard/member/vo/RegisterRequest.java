package com.study.ansboard.member.vo;

public class RegisterRequest {
    private String email;
    private String id;
    private String name;
    private String pw;
    private String checkpw;

    // 비밀번호 확인
    public boolean isPwEqualToCheckpw() {
        return pw.equals(checkpw);
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getCheckpw() {
        return checkpw;
    }

    public void setCheckpw(String checkpw) {
        this.checkpw = checkpw;
    }
}


