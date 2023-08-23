<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 불러오기 --%>
<%@ page import="java.sql.*" %>
<%@ page import="com.nicetry.db.*" %>
<%@ page import="com.nicetry.vo.*" %>
<%@ page import="com.nicetry.vo.Qna" %>
<%-- 2. 인코딩 및 보내온 데이터 받기 --%>
<%@ include file="/setting/encoding.jsp" %>
<%
    int qno = Integer.parseInt(request.getParameter("qno"));

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    int count=0;
    String sql = "UPDATE qna SET cnt=cnt+1 WHERE qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);
    count = pstmt.executeUpdate();
    pstmt.close();

    sql = "SELECT * FROM qnalist WHERE qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);

    rs = pstmt.executeQuery();
    Qna qna = new Qna();
    if(rs.next()){
        qna.setQno(rs.getInt("qno"));
        qna.setTitle(rs.getString("title"));
        qna.setContent(rs.getString("content"));
        qna.setAuthor(rs.getString("author"));
        qna.setResdate(rs.getString("resdate"));
        qna.setCnt(rs.getInt("cnt"));
        qna.setName(rs.getString("name"));
        qna.setLev(rs.getInt("lev"));
        qna.setPar(rs.getInt("par"));
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문 및 답변 글 상세보기</title>
    <%@ include file="../setting/head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../css/google.css">
    <link rel="stylesheet" href="../css/fonts.css">
    <link rel="stylesheet" href="../css/content_header.css">
    <link rel="stylesheet" href="../css/table.css">
    <link rel="stylesheet" href="../css/msboard.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/hd.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
            background-image: url("../images/bg_visual_overview.jpg");
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

        .tb1 { width:800px; margin:50px auto; }
        .tb1 th { line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:deepskyblue; color:#fff; }
        .tb1 td {line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }

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
        <%@ include file="../main/header.jsp"%>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="/">HOME</a> &gt; <a href="/qna/qnaList.jsp">질문 및 답변</a> &gt; <span>질문 및 답변 글 상세보기</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">질문 및 답변 글 상세보기</h2>
                <br><br><hr><br><br>
                <table class="tb1" id="myTable">
                    <tbody>
                    <tr>
                        <th>유형</th>
                        <td>
                            <% if(qna.getLev()==0) { %>
                            <span>질문</span>
                            <% } else { %>
                            <span>답변</span>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <th>글 제목</th>
                        <td><%=qna.getTitle() %></td>
                    </tr>
                    <tr>
                        <th>글 내용</th>
                        <td><%=qna.getContent() %></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>
                            <% if(sid!=null && sid.equals("admin")) { %>
                            <span title="<%=qna.getAuthor()%>"><%=qna.getName() %></span>
                            <% } else { %>
                            <span><%=qna.getName() %></span>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <th>작성일시</th>
                        <td><%=qna.getResdate() %></td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td><%=qna.getCnt() %></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <% if(qna.getLev()==0) { %>
                                <% if(sid!=null) { %>
                                    <a href="/qna/addQuestion.jsp?lev=1&par=<%=qna.getQno() %>" class="inbtn">답변하기</a>
                                <% } %>
                                <% if(sid!=null && (sid.equals("admin") || sid.equals(qna.getAuthor()))) { %>
                                    <a href="/qna/updateQna.jsp?qno=<%=qna.getQno() %>" class="inbtn">질문 수정하기</a>
                                    <a href="/qna/delQna.jsp?qno=<%=qna.getQno() %>&lev=0" class="inbtn">질문 삭제하기</a>
                                <% } %>
                            <% } else { %>
                                <% if(sid!=null && (sid.equals("admin") || sid.equals(qna.getAuthor()))) { %>
                                    <a href="/qna/updateQna.jsp?qno=<%=qna.getQno() %>" class="inbtn">답변 수정하기</a>
                                    <a href="/qna/delQna.jsp?qno=<%=qna.getQno() %>&lev=1" class="inbtn">답변 삭제하기</a>
                                <% } %>
                            <% } %>
                            <a href="/qna/qnaList.jsp" class="inbtn">목록</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../main/footer.jsp"%>
    </footer>
</div>
</body>
</html>