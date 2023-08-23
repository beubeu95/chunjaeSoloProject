<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 sql, db 패키지 임포트 --%>
<%@ page import="java.sql.*" %>
<%@ page import="com.nicetry.db.*" %>
<%@ include file="../setting/encoding.jsp" %>
<%
    int bno = Integer.parseInt(request.getParameter("bno"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Connection conn = null;
    PreparedStatement pstmt = null;


    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "update board set title=?, content=? where bno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setInt(3, bno);
    int cnt = pstmt.executeUpdate();

    if(cnt>0){
        response.sendRedirect("/board/boardList.jsp");
    } else {
        response.sendRedirect("/board/updateBoard.jsp?bno="+bno);
    }
    con.close(pstmt, conn);
%>