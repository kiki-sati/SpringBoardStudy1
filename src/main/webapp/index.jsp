<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>

<head>
    <title>Home</title>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
</head>
<a href="/board/list">게시판</a><br />

<script type="text/javascript">
    $(document).ready(function(){
        $("#logoutBtn").on("click", function(){
            location.href="member/logout";
        })

        $("#join").on("click", function(){
            location.href="member/join";
        })




    })
</script>
<body>
<form action="/member/login" method="post" name="form" >
    <c:if test="${member == null}">
        <div>
            <label for="memId"></label>
            <input type="text" id="memId" name="memId">
        </div>
        <div>
            <label for="memPw"></label>
            <input type="password" id="memPw" name="memPw">
        </div>
        <div>
            <button type="submit">로그인</button>
            <button id="join" type="button">회원가입</button>
        </div>
    </c:if>
    <c:if test="${member != null }">
        <div>
            <p>${member.memId}님 환영 합니다.</p>
            <button id="logoutBtn" type="button">로그아웃</button>
        </div>
    </c:if>
    <c:if test="${msg == false}">
        <p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
    </c:if>
</form>
</body>
</html>