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
    //搜索框
    var topSearchSize = 7;
    if($.browser.msie && $.browser.version=='6.0'){
        topSearchSize = 10;
    }
//查询条件
    var condition = new Array();
    //文件标题
    condition.push({id: 'wjbt',name: 'wjbt',type: 'input',text: '文件标题',value: 'wjbt',maxLength:100});
    condition.push({id: 'lwbh',name: 'lwbh',type: 'input',text: '来文编号',value: 'lwbh',maxLength:100});
    //办理期限
    condition.push({
        id: 'blqx',
        name: 'blqx',
        type: 'datemulti',
        text: '办理期限',
        value: 'blqx',
        ifFormat:'%Y-%m-%d',
        dateTime: false
    });


    searchobj = $.searchCondition({
        top:topSearchSize,
        right:40,
        searchHandler: function(){
            var val = searchobj.g.getReturnValue();
            if(val !== null){
                debugger;
                debugger;
                $("#listStudent").ajaxgridLoad(getSearchValueObj());
            }
        },
        conditions:condition
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
        managerMethod : "toSwhgPortalMoreList"
        //usepager : false
    });



    var d1 = document.getElementsByClassName("bDiv");
    d1[0].style.overflow='hidden';
    d1[0].style.height='550px';

    var d2 = document.getElementsByClassName("pDiv");
    d2[0].style.display='none';


});



var formModel = new Array();
formModel.push({
    display: 'formid',
    name: 'formid',
    width: 'smallest',
    type: 'checkbox'
});
formModel.push({
    display: '文件标题',
    name: 'wjbt',
    sortable : true,
    width: 'big'
});
formModel.push({
    display:'来文编号',
    name: 'lwbh',
    sortable : true,
    width: 'small'
});
formModel.push({
    display:'收文日期',
    name: 'swrq',
    sortable : true,
    width: 'medium'
});
formModel.push({
    display:'办理期限',
    name: 'blqx',
    sortable : true,
    width: 'medium'
});
formModel.push({
    display:'责任人',
    name: 'zrr',
    sortable : true,
    width: 'medium'
});
formModel.push({
    display:'操作',
    name: 'affairid',
    sortable : true,
    width: 'medium'
});


function rend(txt, data, r, c) {
    if(c==1){ //文件标题
        if(null!=txt){
            var tscz=data.tscz;//办理期限-当前系统时间相差天数
            if(tscz<=3){//距离办理期限还有小于三天时间
                txt = "<a style='word-wrap: break-word;word-break: break-all;overflow: hidden;' class='scoreA color_red' onClick='doGwmodView(&quot;"+data.formid+"&quot;,&quot;"+data.summaryid+"&quot;,&quot;"+data.summary_operationid+"&quot;,&quot;"+data.summary_formid+"&quot;)'>" + txt + "</a>";
            }else {
                txt = "<a style='word-wrap: break-word;word-break: break-all;overflow: hidden;' class='scoreA color_blue' onClick='doGwmodView(&quot;"+data.formid+"&quot;,&quot;"+data.summaryid+"&quot;,&quot;"+data.summary_operationid+"&quot;,&quot;"+data.summary_formid+"&quot;)'>" + txt + "</a>";
            }
        }
    }else if(c==6){
        txt="<button type='button' style='background-color: lightskyblue;font-weight:bold' class='common_button'  onclick='cbClick(&quot;"+data.affairid+"&quot;,&quot;"+data.loginname+"&quot;)' >催办</button>";
    }else{
        if(null==txt || txt=='null'){
            txt = "";
        }
    }
    return txt;

}

function cbClick(affairid,loginname){
    $.ajax({
        url: _ctxPath + '/demo.do?method=toSwSendMessage',
        type:'POST',
        data:{loginnames:loginname,affairids:affairid},
        success:function (res) {
            $.alert("发送成功！");
        }
    });
}

/**
 * 点击标题进入详情界面
 */
function doGwmodView(formid,summaryid,summary_operationId,summary_formId) {
    //var operationId=summary_operationId+".-5869788831630209953";
    var operationId="-5090690108441605781.-5869788831630209953";
    var url= _ctxPath + '/govdoc/govdoc.do?method=summary&summaryId='+summaryid+'&openFrom=formQuery&operationId='+operationId+"&formId="+summary_formId;
    var options = "status=no,resizable=no,menubar=no,top=0,left=0,width=1660,height=742,scrollbars=no,center:Yes;";
    window.open(url, null, options);
}
/**
 * 获得查询条件
 */
function getSearchValueObj(){
    o = new Object();
    var choose = $('#'+searchobj.p.id).find("option:selected").val();

    if(choose === 'wjbt'){
        if($('#wjbt').val()!=''){
            o.wjbt = $('#wjbt').val();
        }
    }
    if(choose === 'lwbh'){
        if($('#lwbh').val()!=''){
            o.lwbh = $('#lwbh').val();
        }
    }
    if(choose === 'hgsfwc'){
        if($('#hgsfwc').val()!=''){
            o.hgsfwc = $('#hgsfwc').val();
        }
    }

    if(choose === 'blqx'){
        var fromDate = $('#from_blqx').val();
        var toDate = $('#to_blqx').val();
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
