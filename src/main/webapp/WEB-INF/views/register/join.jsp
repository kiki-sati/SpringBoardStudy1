<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <title>회원가입</title>
</head>
<script type="text/javascript">
    $(document).ready(function(){
        // 취소
        $("#cencle").on("click", function(){
            location.href = "/";
        })

        $("#submit").on("click", function(){
            if($("#memId").val()==""){
                alert("아이디를 입력해주세요.");
                $("#memId").focus();
                return false;
            }
            if($("#memPw").val()==""){
                alert("비밀번호를 입력해주세요.");
                $("#memPw").focus();
                return false;
            }
            if($("#memName").val()==""){
                alert("이름을 입력해주세요.");
                $("#memName").focus();
                return false;
            }
            if($("#phoneNum").val()==""){
                alert("전화번호를 입력해주세요.");
                $("#phoneNum").focus();
                return false;
            }
            if($("#memEmail").val()==""){
                alert("이메일을 입력해주세요.");
                $("#memEmail").focus();
                return false;
            }
        });

    })
</script>
<body>
<section id="container">
    <form action="/member/join" method="post">
        <div class="form-group has-feedback">
            <label class="control-label" for="memId">아이디</label>
            <input class="form-control" type="text" id="memId" name="memId" />
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="memPw">패스워드</label>
            <input class="form-control" type="password" id="memPw" name="memPw" />
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="memName">이름</label>
            <input class="form-control" type="text" id="memName" name="memName" />
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="phoneNum">전화번호</label>
            <input class="form-control" type="text" id="phoneNum" name="phoneNum" />
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="memEmail">이메일</label>
            <input class="form-control" type="text" id="memEmail" name="memEmail" />
        </div>
        <div class="form-group has-feedback">
            <button class="btn btn-success" type="submit" id="submit">회원가입</button>
            <button class=" btn btn-danger" type="button" id="cancel">취소</button>
        </div>
    </form>
</section>

</body>

</html>