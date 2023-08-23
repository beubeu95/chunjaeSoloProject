<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path44 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NT교육</title>
    <%@ include file="setting/head.jsp" %>
    <link rel="shortcut icon" type="image/x-icon" href="<%=path44 %>/images/NTlogo_main.png">

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="css/google.css">
    <link rel="stylesheet" href="css/fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/hd.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; }
        .contents::after { content:""; clear:both; display:block; width:100%; }
        .vs { clear:both; width:100%; min-height:600px; background-color: deeppink;
            position:relative; overflow:hidden; }
        .img_box { position:relative; width: 100%; height:600px; overflow:hidden; }
        .img_box li { visibility:hidden; opacity:0;  transition-duration:0.7s;
            transition-delay:0.1s;    width:100%; height:600px;  }
        .img_box li .bg_box { width:100vw; height:600px; background-repeat: no-repeat;
            background-position:center center; background-size:cover; position:absolute;
            left: 0; top: 0; z-index:5; }
        .img_box li.active .bg_box { z-index:6; }
        .img_box li.item1 .bg_box { background-image: url("/images/main_image1.png"); }
        .img_box li.item2 .bg_box { background-image: url("/images/main_image2.png"); }
        .img_box li .vs_tit { position:absolute; top:180px; left:100px; z-index:10;
            font-weight: 300; font-size: 60px; line-height: 1.3; }
        .img_box li .vs_tit strong { font-weight: 500; }

        .img_box li.active { visibility: visible; opacity: 1; }
        .vs_tit { font-size:60px; color:#fff; }
        .btn_box li .vs_btn { display:block; width: 12px; height: 12px;
            background-color:rgba(255,255,255,0.8); border:2px solid #fff;
            position:absolute; top:150px; left: 100px; z-index:14; cursor:pointer;
            border-radius:50%; }
        .btn_box li.item2 .vs_btn { left: 132px; }
        .btn_box li.active .vs_btn { background-color: #fff; border:2px solid #333; }
        .vs_ra { display:none; }

        .play_btn { display:block; width: 12px; height: 12px; position:absolute;
            top:148px; left: 164px; z-index:14; cursor:pointer; color: #fff;
            border:0;  background-color: transparent; font-weight: 900; }
        .play_btn:after { content:"| |"; }
        .play_btn.active:after { content:"▶"; }

        #page1 { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1.75em; }

        #page1 .page_wrap { width: 100%; height: 600px;}

        .pic_lst { clear:both; width: 1110px; margin: 0px auto; padding-top: 50px; }
        .pic_lst li { width: 500px; height: 300px; padding :40px; margin-left:30px; float:left;
            margin-top:50px; transition:0.4s; overflow:hidden; box-sizing: border-box; box-shadow:5px 5px 5px #999; }
        .pic_lst li:hover { margin-top: 20px; box-shadow:10px 10px 10px #999; }
        .pic_lst li a { display:block; width: 256px; height: 376px; margin: 11px;
            color:#fff; text-align: left; }
        .pic_lst li:first-child { background-color: #3d9eee; border-radius: 50px; }
        .pic_lst li:nth-child(2) { background-color: #71dace; border-radius: 50px;}
        .pic_tit { font-size : 26px; text-shadow:0px 2px 7px rgba(0,0,0,0.12); font-weight:bold;}
        .pic_com {display: block; line-height: 1.2; position: relative; margin-top:10px; margin-bottom: 50px;}
        .pic_arrow { width:150px; height:40px; border : 2px solid #fff; border-radius: 50px; padding:10px; float: right;
                     font-size:20px;}
        #pic_a1:hover { background-color:#ffffff; color:#3d9eee; transition: 0.7s; }
        #pic_a2:hover { background-color:#ffffff; color:#71dace; transition: 0.7s; }

        #page2 { clear:both; width: 100vw; height: 100vh; position:relative; }
        .slide_box::-webkit-scrollbar { display:none; }
        .slide_box { clear:both; width:calc(100vw - 350px); height:400px;
            margin-left: 350px;  -ms-overflow-style:none;
            scrollbar-width:none; }

        .page_com { text-align: center; padding-bottom: 30px; padding-top: 30px;  }
        .card_lst { width: 4000px; }
        .card_lst > li { width: 320px; height: 400px; float:left; margin-right: 50px;
            box-shadow:5px 5px 30px #888; border-radius:6px; overflow: hidden; }
        .card_lst > li:first-child { margin-left: 30px; }

        .card_lst li .thumb_box { width: 320px; height: 210px;
            background-repeat: no-repeat; background-position: center center;
            background-size: cover; }
        .card_lst li a { display:block; width: 320px; height: 220px; }
        .card_lst li.item2 .thumb_box { background-image: url("<%=path44%>/images/thumb6.jpg"); }
        .card_lst li.item2 .thumb_box { background-image: url("<%=path44%>/images/thumb1.jpg"); }
        .card_lst li.item3 .thumb_box { background-image: url("<%=path44 %>/images/thumb2.jpg"); }
        .card_lst li.item4 .thumb_box { background-image: url("<%=path44 %>/images/thumb3.jpg"); }
        .card_lst li.item5 .thumb_box { background-image: url("<<%=path44 %>/images/thumb4.jpg"); }
        .card_lst li.item6 .thumb_box { background-image: url("<%=path44%>/images/thumb5.jpg"); }
        .card_lst li.item7 .thumb_box { background-image: url("<%=path44 %>/images/thumb6.jpg"); }

        .thumb_tit { height: 42px; box-sizing:border-box; font-size: 14px; color:#333; padding:14px; padding-bottom: 0; text-overflow: ellipsis;
            overflow:hidden; display:-webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp:2;
            margin-bottom: 60px; }
        .thumb_date { float:right; margin-right: 14px;  }

        .cate_tit { padding-left: 32px; font-size: 36px; line-height: 2; padding-top: 24px;
            padding-bottom: 24px; }
        .cate_lst li { border-top:1px solid #333; margin-left: 14px; margin-right: 14px;
            padding-top: 32px; height: 90px;  }
        .cate_tit li a { display:block; }
        .bd_content { width:auto; padding-right: 24px; }
        .bd_date { padding-top: 18px; }

        .sl-btn-box .btn { display:block; width: 48px; height: 48px; font-size:32px;
            color:#fff; background-color:#333; text-align: center; line-height: 48px;
            font-weight: 700; cursor:pointer; position:absolute; left:100px; }
        .sl-btn-box .btn.next { top:100px; }
        .sl-btn-box .btn.prev { top:148px; }

        #page3 { clear:both; width: 100vw; position:relative; }

        .board_lst { background-color: rgba(240, 240, 240, 0.5); margin-top : 100px; }
        .board_wrap { width: 1250px; margin: 0px auto; padding: 10px; }
        .board { display : inline-block; margin: 60px; vertical-align: top; }
        .board_title { display : inline-block; position: relative; width: 500px; }
        .notice_title {margin : 5px; font-size: 20px; font-weight: bold;}
        .notice_more { position : absolute; top: 5px; right :0;}
        .events_title {margin : 5px; font-size: 20px; font-weight: bold;}
        .lst_group { display: flex; justify-content : space-between; margin-top : 10px; }
        .lst_group a { line-height: 25px; width: 400px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; display: block; }
        .board_subject1::before { content:"🔉 공지"; margin-right: 5px; padding-right: 5px; border-radius: 50px; background-color: #333;
            color:#fff; font-size: 10px; text-align: center; height: 25px; line-height: 25px; padding-left: 5px; display: inline-block }
        .board_subject2::before { content:"🔉 공지"; margin-right: 5px; padding-right: 5px; border-radius: 50px; background-color: #333;
            color:#fff; font-size: 10px; text-align: center; height: 25px; line-height: 25px; padding-left: 5px; display: inline-block}
        a { text-decoration: none; display : flex; color : #333; }
        .lst { border-top:2px solid #333; margin:0; width : 500px; padding: 0; }
    </style>

    <link rel="stylesheet" href="css/ft.css">
    <script>document.onkeydown = function() { return false; }</script>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="main/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <%@ include file="main/contents.jsp" %>

        <%@ include file="main/section1.jsp" %>

        <%@ include file="main/section2.jsp" %>

        <%@ include file="main/section3.jsp" %>

    </div>
    <footer class="ft" id="ft">
        <%@ include file="main/footer.jsp" %>
    </footer>
</div>
</body>
</html>