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
        managerMethod : "toXxwjPortalList"
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
        display:'文件标题',
        name: 'wjbt',
        sortable : true,
        width: 'medium'
    });
    formModel.push({
        display: '附件',
        name: 'fjcnt',
        sortable : true,
        width: 'small'
    });
    formModel.push({
        display:'文件发布日期',
        name: 'wjfbrq',
        sortable : true,
        width: 'medium'
    });

function rend(txt, data, r, c) {
    if(c==0){ //文件标题
        if(null!=txt){
            var filename=data.wjbt+".doc";
            var url= "/seeyon/filedown.do?method=fileDownload_zdy&fileurl="+data.content+"&createDate="+data.date+"&filename="+filename;
            txt = "<a  href='"+url+"' style='word-wrap: break-word;word-break: break-all;overflow: hidden;' class='scoreA color_blue' >" + txt + "</a>";
        }
    }else if(c==1){
        if(null!=txt) {
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
