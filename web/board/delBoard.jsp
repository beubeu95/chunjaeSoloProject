<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.nicetry.db.*" %>
<%@include file="../setting/encoding.jsp" %>
<%
    int bno = Integer.parseInt(request.getParameter("bno"));

    Connection con = null;
    PreparedStatement pstmt = null;

    DBC conn = new MariaDBCon();
    con = conn.connect();

    String sql = "delete from board where bno=?";
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, bno);
    int cnt = pstmt.executeUpdate();

    if(cnt>0){
        response.sendRedirect("/board/boardList.jsp");
    } else {
        response.sendRedirect("/board/getBoard.jsp?bno="+bno);
    }

    conn.close(pstmt, con);
%>