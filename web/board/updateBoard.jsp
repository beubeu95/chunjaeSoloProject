<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 가져오기 --%>
<%@ page import="java.sql.*" %>
<%@ page import="com.nicetry.db.*" %>
<%@ page import="com.nicetry.dto.*" %>
<%@ page import="com.nicetry.vo.Board" %>
<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    int bno = Integer.parseInt(request.getParameter("bno"));

    DBC conn = new MariaDBCon();
    con = conn.connect();

    String sql = "select * from board where bno=?";
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, bno);
    rs = pstmt.executeQuery();

    Board bd  = new Board();
    if(rs.next()){
        bd.setBno(rs.getInt("bno"));
        bd.setTitle(rs.getString("title"));
        bd.setContent(rs.getString("content"));
        bd.setAuthor(rs.getString("author"));
        bd.setResdate(rs.getString("resdate"));
        bd.setCnt(rs.getInt("cnt"));
    }
    conn.close(rs, pstmt, con);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티글 수정하기</title>

    <%@ include file="../setting/head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../css/google.css">
    <link rel="stylesheet" href="../css/fonts.css">
    <link rel="stylesheet" href="../css/table.css">
    <link rel="stylesheet" href="../css/msboard.css">
    <link rel="stylesheet" href="../css/content_header.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/hd.css">
    <link rel="stylesheet" href="../css/ft.css">
</head>
<body>
<div class="container">
    <header class="hd" id="hd">
        <%@ include file="../main/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="/">HOME</a> &gt; <a href="/board/boardList.jsp">커뮤니티</a> &gt; <span>커뮤니티글 수정하기</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">커뮤니티글 수정하기</h2>
                <hr>
                <form action="updateBoardPro.jsp" method="post">
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <th>글 번호</th>
                            <td><input type="text" name="bno" id="bno" class="indata" value="<%=bd.getBno() %>" readonly></td>
                        </tr>
                        <tr>
                            <th>글 제목</th>
                            <td><input type="text" name="title" id="title" class="indata" value="<%=bd.getTitle() %>" required></td>
                        </tr>
                        <tr>
                            <th>글 내용</th>
                            <td><textarea rows="10" cols="80" name="content" id="content" class="indata2"><%=bd.getContent() %></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <a href="/board/boardList.jsp" class="inbtn">글 목록</a>
                                <% if(sid.equals("admin") || sid.equals(bd.getAuthor())) { %>
                                <input type="submit" value="글수정" class="inbtn">
                                <a href="/board/delBoard.jsp?bno=<%=bd.getBno() %>" class="inbtn">글 삭제</a>
                                <% } %>
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