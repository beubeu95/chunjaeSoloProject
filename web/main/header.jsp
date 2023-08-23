<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String sid = (String) session.getAttribute("id");

    String path81 = request.getContextPath();
%>
<div class="hd_wrap">
    <div class="logo_box">
    <a href="<%=path81 %>" class="logo">
        <img src="<%=path81 %>/images/NTlogo_main.png" alt="NTedu 로고타입" style="width:50px; height:50px;">
    </a>
    </div>
    <div class="gnb">
        <ul class="menu">
            <li class="item1">
                <a href="company.html" class="dp1">회사소개</a>
                <ul class="sub">
                    <li><a href="company.html#com">회사개요</a></li>
                    <li><a href="company.html#greet">인사말</a></li>
                    <li><a href="/intro/map.jsp">오시는길</a></li>
                </ul>
            </li>
            <li class="item2">
                <a href="biz.html" class="dp1">학습지</a>
                <ul class="sub">
                    <li><a href="biz.html#text">영어</a></li>
                    <li><a href="biz.html#ref">중국어</a></li>
                    <li><a href="biz.html#smart">일본어</a></li>
                    <li><a href="biz.html#edu">스페인어</a></li>
                </ul>
            </li>
            <li class="item3">
                <a href="social.html" class="dp1">강의</a>
                <ul class="sub">
                    <li><a href="social.html#serve">영어</a></li>
                    <li><a href="social.html#support">중국어</a></li>
                    <li><a href="social.html#academy">일본어</a></li>
                    <li><a href="social.html#school">스페인어</a></li>
                </ul>
            </li>
            <li class="item4">
                <a href="/notice/noticeList.jsp" class="dp1">고객지원</a>
                <ul class="sub">
                    <li><a href="/notice/noticeList.jsp">공지사항</a></li>
                    <li><a href="/qna/qnaList.jsp">QnA</a></li>
                    <li><a href="/faq/faqList.jsp">FAQ</a></li>
                </ul>
            </li>
            <li class="item5">
                <a href="/board/boardList.jsp" class="dp1">커뮤니티</a>
                <ul class="sub">
                    <li><a href="/board/boardList.jsp">커뮤니티</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="tnb">
        <ul class="menu">
            <% if(sid!=null && sid.equals("admin")) { %>
            <li><a href="<%=path81 %>/member/logout.jsp">로그아웃 | </a></li>
            <li><a href="<%=path81 %>/mypage/mypage.jsp">ADMIN</a></li>
            <% }else if(sid!=null) { %>
            <li><a href="<%=path81 %>/member/logout.jsp">로그아웃 | </a></li>
            <li><a href="<%=path81 %>/admin/index.jsp">ADMIN</a></li>
            <% }else { %>
            <li><a href="<%=path81 %>/member/login.jsp">로그인 &nbsp; | &nbsp; </a></li>
            <li><a href="<%=path81 %>/member/term.jsp">회원가입</a></li>
            <% } %>
        </ul>
    </div>
</div>
