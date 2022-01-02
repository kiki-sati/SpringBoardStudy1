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

</head>ㄴ
<body>

<div class="container">
    <h2 class="mt-sm-5">게시판 리스트</h2>
    <button class="btn btn-primary float-right mb-sm-2 move" data="write">글작성</button>

    <table class="table text-center">
        <thead class="table-dark">
        <tr>
            <td>번호</td>
            <td>제목</td>
            <td>작성자</td>
            <td>날짜</td>
            <td>조회수</td>
        </tr>
        </thead>

        <tbody>
        <tr>
            <td>1</td>
            <td>하하</td>
            <td>박순이</td>
            <td>2012.11.11</td>
            <td>1</td>
        </tr>
        </tbody>
    </table>

    <ul class="pagination" style="margin-left: 42%">
        <li class="page-item">
            <a class="page-link" href="#">1</a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#">2</a>
        </li>
        <li class="page-item" active>
            <a class="page-link" href="#">3</a>
        </li>

    </ul>
</div>

</body>
</html>