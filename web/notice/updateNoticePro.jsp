<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.nicetry.db.*" %>
<%@ include file="../setting/encoding.jsp" %>
<%
    int no = Integer.parseInt(request.getParameter("no"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Connection conn = null;
    PreparedStatement pstmt = null;


    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "update board set title=?, content=? where no=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setInt(3, no);
    int cnt = pstmt.executeUpdate();

    if(cnt>0){
        response.sendRedirect("/notice/noticeList.jsp");
    } else {
        response.sendRedirect("/notice/updateNotice.jsp?no="+no);
    }
    con.close(pstmt, conn);
%>