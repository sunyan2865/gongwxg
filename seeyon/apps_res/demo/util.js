/**
 * 删除附件
 */
function deletefj(fileurl){
    var summaryid=document.getElementById("summaryid").value;
    $.ajax({
        url: _ctxPath + '/demo.do?method=toDeleteFj',
        type:'POST',
        data:{file_url:fileurl,summaryid:summaryid},
        error:function(res){
            $.alert("删除成功!");
        },
        success:function (res) {
            $.alert("删除成功!");
            var obj=$("#attachmentDiv_"+fileurl);
            obj.remove();
        }
    });
}


function deleteZw(fileurl){
    var obj=$("#attachmentDiv_"+fileurl);
    obj.remove();
}

/**
 * 动态获得select下拉框的值
 */
function getJgdzOption_data(component,obj,ref_enumid){
    $.ajax({
        url: _ctxPath + '/demo.do?method=getJgdzData',
        type:'POST',
        data:{parent_id: component,ref_enumid:ref_enumid},
        dataType: "json",
        success:function (res) {
            var list=res["data"];
            obj.children().remove();
            obj.append("<option val4cal='0' value='' selected=''></option>");
            for(var i=0;i<list.length;i++){
                obj.append("<option value="+list[i].id+" title="+list[i].showvalue+"  >"+list[i].showvalue+"</option>");
            }
        }
    });

}

/**
 * 初始化select控件值
 * @param component
 * @param id
 */
function initOption(component,id){
    var all_options = document.getElementById(component).options;
    for (i=0; i<all_options.length; i++){
        if (all_options[i].value == id)  // 根据option标签的ID来进行判断
        {
            all_options[i].selected = true;
        }
    }
}



/**
 * 格式化多部门值
 * @param str
 * @returns {string}
 */
function formatdata(str){
    if(null!=str || str!=''){
        var ci=str.indexOf("hiddenValueDepartment");
        return str.substring(ci,str.length).replace("hiddenValueDepartment","Department").replace("\n","").trim();
    }
}




/**
 * 意见按钮事件：删除和修改
 * @param element
 */
function buttonClick(element){
    var  id_modstr=element.id;
    var arr=id_modstr.split('_');
    //arr[0]:id   arr[1]:字段名，更新的列  arr[2]：mod修改  del删除
    //alert(arr[0]+"===="+arr[1]+"===="+arr[2]+"==="+$("#"+arr[0]).val());
    $.ajax({
        url: _ctxPath + '/demo.do?method=toUpdateOpinion',
        type:'POST',
        data:{id: arr[0],zd:arr[1],operType:arr[2],content:$("#"+arr[0]).val()},
        success:function (res) {
            if('0'==res.code){
                if(arr[2]=="mod"){
                    $.alert("修改成功!");
                }else{
                    $.alert("删除成功！");
                    var obj=$("#div_"+arr[0]);
                    obj.remove();
                }
            }else{
                if(arr[2]=="mod"){
                    $.alert("修改失败!");
                }else{
                    $.alert("删除失败！");
                }
            }
        }
    });

}


function makeExpandingArea(el) {
    var timer = null;
    //由于ie8有溢出堆栈问题，故调整了这里
    var setStyle = function(el, auto) {
        if (auto) el.style.height = 'auto';
        el.style.height = (el.scrollHeight)+'px';
    }
    var delayedResize = function(el) {
        if (timer) {
            clearTimeout(timer);
            timer = null;
        }
        timer = setTimeout(function() {
            setStyle(el)
        }, 200);
    }
    if (el.addEventListener) {
        el.addEventListener('input', function() {
            setStyle(el, 1);
        }, false);
        setStyle(el)
    } else if (el.attachEvent) {
        el.attachEvent('onpropertychange', function() {
            setStyle(el)
        })
        setStyle(el)
    }
    if (window.VBArray && window.addEventListener) { //IE9
        el.attachEvent("onkeydown", function() {
            var key = window.event.keyCode;
            if (key == 8 || key == 46) delayedResize(el);

        });
        el.attachEvent("oncut", function() {
            delayedResize(el);
        }); //处理粘贴
    }
}