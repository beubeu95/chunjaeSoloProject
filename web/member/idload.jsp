<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.nicetry.db.*" %>

<%

    String id = request.getParameter("id");

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC conn = new MariaDBCon();
    con = conn.connect();
    if(con != null){
        System.out.println("DB 연결 성공");
    }
    try {
        String sql = "select * from member where id=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();

        if(rs.next()){
            out.println("<p>사용 불가능한 아이디입니다.</p>");
            out.println("<a href='idcheck.jsp?id="+id+"'>아이디 중복 재시도</a>");
        } else {
            out.println("<p>사용 가능한 아이디입니다.</p>");
            out.println("<button type='button' onclick='fnc1(\""+id+"\")'>사용하기</button>");
        }
    } catch(SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
        conn.close(rs, pstmt, con);
    }
%>
<script>
    function fnc1(cid){
        opener.document.frm1.id.value = cid;
        opener.document.frm1.idck2.value = "yes";
        window.close();
    }
</script>
