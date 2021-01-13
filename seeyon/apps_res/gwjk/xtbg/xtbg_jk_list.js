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
    //拟稿日期
    condition.push({
        id: 'bqrq',
        name: 'bqrq',
        type: 'datemulti',
        text: '报请日期',
        value: 'bqrq',
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
        display:'报请日期',
        name: 'bqrq',
        sortable : true,
        width: 'small'
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
        managerMethod : "toXtbgJkList"
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

    if(choose === 'bqrq'){
        var fromDate = $('#from_bqrq').val();
        var toDate = $('#to_bqrq').val();
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
            txt = "<a style='word-wrap: break-word;word-break: break-all;overflow: hidden;' class='scoreA color_blue' onClick='scanSwxx(&quot;"+data.formid+"&quot;,&quot;"+data.summaryid+"&quot;)'>" + txt + "</a>";
        }
    }
    if(c==2){ //文件标题
        if(null==txt || txt=="null"){
          txt="";
        }
    }
    if(c==3){
        debugger;
        var rendertxt="";
        var definestrArr='';
        var definestate=data.definestate;//每个里面包括姓名，姓名id,个人事项中的state,个人事项id
        if(null!=txt && txt!='' && txt!='null'){
            var teamuserid=data.teamuserid;
            var teamarr=teamuserid.split(',');

            //先读取ctp_affair_define_state状态
            if(null!=definestate && definestate!='' && definestate!='null'){
                definestrArr=definestate.split(",");
                for(var k=0;k<definestrArr.length;k++){
                    if(k!=0 && k%7==0){
                        rendertxt+="</br>"
                    }
                    var splitdefinestrArr=definestrArr[k].split(';');//0姓名，1姓名id,2状态，3 affairId
                    if(null!=splitdefinestrArr[0]){
                        var curuserid=splitdefinestrArr[1];
                        var flag=true;
                        for(var m=0;m<teamarr.length;m++){
                            if(curuserid==teamarr[m]){
                                flag=false;
                                break;
                            }
                        }
                        if(flag){
                            if(splitdefinestrArr[2]=='20'){//已办未读
                                rendertxt+= "<button type='button' style='background-color:#a7d0f6;border:1px solid #D4D4D4;text-align:center;width:60px;height:30px;margin-top:10px' onClick='openOpinion(1,&quot;"+splitdefinestrArr[0]+"&quot;,&quot;"+splitdefinestrArr[3]+"&quot;,&quot;"+data.summaryid+"&quot;)'>" + splitdefinestrArr[0] + "</button><span style='position:absolute;color:red;padding-top:5px;margin-left:-10px'>⬤</span>&nbsp;&nbsp;&nbsp;";
                            }else if(splitdefinestrArr[2]=='21'){//已办已读
                                rendertxt+= "<button type='button' style='background-color:#a7d0f6;border:1px solid #D4D4D4;text-align:center;width:60px;height:30px;margin-top:10px' onClick='openOpinion(2,&quot;"+splitdefinestrArr[0]+"&quot;,&quot;"+splitdefinestrArr[3]+"&quot;,&quot;"+data.summaryid+"&quot;)'>" + splitdefinestrArr[0] + "</button>&nbsp;&nbsp;&nbsp;";
                            }
                        }
                    }
                }
            }
            var p=definestrArr.length;
            var strArr=txt.split(',');//每个里面包括姓名，姓名id，个人事项中的state，个人事项id
            for(var i=0;i<strArr.length;i++){
                if((p+i)!=0 && (p+i)%7==0){  rendertxt+="</br>" }
                var splitstrArr=strArr[i].split(';');//0姓名，1姓名id,2状态，3 affairId
                if(null!=splitstrArr[0]){
                    var curuserid=splitstrArr[1];
                    var flag=true;
                    for(var m=0;m<teamarr.length;m++){
                        if(curuserid==teamarr[m]){
                            flag=false;
                            break;
                        }
                    }
                    if(flag){
                        if(splitstrArr[2]=='3'){//待办
                            rendertxt+= "<button type='button' style='background-color:#d3d3d3;border:1px solid #D4D4D4;text-align:center;width:60px;height:30px;margin-top:10px' onClick='openOpinion(2,&quot;"+splitstrArr[0]+"&quot;,&quot;"+splitstrArr[3]+"&quot;,&quot;"+data.summaryid+"&quot;)'>" +  splitstrArr[0] + "</button>&nbsp;&nbsp;&nbsp;";
                        }
                    }

                }
            }
            txt = rendertxt;
        }else{
            txt="";
        }
    }
    return txt;
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
                $("#listStudent").ajaxgridLoad(getSearchValueObj());
            }
        });
    }
   /* var url= _ctxPath + '/gwjk.do?method=toOpinionView&affair_id='+affair_id+'&edoc_id='+edoc_id;
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
    var url= _ctxPath + '/demo.do?method=toXtbgDetail&formid='+formid+"&summaryid="+summaryid;
    var window_name = "协同办公详情";
    var options = "status=no,resizable=no,menubar=no,top=10,left=300,width=1073,height=742,scrollbars=no,center:Yes;";
    window.open(url, window_name, options);
}

