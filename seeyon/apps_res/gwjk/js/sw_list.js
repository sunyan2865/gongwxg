var pageX = {};
pageX.openWin = null;
var grid;


$(window).resize(function () {
//    if(grid!=null&&grid.grid!=null){
//        $(grid.grid.bDiv).height($(document.body).height() -78)
//    }
})
$(document).ready(function () {
    new MxtLayout({
        'id': 'layout',
        'northArea': {
            'id': 'north',
            'height': 40,
            'sprit': false,
            'border': false
        },
        'centerArea': {
            'id': 'center',
            'sprit':false,
            'border': false,
            'minHeight': 20
        }
    });

    var toolbarArray = new Array();
    //编辑
    toolbarArray.push({id: "ceshi",name:$.i18n('common.toolbar.edit.label'),className: "ico16 editor_16",click:doGwmod});
    toolbarArray.push({id: "delete",name:$.i18n('common.toolbar.delete.label'),className: "ico16 del_16",click:doDelete});
    toolbarArray.push({id: "replace",name:"替换节点",className: "ico16 sign_16",click:doReplace});
    //工具栏
    toolbar = $("#toolbars").toolbar({
        toolbar: toolbarArray
    });

    //搜索框
    var topSearchSize = 7;
    if($.browser.msie && $.browser.version=='6.0'){
        topSearchSize = 10;
    }

    //查询条件
    var condition = new Array();
    //文件编号
    condition.push({id: 'subject',name: 'subject',type: 'input',text:'文件编号',value: 'subject',maxLength:100});
    //文件标题
    condition.push({id: 'sex',name: 'sex',type: 'input',text: '文件标题',value: 'sex',maxLength:100});
    //拟稿日期
    condition.push({
        id: 'age',
        name: 'age',
        type: 'datemulti',
        text: '拟稿日期',
        value: 'age',
        ifFormat:'%Y-%m-%d',
        dateTime: false
    });
    //当前办理人
    /*  condition.push({id: 'name',name: 'name',type: 'input',text:'当前办理人',value: 'name',maxLength:100});
  */


    searchobj = $.searchCondition({
        top:topSearchSize,
        right:40,
        searchHandler: function(){
            var val = searchobj.g.getReturnValue();
            if(val !== null){
                $("#listStudent").ajaxgridLoad(getSearchValueObj());
            }
        },
        conditions:condition
    });
    var formModel = new Array();
    formModel.push({
        display: 'id',
        name: 'id',
        width: 'smallest',
        type: 'checkbox'
    });
    formModel.push({
        display:'文件编号',
        name: 'subject',
        sortable : true,
        width: 'medium'
    });
    formModel.push({
        display: '文件标题',
        name: 'sex',
        sortable : true,
        width: 'big'
    });
    formModel.push({
        display:'拟稿日期',
        name: 'age',
        sortable : true,
        width: 'medium'
    });
    formModel.push({
        display:'当前办理人',
        name: 'name',
        sortable : true,
        width: 'medium'
    });

    //表格加载
    grid = $('#listStudent').ajaxgrid({
        colModel: formModel,
        //click: clickRow,
        //render : rend,
        height: 200,
        showTableToggleBtn: false,
        parentId: 'center',
        gridType:'autoGrid',
        vChange: true,
        resizable:false,
        vChangeParam: {
            overflow: "hidden",
            autoResize:false //表格下方是否自动显示
        },
        isHaveIframe:true,
        slideToggleBtn:false,
        managerName : "demoManager",
        managerMethod : "demoRight"
        //usepager : false
    });


});


/**
 * 编辑
 */
function doGwmod() {
    var rows = grid.grid.getSelectRows();
    var count = rows.length;
    if (count == 0) {
        // 请选择要编辑的事项
        $.alert($.i18n('govdoc.grid.alert.selectEdit'));
        return;
    }
    if (count > 1) {
        // 只能选择一项事项进行编辑
        $.alert($.i18n('collaboration.grid.alert.selectOneEdit'));
        return;
    }
    if (count == 1) {
        var obj = rows[0];
        var url= _ctxPath + '/demo.do?method=toEditDemoView&formid='+obj.form_recordid+'&summaryid='+obj.summaryid;
        window.open(url,'_blank');
    }
}

/**
 * 删除公文-发文
 * @returns {boolean}
 */
function doDelete(){
    var rows = grid.grid.getSelectRows();
    var simIds ="";
    if(rows.length <= 0) {
        //请选择要删除的公文
        $.alert("请选择要删除的公文");
        return true;
    }
    var confirm = $.confirm({
        // 该操作不能恢复，是否进行删除操作
        'msg': $.i18n("simulation.page.confirm.delete.js"),
        ok_fn: function () {
            for(var count = 0 ; count < rows.length; count ++){
                if(count == rows.length -1){
                    simIds += rows[count].summaryid;
                }else{
                    simIds += rows[count].summaryid +",";
                }
            }
            // table提交
            $.ajax({
                url: _ctxPath + '/demo.do?method=toDelGwfw',
                type:'POST',
                data:{params:simIds},
                success:function (res) {
                    $.messageBox({
                        'title':$.i18n('collaboration.system.prompt.js'),
                        'type': 0,
                        'msg': $.i18n("simulation.page.inform.deleteSuccess.js"),//删除数据成功
                        'imgType':0,
                        ok_fn:function(){
                            $("#listStudent").ajaxgridLoad(getSearchValueObj());
                        }
                    });
                }
            });
        },
        error : function(request, settings, e){
            $.alert(e);
        }
    });
}

/**
 * 替换公文节点-替换
 */
function doReplace(){
    var rows = grid.grid.getSelectRows();
    var count = rows.length;
    if (count == 0) {
        // 请选择要编辑的事项
        $.alert("请选择要替换节点的公文");
        return;
    }
    if (count > 1) {
        // 只能选择一项事项进行编辑
        $.alert($.i18n('collaboration.grid.alert.selectOneEdit'));
        return;
    }
    if (count == 1) {
        var obj = rows[0];
        var url= _ctxPath + '/demo.do?method=toNodeReplaceView&formid='+obj.form_recordid+'&summaryid='+obj.summaryid;
        var options = "status=no,resizable=no,menubar=no,top=50,left=200,width=1024,height=700,scrollbars=no,center:Yes;";
        window.open(url, null, options);
    }
}

function getSearchValueObj(){
    o = new Object();
    var choose = $('#'+searchobj.p.id).find("option:selected").val();

    if(choose === 'subject'){
        if($('#subject').val()!=''){
            o.subject = $('#subject').val();
        }
    }

    if(choose === "sex"){
        if($('#sex').val()!=''){
            o.sex = $('#sex').val();
        }
    }

    /*if(choose === "name"){
        if($('#name').val()!=''){
            o.name = $('#name').val();
        }
    }*/

    if(choose === 'age'){
        var fromDate = $('#from_age').val();
        var toDate = $('#to_age').val();
        if(fromDate != "" && toDate != "" && fromDate > toDate){
            $.alert($.i18n('collaboration.rule.date'));//开始时间不能早于结束时间
            return;
        }
        if(fromDate!=''){
            o.startime = fromDate;
        }
        if(toDate!=''){
            o.endtime=toDate;
        }
    }
    return o;
}
