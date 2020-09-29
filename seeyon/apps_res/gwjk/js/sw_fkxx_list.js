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
    //文件标题
    condition.push({id: 'wjbt',name: 'wjbt',type: 'input',text: '文件标题',value: 'wjbt',maxLength:100});
    //反馈人
    condition.push({id: 'name',name: 'name',type: 'input',text: '反馈人',value: 'wjbt',maxLength:100});


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
        display: '文件标题',
        name: 'wjbt',
        sortable : true,
        width: 'big'
    });
    formModel.push({
        display:'反馈人',
        name: 'name',
        sortable : true,
        width: 'small'
    });
    formModel.push({
        display:'反馈时间',
        name: 'fksj',
        sortable : true,
        width: 'small'
    });
    formModel.push({
        display:'意见',
        name: 'content',
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
        managerName : "gwJkManager",
        managerMethod : "toSwfkxx"
        //usepager : false
    });

    var divs = document.getElementsByClassName("text_overflow");
    for(var i = 0; i < divs.length; i++) {
        divs[i].title = '';
    }

});

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

    if(choose === 'name'){
        if($('#name').val()!=''){
            o.wjbt = $('#name').val();
        }
    }


    return o;
}

/**
 * 修改table表中的字段显示情况
 * @param txt
 * @param data
 * @param r
 * @param c
 * @returns {string}
 */
function rend(txt, data, r, c) {
    if(c==1){ //文件标题
        if(null!=txt){
            if(data.state=='0'){
                txt = "<span style='color:#63e563'>【新】</span><a style='word-wrap: break-word;word-break: break-all;overflow: hidden;' class='scoreA color_blue' onClick='scanSwxx(&quot;"+data.formid+"&quot;,&quot;"+data.opinionid+"&quot;,&quot;"+data.summaryid+"&quot;,&quot;"+data.state+"&quot;)'>" + txt + "</a>";
            }else{
                txt = "<a style='word-wrap: break-word;word-break: break-all;overflow: hidden;' class='scoreA color_blue' onClick='scanSwxx(&quot;"+data.formid+"&quot;,&quot;"+data.opinionid+"&quot;,&quot;"+data.summaryid+"&quot;,&quot;"+data.state+"&quot;)'>" + txt + "</a>";
            }
        }
    }
    return txt;
}


function scanSwxx(formid,opinionid,summaryid,state){
    var url= _ctxPath + '/gwjk.do?method=toSwDetailView&id='+formid+"&summaryid="+summaryid;
    var window_name = "收文详情";
    var options = "status=no,resizable=no,menubar=no,top=10,left=300,width=1073,height=742,scrollbars=no,center:Yes;";
    window.open(url, window_name, options);
    if(state=="0"){
        $.ajax({
            url: _ctxPath + '/gwjk.do?method=toUpdateOpinionState',
            type:'POST',
            data:{opinionid:opinionid},
            success:function (res) {
                var code=res["code"];
                $("#listStudent").ajaxgridLoad(getSearchValueObj());
            }
        });
    }

}

