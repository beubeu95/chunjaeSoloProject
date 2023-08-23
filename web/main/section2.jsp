<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<section class="page" id="page2">
    <div class="page_wrap">
        <h2 class="page_tit">이용 후기</h2>
        <p class="page_com">NT 교육의 학습효과를 보여주는 수강후기 입니다.</p>
        <div class="sl-btn-box">
            <button type="button" class="btn next">&gt;</button>
            <button type="button" class="btn prev">&lt;</button>
        </div>
        <div class="slide_box">
            <ul class="card_lst">
                <li class="item1">
                    <a href="">
                        <div class="thumb_box"></div>
                        <p class="thumb_tit">썸네일제목2 썸네일제목2 썸네일제목2 썸네일제목2 썸네일제목2 썸네일제목2 썸네일제목2썸네일제목2 썸네일제목2 썸네일제목2 썸네일제목2썸네일제목2썸네일제목2 썸네일제목2 </p>
                        <div class="ico_box"><span class="ico item1"></span><span class="thumb_date">2023-08-10</span></div>
                    </a>
                </li>
                <li class="item2">
                    <a href="">
                        <div class="thumb_box"></div>
                        <p class="thumb_tit">썸네일제목2 썸네일제목2 썸네일제목2 썸네일제목2 썸네일제목2 썸네일제목2 썸네일제목2썸네일제목2 썸네일제목2 썸네일제목2 썸네일제목2썸네일제목2썸네일제목2 썸네일제목2 </p>
                        <div class="ico_box"><span class="ico item1"></span><span class="thumb_date">2023-08-10</span></div>
                    </a>
                </li>
                <li class="item3">
                    <a href="">
                        <div class="thumb_box"></div>
                        <p class="thumb_tit">썸네일제목3</p>
                        <div class="ico_box"><span class="ico item1"></span><span class="thumb_date">2023-08-22</span></div>
                    </a>
                </li>
                <li class="item4">
                    <a href="">
                        <div class="thumb_box"></div>
                        <p class="thumb_tit">썸네일제목4</p>
                        <div class="ico_box"><span class="ico item2"></span><span class="thumb_date">2023-07-18</span></div>
                    </a>
                </li>
                <li class="item5">
                    <a href="">
                        <div class="thumb_box"></div>
                        <p class="thumb_tit">썸네일제목5</p>
                        <div class="ico_box"><span class="ico item1"></span><span class="thumb_date">2023-07-18</span></div>
                    </a>
                </li>
                <li class="item6">
                    <a href="">
                        <div class="thumb_box"></div>
                        <p class="thumb_tit">썸네일제목6</p>
                        <div class="ico_box"><span class="ico item2"></span><span class="thumb_date">2023-08-18</span></div>
                    </a>
                </li>
                <li class="item7">
                    <a href="">
                        <div class="thumb_box"></div>
                        <p class="thumb_tit">썸네일제목7</p>
                        <div class="ico_box"><span class="ico item1"></span><span class="thumb_date">2023-08-20</span></div>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</section>
<script>
    $(function(){
        $(".sl-btn-box .btn.next").click(function(){
            var ln = parseInt($(".card_lst").css("margin-left"));
            if(ln>-1110) {
                var mv = ln - 370;
                $(".card_lst").not(":animated").animate({"margin-left":mv+"px"});
            }
        });
        $(".sl-btn-box .btn.prev").click(function(){
            var ln = parseInt($(".card_lst").css("margin-left"));
            if(ln<0){
                var mv = ln + 370;
                $(".card_lst").not(":animated").animate({"margin-left":mv+"px"});
            }
        });
    });
</script>