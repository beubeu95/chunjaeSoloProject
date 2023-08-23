<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.nicetry.db.*" %>
<%@ include file="/setting/encoding.jsp" %>

<%
    String id = request.getParameter("id");
    String tel = request.getParameter("tel");
    String email = request.getParameter("email");

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC conn = new MariaDBCon();
    con = conn.connect();
    if(con != null){
        System.out.println("DB 연결 성공");
    }

    int cnt =0;
    try{
        String sql = "update member set email=?, tel=? where id=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, email);
        pstmt.setString(2, tel);
        pstmt.setString(3, id);
        cnt = pstmt.executeUpdate();
        if(cnt >0){
            response.sendRedirect("/");
        }else{
            response.sendRedirect("/mypage/modify.jsp");
        }
    } catch (SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
      conn.close(rs, pstmt, con);
    }

%>