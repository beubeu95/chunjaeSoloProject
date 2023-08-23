<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path50 = request.getContextPath();
%>
<%@ page import="java.sql.*" %>
<%@ page import="com.nicetry.db.*" %>
<%@ page import="com.nicetry.dto.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.nicetry.vo.Board" %>
<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    int bno = Integer.parseInt(request.getParameter("bno"));


    DBC conn = new MariaDBCon();
    con = conn.connect();


    int count=0;
    String sql = "UPDATE board SET cnt=cnt+1 WHERE bno=?";
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, bno);
    count = pstmt.executeUpdate();
    pstmt.close();


    sql = "select * from studentboard where bno=?";
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, bno);
    rs = pstmt.executeQuery();

    Board bd  = new Board();
    if(rs.next()){
        bd.setBno(rs.getInt("bno"));
        bd.setTitle(rs.getString("title"));
        bd.setContent(rs.getString("content"));
        bd.setAuthor(rs.getString("author"));
        bd.setCnt(rs.getInt("cnt"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d = sdf.parse(rs.getString("resdate"));
        bd.setResdate(sdf.format(d));
    }

    rs.close();
    pstmt.close();

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>학생 커뮤니티 상세보기</title>
    <%@ include file="/setting/head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path50 %>/css/google.css">
    <link rel="stylesheet" href="<%=path50 %>/css/fonts.css">
    <link rel="stylesheet" href="<%=path50 %>/css/content_header.css">
    <link rel="stylesheet" href="<%=path50 %>/css/table.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path50 %>/css/common.css">
    <link rel="stylesheet" href="<%=path50 %>/css/hd.css">
    <link rel="stylesheet" href="<%=path50 %>/css/ft.css">
    <link rel="stylesheet" href="<%=path50 %>/css/msboard.css">
</head>
<body>
<div class="container">
    <header class="hd" id="hd">
        <%@ include file="/main/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="<%=path50 %>">Home</a> &gt;  <a href="<%=path50 %>/board/BoardList.jsp"> 커뮤니티 </a> > <span> 커뮤니티 상세보기 </span> </p>
                <h2 class="page_tit"> 커뮤니티 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <table class="view_detail color">
                    <tbody>
                    <% if(sid.equals("admin") || sid.equals(bd.getAuthor())) { %>
                    <tr>
                        <td colspan="3">
                            <a href="/board/delBoard.jsp?bno=<%=bno%>&target=board" class="btn"> 삭제 </a>
                            <a href="/board/updateBoard.jsp?bno=<%=bno%>" class="btn"> 수정 </a>
                        </td>
                    </tr>
                    <% } %>
                    <tr>
                        <td class="title" colspan="2">
                            <%=bd.getTitle() %>
                        </td>
                    </tr>
                    <tr>
                        <td class="resdate">
                            작성일 | <%=bd.getResdate()%>
                        </td>
                        <td style="width:10%; text-align: right;" >
                            조회수 | <%=bd.getCnt() %>
                        </td>
                        <td style="min-width:10%; max-width: 15%; text-align: right;">
                            작성자 | <%=bd.getAuthor()%>
                        </td>
                    </tr>
                    <tr>
                        <td class="content" colspan="3">
                            <%=bd.getContent() %>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <form action="<%=path50 %>/comment/addBoardCommentPro.jsp" method="post">
                    <table class="comment_detail">
                        <tbody>
                        <tr>
                            <td class="add_comment">
                                <textarea name="content" id="content" class="input_comment" placeholder="댓글을 입력해주세요" required></textarea>
                                <input type="hidden" name="bno" id="bno" value="<%=bno %>">
                            </td>
                            <td class="sub_comment">
                                <input type="submit" class="comment_btn" value="작성">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/main/footer.jsp" %>
    </footer>
</div>
</body>
</html>