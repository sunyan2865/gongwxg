<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<!DOCTYPE html>
<html class="h100b">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>协同办公信息</title>
    <script type="text/javascript" charset="UTF-8" src="${path}/apps_res/supervise/js/superviseDetailList.js${ctp:resSuffix()}"></script>
    <script type="text/javascript" charset="UTF-8" src="${path}/apps_res/demo/swxg/xtbg/xtbg_list.js${ctp:resSuffix()}"></script>
    <script type="text/javascript" src="${path}/common/workflow/workflowDesigner_api.js${ctp:resSuffix()}"></script>
    <%@ include file="/WEB-INF/jsp/ctp/workflow/workflowDesigner_js_api.jsp" %>


    <script text="text/javascript">
        //显示流程图
        var isShowRecord = false;
        var recordType = '';
        var app = "4";
        var docPlugin = true;
        var hasBarCode = "true";
        var templeteIds =  "";
        var superviseStatus = "";
        var isG6 = "false";
        var srcFrom = "";
        var i18nPendingLable = "未办结";//未办结
        var i18nDoneLable = "已办结";//已办结
        var i18nHandingLable ="办理情况";//办理情况
        var i18nEdocArchiveModifyLable  = "归档公文修改日志";//归档公文修改日志
        var i18nDeleteLable = "删除";//删除
        var i18nSubjectLable = '标题';//标题
        var i18nImportanceLable = '重要程度';//重要程度
        var i18nImportanceWuLable = '无';//无
        var i18nImportancePutongLable = '普通';//普通
        var i18nImportanceZhongyaoLable = '重要';//重要
        var i18nImportancefeichangZhongyaoLable = '非常重要';//非常重要
        var i18nsenderLable = '发起人';//发起人
        var i18nsendtimeLable ='发起时间';//发起时间
        var i18ncycleLable = '流程期限';
        var i18nsaoyisaoLable = '扫一扫';


        var edoc_supervise_title = '文件标题';//公文标题
        var wordno_label = '公文文号';//公文文号
        var wordinno_label  = '内部文号';//内部文号
        var edoc_supervise_supervisor =  '督办人';//督办人
        var edoc_supervise_deadline =  '督办期限';//督办期限
        var secretlevel_simple  = '密级';//密级
        var secretlevel_secret  =  '秘密';//秘密
        var secretlevel_highlysecret = '机密';//机密
        var secretlevel_topsecret =  '绝密';//绝密
        var urgentlevel = '紧急程度';//紧急程度

        var pending_exigencyNames4 = '平急';//平急
        var pending_exigencyNames2 = '加急';//加急
        var pending_exigencyNames1 = '特急';//特急
        var pending_exigencyNames3 = '特提';//特提

        var sorttype_label = "类别";//类别
        var docmark_inner_send = "发文";//发文
        var docmark_inner_receive =  "收文";//收文
        var docmark_inner_signandreport =  "签报";//签报
        var docmark_inner_exchange =  "交换";//交换

        var collaboration_rule_date =  "结束时间不能早于开始时间";//开始时间不能早于结束时间

        var currentNodesInfo_label =  "当前待办人";//当前处理人信息
        var process_cycle_label = "流程期限";//流程期限
        var supervise_col_deadline =  "督办期限";//督办期限       ;
        var supervise_hasten_label = "催办";


        var supervise_form_bind_flow_label ="流程";//流程
        var supervise_col_description = "督办摘要";//督办摘要
        var collaboration_workflow_label_pleaseChoose = "请选择一条记录";//请选择一条督办记录!
        var collaboration_workflow_label_sureDelete = "你确定要删除该条记录吗?" ; //确定要删除督办记录?'
        var close_label =  "关闭";
        var overtop_true_title =  "流程已超期";
        var overtop_false_title ="流程未超期"; //流程未超期
        var superviseDetailList_secondary = "次" ; //次
        var supervise_col_label = "协同督办";//协同督办
        var supervise_edoc_label  = "公文督办";//
        var superviseDetailList_content = " [内容]" ; //[内容]
        var supervise_thisTimeXYouset = '您设置的督办日期小于当前日期,是否继续?'; //您设置的督办日期小于当前日期,是否继续? ;

        var collaboration_process_finished  = "该流程已结束,不允许修改!";
        var cancel_label  =  "取消" ;
        var ok_label =  "确定";
        var supervise_col_title_label = "催办记录";

        var revoked_record_lable = "撤销记录"//撤销记录
        var toback_record_lable = "回退记录"//回退记录
    </script>
</head>
<body class="h100b" onunload="">
<div id='layout'>
    <div class="layout_north f0f0f0" id="north">
        <table width="100%" border="0" cellpadding="0">
            <tr>
                <td><div id="toolbars"></div></td>
                <td style="padding-bottom:5px" width="60" align="center" valign="center">
                </td>
            </tr>
        </table>
    </div>
    <div class="layout_center over_hidden" id="center">
        <table  class="flexme3" id="listStudent"></table>
    </div>

</div>

</body>
</html>
