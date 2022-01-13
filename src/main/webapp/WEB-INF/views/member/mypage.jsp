<%@ page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/layout/header.jsp" %>
    <title>회원정보 수정</title>
</head>

<body>
<section class="container" style="margin-top:100px">
    <h2 class="mt-sm-5" style="margin-bottom: 50px"> 회원 정보 수정 </h2>
    <form action="/member/memberUpdate" method="post">
        <input type="hidden" name="phoneNum" id="phoneNum"/>
        <div class="form-group has-feedback">
            <label class="control-label" for="memId">아이디</label>
            <input class="form-control" type="text" id="memId" name="memId" value="${login.memId}" readonly/>

            <div class="form-group has-feedback">
                <label class="control-label" for="memPw">비밀번호 수정</label>
                <input class="form-control" type="password" id="memPw" name="memPw" maxlength="15" required/>
                <div id="invalid-pw1"></div>
            </div>

            <div class="form-group has-feedback">
                <label class="control-label" for="memPwCheck">비밀번호 확인</label>
                <input class="form-control" type="password" id="memPwCheck" name="memPwCheck" maxlength="15" required/>
                <div id="alert-success"></div>
                <div id="alert-danger"></div>
            </div>

            <div class="set_input_check_master">
                <label><span></span> 재설정</label>
                <a href="javascript:void(0);" id="pwdArea" onclick="fncChangeAdminPwd();">비밀번호 재설정</a>
            </div>

            <div class="form-group has-feedback">
                <label class="control-label">이름</label>
                <input class="form-control" type="text" value="${login.memName}" readonly/>
                <label class="control-label" for="memName">변경할 이름</label>
                <input class="form-control" type="text" id="memName" name="memName" maxlength="5"/>
            </div>

            <div class="form-group has-feedback">
                <label class="control-label">전화번호</label>
                <label for="phoneNum1"></label>
                <select name="phoneNum1" id="phoneNum1" style="width:90px">
                    <option value="">선택</option>
                    <option value="010">010</option>
                    <option value="011">011</option>
                </select>

                <label for="phoneNum2"></label>
                <input type="text" id="phoneNum2" name="phoneNum2" maxlength="4" style="width:90px"/>
                <label for="phoneNum3"></label>
                <input type="text" id="phoneNum3" name="phoneNum3" maxlength="4" style="width:90px"/>
            </div>

            <div class="form-group has-feedback">
                <label class="control-label" for="memEmail">이메일</label>
                <input class="form-control" type="text" id="memEmail" name="memEmail"/>
                <div id="invalid-email"></div>
            </div>

            <div class="form-group has-feedback">
                <button class="btn btn-success" type="submit" id="submit">회원정보 수정</button>
                <button class=" btn btn-danger" type="button" id="cancel">취소</button>
            </div>
            <input type="hidden" name="memNo" id="memNo" value="${login.memNo}"/>
        </div>
    </form>
</section>

<script type="text/javascript">

    $(document).ready(function () {

        $('#phoneNum2').on('keyup', function () {
            $('#phoneNum2').val($('#phoneNum2').val().replace(/[^0-9]/g, ""));
        });

        $('#phoneNum3').on('keyup', function () {
            $('#phoneNum3').val($('#phoneNum3').val().replace(/[^0-9]/g, ""));
        });

        $('#memPw').on('keyup', function (event) {
            if (!/^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,15}$/.test($('#memPw').val())) {
                $('#invalid-pw1').html("<div class='bi bi-exclamation-circle' style='color:#d92742'>유효한 비밀번호를 입력해 주시기 바랍니다.(영문,숫자,특수문자 8~15)</div> ");
                $('#invalid-pw1').show();
            } else {
                $('#invalid-pw1').empty();
            }
        });


        /* 이메일, 비밀번호 유효성 검사 */
        $('#memEmail').on('keyup', function (event) {
            if (!/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g.test($('#memEmail').val())) {
                $('#invalid-email').html("<div class='bi bi-exclamation-circle' style='color:#d92742'>유효한 이메일 주소를 입력해 주시기 바랍니다.</div> ");
                $('#invalid-email').show(); /*show() 메소드 추가 -> hide*/
            } else {
                $('#invalid-email').empty();
            }
        });


        /* 비밀번호 중복확인 */
        $('#memPwCheck').on('blur', function () {
            var pwd1 = $("#memPw").val();
            var pwd2 = $("#memPwCheck").val();
            if (pwd1 != '' && pwd2 == '') {
                return false;
            } else if (pwd1 != "" || pwd2 != "") {
                if (pwd1 == pwd2) {
                    $("#alert-danger").hide();
                    $('#alert-success').html("<div class='bi bi-exclamation-circle' >비밀번호가 일치합니다.</div> ");
                    $('#alert-success').show();
                } else {
                    alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
                    $("#alert-success").hide();
                    $('#alert-danger').html("<div class='bi bi-exclamation-circle' style='color: #d92742; font-weight: bold' >비밀번호가 일치하지 않습니다.</div> ");
                    $('#alert-danger').show();
                }
            }
        });

        $("#submit").on("click", function () {

            const ph1 = $("#phoneNum1").val();
            const ph2 = $("#phoneNum2").val();
            const ph3 = $("#phoneNum3").val();

            $("#phoneNum").val(ph1 + ph2 + ph3);

        });

        // 취소 이동
        $("#cancel").on("click", function () {
            location.href = "/board/list";
        })


    })
    function fncChangeAdminPwd() {
        $.ajax({
            method: "POST",
            url: "mypagePwd.json",
            data: $("form").serialize(),
            dataType: "json",
            success: function (data) {
                prompt("비밀번호가 재설정되었습니다.", data.newPwd);
                $("#newPwd").val(data.newPwd);
                $("#newPwd").select();
                document.execCommand("copy");
            },
            error: function (request, status, error) {
                alert("오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }
</script>
</body>
</html>