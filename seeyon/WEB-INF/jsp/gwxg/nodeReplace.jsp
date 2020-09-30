<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>替换节点</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" charset="UTF-8" src="${path}/common/content/form.js${ctp:resSuffix()}"></script>
</head>
<body>

<div style="clear: both;"></div>
<div id="mainbodyDiv" style="text-align: center;margin-top: 150px;margin-left: 150px">
    <table style="BORDER-TOP-STYLE: none; WORD-WRAP: break-word; WIDTH: 638px; BORDER-COLLAPSE: collapse; TABLE-LAYOUT: fixed; BORDER-BOTTOM-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none;" class="xdFormLayout">
        <tbody>
        <tr class="xdTableContentRow" style="height: 140px;">
            <td class="xdTableContentCell" style="BORDER-TOP: #000000 1pt; BORDER-RIGHT: #bfbfbf 1pt; BORDER-BOTTOM: #bfbfbf 1pt; BORDER-LEFT: #bfbfbf 1pt" valign="top">
                <div align="center">
                    <fieldset style="width:100%;height:150px">
                        <legend>替换节点</legend>
                        <table border="1" bordercolor="buttontext" style="padding-top:50px;WORD-WRAP: break-word; BORDER-TOP: medium none; BORDER-RIGHT: medium none; WIDTH: 636px; BORDER-COLLAPSE: collapse; TABLE-LAYOUT: fixed; BORDER-BOTTOM: medium none; BORDER-LEFT: medium none;margin-top:40px" class="xdLayout">
                            <tbody valign="top">

                            <tr style="min-height: 40px; height: 40px;">
                                <td style=" border:0px;VERTICAL-ALIGN: middle; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px;  PADDING-RIGHT: 1px">
                                    <div align="center">原节点人</div>
                                </td>
                                <td style=" border:0px;VERTICAL-ALIGN: middle; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px;  PADDING-RIGHT: 1px">
                                    <div>
                                        <font face="宋体">
                                            <div>
                                                <select name="oldnode" id="oldnode" style="width:100%"   >
                                                    <option val4cal="0" value="" selected=""></option>
                                                    <c:forEach items="${memberlist}" var="t">
                                                        <option value="${t.member_id}" title="${t.name}">${t.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </font>
                                    </div>
                                </td>

                                <td style=" border:0px;VERTICAL-ALIGN: middle; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px;  PADDING-RIGHT: 1px">
                                    <div align="center">现节点人</div>
                                </td>
                                <td style=" border:0px;VERTICAL-ALIGN: middle; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px;  PADDING-RIGHT: 1px">
                                <span class="edit_class" fieldval="{name:&quot;newnode&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;create_person&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;member&quot;,formatType:&quot;1&quot;,value:&quot;&quot;}">
                                    <input type="text" onblur="calc(this);" class="xdTextBox validate comp" incondition="false" comp="type:&quot;selectPeople&quot;,showOriginalElement:false,isNeedCheckLevelScope:false,showAccountShortname:&quot;no&quot;,showAllOuterDepartment:true,showBtn:true,extendWidth:true,panels:&quot;Department,Team,Post,Level,Outworker,RelatePeople,JoinOrganization&quot;,selectType:&quot;Member&quot;
                                           ,value:&quot;&quot;,text:&quot;&quot;,minSize:0,maxSize:1,preCallback:selectOrgPreCallBack,callback:selectOrgCallBack,valueChange:orgFieldOnChange,hasRelationField:false,departmentId:'',isMasterField:true,fieldName:&quot;newnode&quot;" unique="false" name="field0003_txt" mappingfield="create_person" incalculate="false" id="field0003_txt" data-role="none" validate="name:&quot;create_person&quot;,type:&quot;string&quot;,china3char:true,notNull:false" readonly="readonly" comptype="selectPeople" _inited="1"  style="width: 133px; text-overflow: clip;" oldval="">
                                    <input type="hidden" id="newnode" name="newnode"  style="display: none;">
                                    <span _isrel="1" class="ico16 radio_people_16 _autoBtn"></span>
                                 </span>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </fieldset>
                    <button type="button" onclick="saveBtn()" style='background-color:#a7d0f6;border:1px solid #D4D4D4;text-align:center;width:60px;height:30px;margin-top:20px'>确定</button>
                    <button type="button" onclick="cancelBtn()" style='background-color:lightgray;border:1px solid #e7e4e4;text-align:center;width:60px;height:30px;margin-top:20px'>取消</button>

                </div>
            </td>
        </tr>
        </tbody>
    </table>
    <input type="hidden" id="summaryid" value="${summaryid}"/>
</div>


<script type="text/javascript">

     //保存
     function saveBtn(){
         var oldmemberid=$("#oldnode").val();
         var newmemberid=$("#newnode").val().replace('Member|','');
         if(oldmemberid==''){
             $.alert("请选择【原节点人】");
             return;
         }
         if(newmemberid==''){
             $.alert("请选择【现节点人】");
             return;
         }
         $.ajax({
             url: _ctxPath + '/demo.do?method=toUpdateNodeReplace',
             type:'POST',
             data:{
                     summaryid: $("#summaryid").val(),
                     affairid:$("#affairid").val(),
                     oldmemberid:oldmemberid,
                     newmemberid:newmemberid
             },
             success:function (res) {
                 var code=res["code"];
                 if(code=="0"){
                     $.alert("保存成功！");
                     window.close();
                 }else{
                     $.alert("保存失败！");
                 }
             }
         });
     }
    //取消
    function cancelBtn(){
        window.close();
    }
</script>
</body>
</html>
