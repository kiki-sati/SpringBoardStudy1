<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="/WEB-INF/views/layout/header.jsp"%>
    <title>게시판 리스트</title>

    <script>
        // 게시판 이동
        $(document).ready(function() {
            $(".list").click(function() {
                location.href = "/board/list";
            });
        });
    </script>
</head>
<body>

<div class="container">
    <h2 class="mt-sm-5">게시글 작성 </h2>
    <form action="/board/write" id="form" method="post">
        <input type="hidden" name="bNo" value="${board.bNo}">
        <input type="hidden" name="gNo" value="${board.gNo}">
        <input type="hidden" name="step" value="${board.step}">
        <input type="hidden" name="indent" value="${board.indent}">
        <input type="hidden" id="boardParentSeq" name="boardParentSeq" value="${bNo}"/> <!-- 부모 게시글 번호 -->
        <input type="text" class="form-control w-50 mb-sm-1" readonly name="writer" value="${login.memName}">
        <input type="text" class="form-control w-50 mb-sm-1" name="title" placeholder="제목">
        <textarea rows="10" class="form-control w-50 mb-sm-1" name="content"></textarea>
        <button type="submit" class="btn btn-primary" style="margin-left: 45%;">등록</button>
    </form>
    <button type="button" class="btn btn-primary list">목록</button>
</div>
</body>
</html>