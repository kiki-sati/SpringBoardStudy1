<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <h2 class="mt-sm-5">게시글 보기</h2>
    <button class="btn btn-primary mb-2 list" style="margin-left: 39%">목록</button>
    <button class="btn btn-primary mb-2 ml-1 writereply" >답글</button>
    <input type="hidden" name="no" value="">
    <input type="hidden" name="gNO" value="">
    <input type="hidden" name="step" value="">
    <input type="hidden" name="indent" value="">

    <div class="row mt-3 ml-5">
        <form class="form-inline" name="commentForm">
            <input type="hidden" name="bNo" value="">
            <input type="text" class="w-25 comments_writer" name="id" placeholder="작성자">
            <input type="text" class="w-50 comments_content" name="content" placeholder="내용">
            <button type="button" class="ml-4 btn btn-danger writecomments">작성</button>
        </form>
    </div>

    <div class="comments_list">
        <div class="row mt-1">
            <div class="col-2">123</div>
            <div class="col-3">123</div>
            <div class="col-3">123</div>
        </div>
    </div>

</div>
</body>
</html>