<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>校内请示修改</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" charset="UTF-8" src="${path}/common/content/form.js${ctp:resSuffix()}"></script>
    <script type="text/javascript" charset="UTF-8" src="${path}/apps_res/govdoc/js/govdocBody.js${ctp:resSuffix()}"></script>

</head>
<body style="height:1000px">
<div id="toolbar_4462223" style="float:right" class="toolbar_l clearfix">
    <a style="margin-right: 50px;margin-top: 20px;cursor: pointer;" class="common_button" onclick="saveSwxg()">
        <em id="saveDraft_em" class="ico16 save_traft_16"></em>
        <span id="saveDraft_span" class="menu_span" title="保存">保存</span>
    </a>
</div>
<div style="clear: both;"></div>
<div id="mainbodyDiv" style="height:100%;text-align: center;margin-top: 10px;margin-left: 70px;">
    <div align="center">
        <table style="BORDER-TOP-STYLE: none; WORD-WRAP: break-word; WIDTH: 679px; BORDER-COLLAPSE: collapse; TABLE-LAYOUT: fixed; BORDER-BOTTOM-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none"
               class="xdFormLayout">
            <colgroup>
                <col style="WIDTH: 679px">
            </colgroup>
            <tbody>
            <tr style="min-height: 466px; height: 466px;" class="xdTableContentRow">
                <td class="xdTableContentCell"
                    style="BORDER-TOP: #000000 1pt; BORDER-RIGHT: #bfbfbf 1pt; BORDER-BOTTOM: #bfbfbf 1pt; BORDER-LEFT: #bfbfbf 1pt"
                    valign="top">
                    <div align="center">
                        <table border="1" bordercolor="buttontext"
                               style="WORD-WRAP: break-word; BORDER-TOP: medium none; BORDER-RIGHT: medium none; WIDTH: 674px; BORDER-COLLAPSE: collapse; TABLE-LAYOUT: fixed; BORDER-BOTTOM: medium none; BORDER-LEFT: medium none"
                               class="xdLayout">
                            <colgroup>
                                <col style="WIDTH: 164px">
                                <col style="WIDTH: 190px">
                                <col style="WIDTH: 150px">
                                <col style="WIDTH: 170px">
                            </colgroup>
                            <tbody valign="top">
                            <tr style="min-height: 4px; height: 21px;">
                                <td style="BORDER-TOP: #000000 1pt; BORDER-RIGHT: #000000 1pt; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #000000 1pt; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent"
                                    colspan="4">
                                    <div align="center"><font face="宋体" color="#ff0000"
                                                              style="FONT-SIZE: 20pt"><strong></strong></font>&nbsp;
                                    </div>
                                    <div align="center"><font face="宋体" color="#ff0000" style="FONT-SIZE: 22pt"><strong>中国矿业大学校内请示</strong></font>
                                    </div>
                                    <div align="center"><strong><font face="宋体" size="6"
                                                                      color="#ff0000"></font></strong>&nbsp;
                                    </div>
                                </td>
                            </tr>
                            <tr style="min-height: 40px; height: 40px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>请示部门</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center">
                                        <font face="宋体">
                                            <strong>
                                                <div style="width: 0px; height: 0px; position: absolute;display:inline-block;">
                                                    <div id="newInputPosition" class="dddsas"></div>
                                                </div>
                                                <span id="field0001_span" class="edit_class"
                                                      fieldval="{name:&quot;field0001&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;send_unit&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;accountAndDepartment&quot;,formatType:&quot;&quot;,value:&quot;致远项目组hiddenValueDepartment|7697236995411887744&quot;}"><textarea
                                                        onpropertychange="this.style.posHeight=this.scrollHeight"
                                                        onblur="calc(this);" class="comp validate" incondition="false"
                                                        comp="isDuo:true,type:&quot;selectPeople&quot;,valueChange:orgFieldOnChange,showBtn:true,dan:1,showAllAccount:true,extendWidth:true,mode:&quot;open&quot;,panels:&quot;Account,Department,OrgTeam,ExchangeAccount&quot;,minSize:0,isCheckInclusionRelations:false,maxSize:0,selectType:&quot;Department,Account,OrgTeam,ExchangeAccount&quot;,value:&quot;Department|7697236995411887744&quot;,text:&quot;致远项目组&quot;,preCallback:selectOrgPreCallBack,callback:selectOrgCallBack,hasRelationField:false,isMasterField:true,fieldName:&quot;field0001&quot;,isMultipleAccountAndDepartment: true,isCanSelectGroupAccount:false,isCanEdit:true"
                                                        unique="false" name="field0001_txt" mappingfield="send_unit"
                                                        incalculate="false" id="field0001_txt" data-role="none"
                                                        validate="name:&quot;send_unit&quot;,type:&quot;string&quot;,china3char:true,maxLength:4000,notNull:false"
                                                        comptype="selectPeople" _inited="1" title="致远项目组" style="width: 169px;">致远项目组</textarea><input
                                                        type="hidden" id="field0001" name="field0001" field0001_txt="disabled"
                                                        hiddenvalue="Department|7697236995411887744"
                                                        value="致远项目组hiddenValueDepartment|7697236995411887744"
                                                        style="display: none;">
                                                    <span _isrel="1" class="ico16 check_dept_16 _autoBtn"></span>
                                                </span>
                                            </strong>
                                        </font>
                                    </div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center">
                                        <font face="宋体" size="4" color="#ff0000">
                                            <strong>起草人</strong>
                                        </font>
                                    </div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center">
                                        <font face="宋体" size="4" color="#ff0000">
                                            <strong>
                                                <span id="field0002_span" class="edit_class"
                                            fieldval="{name:&quot;field0002&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;create_person&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;member&quot;,formatType:&quot;1&quot;,value:&quot;9100857440388728146&quot;}"><input
                                            type="text" onblur="calc(this);" class="xdTextBox validate comp"
                                            incondition="false"
                                            comp="type:&quot;selectPeople&quot;,showOriginalElement:false,isNeedCheckLevelScope:false,showAccountShortname:&quot;no&quot;,showAllOuterDepartment:true,showBtn:true,extendWidth:true,panels:&quot;Department,Team,Post,Level,Outworker,RelatePeople,JoinOrganization&quot;,selectType:&quot;Member&quot;,value:&quot;Member|9100857440388728146&quot;,text:&quot;孙翠&quot;,minSize:0,maxSize:1,preCallback:selectOrgPreCallBack,callback:selectOrgCallBack,valueChange:orgFieldOnChange,hasRelationField:false,departmentId:7697236995411887744,isMasterField:true,fieldName:&quot;field0002&quot;"
                                            unique="false" name="field0002_txt" mappingfield="create_person"
                                            incalculate="false" id="field0002_txt" data-role="none"
                                            validate="name:&quot;create_person&quot;,type:&quot;string&quot;,china3char:true,notNull:false"
                                            readonly="readonly" comptype="selectPeople" _inited="1" title="孙翠"
                                            style="width: 146px; text-overflow: clip;">
                                                    <input type="hidden" id="field0002" name="field0002" value="Member|9100857440388728146" style="display: none;">
                                                    <span _isrel="1" class="ico16 radio_people_16 _autoBtn"></span>
                                                </span>
                                            </strong>
                                        </font>
                                    </div>
                                </td>
                            </tr>
                            <tr style="min-height: 40px; height: 40px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>请示标题</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent"
                                    colspan="3"><font face="宋体"><strong>
                                    <div align="left"><span id="field0003_span" class="editableSpan edit_class"
                                                            fieldval="{name:&quot;field0003&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;subject&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;textarea&quot;,formatType:&quot;&quot;,value:&quot;&quot;}"><textarea
                                            onblur="calc(this);" class="xdRichTextBox text_justify validate"
                                            incondition="false" unique="false" name="field0003" mappingfield="subject"
                                            incalculate="false" id="field0003" data-role="none"
                                            validate="name:&quot;subject&quot;,type:&quot;string&quot;,china3char:true,maxLength:255,notNull:true"
                                            finalwidth="503"
                                            style="background-color: rgb(252, 221, 139); width: 503px; overflow: hidden; height: 62px; white-space: pre-wrap;"></textarea></span>
                                    </div>
                                </strong></font></td>
                            </tr>
                            <tr style="min-height: 40px; height: 40px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>请示内容</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent"
                                    colspan="3">
                                    <div align="center"><font face="宋体"><strong><span id="field0004_span"
                                                                                      class="editableSpan edit_class"
                                                                                      fieldval="{name:&quot;field0004&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;text1&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;textarea&quot;,formatType:&quot;&quot;,value:&quot;&quot;}"><textarea
                                            onblur="calc(this);" class="xdRichTextBox text_justify validate"
                                            incondition="false" unique="false" name="field0004" mappingfield="text1"
                                            incalculate="false" id="field0004" data-role="none"
                                            validate="name:&quot;text1&quot;,type:&quot;string&quot;,china3char:true,maxLength:4000,notNull:true"
                                            finalwidth="503"
                                            style="background-color: rgb(252, 221, 139); width: 503px; overflow: hidden; height: 62px; white-space: pre-wrap;"></textarea></span></strong></font>
                                    </div>
                                </td>
                            </tr>
                            <tr style="min-height: 40px; height: 40px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>附件</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent"
                                    colspan="3">
                                    <div align="center"><font face="宋体"><strong><span id="field0005_span"
                                                                                      mappingfield="attachments"
                                                                                      class="edit_class"
                                                                                      fieldval="{name:&quot;field0005&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;fujian&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;attachment&quot;,formatType:&quot;&quot;,value:&quot;&quot;}"
                                                                                      style="display: inline-block;"><div
                                            class="comp"
                                            comp="type:'fileupload',callMethod:'fileValueChangeCallBack',delCallMethod:'fileDelCallBack',takeOver:false,isBR:true,canDeleteOriginalAtts:true,canFavourite:'true',notNull:'false',displayMode:'visible',autoHeight:true,applicationCategory:'2',embedInput:'field0005',attachmentTrId:'6137913307006453888'"
                                            attsdata="{}" comptype="fileupload" style="display: none;"><input
                                            type="text" style="display: none; width: 504px;" id="field0005"
                                            name="field0005" value=""></div><div id="attachmentArea6137913307006453888"
                                                                                 style="overflow-x: hidden; min-height: 24px; width: 484px;"
                                                                                 requrl="/seeyon/fileUpload.do?type=0&amp;inputId=undefined&amp;applicationCategory=2&amp;extensions=&amp;maxSize=&amp;isEncrypt=&amp;popupTitleKey=&amp;attachmentTrId=6137913307006453888&amp;embedInput=field0005&amp;callMethod=fileValueChangeCallBack&amp;takeOver=false"
                                                                                 delcallmethod="fileDelCallBack"
                                                                                 class="border_all left"></div><div
                                            style="display:none;"><iframe name="downloadFileFrame"
                                                                          id="downloadFileFrame" frameborder="0"
                                                                          width="0" height="0"></iframe></div><span
                                            class="ico16 affix_16" onclick="insertAttachmentPoi('6137913307006453888')"><input
                                            type="hidden" id="field0005_0_editAtt" value="true"></span></span></strong></font>
                                    </div>
                                </td>
                            </tr>
                            <tr style="min-height: 49px; height: 49px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4" color="#ff0000"><strong>请示部门意见</strong></font>
                                    </div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px"
                                    colspan="3">
                                    <div align="center"><font face="宋体"><strong><span id="field0006_span"
                                                                                      class="browse_class"
                                                                                      fieldval="{name:&quot;field0006&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;shenhe&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;edocflowdealoption&quot;,formatType:&quot;&quot;,value:&quot;&quot;}"><span
                                            id="field0006" name="field0006" incondition="false" readonly="false"
                                            unique="false" mappingfield="shenhe" incalculate="false" data-role="none"
                                            validate="name:&quot;shenhe&quot;,type:&quot;string&quot;,china3char:true,maxLength:4000"
                                            class="comp xdRichTextBox"
                                            style="border-color: rgb(204, 204, 204); white-space: pre-wrap; min-height: 14px; height: auto; width: 503px;"
                                            finalwidth="503"></span></span></strong></font></div>
                                </td>
                            </tr>
                            <tr style="min-height: 49px; height: 49px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4" color="#ff0000"><strong>党政办意见</strong></font>
                                    </div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px"
                                    colspan="3">
                                    <div align="center"><font face="宋体"><strong><span id="field0007_span"
                                                                                      class="browse_class"
                                                                                      fieldval="{name:&quot;field0007&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;niban&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;edocflowdealoption&quot;,formatType:&quot;&quot;,value:&quot;&quot;}"><span
                                            id="field0007" name="field0007" incondition="false" readonly="false"
                                            unique="false" mappingfield="niban" incalculate="false" data-role="none"
                                            validate="name:&quot;niban&quot;,type:&quot;string&quot;,china3char:true,maxLength:4000"
                                            class="comp xdRichTextBox"
                                            style="border-color: rgb(204, 204, 204); white-space: pre-wrap; min-height: 14px; height: auto; width: 503px;"
                                            finalwidth="503"></span></span></strong></font></div>
                                </td>
                            </tr>
                            <tr style="min-height: 49px; height: 49px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4" color="#ff0000"><strong>校领导意见</strong></font>
                                    </div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px"
                                    colspan="3">
                                    <div align="center"><font face="宋体"><strong><span id="field0008_span"
                                                                                      class="browse_class"
                                                                                      fieldval="{name:&quot;field0008&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;shenpi&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;edocflowdealoption&quot;,formatType:&quot;&quot;,value:&quot;&quot;}"><span
                                            id="field0008" name="field0008" incondition="false" readonly="false"
                                            unique="false" mappingfield="shenpi" incalculate="false" data-role="none"
                                            validate="name:&quot;shenpi&quot;,type:&quot;string&quot;,china3char:true,maxLength:4000"
                                            class="comp xdRichTextBox"
                                            style="border-color: rgb(204, 204, 204); white-space: pre-wrap; min-height: 14px; height: auto; width: 503px;"
                                            finalwidth="503"></span></span></strong></font></div>
                                </td>
                            </tr>
                            <tr style="min-height: 49px; height: 49px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4" color="#ff0000"><strong>主办部门意见</strong></font>
                                    </div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px"
                                    colspan="3">
                                    <div align="center"><font face="宋体"><strong><span id="field0009_span"
                                                                                      class="browse_class"
                                                                                      fieldval="{name:&quot;field0009&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;banli&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;edocflowdealoption&quot;,formatType:&quot;&quot;,value:&quot;&quot;}"><span
                                            id="field0009" name="field0009" incondition="false" readonly="false"
                                            unique="false" mappingfield="banli" incalculate="false" data-role="none"
                                            validate="name:&quot;banli&quot;,type:&quot;string&quot;,china3char:true,maxLength:4000"
                                            class="comp xdRichTextBox"
                                            style="border-color: rgb(204, 204, 204); white-space: pre-wrap; min-height: 14px; height: auto; width: 503px;"
                                            finalwidth="503"></span></span></strong></font></div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>

    </div>
    <input id="formid" type="hidden" value="${entity.id}"/>
    <input id="summaryid" type="hidden" value="${entity.summaryid}" /><%--公文主表edoc_summary的id--%>
    <input id="fjdatas"  />
</div>
<script type="text/javascript">
   /* $(document).ready(function(){
        initOption("field0001",${entity.field0001});//来文单位
        initOption("field0021",${entity.field0021});//收文机构代字编码
        initOption("field0011",${entity.field0011});//处理性质
        initOption("field0012",${entity.field0012});//缓急

        $.ajax({
            url: _ctxPath + '/demo.do?method=getJgdzData',
            type:'POST',
            data:{parent_id: $("#field0021").val(),ref_enumid:'5765437337868452209'},
            dataType: "json",
            success:function (res) {
                var list=res["data"];
                var obj=$("#field0022");
                obj.children().remove();
                obj.append("<option val4cal='0' value='' selected=''></option>");
                for(var i=0;i<list.length;i++){
                    obj.append("<option value="+list[i].id+" title="+list[i].showvalue+"  >"+list[i].showvalue+"</option>");
                }
                initOption("field0022",${entity.field0022});//机构代字
            }

        });
    });


    //保存form表单数据
    function saveSwxg(){
        var fjdata="";
        if($("#fjdatas").val()!=""){
            fjdata=JSON.parse($("#fjdatas").val());
        }
        var params={
            ID:$('#formid').val(),
            field0006:$('#field0006').val(), //文件标题
            field0001:$('#field0001').val(), //来文单位
            field0002:$('#field0002').val(), //来文编号
            field0013:$('#field0013').val(), //来文日期
            field0014:$('#field0014').val(), //收文日期
            field0021:$('#field0021').val(), //收文机构代字编码 G
            field0022:$('#field0022').val(), //收文机构代字名称
            field0024:$('#field0024').val(), //收文编号
            field0011:$('#field0011').val(),//处理性质
            field0003:$('#field0003').val(),//登记日期
            field0015:$('#field0015').val().replace("Member|",""),//登记人
            field0016:$('#field0016').val(),//办理期限
            field0005:$('#field0005').val(),//份数
            field0017:$('#field0017').val(),//页数
            field0012:$('#field0012').val(),//缓急
            field0018:formatdata($('#field0018').val()), //责任单位
            field0020:$('#field0020').val(),//备注
            field0019:$('#field0019').val(), //field0019  关联attachment中的sub_reference

        };
        $.ajax({
            url: _ctxPath + '/demo.do?method=toUpdateFormmain0081',
            type:'POST',
            data:{
                params:JSON.stringify(params),
                fjparams:JSON.stringify(fjdata["instance"]),
                att_reference:$('#summaryid').val()
            },
            error:function(res){
                $.alert("修改成功!");
            },
            success:function (res) {
                $.alert("修改成功!");
                window.close();
                window.opener.location.href=window.opener.location.href;
            }
        });
    }

    function getJgdzmcOption(){
        $.ajax({
            url: _ctxPath + '/demo.do?method=getJgdzData',
            type:'POST',
            data:{parent_id: $("#field0021").val(),ref_enumid:'5765437337868452209'},
            dataType: "json",
            success:function (res) {
                var list=res["data"];
                var obj=$("#field0022");
                obj.children().remove();
                obj.append("<option val4cal='0' value='' selected=''></option>");
                for(var i=0;i<list.length;i++){
                    obj.append("<option value="+list[i].id+" title="+list[i].showvalue+"  >"+list[i].showvalue+"</option>");
                }
            }
        });

    }


    //意见按钮事件
    function buttonClick(element){
        var  id_modstr=element.id;
        var arr=id_modstr.split('_');
        //arr[0]:id   arr[1]:字段名，更新的列  arr[2]：mod修改  del删除
        //alert(arr[0]+"===="+arr[1]+"===="+arr[2]+"==="+$("#"+arr[0]).val());
        $.ajax({
            url: _ctxPath + '/demo.do?method=toUpdateOpinion',
            type:'POST',
            data:{id: arr[0],zd:arr[1],operType:arr[2],content:$("#"+arr[0]).val()},
            success:function (res) {
                if('0'==res.code){
                    if(arr[2]=="mod"){
                        $.alert("修改成功!");
                    }else{
                        $.alert("删除成功！");
                        var obj=$("#div_"+arr[0]);
                        obj.remove();
                    }
                }else{
                    if(arr[2]=="mod"){
                        $.alert("修改失败!");
                    }else{
                        $.alert("删除失败！");
                    }
                }
            }
        });

    }

    /!**
     * 删除附件
     *!/
    function deletefj(fileurl){
        $.ajax({
            url: _ctxPath + '/demo.do?method=toDeleteFj',
            type:'POST',
            data:{file_url:param},
            error:function(res){
                $.alert("删除成功!");
            },
            success:function (res) {
                $.alert("删除成功!");
            }
        });
    }



    function initOption(component,id){
        var all_options = document.getElementById(component).options;
        for (i=0; i<all_options.length; i++){
            if (all_options[i].value == id)  // 根据option标签的ID来进行判断
            {
                all_options[i].selected = true;
            }
        }
    }


    function formatdata(str){
        if(null!=str || str!=''){
            var ci=str.indexOf("hiddenValueDepartment");
            return str.substring(ci,str.length).replace("hiddenValueDepartment","Department").replace("\n","").trim();
        }
    }
*/
</script>

</body>
</html>
