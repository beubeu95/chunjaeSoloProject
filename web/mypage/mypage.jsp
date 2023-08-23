<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.nicetry.db.*" %>
<%@ page import="com.nicetry.dto.*" %>
<%@ include file="/setting/encoding.jsp" %>
<%
    String path5 = request.getContextPath();
%>
<%
    String id = (String) session.getAttribute("id");


    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC conn = new MariaDBCon();
    con = conn.connect();

    Member m = new Member();
    String sql = "select * from member where id=? ";
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, id);
    rs = pstmt.executeQuery();
    if(rs.next()){
        m.setId(rs.getString("id"));
        m.setPw(rs.getString("pw"));
        m.setName(rs.getString("name"));
        m.setEmail(rs.getString("email"));
        m.setTel(rs.getString("tel"));
        m.setResdate(rs.getString("resdate"));
        m.setPoint(rs.getInt("point"));

    }else{
        response.sendRedirect("/member/login.jsp");
    }
    conn.close(rs, pstmt, con);

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <%@ include file="/setting/encoding.jsp" %>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path5%>/css/google.css">
    <link rel="stylesheet" href="<%=path5%>/css/fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path5%>/css/common.css">
    <link rel="stylesheet" href="<%=path5%>/css/hd.css">
    <link rel="stylesheet" href="../css/content_header.css">
    <style>
        .item_wrap { width: 100%; }
        .item_wrap .item {display: block;float: left;margin: 15px;padding: 15px;box-sizing: border-box;width: 300px;height: 270px;
            border: 1px solid #333;text-decoration: none;text-align: center;color: #333;font-size: 20px;transition: 0.3s;}
        .item_wrap .item:hover {box-shadow: 5px 5px 0px #ddd;}
        .item_wrap .item img {width: 100%;height: auto;margin-bottom: 30px;}
    </style>

    <link rel="stylesheet" href="<%=path5%>/css/ft.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="/main/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="/">Home</a> &gt; <span> 마이페이지 </span> </p>
                <h2 class="page_tit"> 마이페이지 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <p class="content_tit"> 안녕하세요, <%=m.getName() %>님! </p>
                <hr>
                <div class="item_wrap">
                    <a href="/mypage/modify.jsp" class="item"><img src="/images/mypage_info.jpg" alt="개인정보 변경 이미지"><br> 개인정보 변경 </a>
                    <a href="/mypage/myBoardListQna.jsp" class="item"><img src="/images/mypage_write.jpg" alt="내가쓴 글 이미지"><br> 내가 쓴 글 </a>
                </div>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/main/footer.jsp" %>
    </footer>
</div>
</body>
</html>