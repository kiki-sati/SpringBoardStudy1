<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 내용</title>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <script>

        $(document).ready(function () {
            // 게시판 리스트로 이동
            $('.list').on('click', function () {
                location.href = '/board/list';
            });

            // 수정 페이지
            $(".edit").click(function () {
                location.href = "/board/update?bNo=${board.bNo}";
            });

            // 글삭제
            $('.delete').click(function () {
                if (confirm('삭제하시면 복구할수 없습니다. \n 정말로 삭제하시겠습니까??')) {
                    location.href = "/delete?bNo=${board.bNo}";
                }
            });

            // 답글달기
            $('.writeReply').on('click', function () {
                var bNo = $('#bNo').val();
                var gNo = $('#gNo').val();
                var step = $('#step').val();
                var indent = $('#indent').val();
                location.href = '/board/write?bNo=${board.bNo}&gNo=${board.gNo}&step=${board.step}&indent=${board.indent}';
            });
        });
    </script>

</head>
<body>

<div class="container">
    <h2 class="mt-sm-5">게시글 뷰</h2>
    <button class="btn btn-primary mb-2 edit" style="margin-left: 35%;">수정</button>
    <button class="btn btn-primary mb-2 ml-1 delete">삭제</button>
    <button class="btn btn-primary mb-2 ml-1 list">목록</button>
    <button class="btn btn-primary mb-2 ml-1 writeReply">답글</button>
    <input type="hidden" id="bNo" value="${board.bNo}">
    <input type="hidden" id="gNo" value="${board.gNo}">
    <input type="hidden" id="step" value="${board.step}">
    <input type="hidden" id="indent" value="${board.indent}">
    <input type="text" class="form-control w-50 mb-sm-1" readonly="readonly" value="${board.writer}">
    <input type="text" class="form-control w-50 mb-sm-1" readonly="readonly" value="${board.title}">
    <textarea class="form-control w-50 mb-sm-1" rows="10" readonly="readonly">${board.content}</textarea>

    <%-- 댓글폼--%>
    <div class="row mt-3 ml-5">
        <form class="form-inline" name="commentForm">
            <input type="hidden" name="bNo" value="${board.bNo}">
            <input type="text" class="w-25 comments_writer" name="cmWriter" placeholder="작성자">
            <input type="text" class="w-50 comments_content" name="cmContent" placeholder="내용">
            <button type="button" class="ml-4 btn btn-danger writecomments">댓글작성</button>
        </form>
    </div>

    <div class="comments_list">
        <div class="row mt-1">
            <form id="commentListForm" name="commentListForm" method="post">
                <div id="commentList"></div>
            </form>
        </div>
    </div>

</div>

<script>
    /*
     * 댓글 등록하기(Ajax)
     */
    function fn_comment(code) {

        $.ajax({
            type: 'POST',
            url: "<c:url value='/board/insertComm'/>",
            data: $("#commentForm").serialize(),
            success: function (data) {
                if (data == "1") {
                    getCommentList();
                    $("#cmContent").val(""); /* 등록 후 초기화 하기 */
                    $("#cmWriter").val(""); /* 등록 후 초기화 하기 */
                }
            },
            error: function (request, status, error) {
                //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }

        });
    }

    /**
     * 초기 페이지 로딩시 댓글 불러오기
     */
    $(function () {

        getCommentList();


    });

    /**
     * 댓글 불러오기(Ajax)
     */
    function getCommentList() {

        $.ajax({
            type: 'GET',
            url: "<c:url value='/board/selectCommList'/>",
            dataType: "json",
            data: $("#commentForm").serialize(), /* 자주쓰는 기억하기 */
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function (data) {
                console.log(data);

                var html = "";
                var cCnt = data.length;

                if (data.length > 0) {

                    for (i = 0; i < data.length; i++) {
                        html += "<div>";
                        html += "<div><table class='table'><h6><strong>" + data[i].cmWriter + "</strong></h6>";
                        html += data[i].cmContent + "<tr><td></td></tr>";
                        html += "</table></div>";
                        html += "</div>";
                    }

                } else {

                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                    html += "</table></div>";
                    html += "</div>";

                }

                $("#cCnt").html(cCnt);
                $("#commentList").html(html);

            },
            error: function (request, status, error) {

            }

        });
    }

</script>
</body>
</html>