function checkForm() {
    var upload_timer = null;
    var dutyplan = $("#dutyplan").val();
    var importDepartment = $("#field0002").val();
    var file = $("#file").val();
    if(!dutyplan || !importDepartment){
        var alertObj = $.alert("请先选择值班计划和所属部门！");
        return false;
    }
    if(!file){
        $.alert("请先选择需要导入的文件！");
        return false;
    }
    var proce = $.progressBar({
        text: "正在导入数据...."
    });
    $("#import_button").prop("disabled", true).addClass("common_button_disable");
    //获取响应信息
    clearInterval(upload_timer);
    upload_timer = setInterval(function() {
        var res, iframeBody = $("#upload_iframe").contents().find('body');
        try {
            res = iframeBody.text();
        } catch(e) {
            clearInterval(upload_timer);
            $("#import_button").prop("disabled", false).removeClass("common_button_disable");
            proce.close();
            return $.alert("未知错误！");
        }
        if(res){
            clearInterval(upload_timer);
            iframeBody.html('');
            if (typeof res !== 'object') {
                res = JSON.parse(res);
                if (res.code == 0) {
                    var obj = document.getElementById('file');
                    obj.outerHTML = obj.outerHTML;
                    $("#dutyplan").val("");
                }
                $("#import_button").prop("disabled", false).removeClass("common_button_disable");
                proce.close();
                return $.alert(res.msg);
            }
        }
    }, 30);
}