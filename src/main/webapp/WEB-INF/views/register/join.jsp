<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <title>회원가입</title>
</head>

<body>
<section  class="container" style="margin-top:100px"  >
    <form action="/member/join" method="post">
        <input type="hidden" name="phoneNum" id="phoneNum"/>
        <div class="form-group has-feedback">
            <label class="control-label" for="memId">아이디</label>
            <input class="form-control" type="text" id="memId" name="memId" maxlength="28"/>
            <div id="idCheck1">사용 가능한 아이디 입니다. </div>
            <div id="idCheck2" style="color:#d92742"> 이미 사용중인 아이디 입니다.</div>

            <div class="form-group has-feedback">
                <label class="control-label" for="memPw">비밀번호</label>
                <input class="form-control" type="password" id="memPw" name="memPw" maxlength="15"/>
                <div id="invalid-pw1"></div>
            </div>
            <div class="form-group has-feedback">
                <label class="control-label" for="memPwCheck">비밀번호 확인</label>
                <input class="form-control" type="password" id="memPwCheck" name="memPwCheck" maxlength="15"/>
                <div id="alert-success"></div>
                <div id="alert-danger"></div>
            </div>
            <div class="form-group has-feedback">
                <label class="control-label" for="memName">이름</label>
                <input class="form-control" type="text" id="memName" name="memName" maxlength="5"/>
            </div>
            <div class="form-group has-feedback">
                <label class="control-label">전화번호</label>
                <select name="phoneNum1" id="phoneNum1" style="width:90px">
                    <option value="">선택</option>
                    <option value="010">010</option>
                    <option value="011">011</option>
                </select>
                <input type="text" id="phoneNum2" name="phoneNum2" maxlength="4" style="width:90px" />
                <input type="text" id="phoneNum3" name="phoneNum3" maxlength="4" style="width:90px" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label" for="memEmail">이메일</label>
                <input class="form-control" type="text" id="memEmail" name="memEmail"/>
                <div id="invalid-email"></div>
            </div>
            <div class="form-group has-feedback">
                <button class="btn btn-success" type="submit" id="submit">회원가입</button>
                <button class=" btn btn-danger" type="button" id="cancel">취소</button>
            </div>
        </div>
    </form>
</section>

<script type="text/javascript">

    $(document).ready(function () {



        $('#idCheck1').hide();
        $('#idCheck2').hide();

        $("#cancel").on("click", function () {
            location.href = "/";
        })

        //아이디 중복검사
        $('#memId').on('blur', function (event) {
            const memId = $("#memId").val();
            if (memId != null && memId != '' && memId != "undefined") {
                $.ajax({
                    method: "post",
                    url: "/member/memIdCheck",
                    data: {memId: memId},
                    success: function (result) {
                        if (result != 'fail') {
                            $('#idCheck2').hide();
                            $('#idCheck1').show();
                        } else {
                            $('#idCheck1').hide();
                            $('#idCheck2').show();
                        }
                    }
                });
            } else {
                $('#idCheck1').hide();
                $('#idCheck2').hide();
                alert("아디를 입력해");
                return false;
            }

        });

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
            if ($("#memId").val() == "") {
                alert("아이디를 입력해주세요.");
                $("#memId").focus();
                return false;
            }
            if ($("#memPw").val() == "") {
                alert("비밀번호를 입력해주세요.");
                $("#memPw").focus();
                return false;
            }
            if ($("#memPwCheck").val() == "") {
                alert("비밀번호 확인을 입력해주세요.");
                $("#memPwCheck").focus();
                return false;
            }
            if ($("#memName").val() == "") {
                alert("이름을 입력해주세요.");
                $("#memName").focus();
                return false;
            }
            const ph1 = $("#phoneNum1").val();
            const ph2 = $("#phoneNum2").val();
            const ph3 = $("#phoneNum3").val();

            $("#phoneNum").val(ph1 + ph2 + ph3);
            if ($("#phoneNum").val() == "" || $("#phoneNum").val().length < 10) {
                alert("전화번호를 입력해주세요.");
                $("#phoneNum").focus();
                return false;
            }
            if ($("#memEmail").val() == "") {
                alert("이메일을 입력해주세요.");
                $("#memEmail").focus();
                return false;
            }
        });
    })


</script>
</body>
</html>