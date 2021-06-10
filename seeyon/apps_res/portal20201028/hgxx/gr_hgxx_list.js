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
        managerMethod : "toSwhgPortalListGr"
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
    display: '文件标题',
    name: 'wjbt',
    sortable : true,
    width: 'big'
});
formModel.push({
    display:'来文编号',
    name: 'lwbh',
    sortable : true,
    width: 'medium'
});
formModel.push({
    display:'收文日期',
    name: 'swrq',
    sortable : true,
    width: 'small'
});
formModel.push({
    display:'办理期限',
    name: 'blqx',
    sortable : true,
    width: 'small'
});

function rend(txt, data, r, c) {
    if(c==0){ //文件标题
        if(null!=txt){
            var tscz=data.tscz;//办理期限-当前系统时间相差天数
            if(tscz<=3){//距离办理期限还有小于三天时间
                txt = "<a style='word-wrap: break-word;word-break: break-all;overflow: hidden;' class='scoreA color_red' onClick='doGwmodView(&quot;"+data.affairid+"&quot;)'>" + txt + "</a>";
            }else {
                txt = "<a style='word-wrap: break-word;word-break: break-all;overflow: hidden;' class='scoreA color_blue' onClick='doGwmodView(&quot;"+data.affairid+"&quot;)'>" + txt + "</a>";
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
 * 点击标题进入待办界面
 */
function doGwmodView(affairid) {
    //var operationId=summary_operationId+".-5869788831630209953";
    var url=_ctxPath + '/govdoc/govdoc.do?method=summary&affairId='+affairid+'&openFrom=listPending';
    window.open(url, '_blank');
}


