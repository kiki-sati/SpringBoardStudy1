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
        $(document).ready(function () {
            $('.move').on('click', function () {
                var value = $(this).attr('data');
                if (value == 'write') {
                    location.href = '/board/write';
                } else if (value == 'view') {
                    var bNo = $(this).parent('tr').children('td:nth-of-type(1)').html();
                    console.log(bNo);
                    location.href = '/board/view?bNo=' + bNo;
                }
            });
        });
    </script>
</head>
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
        <c:forEach items="${list}" var="list">
            <tr>
                <td>${list.bNo}</td>
                <td class="move text-left" data="view" style="cursor: pointer;">
                    <c:if test="${list.indent > 0 }">
                        <c:set var="width" value="${list.indent * 10}"> </c:set>
                        <img alt="" src="/img/abc.png" width="${width}px">
                        <span>&gt;</span>
                    </c:if>
                        ${list.title}</td>
                <td>${list.writer}</td>
                <td>${list.regDate}</td>
                <td>${list.viewCnt}</td>
            </tr>

        </c:forEach>
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
