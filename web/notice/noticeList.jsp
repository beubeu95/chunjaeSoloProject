<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.nicetry.db.*" %>
<%@ page import="com.nicetry.dto.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="/setting/encoding.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 공지사항 </title>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path%>/css/google.css">
    <link rel="stylesheet" href="../css/fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/hd.css">
    <link rel="stylesheet" href="../css/content_header.css">
    <link rel="stylesheet" href="../css/table.css">
    <link rel="stylesheet" href="../css/msboard.css">
    <link rel="stylesheet" href="../css/ft.css">
    <style>
        .btn_group { clear:both; width:800px; margin:20px auto; }

        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #8CB964; color:#fff; font-size: 18px; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }
    </style>
    <%
        response.setHeader("Cache-Control", "no-cache");
        response.addHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 1L);

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        DBC con = new MariaDBCon();
        conn = con.connect();


        String sql = "SELECT * FROM notice ORDER BY no DESC";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        List<Notice> noticeList = new ArrayList<>();
        while(rs.next()) {
            Notice n = new Notice();
            n.setNo(rs.getInt("No"));
            n.setTitle(rs.getString("title"));
            n.setAuthor(rs.getString("author"));
            n.setCnt(rs.getInt("cnt"));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date d = sdf.parse(rs.getString("resdate"));
            n.setResdate(sdf.format(d));
            noticeList.add(n);
        }
        con.close(rs, pstmt, conn);
    %>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="/main/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="<%=path %>/">Home</a> &gt; <a href="<%=path %>">고객지원</a> &gt; <span> 공지사항 </span> </p>
                <h2 class="page_tit"> 고객지원 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <p class="content_tit"> 공지사항 </p>
                <hr>
                <div class="board_list_wrap">
                    <div class="board_list">
                        <div class="top">
                            <div class="bno" style="padding-right: 200px"> 글번호 </div>
                            <div class="Title" style="padding-right: 120px"> 제목 </div>
                            <div style="width: 15%; padding-left: 150px"> 작성자 </div>
                            <div style="width: 5%; padding-left: 20px"> 조회수 </div>
                            <div style="width : 10%; padding-left:40px;"> 작성일 </div>
                        </div>
                        <% for(Notice n: noticeList) { %>
                        <div>
                            <div class="bno"> <%=n.getNo()%> </div>
                            <% if(sid!=null) { %>
                            <div class="qTitle"> <a href="/notice/getNotice.jsp?no=<%=n.getNo() %>"><%=n.getTitle() %></a> </div>
                            <% } else { %>
                            <div class="qTitle"><%=n.getTitle() %></div>
                            <% } %>
                            <div style="width: 22%; padding-left:15px;"> <%=n.getAuthor()%> </div>
                            <div class="cnt"> <%=n.getCnt()%> </div>
                            <div style="padding-left: 80px;"> <%=n.getResdate()%> </div>
                        </div>
                        <% } %>
                    </div>
                    <div class="btn_group" style="margin:0; width:1000px; padding-top:25px; ">
                        <% if(sid!=null && sid.equals("admin")) { %>
                        <a href="/notice/addNotice.jsp" class="inbtn" style="float:right; ">글쓰기</a>
                        <% } else { %>
                        <p>관리자만 공지사항의 글을 쓸 수 있습니다.<br>
                            로그인한 사용자만 글의 상세내용을 볼 수 있습니다.</p>
                        <% } %>
                    </div>
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