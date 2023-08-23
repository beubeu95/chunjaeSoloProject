<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.nicetry.dto.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.nicetry.db.*" %>
<%@ page import="com.nicetry.vo.Board" %>
<%@ include file="/setting/encoding.jsp"%>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    String sql = "SELECT * FROM notice ORDER BY no DESC LIMIT 0, 5";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    List<Notice> noticeList = new ArrayList<>();
    while(rs.next()) {
        Notice n = new Notice();
        n.setNo(rs.getInt("no"));
        n.setTitle(rs.getString("title"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d = sdf.parse(rs.getString("resdate"));
        n.setResdate(sdf.format(d));
        noticeList.add(n);
    }
    rs.close();
    pstmt.close();

    sql = "SELECT * FROM board ORDER BY cnt DESC, bno DESC LIMIT 0, 5";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    List<Board> boardList = new ArrayList<>();
    while(rs.next()) {
        Board b = new Board();
        b.setBno(rs.getInt("bno"));
        b.setTitle(rs.getString("title"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d = sdf.parse(rs.getString("resdate"));
        b.setResdate(sdf.format(d));
        boardList.add(b);
    }
    con.close(rs, pstmt, conn);
%>

<section class="page" id="page3">
    <div class="board_lst">
        <div class="board_wrap">
            <!--공지사항 게시판(공지사항, 더보기(공지사항 연결링크), 글목록 )-->
            <div class="board">
                <div class="board_title">
                    <h2 class="notice_title">공지사항</h2>
                    <a href="/notice/noticeList.jsp?page=1" class="notice_more" >더보기 + </a>
                </div>
                <ul class="lst">
                    <%  int i = 1;
                        for(Notice n : noticeList) { %>
                    <li class="lst_group">
                        <% if(sid == null) {%>
                        <a href="javascript:alert('로그인 후 다시 시도해주세요.')" class="board_subject<%=i%>"><%=n.getTitle()%></a>
                        <% } else { %>
                        <a href="/notice/getNotice.jsp?no=<%=n.getNo()%>" class="board_subject<%=i%>"><%=n.getTitle()%></a>
                        <% } %>
                        <div class="board_date"><%=n.getResdate()%></div>
                    </li>
                    <%  i++;
                    }
                    %>
                </ul>
            </div>

            <!--이벤트 게시판(이벤트, 더보기(커뮤니티 연결링크), 글목록 )-->
            <div class="board">
                <div class="board_title">
                    <h2 class="events_title"> 커뮤니티 인기 글 </h2>
                    <a href="/board/boardList.jsp" class="notice_more">더보기 + </a>
                </div>
                <ul class="lst">
                    <% for(Board b : boardList) { %>
                    <li class="lst_group">
                        <% if(sid == null) {%>
                        <a href="javascript:alert('로그인 후 다시 시도해주세요.')" class="board_subject"><%=b.getTitle()%></a>
                        <% } else { %>
                        <a href="/board/getBoard.jsp?bno=<%=b.getBno()%>" class="event_subject"><%=b.getTitle()%></a>
                        <% } %>
                        <div class="board_date"><%=b.getResdate()%></div>
                    </li>
                    <% } %>
                </ul>
            </div>
        </div>

    </div>
</section>