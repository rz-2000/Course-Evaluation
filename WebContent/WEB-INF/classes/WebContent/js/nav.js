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