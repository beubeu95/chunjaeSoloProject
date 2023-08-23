<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 중복 검사</title>

    <style>
        label {
            color: #8CB964;
            font-weight: 600;
        }
        input[type=text] {
            box-sizing: border-box;
            border-radius: 6px;
            background-color: #F8F8F8;
            height: 30px;
        }
        input[type=submit] {
            color: #fff;
            background-color: #8CB964;
            border-radius: 6px;
            float: right;
            margin-top: 10px;
            margin-right: 75px;
        }
    </style>
</head>
<body>
<%
    String id = request.getParameter("id");
%>
<div class="container">
    <form name="child" action="idload.jsp" method="post" onsubmit="return invalidCheck(this)">
        <label for="id">아이디</label>
        <input type="text" name="id" id="id" value="<%=id %>" placeholder="12글자 이내">
        <br>
        <input type="submit" value="아이디 중복 검사">
    </form>
    <script>
        function invalidCheck(f){
            var id = f.id.value;
            if(id.length>12){
                alert("아이디의 글자수는 12글자 이내입니다.");
                f.id.focus();
                return;
            }
        }
    </script>
</div>
</body>
</html>