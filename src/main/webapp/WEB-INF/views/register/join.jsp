<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <title>회원가입</title>
</head>
<script type="text/javascript">


    $(document).ready(function(){


        $('#memEmail').on('keyup' ,function(event) {
            if (!/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g.test($('#memEmail').val())) {
                $('#invalid-email').html("<div class='bi bi-exclamation-circle' style='color:red'>유효한 이메일 주소를 입력해 주시기 바랍니다.</div> ");
                $('#invalid-email').show(); // show() 메소드 추가 -> hide
            } else {
                $('#invalid-email').empty();
            }
        });

        $('#memPw').on('keyup' ,function(event) {
            if (!/^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,15}$/.test($('#memPw').val())) {
                $('#invalid-pw').html("<div class='bi bi-exclamation-circle' style='color:red'>유효한 비밀번호를 입력해 주시기 바랍니다.(영문,숫자,특수문자 8~15)</div> ");
                $('#invalid-pw').show(); // show() 메소드 추가 -> hide
            } else {
                $('#invalid-pw').empty();
            }
        });

        // 취소
        $("#cancel").on("click", function(){
            location.href = "/";
        })

        $("#submit").on("click", function(){
            if($("#memId").val()==""){
                alert("아이디를 입력해주세요.");
                $("#memId").focus();
                return false;
            }
            if($("#memPw").val()==""){
                alert("비밀번호를 입력해주세요.");
                $("#memPw").focus();
                return false;
            }
            if($("#memName").val()==""){
                alert("이름을 입력해주세요.");
                $("#memName").focus();
                return false;
            }
            if($("#phoneNum").val()==""){
                alert("전화번호를 입력해주세요.");
                $("#phoneNum").focus();
                return false;
            }
            if($("#memEmail").val()==""){
                alert("이메일을 입력해주세요.");
                $("#memEmail").focus();
                return false;
            }



        });



    })
</script>
<body>
<section id="container">
    <form action="/member/join" method="post">
        <div class="form-group has-feedback">
            <label class="control-label" for="memId">아이디</label>
            <input class="form-control" type="text" id="memId" name="memId" />
            <button class=" btn btn-danger" type="button" id="idCheck">중복검사</button>
            <div id="invalid-id"></div>
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="memPw">비밀번호</label>
            <input class="form-control" type="password" id="memPw" name="memPw" />
            <div id="invalid-pw"></div>
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="memPwCheck">비밀번호 확인</label>
            <input class="form-control" type="password" id="memPwCheck" name="memPw" />
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="memName">이름</label>
            <input class="form-control" type="text" id="memName" name="memName" />
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" >전화번호</label>
            <select name="phoneNum1" style="width:90px">
                <option value="010">010</option>
                <option value="011">011</option>
            </select>
            <input type="text" id="phoneNum2" name="phoneNum2" style="width:90px" />
            <input type="text" id="phoneNum3" name="phoneNum3" style="width:90px" />
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="memEmail">이메일</label>
            <input class="form-control" type="text" id="memEmail" name="memEmail" />
            <div id="invalid-email"></div>
        </div>
        <div class="form-group has-feedback">
            <button class="btn btn-success" type="submit" id="submit">회원가입</button>
            <button class=" btn btn-danger" type="button" id="cancel">취소</button>
        </div>
    </form>
</section>

</body>

</html>