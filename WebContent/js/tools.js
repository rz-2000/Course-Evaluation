/**
 * Created by 杨志豪 on 2019/11/27.
 */

// 导航栏下拉菜单
var drop_name = $("#drop-name");
var drop_list = $("#drop-list");
var flag = 0;
drop_name.mouseenter(function () {
    drop_list.stop();
    drop_list.slideDown(300);
});
drop_name.mouseleave(function () {
    drop_list.stop();
    drop_list.slideUp(300);
});
drop_list.mouseenter(function () {
    drop_list.stop();
});
drop_list.mouseleave(function () {
    drop_list.slideUp(300);
});

// 控制评星显示
var star_lists = document.getElementsByClassName("star-list");
for(var i = 0; i<star_lists.length; i++) {
    var text_score = star_lists[i].getElementsByClassName("score")[0];
    var score = text_score.innerText / 2;
    var score_int = Math.floor(score);
    if (score_int == 0) {
        text_score.innerText = "暂无评分";
        text_score.style.color = "grey";
        text_score.style.fontSize = "13px";
    } else {
        var star_lis = star_lists[i].getElementsByTagName("img");
        var j = 0;
        while (j < score_int) {
            star_lis[j].src = "images/评星1.png";
            j++;
        }
        if (score > score_int) {
            star_lis[j].src = "images/评星0.5.png";
        }
    }
}