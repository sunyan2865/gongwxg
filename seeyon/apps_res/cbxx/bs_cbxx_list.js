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
    toolbarArray.push({id: "ceshi",name:"发送短信",className: "ico16 editor_16",click:doSendMessage});
    //工具栏
    toolbar = $("#toolbars").toolbar({
        toolbar: toolbarArray
    });
    /*
    //搜索框
    var topSearchSize = 7;
    if($.browser.msie && $.browser.version=='6.0'){
        topSearchSize = 10;
    }


    //查询条件
    var condition = new Array();
    //
    condition.push({id: 'xm',name: 'xm',type: 'input',text:'姓名',value: 'xm',maxLength:100});
    condition.push({id: 'lxdh',name: 'lxdh',type: 'input',text:'联系电话',value: 'lxdh',maxLength:100});

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

 */
    var formModel = new Array();
    formModel.push({
        display: 'id',
        name: 'id',
        width: 'smallest',
        type: 'checkbox'
    });
    formModel.push({
        display:'姓名',
        name: 'xm',
        sortable : true,
        width: 'medium'
    });
    formModel.push({
        display:'联系电话',
        name: 'lxdh',
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
        managerMethod : "toCbryQuery"
        //usepager : false
    });


});


/**
 * 发送短信
 * @returns {boolean}
 */
function doSendMessage(){
    var rows = grid.grid.getSelectRows();
    var loginnames ="";
    var affairids="";
    if(rows.length <= 0) {
        //请选择要删除的公文
        $.alert("请选择要发送短信的待办人");
        return true;
    }
    for(var count = 0 ; count < rows.length; count ++){
       if(count == rows.length -1){
           loginnames += rows[count].id;
           affairids+=rows[count].affairid;
       }else{
           loginnames += rows[count].id +",";
           affairids+=rows[count].affairid+",";
       }
    }

    // table提交
    $.ajax({
        url: _ctxPath + '/demo.do?method=toSendMessage',
        type:'POST',
        data:{loginnames:loginnames,affairids:affairids},
        success:function (res) {
            $.alert("发送成功！");
            window.close();
        }
    });
}

/*

function getSearchValueObj(){
    o = new Object();
    var choose = $('#'+searchobj.p.id).find("option:selected").val();

    if(choose === 'xm'){
        if($('#xm').val()!=''){
            o.xm = $('#xm').val();
        }
    }
    if(choose === 'lxdh'){
        if($('#lxdh').val()!=''){
            o.lxdh = $('#lxdh').val();
        }
    }
    return o;
}
*/
