<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path13 = request.getContextPath();
%>
<section class="page" id="page1">
    <div class="page_wrap" id="page_wrap1">
        <ul class="pic_lst">
            <li class="item1">
                <a href="<%=path13 %>/lecture/lectures.jsp?target=초등">
                    <strong class="pic_tit">학습지</strong>
                    <em class="pic_com">학습지 메뉴로 이동합니다.</em>
                    <span class="pic_arrow" id="pic_a1">이동하기 →</span>
                </a>
            </li>
            <li class="item2">
                <a href="<%=path13 %>/lecture/lectures.jsp?target=중등">
                    <strong class="pic_tit">강의</strong>
                    <em class="pic_com">인터넷 메뉴로 이동합니다.</em>
                    <span class="pic_arrow" id="pic_a2">이동하기 →</span>
                </a>
            </li>
        </ul>
    </div>
</section>