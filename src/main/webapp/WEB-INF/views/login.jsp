<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>

<head>
    <%@ include file="/WEB-INF/views/layout/header.jsp" %>
    <title>Login</title>
</head>
<a href="/board/list">게시판</a><br/>


<body>
<form action="/member/loginPost" method="post" name="form">
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
</form>

</body>
<script type="text/javascript">
    $(document).ready(function () {
        $("#logoutBtn").on("click", function () {
            location.href = "/member/logout";
        })

        $("#join").on("click", function () {
            location.href = "/member/join";
        })

    })

    var msg = "${msg}";
    if (msg === "REGISTERED") {
        alert("회원가입이 완료되었습니다. 로그인해주세요~^^*");
    }

</script>
</html>