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

    String path21 = request.getContextPath();
%>
<%
    String id = (String) session.getAttribute("id");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();


    String sql = "select * from boardlist where id=? ORDER BY resdate desc ";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);

    rs = pstmt.executeQuery();

    List<Board> boardList = new ArrayList();
    while(rs.next()){
        Board b = new Board();
        b.setBno(rs.getInt("bno"));
        b.setTitle(rs.getString("title"));
        b.setContent(rs.getString("content"));
        b.setAuthor(rs.getString("author"));
        b.setId(rs.getString("id"));
        b.setResdate(rs.getString("resdate"));
        b.setCnt(rs.getInt("cnt"));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d = sdf.parse(rs.getString("resdate"));
        b.setResdate(sdf.format(d));

        boardList.add(b);
    }
    con.close(rs, pstmt, conn);

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내가쓴글-comunity</title>

    <%@ include file="/setting/encoding.jsp" %>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path21 %>/css/google.css">
    <link rel="stylesheet" href="<%=path21 %>/css/fonts.css">
    <link rel="stylesheet" href="<%=path21 %>/css/content_header.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path21 %>/css/common.css">
    <link rel="stylesheet" href="<%=path21 %>/css/hd.css">
    <link rel="stylesheet" href="<%=path21 %>/css/msboard.css">
    <link rel="stylesheet" href="<%=path21 %>/css/table.css">

    <style>
        .box_myboard { display : block; margin-bottom: 20px; text-align :center;}
        .btn_myboard {padding-right : 20px; padding-left :20px;  background-color: gray; color:#fff;
            border-radius:100px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            line-height:50px; font-size:15px; text-align: center;}
        #btn_mb1 {background-color: yellowgreen;}
    </style>

    <link rel="stylesheet" href="<%=path21 %>/css/ft.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="/main/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="/">Home</a> &gt; <a href="/mypage/mypage.jsp">마이페이지</a> &gt; <span> 내가 쓴 글 </span> </p>
                <h2 class="page_tit"> 내가 쓴 글 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <p class="content_tit">
                    <a href="/mypage/myBoardListQna.jsp?page=1" class="btn_myboard">QnA </a> &nbsp&nbsp | &nbsp&nbsp
                    <a href="/mypage/myBoardList.jsp?page=1" class="btn_myboard" id="btn_mb1">커뮤니티</a>
                </p>
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
                        <%
                            for(Board b: boardList){
                        %>
                        <div>
                            <div class="bno"><%=b.getBno() %></div>
                            <div class="qTitle">
                                <a href="<%=path21 %>/board/getBoard.jsp?bno=<%=b.getBno()%>"><%=b.getTitle() %></a>
                            </div>
                            <div style="width: 22%"><%=b.getId() %></div>
                            <div class="cnt"> <%=b.getCnt()%> </div>
                            <div style="padding-left: 80px;"><%=b.getResdate() %></div>
                        </div>
                        <%} %>
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