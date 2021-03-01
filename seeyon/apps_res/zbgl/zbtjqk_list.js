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

    //搜索框
    var topSearchSize = 7;
    if($.browser.msie && $.browser.version=='6.0'){
        topSearchSize = 10;
    }

    //查询条件
    var condition = new Array();
    //标题
    condition.push({id: 'zbjh',name: 'zbjh',type: 'input',text: '值班计划',value: 'zbjh',maxLength:100});


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
        display: '值班计划',
        name: 'zbjh',
        sortable : true,
        width: 'big'
    });
    formModel.push({
        display:'总部门数',
        name: 'zscnt',
        sortable : true,
        width: 'medium'
    });
    formModel.push({
        display:'已提交值班数',
        name: 'ydcnt',
        sortable : true,
        width: 'medium'
    });
    formModel.push({
        display:'未提交值班数',
        name: 'wdcnt',
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
        managerMethod : "toZbtjqkList"
        //usepager : false
    });

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
    if(c==3){//已提交
        if(null!=txt && txt!='null'){
            txt = "<a style='word-wrap: break-word;word-break: break-all;overflow: hidden;' class='scoreA color_blue' onClick='scanTjQk(&quot;"+data.zbjh+"&quot;,1)'>" + txt + "</a>";
        }else{
            txt="";
        }
    }else if(c==4){//未提交
        if(null!=txt && txt!='null'){
            txt = "<a style='word-wrap: break-word;word-break: break-all;overflow: hidden;' class='scoreA color_blue' onClick='scanTjQk(&quot;"+data.zbjh+"&quot;,2)'>" + txt + "</a>";
        }else{
            txt="";
        }
    } else{
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

    if(choose === 'zbjh'){
        if($('#zbjh').val()!=''){
            o.zbjh = $('#zbjh').val();
        }
    }


    return o;
}




/**
 * 点击标题可查看已提交部门或未提交部门
 */
function scanTjQk(zbjh,type){
        var url= _ctxPath + '/demo.do?method=toTjQkDetail&zbjh='+zbjh+'&type='+type;
        var options = "status=no,resizable=no,menubar=no,top=100,left=400,width=800,height=600,scrollbars=no,center:Yes;";
        var oWin = window.open(url, "已提交值班情况", options);
        if(type==1){
            setTimeout(function(){ oWin.document.title = '已提交值班情况'; }, 100);
        }else if(type==2){
            setTimeout(function(){ oWin.document.title = '未提交值班情况'; }, 100);
        }

}


