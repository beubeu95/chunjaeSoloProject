<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Author" content="천재교육 콘텐츠 제작팀">
<meta http-equiv="Publisher" content="천재교육 김기태">
<meta http-equiv="Copyright" content="copyright@chunjae.co.kr">
<title>NT교육</title>

<!-- 검색엔진 최적화(SEO) -->
<meta name="Subject" content="NT교육, Nice Try교육센터">
<meta name="Keywords" content="NT교육, NT 학습지, 교육 교재, 인터넷 강의, 스마트 교육">
<meta name="Description" content="NT교육은 학습지, 교육 교재 제작, 영어, 중국어, 일본어 교육에 대한 교재와 교육을 실시하는 기관입니다.">
<!-- <meta name="Robots" content="noindex, nofllow"> -->
<meta name="robots" content="index,follow">

<!-- 오픈 그래프(Open graph)-->
<meta property="og:type" content="website">
<meta property="og:title" content="천재교육">
<meta property="og:description" content="앞선 생각으로 더 큰 미래의 교육을 준비하는 기업">
<meta property="og:image" content="<%=path %>/images/NTlogo_main.png">
<meta property="og:url" content="<%=path %>">

<!-- 트위터 -->
<meta name="twitter:card" content="picture">
<meta name="twitter:title" content="천재교육">
<meta name="twitter:description" content="앞선 생각으로 더 큰 미래의 교육을 준비하는 기업">
<meta name="twitter:image" content="<%=path %>/images/NTlogo_main.png">


<!-- 파비콘 설정 -->

<link rel="shortcut icon" href="/images/logo_24.png">
<!-- 애플 계열 모바일 -->
<link rel="apple-touch-icon-precomposed" href="<%=path %>/images/logo_64.png">
<!-- IE 계열 브라우저 -->
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="<%=path %>/images/logo_48.png">
<!-- 파이어폭스, 오페라, 또는 구형 크롬/사파리 -->
<link rel="icon" href="<%=path %>/images/logo_16.png" sizes="16x16">
<link rel="icon" href="<%=path %>/images/logo_32.png" sizes="32x32">
<link rel="icon" href="<%=path %>/images/logo_48.png" sizes="48x48">
<link rel="icon" href="<%=path %>/images/logo_64.png" sizes="64x64">
<script>
document.oncontextmenu = function() { return false; }
document.ondragstart = function() { return false; }
document.onselectstart = function() { return false; }
//document.onkeydown = function() { return false; }
</script>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
%>