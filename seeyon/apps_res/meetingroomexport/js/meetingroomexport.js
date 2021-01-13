function checkExportForm() {
    var export_time = $("#export_time").val();
    if(!export_time){
        var alertObj = $.alert("请先选择日期！");
        return false;
    }
}