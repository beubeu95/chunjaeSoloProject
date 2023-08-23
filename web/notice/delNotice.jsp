<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 sql, db 패키지 임포트 --%>
<%@ page import="java.sql.*" %>
<%@ page import="com.nicetry.db.*" %>
<%@include file="../setting/encoding.jsp" %>
<%
    int no = Integer.parseInt(request.getParameter("no"));

    Connection con = null;
    PreparedStatement pstmt = null;

    DBC conn = new MariaDBCon();
    con = conn.connect();

    String sql = "delete from notice where no=?";
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, no);
    int cnt = pstmt.executeUpdate();

    if(cnt>0){
        response.sendRedirect("/notice/noticeList.jsp");
    } else {
        response.sendRedirect("/notice/getNotice.jsp?no="+no);
    }

    conn.close(pstmt, con);
%>