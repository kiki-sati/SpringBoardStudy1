<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 리스트</title>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <script>
        $(document).ready(function(){
            $('.list').on('click', function(){
                location.href='/board/list';
            });

            $('.writeReply').on('click', function(){
                var bNo = $('#bNo').val();
                var gNo = $('#gNo').val();
                var step = $('#step').val();
                var indent = $('#indent').val();
                location.href='/board/write?bNo=${board.bNo}&gNo=${board.gNo}&step=${board.step}&indent=${board.indent}';
            });
        });
    </script>

</head>
<body>

<div class="container">
    <h2 class="mt-sm-5">게시글 뷰</h2>
    <button class="btn btn-primary mb-2 list" style="margin-left: 39%;">목록</button>
    <button class="btn btn-primary mb-2 ml-1 writeReply">답글</button>
    <input type="hidden" id="bNo" value="${board.bNo}">
    <input type="hidden" id="gNo" value="${board.gNo}">
    <input type="hidden" id="step" value="${board.step}">
    <input type="hidden" id="indent" value="${board.indent}">
    <input type="text" class="form-control w-50 mb-sm-1" readonly="readonly" value="${board.writer}">
    <input type="text" class="form-control w-50 mb-sm-1" readonly="readonly" value="${board.title}">
    <textarea class="form-control w-50 mb-sm-1" rows="10" readonly="readonly">${board.content}</textarea>

    <div class="row mt-3 ml-5">
        <form class="form-inline" name="commentForm">
            <input type="hidden" name="bNo" value="${board.bNo}">
            <input type="text" class="w-25 comments_writer" name="cmWriter" placeholder="작성자">
            <input type="text" class="w-50 comments_content" name="cmContent" placeholder="내용">
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