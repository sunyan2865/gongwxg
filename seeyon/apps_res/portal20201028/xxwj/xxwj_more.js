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
    toolbarArray.push({id: "delete",name:"删除流程",className: "ico16 del_16",click:doDelete});
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
    //文件标题
    condition.push({id: 'wjbt',name: 'wjbt',type: 'input',text: '文件标题',value: 'wjbt',maxLength:100});
    //文号
    condition.push({id: 'wh',name: 'wh',type: 'input',text: '文号',value: 'wh',maxLength:100});
    //公开方式
    condition.push({id: 'gksfmc',name: 'gksfmc',type: 'input',text: '公布范围',value: 'gksfmc',maxLength:100});

    //拟稿日期
    condition.push({
        id: 'wjfbrq',
        name: 'wjfbrq',
        type: 'datemulti',
        text: '文件发布日期',
        value: 'wjfbrq',
        ifFormat:'%Y-%m-%d',
        dateTime: false
    });



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
        display:'文件标题',
        name: 'wjbt',
        sortable : true,
        width: 'big'
    });
    formModel.push({
        display: '附件',
        name: 'fjcnt',
        sortable : true,
        width: 'small'
    });
    formModel.push({
        display:'文号',
        name: 'wh',
        sortable : true,
        width: 'medium'
    });
    formModel.push({
        display:'公布范围',
        name: 'gksfmc',
        sortable : true,
        width: 'medium'
    });
    formModel.push({
        display:'文件发布日期',
        name: 'wjfbrq',
        sortable : true,
        width: 'medium'
    });

    //表格加载
    grid = $('#listStudent').ajaxgrid({
        colModel: formModel,
        //click: clickRow,
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
        managerMethod : "toXxwjPortalMoreList"
        //usepager : false
    });

});

function rend(txt, data, r, c) {
    if(c==1){ //文件标题
        if(null!=txt){
            var filename=data.wjbt+".doc";
            var url= "/seeyon/filedown.do?method=fileDownload_zdy&fileurl="+data.content+"&createDate="+data.date+"&filename="+filename;
            txt = "<a  href='"+url+"' style='word-wrap: break-word;word-break: break-all;overflow: hidden;' class='scoreA color_blue' >" + txt + "</a>";
        }
    }else if(c==2){
        if(null!=txt){
            if(txt!=0){
                txt="<span class='ico16 affix_16' onclick='downloadFj(&quot;"+data.summaryid+"&quot;)'> <input type='hidden' id='field0010_1_editAtt_1' value='true'></span>";
            }else{
                txt = "";
            }
         }
    }else{
        if(null==txt || txt=='null'){
            txt = "";
        }
    }
    return txt;
}



function downloadFj(summaryid){
    var url= _ctxPath + '/demo.do?method=toPortalDownloadFj&summaryid='+summaryid;
    var options = "status=no,resizable=no,menubar=no,top=250,left=480,width=600,height=300,scrollbars=no,center:Yes;";
    window.open(url, null, options);
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
                data:{params:simIds,tablename:'formmain_0170',summarytable:'edoc_summary'},
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



function getSearchValueObj(){
    o = new Object();
    var choose = $('#'+searchobj.p.id).find("option:selected").val();

    if(choose === 'wjbt'){
        if($('#wjbt').val()!=''){
            o.wjbt = $('#wjbt').val();
        }
    }

    if(choose === 'wh'){
        if($('#wh').val()!=''){
            o.wh = $('#wh').val();
        }
    }


    if(choose === 'gksfmc'){
        if($('#gksfmc').val()!=''){
            o.gksfmc = $('#gksfmc').val();
        }
    }



    if(choose === 'wjfbrq'){
        var fromDate = $('#from_wjfbrq').val();
        var toDate = $('#to_wjfbrq').val();
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
