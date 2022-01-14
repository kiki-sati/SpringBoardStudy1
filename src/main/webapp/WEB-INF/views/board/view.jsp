<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="/WEB-INF/views/layout/header.jsp" %>
    <title>게시판 내용</title>


</head>
<body>

<div class="container">
    <div class="mt-sm-5">
        <%@ include file="/WEB-INF/views/layout/nav.jsp" %>
    </div>
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
    <input type="text" class="form-control w-50 mb-sm-1" readonly="readonly" value="${board.regDate}">
    <input type="text" class="form-control w-50 mb-sm-1" readonly="readonly" value="${board.editDate}">
    <textarea class="form-control w-50 mb-sm-1" rows="10" readonly="readonly">${board.content}</textarea>

    <%-- 댓글폼--%>
    <div class="container">
        <form id="commentForm" name="commentForm" method="post">
            <div>
                <div>
                    <span><strong>Comments</strong></span>
                    <span id="cCnt"></span>
                </div>
                <div>
                    <table class="table">
                        <tr>
                            <td>
                                <input type="text" style="width: 300px" id="cmWriter" name="cmWriter" value="${login.memName}" readonly></textarea>
                                <br>
                                <textarea style="width: 500px" rows="3" cols="30" id="cmContent" name="cmContent" placeholder="댓글을 입력하세요" maxlength="500"></textarea>
                                <div>
                                    <a href='#' onClick="fn_comment('${result.code}')" class="btn pull-right btn-success">등록</a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <input type="hidden" id="b_code" name="b_code" value="${result.code}"/>
            <input type="hidden" id="bNo2" name="bNo2" value="${board.bNo}">
        </form>
    </div>
    <div class="container">
        <form id="commentListForm" name="commentListForm" method="post">
            <div id="commentList"></div>
        </form>
    </div>

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
                    location.href = "/board/delete?bNo=${board.bNo}";
                }
            });

            // 답글달기
            $('.writeReply').on('click', function () {
                const bNo = $('#bNo').val();
                const gNo = $('#gNo').val();
                const step = $('#step').val();
                const indent = $('#indent').val();
                location.href = '/board/write?bNo=${board.bNo}&gNo=${board.gNo}&step=${board.step}&indent=${board.indent}';
            });
        });


        //댓글 등록하기(Ajax)
        function fn_comment(code) {
            $.ajax({
                type: 'POST',
                url: "comments.json",
                data: $("#commentForm").serialize(),
                dataType: "json",
                success: function (data) {
                    if (data == "1") {
                        getCommentList();
                        $("#cmContent").val(""); /* 등록 후 초기화 하기 */
                    }
                },
                error: function (request, status, error) {
                }
            });
        }

        // 초기 페이지 로딩시 댓글 불러오기
        $(function () {
            getCommentList();
        });

        // 댓글 불러오기
        function getCommentList() {
            $.ajax({
                type: 'GET',
                url: "getCommentList",
                dataType: "json",
                data: $("#commentForm").serialize(),
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                success: function (data) {
                    console.log(data);

                    let html = "";
                    let cCnt = data.length;

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

</div>
</body>
</html>