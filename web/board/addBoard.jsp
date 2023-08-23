<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 글쓰기</title>
    <%@ include file="../setting/head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../css/google.css">
    <link rel="stylesheet" href="../css/fonts.css">
    <link rel="stylesheet" href="../css/table.css">
    <link rel="stylesheet" href="../css/msboard.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/hd.css">
    <link rel="stylesheet" href="../css/content_header.css">
    <link rel="stylesheet" href="../css/ft.css">
    <style>
        .btn_group { clear:both; width:800px; margin:20px auto; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }
    </style>
</head>
<body>
<div class="container">
    <header class="hd" id="hd">
        <%@ include file="../main/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="/">HOME</a> &gt; <a href="/board/boardList.jsp">커뮤니티</a> &gt; <span>커뮤니티 글쓰기</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">커뮤니티 글쓰기</h2>
                <hr>
                <form action="addBoardPro.jsp" method="post">
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <th><label for="title">글 제목</label></th>
                            <td>
                                <input type="text" name="title" id="title" class="indata" required>
                                <input type="hidden" name="author" id="author" value="<%=sid %>">
                            </td>
                        </tr>
                        <tr>
                            <th><label for="content">글 내용</label></th>
                            <td><textarea rows="10" cols="80" name="content" id="content" class="indata2" maxlength="990" required></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" value="글쓰기" class="inbtn">
                                <input type="reset" value="취소" class="inbtn">
                            </td>
                        </tr>
                    </tbody>
                    </table>
                </form>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../main/footer.jsp" %>
    </footer>
</div>
</body>
</html>