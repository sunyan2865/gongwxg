<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>内部传阅</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" charset="UTF-8" src="${path}/common/content/form.js${ctp:resSuffix()}"></script>
    <script type="text/javascript" charset="UTF-8" src="${path}/apps_res/govdoc/js/govdocBody.js${ctp:resSuffix()}"></script>
    <script type="text/javascript" charset="UTF-8" src="${path}/apps_res/demo/util.js${ctp:resSuffix()}"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/apps_res/demo/common/workflow/workflowDesigner_api-min.js${ctp:resSuffix()}"></script>

</head>
<body style="height:1500px">

<div style="clear: both;"></div>
<div id="mainbodyDiv" style="text-align: center;margin-top:50px;margin-left: 200px;">
    <table style="BORDER-TOP-STYLE: none; WORD-WRAP: break-word; WIDTH: 638px; BORDER-COLLAPSE: collapse; TABLE-LAYOUT: fixed; BORDER-BOTTOM-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none;" class="xdFormLayout">
        <colgroup><col style="WIDTH: 638px"></colgroup>
        <tbody>
        <tr class="xdTableContentRow" style="height: 140px;">
            <td class="xdTableContentCell" style="BORDER-TOP: #000000 1pt; BORDER-RIGHT: #bfbfbf 1pt; BORDER-BOTTOM: #bfbfbf 1pt; BORDER-LEFT: #bfbfbf 1pt" valign="top">
                <div align="center">
                    <table border="1" bordercolor="buttontext" style="WORD-WRAP: break-word; BORDER-TOP: medium none; BORDER-RIGHT: medium none; WIDTH: 636px; BORDER-COLLAPSE: collapse; TABLE-LAYOUT: fixed; BORDER-BOTTOM: medium none; BORDER-LEFT: medium none" class="xdLayout">
                        <colgroup>
                            <col style="WIDTH: 159px">
                            <col style="WIDTH: 157px">
                            <col style="WIDTH: 161px">
                            <col style="WIDTH: 159px">
                        </colgroup>
                        <tbody valign="top">

                        <tr style="min-height: 40px; height: 40px;">
                            <td style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225);border-top: 1px solid rgb(134, 184, 225); width: 200px;">
                                <div align="center">
                                    <font face="宋体" size="3" >文件标题</font>
                                </div>
                            </td>
                            <td style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); border-top: 1px solid rgb(134, 184, 225); width: 200px;" colspan="3">
                                <font face="方正小标宋简体" >
                                    <div>
                                        <input   id="bt" style="width:99%;height:30px;border: 0px" value="${swdata.bt}"/>
                                    </div>
                                </font>
                            </td>
                        </tr>

                      <%--  <tr style="min-height: 40px; height: 40px;">
                            <td style="BORDER-TOP:  1pt solid; BORDER-RIGHT: 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM:  1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT:  1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                <div align="center"><font face="宋体" size="3" >转阅人</font></div>
                            </td>
                            <td style="BORDER-TOP:  1pt solid; BORDER-RIGHT:  1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM:  1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT:  1pt solid; PADDING-RIGHT: 1px" colspan="3">
                                <span id="field0003_span" class="edit_class" fieldval="{name:&quot;field0003&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;create_person&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;member&quot;,formatType:&quot;1&quot;,value:&quot;&quot;}">
                                    <input type="text" onblur="calc(this);" class="xdTextBox validate comp" incondition="false"
                                           comp="&quot;type&quot;:&quot;selectPeople&quot;,&quot;departmentId&quot;:7697236995411888000,&quot;valueChange&quot;:orgFieldOnChange,&quot;isNeedCheckLevelScope&quot;:false,&quot;showAccountShortname&quot;:&quot;no&quot;,&quot;showAllOuterDepartment&quot;:true,&quot;showBtn&quot;:true,&quot;extendWidth&quot;:true,&quot;mode&quot;:&quot;open&quot;,&quot;panels&quot;:&quot;Department,Team,Post,Level,Outworker,RelatePeople,JoinOrganization&quot;,&quot;minSize&quot;:0,&quot;maxSize&quot;:190,&quot;selectType&quot;:&quot;Member&quot;,&quot;value&quot;:&quot;&quot;,&quot;text&quot;:&quot;&quot;"
                                           unique="false" name="field0003_txt" mappingfield="create_person" incalculate="false" id="field0003_txt" data-role="none" validate="name:&quot;create_person&quot;,type:&quot;string&quot;,china3char:true,notNull:false" readonly="readonly" comptype="selectPeople" _inited="1"  style="width: 200px; text-overflow: clip;" oldval="">
                                    <input type="hidden" id="field0003" name="field0003"  style="display: none;">
                                    <span _isrel="1" class="ico16 radio_people_16 _autoBtn"></span>
                                </span>
                            </td>
                        </tr>--%>

                        <tr style="min-height: 40px; height: 40px;">
                            <td style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                                <div align="center"><font face="宋体" size="3" >转阅人</font></div>
                            </td>
                            <td style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;" colspan="3">
                                <span id="zyr_span" class="edit_class" >
                                    <input id="zyrname"  type="text"  style="border:0px;background-color: #fef0d0;width: 200px; text-overflow: clip;"  class="xdTextBox validate comp" name="field0003_txt"  incalculate="false"  readonly="readonly"   >
                                     <span id="iconzyr" _isrel="1" class="ico16 radio_people_16 _autoBtn"></span>
                                </span>
                            </td>
                        </tr>


                        <tr style="min-height: 40px; height: 40px;">
                            <td style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                                <div align="center"><font face="宋体" size="3" >备注</font></div>
                            </td>
                            <td style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;"
                                colspan="3">
                                <div><font face="宋体"><strong>
                                        <span id="field0020_span" class="edit_class" fieldval="{name:&quot;field0020&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;text1&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;textarea&quot;,formatType:&quot;&quot;,value:&quot;&quot;}">
                                            <textarea  class="xdRichTextBox" id="bz" style="border:0px;width: 470px;height:300px"></textarea>
                                        </span>
                                </strong></font>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
    <div id="toolbar_4462223" style="margin-left: -57px;margin-top: 20px;" class="toolbar_l clearfix">
        <input id="_dealSubmit" type="button" class="common_button common_button_emphasize margin_r_5 hand" style="width: auto;max-width: none;min-width: 63px;" value="提交">
        <input id="_cancel" type="button" class="common_button common_button_seeyon margin_r_5 hand" style="width: auto;max-width: none;min-width: 63px;" value="取消">
    </div>
    <input id="summaryid" type="hidden" value="${summaryid}" />
    <input id="yformid" type="hidden" value="${swdata.id}" />
    <input id="formappid" type="hidden" value="${formappid}" />
    <input id="department" type="hidden" value="<%=AppContext.getCurrentUser().getDepartmentId()%>"/>
    <input id="selectzyrids" type="hidden"/>

</div>


<script type="text/javascript">
    $("#_dealSubmit").click(function(){
        var selectpeople=$('#selectzyrids').val();
        if(selectpeople.length==0){
            $.alert("请选择转阅人！");
            return;
        }

        $.ajax({
            url: _ctxPath + '/demo.do?method=toSaveZyxx',
            type:'POST',
            data:{
                wjbt:$('#bt').val(),
                yformid:$('#yformid').val(),
                summaryid:$('#summaryid').val(),
                selectzyr:$('#selectzyrids').val(),//转阅人
                formappid:$('#formappid').val(),
                bz:$('#bz').val()
            },
            error:function(res){
                $.alert("转阅成功!");
            },
            success:function (res) {
                $.alert("转阅成功!");
                window.close();
                window.opener.location.href=window.opener.location.href;
            }
        });
    });

    $("#_cancel").click(function(){
        window.close();
    });


    $("#zyr_span").click(function(){
        var url= _ctxPath + '/demo.do?method=toSelectPeopleView&department='+document.getElementById("department").value;
       // var options = "status=no,resizable=no,menubar=no,top=150,left=380,width=848,height=503,scrollbars=no,center:Yes;";
      // var options = "status=no,resizable=no,menubar=no,top=140,left=200,width=1209,height=513,scrollbars=no,center:Yes;";
         var options = "status=no,resizable=no,menubar=no,top=140,left=450,width=717,height=477,scrollbars=no,center:Yes;";
        window.open(url, null, options);
    });





</script>
</body>
</html>
