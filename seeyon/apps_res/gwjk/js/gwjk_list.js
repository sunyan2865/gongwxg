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
    toolbarArray.push({id: "cuiban",name:"催办",className: "ico16 editor_16",click:doCbMessage});

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
    //文件标题
    condition.push({id: 'wjbt',name: 'wjbt',type: 'input',text: '文件标题',value: 'wjbt',maxLength:100});
    condition.push({id: 'clxz',name: 'clxz',type: 'input',text: '处理性质',value: 'clxz',maxLength:100});
    condition.push({id: 'jjcd',name: 'jjcd',type: 'input',text: '紧急程度',value: 'jjcd',maxLength:100});
    condition.push({id: 'sfhg',name: 'sfhg',type: 'input',text: '是否回告',value: 'sfhg',maxLength:100});
    //拟稿日期
    condition.push({
        id: 'swrq',
        name: 'swrq',
        type: 'datemulti',
        text: '收文日期',
        value: 'swrq',
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
        display: '文件标题',
        name: 'wjbt',
        sortable : true,
        width: 'big'
    });
    formModel.push({
        display:'处理性质',
        name: 'clxz',
        sortable : true,
        width: 'smallest'
    });
    formModel.push({
        display:'缓急',
        name: 'jjcd',
        sortable : true,
        width: 'smallest'
    });
    formModel.push({
        display:'截止日期',
        name: 'blqx',
        sortable : true,
        width: 'smallest'
    });
    formModel.push({
        display:'收文日期',
        name: 'swrq',
        sortable : true,
        width: 'smallest'
    });
    formModel.push({
        display:'责任人',
        name: 'zrr',
        sortable : true,
        width: 'smallest'
    });
    formModel.push({
        display:'是否回告',
        name: 'sfhg',
        sortable : true,
        width: 'smallest'
    });
    formModel.push({
        display:'分发计数器',
        name: 'name',
        sortable : true,
        width: 'big'
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
        managerMethod : "toGwjk"
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
    debugger;
    o = new Object();
    var choose = $('#'+searchobj.p.id).find("option:selected").val();

    if(choose === 'wjbt'){
        if($('#wjbt').val()!=''){
            o.wjbt = $('#wjbt').val();
        }
    }

    if(choose === 'clxz'){
        if($('#clxz').val()!=''){
            o.clxz = $('#clxz').val();
        }
    }

    if(choose === 'jjcd'){
        if($('#jjcd').val()!=''){
            o.jjcd = $('#jjcd').val();
        }
    }

    if(choose === 'sfhg'){
        if($('#sfhg').val()!=''){
            o.sfhg = $('#sfhg').val();
        }
    }

    if(choose === 'zrr'){
        if($('#zrr').val()!=''){
            o.zrr = $('#zrr').val();
        }
    }

    if(choose === 'swrq'){
        var fromDate = $('#from_swrq').val();
        var toDate = $('#to_swrq').val();
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
            var startdate=data.start_date;
            if(startdate>='2021-06-10' && data.clxz=='办件'){//从6.10开始判断 办件
                var tscz=data.tscz;//办理期限-当前系统时间相差天数
                if(tscz<=3){//距离办理期限还有小于三天时间
                    txt = "<a style='word-wrap: break-word;word-break: break-all;overflow: hidden;' class='scoreA color_red' onClick='doGwmodView(&quot;"+data.formid+"&quot;,&quot;"+data.summaryid+"&quot;,&quot;"+data.summary_operationid+"&quot;,&quot;"+data.summary_formid+"&quot;)'>" + txt + "</a>";
                }else {
                    txt = "<a style='word-wrap: break-word;word-break: break-all;overflow: hidden;' class='scoreA color_blue' onClick='doGwmodView(&quot;"+data.formid+"&quot;,&quot;"+data.summaryid+"&quot;,&quot;"+data.summary_operationid+"&quot;,&quot;"+data.summary_formid+"&quot;)'>" + txt + "</a>";
                }
            }else{
                txt = "<a style='word-wrap: break-word;word-break: break-all;overflow: hidden;' class='scoreA color_blue' onClick='doGwmodView(&quot;"+data.formid+"&quot;,&quot;"+data.summaryid+"&quot;,&quot;"+data.summary_operationid+"&quot;,&quot;"+data.summary_formid+"&quot;)'>" + txt + "</a>";
            }

        }
    }
    if(c==2 || c==3 || c==6 || c==7){//处理性质/缓急
        if(txt=="null" || txt==""){
            txt="";
        }

    }

    if(c==4 || c==5 ){//办理期限 或收文日期
        if(txt!="null" && txt!=""){
            txt = txt.substring(0,10);
        }else{
            txt="";
        }

    }
    if(c==8){
        var rendertxt="";
        var definestrArr='';
        var definestate=data.definestate;//每个里面包括姓名，姓名id,个人事项中的state,个人事项id
       /* if(null!=txt && txt!='' && txt!='null'){*/
            //先读取ctp_affair_define_state状态
            if(null!=definestate && definestate!='' && definestate!='null'){
                definestrArr=definestate.split(",");
                for(var k=0;k<definestrArr.length;k++){
                    if(k!=0 && k%6==0){
                        rendertxt+="</br>"
                    }
                    var splitdefinestrArr=definestrArr[k].split(';');//0姓名，1姓名id,2状态，3 affairId
                    if(null!=splitdefinestrArr[0]){
                        if(splitdefinestrArr[2]=='20'){//已办未读
                            rendertxt+= "<button type='button' style='background-color:#a7d0f6;border:1px solid #D4D4D4;text-align:center;width:60px;height:30px;margin-top:10px' onClick='openOpinion(1,&quot;"+splitdefinestrArr[0]+"&quot;,&quot;"+splitdefinestrArr[3]+"&quot;,&quot;"+data.summaryid+"&quot;)'>" + splitdefinestrArr[0] + "</button>  <span id="+splitdefinestrArr[3]+" class='ico16 speech_read2_16' style='background-position:-224px -206px;position:absolute;color:red;padding-top:4px;margin-left:-10px' ></span>&nbsp;&nbsp;&nbsp;&nbsp;";
                        }else if(splitdefinestrArr[2]=='21'){//已办已读
                            rendertxt+= "<button type='button' style='background-color:#a7d0f6;border:1px solid #D4D4D4;text-align:center;width:60px;height:30px;margin-top:10px' onClick='openOpinion(2,&quot;"+splitdefinestrArr[0]+"&quot;,&quot;"+splitdefinestrArr[3]+"&quot;,&quot;"+data.summaryid+"&quot;)'>" + splitdefinestrArr[0] + "</button>&nbsp;&nbsp;&nbsp;&nbsp;";
                        }
                    }
                }
            }
            var p=definestrArr.length;

            var strArr=txt.split(',');//每个里面包括姓名，姓名id，个人事项中的state，个人事项id
            for(var i=0;i<strArr.length;i++){
                if((p+i)!=0 && (p+i)%6==0){  rendertxt+="</br>" }
                var splitstrArr=strArr[i].split(';');//0姓名，1姓名id,2状态，3 affairId
                if(null!=splitstrArr[0]){
                   if(splitstrArr[2]=='3'){//待办
                       rendertxt+= "<button type='button' style='background-color:#d3d3d3;border:1px solid #D4D4D4;text-align:center;width:60px;height:30px;margin-top:10px' onClick='openOpinion(2,&quot;"+splitstrArr[0]+"&quot;,&quot;"+splitstrArr[3]+"&quot;,&quot;"+data.summaryid+"&quot;)'>" +  splitstrArr[0] + "</button>&nbsp;&nbsp;&nbsp;&nbsp;";
                   }
                }
            }
            txt = rendertxt;
       /* }else{
            txt="";
        }*/
    }
    return txt;
}

function getMousePos(event) {
    var e = event || window.event;
    alert('x:'+e.clientX+",'y':"+e.clientY);
    return {'x':e.clientX,'y':e.clientY}
}
/**
 * 查看意见详情
 * @param type
 * @param xm
 * @param affair_id
 * @param edoc_id
 */
function openOpinion(type,xm,affair_id,edoc_id){
    if(type==1){//已办未读  执行方法
       $.ajax({
            url: _ctxPath + '/gwjk.do?method=toUpdateAffairState',
            type:'POST',
            data:{summaryid: edoc_id,affairid:affair_id},
           success:function (res) {
               var code=res["code"];
               $("#"+affair_id).removeClass("ico16 speech_read2_16");
              // $("#listStudent").ajaxgridLoad(getSearchValueObj());

           }
        });
    }
 /*   var url= _ctxPath + '/gwjk.do?method=toOpinionView&affair_id='+affair_id+'&edoc_id='+edoc_id;
    var window_name = "【"+xm+"】意见详情";
    var options = "status=no,resizable=no,menubar=no,top=200,left=500,width=400,height=232,scrollbars=no,center:Yes;";
    window.open(url, window_name, options);*/

    $.ajax({
        url: _ctxPath + '/gwjk.do?method=doGwdb',
        type:'POST',
        data:{summaryid: edoc_id},
        dataType: "json",
        success:function (res) {
            var data=res["data"];
            if(null==data.affairid || data.affairid=='' || data.affairid=='null'){
                $.alert("此条公文暂无待办！");
            }else{
                var url=_ctxPath + '/govdoc/govdoc.do?method=summary&affairId='+data.affairid+'&openFrom=listPending';
                window.open(url, '_blank');
            }
        }
    });
}

function scanSwxx(formid,summaryid){
    var url= _ctxPath + '/gwjk.do?method=toSwDetailView&id='+formid+"&summaryid="+summaryid;
    var window_name = "收文详情";
    var options = "status=no,resizable=no,menubar=no,top=10,left=300,width=1073,height=742,scrollbars=no,center:Yes;";
    window.open(url, window_name, options);
}

function doGwmodView(formid,summaryid,summary_operationId,summary_formId) {
    //var operationId=summary_operationId+".-5869788831630209953";
    var operationId="-5090690108441605781.-5869788831630209953";
    var url= _ctxPath + '/govdoc/govdoc.do?method=summary&summaryId='+summaryid+'&openFrom=formQuery&operationId='+operationId+"&formId="+summary_formId;
    var options = "status=no,resizable=no,menubar=no,top=0,left=0,width=1660,height=742,scrollbars=no,center:Yes;";
    window.open(url, null, options);
}

function doCbMessage(){
    var rows = grid.grid.getSelectRows();
    var loginnames ="";
    var summaryids="";
    if(rows.length <= 0) {
        //请选择要删除的公文
        $.alert("请选择要催办的公文");
        return true;
    }
    var confirm = $.confirm({
        // 该操作不能恢复，是否进行删除操作
        'msg': '确定发送催办？',
        ok_fn: function () {
            for(var count = 0 ; count < rows.length; count ++){
                if(count == rows.length -1){
                    loginnames += rows[count].loginname;
                    summaryids+= rows[count].summaryid;
                }else{
                    loginnames += rows[count].loginname +",";
                    summaryids+= rows[count].summaryid +",";
                }
            }
            $.ajax({
               url: _ctxPath + '/demo.do?method=toSwSendMessage',
               type:'POST',
               data:{loginnames:loginnames,summaryids:summaryids},
               success:function (res) {
                   $.alert("发送成功！");
               }
            });
        },
        error : function(request, settings, e){
            $.alert(e);
        }
    });
}