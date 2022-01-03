<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 리스트</title>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
</head>
<body>

<div class="container">
    <h2 class="mt-sm-5">게시글 작성 </h2>
    <form action="/board/write" method="post">
        <input type="hidden" name="bNo" value="${board.bNo}">
        <input type="hidden" name="gNo" value="${board.gNo}">
        <input type="hidden" name="step" value="${board.step}">
        <input type="hidden" name="indent" value="${board.indent}">
        <input type="text" class="form-control w-50 mb-sm-1" name="bNo" placeholder="작성자">
        <input type="text" class="form-control w-50 mb-sm-1" name="title" placeholder="제목">
        <textarea rows="10" class="form-control w-50 mb-sm-1" name="content"></textarea>
        <button type="submit" class="btn btn-primary" style="margin-left: 45%;">등록</button>
    </form>
</div>
</body>
</html>