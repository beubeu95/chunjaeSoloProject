<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.nicetry.db.*" %>
<%@ page import="com.nicetry.vo.*" %>
<%@ include file="/setting/encoding.jsp" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.addHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 1L);

    String path45 = request.getContextPath();
%>
<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC conn = new MariaDBCon();
    con = conn.connect();

    String sql = "select * from board order by bno desc";
    pstmt = con.prepareStatement(sql);
    rs = pstmt.executeQuery();

    List<Board> boardList = new ArrayList<>();
    while(rs.next()){
        Board bd = new Board();
        bd.setBno(rs.getInt("bno"));
        bd.setTitle(rs.getString("title"));
        bd.setContent(rs.getString("content"));
        bd.setAuthor(rs.getString("author"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d = sdf.parse(rs.getString("resdate"));
        bd.setResdate(sdf.format(d));
        bd.setCnt(rs.getInt("cnt"));
        boardList.add(bd);
    }
    conn.close(rs, pstmt, con);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 목록</title>
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
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
    </style>

    <link rel="stylesheet" href="../css/ft.css">
</head>
<body>
<div class="container">
    <header class="hd" id="hd">
        <%@ include file="../main/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="<%=path45 %>">Home</a> &gt; <span> 커뮤니티 </span> </p>
                <h2 class="page_tit"> 커뮤니티  </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <p class="content_tit"> 커뮤니티 </p>
                <hr>
                <div class="board_list_wrap">
                    <div class="board_list">
                        <div class="top">
                            <div class="bno" style="padding-right: 200px"> 글번호 </div>
                            <div class="Title" style="padding-right: 120px"> 제목 </div>
                            <div style="width: 12%; padding-left: 150px"> 작성자 </div>
                            <div style="width: 5%; padding-left: 30px"> 조회수 </div>
                            <div style="width : 13%; padding-left:40px;"> 작성일 </div>
                        </div>
                        <% for(Board bd: boardList) { %>
                        <div>
                            <div class="bno"> <%=bd.getBno()%> </div>
                            <% if(sid!=null) { %>
                            <div class="qTitle"> <a href="<%=path45%>/board/getBoard.jsp?bno=<%=bd.getBno() %>"><%=bd.getTitle() %></a> </div>
                            <% } else { %>
                            <div class="qTitle"><%=bd.getTitle() %></div>
                            <% } %>
                            <div style="width: 22%"> <%=bd.getAuthor()%> </div>
                            <div class="cnt"> <%=bd.getCnt()%> </div>
                            <div style="padding-left: 80px;"> <%=bd.getResdate()%> </div>
                        </div>
                        <% } %>
                    </div>
                    <div class="btn_group" style="margin:0; width:1000px; padding-top:25px; ">
                        <% if(sid!=null) { %>
                        <a href="/board/addBoard.jsp" class="inbtn" style="float:right; ">글쓰기</a>
                        <% } else { %>
                        <p>로그인한 사용자만 글을 작성할 수 있습니다.</p>
                        <% } %>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../main/footer.jsp" %>
    </footer>
</div>
</body>
</html>