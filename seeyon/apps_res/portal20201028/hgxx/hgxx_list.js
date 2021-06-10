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

        'centerArea': {
            'id': 'center',
            'sprit':false,
            'border': false,
            'minHeight': 20
        }
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
        managerMethod : "toSwhgPortalList"
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



function rend(txt, data, r, c) {
    if(c==0){ //文件标题
        if(null!=txt){
            var tscz=data.tscz;//办理期限-当前系统时间相差天数
            if(tscz<=3){//距离办理期限还有小于三天时间
                txt = "<a style='word-wrap: break-word;word-break: break-all;overflow: hidden;' class='scoreA color_red' onClick='doGwmodView(&quot;"+data.formid+"&quot;,&quot;"+data.summaryid+"&quot;,&quot;"+data.summary_operationid+"&quot;,&quot;"+data.summary_formid+"&quot;)'>" + txt + "</a>";
            }else {
                txt = "<a style='word-wrap: break-word;word-break: break-all;overflow: hidden;' class='scoreA color_blue' onClick='doGwmodView(&quot;"+data.formid+"&quot;,&quot;"+data.summaryid+"&quot;,&quot;"+data.summary_operationid+"&quot;,&quot;"+data.summary_formid+"&quot;)'>" + txt + "</a>";
            }
        }
    }else{
        if(null==txt || txt=='null'){
            txt = "";
        }
    }
    return txt;

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
