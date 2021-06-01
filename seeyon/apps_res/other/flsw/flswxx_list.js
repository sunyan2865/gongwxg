var pageX = {};
pageX.openWin = null;
var grid;

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
    toolbarArray.push({id: "ceshi",name:"法律事务修改",className: "ico16 editor_16",click:doMod});
    toolbarArray.push({id: "delete",name:"删除流程",className: "ico16 del_16",click:doDelete});
    toolbarArray.push({id: "deleteNode",name:"节点管理",className: "ico16 sign_16",click:doNodeManager});
    //toolbarArray.push({id: "replace",name:"替换节点",className: "ico16 sign_16",click:doReplace});
    var el = document.getElementById('toolbars');
    var childs = el.childNodes;
    for(var i = childs .length - 1; i >= 0; i--) {
        el.removeChild(childs[i]);
    }

    var el_1 = document.getElementsByClassName('common_search common_search_condition clearfix');
    for(i=0;i<el_1.length;i++){
        //删除元素 元素.parentNode.removeChild(元素);
        if (el_1[i] != null)
            el_1[i].parentNode.removeChild(el_1[i]);
    }

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
    //标题
    condition.push({id: 'bt',name: 'bt',type: 'input',text: '标题',value: 'bt',maxLength:100});
    //登记人
    condition.push({id: 'djr',name: 'djr',type: 'input',text: '标题',value: 'djr',maxLength:100});
    //登记时间
    condition.push({id: 'djsj',name: 'djsj',type: 'input',text: '登记时间',value: 'djsj',maxLength:100});


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
        display: 'formid',
        name: 'formid',
        width: 'smallest',
        type: 'checkbox'
    });
    formModel.push({
        display: '标题',
        name: 'bt',
        sortable : true,
        width: 'big'
    });
    formModel.push({
        display:'登记人',
        name: 'djr',
        sortable : true,
        width: 'small'
    });
    formModel.push({
        display:'登记部门',
        name: 'djbm',
        sortable : true,
        width: 'small'
    });
    formModel.push({
        display:'送达人',
        name: 'sdr',
        sortable : true,
        width: 'small'
    });
    formModel.push({
        display:'送达方式',
        name: 'sdfs',
        sortable : true,
        width: 'small'
    });
    formModel.push({
        display:'来文单位',
        name: 'lwdw',
        sortable : true,
        width: 'small'
    });
    formModel.push({
        display:'来文编号',
        name: 'lwbh',
        sortable : true,
        width: 'small'
    });
    formModel.push({
        display:'登记时间',
        name: 'djsj',
        sortable : true,
        width: 'medium'
    });

    //表格加载
    grid = $('#listStudent').ajaxgrid({
        colModel: formModel,
        /*  click: clickRow,*/
        render : rend,
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
        managerMethod : "toFlswList"
        //usepager : false
    });

    var divs = document.getElementsByClassName("text_overflow");
    for(var i = 0; i < divs.length; i++) {
        divs[i].title = '';
    }

});

/**
 * 改变table列样式或值
 * @param txt
 * @param data
 * @param r
 * @param c
 * @returns {string}
 */
function rend(txt, data, r, c) {
    if(c==1){ //文件标题
        if(null!=txt && txt!='null'){
            txt = "<a style='word-wrap: break-word;word-break: break-all;overflow: hidden;' class='scoreA color_blue' onClick='doModView(&quot;"+data.formid+"&quot;,&quot;"+data.summaryid+"&quot;)'>" + txt + "</a>";
        }else{
            txt="";
        }
    }else{
        if(null==txt || txt=='null'){
            txt = "";
        }
    }
    return txt;
}

/**
 * 获得查询条件
 */
function getSearchValueObj(){
    o = new Object();
    var choose = $('#'+searchobj.p.id).find("option:selected").val();

    if(choose === 'bt'){
        if($('#bt').val()!=''){
            o.bt = $('#bt').val();
        }
    }
    if(choose === 'djr'){
        if($('#djr').val()!=''){
            o.djr = $('#djr').val();
        }
    }
    if(choose === 'djsj'){
        var fromDate = $('#from_djsj').val();
        var toDate = $('#to_djsj').val();
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




/**
 * 修改
 */
function doMod() {
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
        var url= _ctxPath + '/demo.do?method=toFlswMod&formid='+obj.formid+'&summaryid='+obj.summaryid;
        var options = "status=no,resizable=no,menubar=no,top=10,left=200,width=1073,height=742,scrollbars=no,center:Yes;";
        window.open(url, null, options);
        /* window.open(url,'_blank');*/
    }
}

/**
 * 点击标题可以跳转到修改界面
 */
function doModView(formid,summaryid){
    var url= _ctxPath + '/demo.do?method=toFlswMod&formid='+formid+'&summaryid='+summaryid;
    var options = "status=no,resizable=no,menubar=no,top=10,left=200,width=1073,height=742,scrollbars=no,center:Yes;";
    window.open(url, null, options);
}


/**
 * 删除公
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
                data:{params:simIds,tablename:'formmain_0084',summarytable:'col_summary'},
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
        $.alert("请选择要替换节点的事项");
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


/***
 * 节点管理：删除替换催办等功能
 */
function doNodeManager(){
    var rows = grid.grid.getSelectRows();
    var count = rows.length;
    if (count == 0) {
        // 请选择要编辑的事项
        $.alert("请选择要管理节点的事项");
        return;
    }
    if (count > 1) {
        // 只能选择一项事项进行编辑
        $.alert($.i18n('collaboration.grid.alert.selectOneEdit'));
        return;
    }
    if (count == 1) {
        var obj = rows[0];
        /*if(obj.dqblr=="" || obj.dqblr=="null" || null==obj.dqblr){
            $.alert("流程已结束！");
            return;
        }else{*/
            //showSuperviseDigram(obj.case_id,obj.process_id,'true','collaboration','670869647114347','部门承办','部门承办','节点管理','','',obj.form_app_id,obj.formid);
            showSuperviseDigram(obj.case_id,obj.process_id,'true','collaboration','670869647114347','部门办理','部门办理','节点管理','','',obj.form_app_id,obj.formid);
       /* }*/

    }


}