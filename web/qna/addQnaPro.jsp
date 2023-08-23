<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.nicetry.db.*" %>
<%@ include file="/setting/encoding.jsp" %>

<%

    int lev = Integer.parseInt(request.getParameter("lev"));
    int par = Integer.parseInt(request.getParameter("par"));

    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String content = request.getParameter("content");

    Connection con =null;
    PreparedStatement pstmt = null;
    DBC conn = new MariaDBCon();
    con = conn.connect();

    String sql = "insert into qna (title, author, content, lev, par) values (?, ?, ?, ?, ?)";
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, author);
    pstmt.setString(3, content);
    pstmt.setInt(4, lev);
    pstmt.setInt(5,par);

    int cnt = pstmt.executeUpdate();

    if(lev==0){
        pstmt.close();
        sql = "update qna set par=qno where par=0 and lev=0";
        pstmt = con.prepareStatement(sql);
        pstmt.executeUpdate();
        cnt++;
    }

    if(cnt==2){
        System.out.println("질문글이 등록되었습니다.");
        response.sendRedirect("/qna/qnaList.jsp");
    }else if(cnt==1){
        System.out.println("답변글이 등록되었습니다.");
        response.sendRedirect("/qna/qnaList.jsp");
    }else{
        System.out.println("질문 및 답변 등록이 실패되었습니다.");
        response.sendRedirect("/qna/addQna.jsp?lev="+lev+"&par="+par);
    }
    conn.close(pstmt, con);

%>

