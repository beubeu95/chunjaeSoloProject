<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path46 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 글쓰기</title>
    <%@ include file="/setting/head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path46%>/css/google.css">
    <link rel="stylesheet" href="<%=path46%>/css/fonts.css">
    <link rel="stylesheet" href="<%=path46%>/css/content_header.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path46%>/css/common.css">
    <link rel="stylesheet" href="<%=path46%>/css/hd.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
            /* background-image: url("../../images/bg_visual_overview.jpg"); */
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 1000px; height: 100vh; position:relative; margin: 0 auto; margin-bottom: 100px; margin-top: 100px; box-shadow: 5px 5px 5px 5px gray; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

        .tb1 { width:800px; margin:50px auto; }
        .tb1 th { width:150px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:deepskyblue; color:#fff; }
        .tb1 td { width:650px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #8CB964;
            padding-left: 14px; border-top:1px solid #8CB964; }

        .indata { display:inline-block; width:600px; height: 48px; line-height: 48px;
            padding:14px; font-size:18px; }
        .indata2 { width: 600px; padding: 14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #8CB964; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
        .search_wrap {
            position:relative;
            padding: 30px 30px;
            margin: 0 auto;
            background-color: #f5f5f5;
        }
        form, fieldset, input, h1, h2, h3, h4, h5, h6, p {
            position:relative;
            margin: 0 auto;
            padding: 0;
        }
    </style>

    <link rel="stylesheet" href="<%=path46%>/css/ft.css">
    <link rel="stylesheet" type="text/css" href="http://s1.daumcdn.net/svc/attach/U03/cssjs/mapapidoc/1421136453605/service.min.css">
    <style>
        body { background:white; }
    </style>
    <script type="text/javascript" src="http://dmaps.daum.net/map_js_init/v3.js"></script>
    <script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U0301/cssjs/JSON-js/fc535e9cc8/json2.min.js"></script>
    <style>
        .btn_group { clear:both; width:800px; margin:20px auto; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }
    </style>
</head>
<body class="web guide" data-page_section="web" data-page_type="guide" data-title="Daum 지도 Web API 가이드">
<div class="container">
    <header class="hd" id="hd">
        <%@ include file="/main/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="<%=path46 %>">Home</a> &gt; <span> 오시는 길 </span> </p>
                <h2 class="page_tit"> 오시는 길 </h2>
            </div>
        </div>
        <section class="page" id="map">
            <div class="page_wrap">
                <h2 class="page_tit">오시는 길</h2>
                <div class="maparea">
                    <div id="map2" style="margin-left:120px;	margin-top:50px; width:500px;height:700px; background:white; ">                        </div>
                    <script>
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                            mapOption = {
                                center: new daum.maps.LatLng(37.4676446,126.8876698), // 지도의 중심좌표
                                level: 2 // 지도의 확대 레벨
                            };
                        var map = new daum.maps.Map(mapContainer, mapOption);
                        // 마커가 표시될 위치입니다
                        var markerPosition  = new daum.maps.LatLng(37.4676446,126.8876698);
                        // 마커를 생성합니다
                        var marker = new daum.maps.Marker({
                            position: markerPosition
                        });
                        // 마커가 지도 위에 표시되도록 설정합니다
                        marker.setMap(map);
                        var iwContent = '<div style="padding:5px;">천재 IT교육센터 본원<br><a href="" style="color:blue" target="_blank"></a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                            iwPosition = new daum.maps.LatLng(37.4676446,126.8876698); //인포윈도우 표시 위치입니다
                        // 인포윈도우를 생성합니다
                        var infowindow = new daum.maps.InfoWindow({
                            position : iwPosition,
                            content : iwContent
                        });
                        // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                        infowindow.open(map, marker);
                    </script>
                    <script type="text/javascript" src="http://m1.daumcdn.net/tiara/js/td.min.js"></script>
                    <script type="text/javascript">
                        var _tiq = 'undefined' !== typeof _tiq ? _tiq : [];
                        window._tiq = _tiq;
                        _tiq.push(['__trackPageview']);
                    </script>
                    <script type="text/javascript" src="http://s1.daumcdn.net/svc/attach/U03/cssjs/mapapidoc/1421136453605/service.min.js">
                    </script>
                </div>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/main/footer.jsp" %>
    </footer>
</div>
</body>
</html>