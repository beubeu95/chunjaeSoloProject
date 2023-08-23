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
    <title> 회원 관리 </title>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path%>/css/google.css">
    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path%>/css/common.css">
    <link rel="stylesheet" href="<%=path%>/css/hd.css">
    <link rel="stylesheet" href="<%=path%>/css/content_header.css">
    <link rel="stylesheet" href="<%=path%>/css/table.css">
    <link rel="stylesheet" href="<%=path%>/css/ft.css">

    <style>
        .contents {
            clear:both;
            min-height:100vh;
        }
        .contents::after {
            content:"";
            clear:both;
            display:block;
            width:100%;
        }

        .page {
            clear:both;
            width: 100%;
            min-height: 100vh;
            position:relative;
            top: 50px;
            margin: 0px auto;
        }
        .page::after {
            content:"";
            display:block;
            width: 100%;
            clear:both;
        }

        .page_wrap {
            clear:both;
            width: 1000px;
            height: auto;
            margin:0 auto;
        }

        .content_tit {
            font-weight: bold;
            font-size: 25px;
            margin: 80px 30px 30px 10px;
        }
    </style>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "SELECT * FROM member WHERE id !='admin' ORDER BY resdate desc";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    List<Member> memberList = new ArrayList<>();
    while(rs.next()) {
        Member member = new Member();
        member.setId(rs.getString("id"));
        member.setName(rs.getString("name"));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d = sdf.parse(rs.getString("resdate"));
        member.setResdate(sdf.format(d));
        memberList.add(member);
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
                    <p><a href="<%=path %>">Home</a> &gt; <a href="<%=path %>/admin/adminPage.jsp">관리자 페이지</a> &gt; <span> 회원 관리 </span> </p>
                    <h2 class="page_tit"> 관리자 페이지 </h2>
                </div>
            </div>
            <section class="page" id="page1">
                <div class="page_wrap">
                    <p class="content_tit"> 회원 관리 </p>
                    <hr>
                    <div class="board_list_wrap">
                        <div class="board_list">
                            <div class="top">
                                <div class="id"> 회원 아이디 </div>
                                <div class="name"> 이름 </div>
                                <div class="date"> 가입일 </div>
                                <div class="kick"> 강퇴 </div>
                            </div>
                            <% for(Member member : memberList) { %>
                                <div>
                                    <div class="id"> <%=member.getId()%> </div>
                                    <div class="name"> <%=member.getName()%> </div>
                                    <div class="date"> <%=member.getResdate()%> </div>
                                    <div class="kick"><button onclick="javascript:location.href='<%=path%>/admin/kickpro.jsp?id=<%=member.getId()%>&pageNo=<%=pageNo%>'">강퇴</button></div>
                                </div>
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
