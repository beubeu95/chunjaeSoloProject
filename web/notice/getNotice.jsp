<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.nicetry.db.*" %>
<%@ page import="com.nicetry.dto.*" %>
<%@ page import="com.nicetry.vo.*" %>
<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    int no = Integer.parseInt(request.getParameter("no"));

    DBC conn = new MariaDBCon();
    con = conn.connect();

    int count=0;
    String sql = "UPDATE notice SET cnt=cnt+1 WHERE no=?";
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, no);
    count = pstmt.executeUpdate();
    pstmt.close();

    sql = "select * from notice where no=?";
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, no);
    rs = pstmt.executeQuery();

    Notice n  = new Notice();
    if(rs.next()){
        n.setNo(rs.getInt("no"));
        n.setTitle(rs.getString("title"));
        n.setContent(rs.getString("content"));
        n.setAuthor(rs.getString("author"));
        n.setResdate(rs.getString("resdate"));
        n.setCnt(rs.getInt("cnt"));
    }
    conn.close(rs, pstmt, con);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 글 상세보기</title>

    <%@ include file="../setting/head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../css/google.css">
    <link rel="stylesheet" href="../css/fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/hd.css">
    <link rel="stylesheet" href="../css/content_header.css">
    <link rel="stylesheet" href="../css/table.css">
    <link rel="stylesheet" href="../css/msboard.css">
    <style>
        .indata { display:inline-block; width:300px; height: 48px; line-height: 48px;
            text-indent:14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min-width:100px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px;
            float:left; margin-right: 20px; }
        .inbtn:last-child { float:right; }
    </style>

    <link rel="stylesheet" href="../css/ft.css">
    <style>

    </style>
</head>
<body>
<div class="container">
    <header class="hd" id="hd">
        <%@ include file="../main/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="/">HOME</a> &gt; <a href="/notice/noticeList.jsp">공지사항</a> &gt; <span>공지사항 상세보기</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">공지사항 상세보기</h2>
                <hr>
                <table class="tb1">
                    <tbody>
                    <tr>
                        <th>글 번호</th>
                        <td><%=n.getNo() %></td>
                    </tr>
                    <tr>
                        <th>글 제목</th>
                        <td><%=n.getTitle() %></td>
                    </tr>
                    <tr>
                        <th>글 내용</th>
                        <td><%=n.getContent() %></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td><%=n.getAuthor() %></td>
                    </tr>
                    <tr>
                        <th>작성일시</th>
                        <td><%=n.getResdate() %></td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td><%=n.getCnt() %></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <a href="/notice/noticeList.jsp" class="inbtn">글 목록</a>
                            <% if(sid.equals("admin")) { %>
                            <a href="/notice/updateNotice.jsp?no=<%=n.getNo() %>" class="inbtn">글 수정</a>
                            <a href="/notice/delNotice.jsp?no=<%=n.getNo() %>" class="inbtn">글 삭제</a>
                            <% } %>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../main/footer.jsp" %>
    </footer>
</div>
</body>
</html>