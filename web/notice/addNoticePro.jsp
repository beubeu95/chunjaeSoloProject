<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.nicetry.db.*" %>
<%@ include file="../setting/encoding.jsp" %>
<%
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String content = request.getParameter("content");

    Connection conn = null;
    PreparedStatement pstmt = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "insert into Notice(title, content, author) values (?, ?, ?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setString(3, author);

    int cnt = pstmt.executeUpdate();
    String script = "<script>";
    script += "history.go(-1);";
    script += "</script>";
    if(cnt>0){
        response.sendRedirect("NoticeList.jsp");
    } else {
        //response.sendRedirect("addNotice.jsp");
        out.println(script);
    }
    con.close(pstmt, conn);
%>
