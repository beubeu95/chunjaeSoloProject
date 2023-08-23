<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path30 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path30 %>/css/google.css">
    <link rel="stylesheet" href="<%=path30 %>/css/fonts.css">


    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="./jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="<%=path30 %>/css/common.css">
    <link rel="stylesheet" href="<%=path30 %>/css/hd.css">
    <link rel="stylesheet" href="<%=path30 %>/css/ft.css">
    <link rel="stylesheet" href="<%=path30 %>/css/join.css">
    <link rel="stylesheet" href="<%=path30 %>/css/content_header.css">
    <style>
    .btn_group { clear:both; width:800px; margin:20px auto; }
    .btn_group:after { content:""; display:block; width:100%; clear: both; }
    .btn_group p {text-align: center;   line-height:3.6; }
    </style>
    </head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="/main/header.jsp" %>
    </header>
        <div class="contents" id="contents">
            <div class="content_header">
                <div class="breadcrumb">
                    <p><a href="/">Home</a> &gt; <span> 회원 가입 </span> </p>
                    <h2 class="page_tit"> 회원 가입 </h2>
                </div>
            </div>
            <section class="page" id="page1">
                <div class="join_wrapper">
                    <form name="frm1" action="/member/joinpro.jsp" method="post" onsubmit="return inform(this)">
                        <table class="tb1">
                            <tbody>
                            <tr>
                                <th><label for="id">아이디</label></th>
                                <td>
                                    <input type="text" name="id" id="id" placeholder="영문소문자 및 숫자를 혼용하여 아이디 입력" class="form-control" pattern="^[a-z0-9]{8,16}" maxlength="16" autofocus required />
                                    <input type="button" id="idck" class="inbtn" value="아이디 중복 확인" onclick="idCheck()">
                                    <input type="hidden" name="idck2" id="idck2" value="no">
                                </td>
                            </tr>
                            <tr>
                                <th><label for="pw">비밀번호</label></th>
                                <td>
                                    <input type="password" name="pw" id="pw" placeholder="비밀번호 입력" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required />
                                    <p>비밀번호는 최소 8자리에서 최대 16자리까지 숫자, 영문, 특수문자 각 1개 이상 포함되어야 함</p>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="pw2">비밀번호 확인</label></th>
                                <td><input type="password" name="pw2" id="pw2" placeholder="비밀번호  확인 입력" class="form-control" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required /></td>
                            </tr>
                            <tr>
                                <th><label for="name">이름</label></th>
                                <td><input type="text" name="name" id="name" placeholder="이름 입력" class="form-control" required /></td>
                            </tr>
                            <tr>
                                <th><label for="email">이메일</label></th>
                                <td><input type="email" name="email" id="email" placeholder="이메일 입력" class="form-control" required></td>
                            </tr>
                            <tr>
                                <th><label for="tel">연락처</label></th>
                                <td><input type="tel" name="tel" id="tel" maxlength="11" class="form-control" required></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="btn-group">
                                    <input type="submit" name="submit" class="btn2" value="회원가입">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                    <script>
                        function inform(frm){
                            var idck2 = frm.idck2;
                            if(idck2 !="yes"){
                                alert("아이디 중복 검사를 진행하시기 바랍니다.");
                                frm.id.focus();
                                return;
                            }
                            var pw = frm.pw.value;
                            var pw2 = frm.pw2.value;
                            if(pw!=pw2){
                                alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                                pw.focus();
                                return;
                            }

                            if(pw.length < 8 || pw.length > 20){
                                alert("8자리 ~ 20자리 이내로 입력해주세요.");
                                return false;
                            }else if(pw.search(/\s/) != -1){
                                alert("비밀번호는 공백 없이 입력해주세요.");
                                return false;
                            }else if(num < 0 || eng < 0 || spe < 0 ){
                                alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
                                return false;
                            }else {
                                return true;
                            }
                        }
                        function idcheck(){
                            var child;
                            var id = document.getElementById("id");
                            if(id.value!=""){
                                child = window.open("idcheck.jsp?id="+id.value,"child");
                                return;
                            }else{
                                alert("아이디 입력란에 아이디를 입력하고, 진행하시기 바랍니다.");
                            }
                        }
                    </script>
                </div>
            </section>
        </div>
    <footer class="ft" id="ft">
        <%@ include file="/main/footer.jsp" %>
    </footer>
</div>
</body>
</html>