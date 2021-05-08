<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>校内信息修改</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" charset="UTF-8" src="${path}/common/content/form.js${ctp:resSuffix()}"></script>
    <script type="text/javascript" charset="UTF-8" src="${path}/apps_res/govdoc/js/govdocBody.js${ctp:resSuffix()}"></script>
    <script type="text/javascript" charset="UTF-8" src="${path}/apps_res/demo/util.js${ctp:resSuffix()}"></script>
    <style type="text/css">
        .opinionclass{
            width:175px;
            height:100%;
            border:none;
        }
    </style>
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
        <table style="BORDER-TOP-STYLE: none; WORD-WRAP: break-word; WIDTH: 679px; BORDER-COLLAPSE: collapse; TABLE-LAYOUT: fixed; BORDER-BOTTOM-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none" class="xdFormLayout">
            <colgroup>
                <col style="WIDTH: 679px">
            </colgroup>
            <tbody>
            <tr style="min-height: 672px; height: 672px;" class="xdTableContentRow">
                <td class="xdTableContentCell"
                    style="BORDER-TOP: #000000 1pt; BORDER-RIGHT: #bfbfbf 1pt; BORDER-BOTTOM: #bfbfbf 1pt; BORDER-LEFT: #bfbfbf 1pt" valign="top">
                    <div align="center">
                        <table border="1" bordercolor="buttontext" style="WORD-WRAP: break-word; BORDER-TOP: medium none; BORDER-RIGHT: medium none; WIDTH: 674px; BORDER-COLLAPSE: collapse; TABLE-LAYOUT: fixed; BORDER-BOTTOM: medium none; BORDER-LEFT: medium none" class="xdLayout">
                            <colgroup>
                                <col style="WIDTH: 164px">
                                <col style="WIDTH: 39px">
                                <col style="WIDTH: 151px">
                                <col style="WIDTH: 150px">
                                <col style="WIDTH: 170px">
                            </colgroup>
                            <tbody valign="top">
                            <tr style="min-height: 53px; height: 53px;">
                                <td style="BORDER-TOP: #000000 1pt; BORDER-RIGHT: #000000 1pt; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #000000 1pt; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent"
                                    colspan="5">
                                    <div align="center"><font face="宋体" color="#ff0000"
                                                              style="FONT-SIZE: 20pt"><strong></strong></font>&nbsp;
                                    </div>
                                    <div align="center"><font face="宋体" color="#ff0000" style="FONT-SIZE: 22pt"><strong>中国矿业大学校内信息</strong></font>
                                    </div>
                                    <div align="center"><strong><font face="宋体" size="6"
                                                                      color="#ff0000"></font></strong>&nbsp;
                                    </div>
                                </td>
                            </tr>
                            <tr style="min-height: 40px; height: 40px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center">
                                        <font face="宋体" size="4" color="#ff0000">
                                            <strong>文件标题</strong>
                                        </font>
                                    </div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent"
                                    colspan="4">
                                    <div>
                                        <font face="宋体">
                                            <div>
                                                <input   id="field0001" style="width:99%;height:30px;border:1px solid #D4D4D4" value="${entity.field0001}"/>
                                            </div>
                                        </font>
                                    </div>
                                </td>
                            </tr>

                            <tr style="min-height: 40px; height: 40px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>处理性质</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px"
                                    colspan="2">
                                    <div >
                                        <span id="field0002_span" class="edit_class" fieldval="{name:&quot;field0002&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;list2&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;select&quot;,formatType:&quot;&quot;,value:&quot;&quot;}">
                                            <select name="field0002" id="field0002" style="width:100%" >
                                                    <option val4cal="0" value="" selected=""></option>
                                                    <c:forEach items="${clxzoption}" var="t">
                                                        <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                                    </c:forEach>
                                                </select>
                                        </span>
                                    </div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>登记日期</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px">
                                    <div >
                                        <font face="宋体">
                                            <input  id="field0003" name="field0003"  type="text" value="${entity.field0003}" comp="type:&quot;calendar&quot;,cache:false,isOutShow:true,ifFormat:&quot;%Y-%m-%d&quot;" class="validate xdRichTextBox comp" incalculate="false" comptype="calendar"  style="width: 165px;" finalwidth="165">
                                        </font>
                                    </div>
                                </td>
                            </tr>
                            <tr style="min-height: 40px; height: 40px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>登记人</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px"
                                    colspan="2">
                                    <div >
                                        <font face="宋体" size="4" color="#ff0000">
                                            <span id="field0004_span" class="edit_class" fieldval="{name:&quot;field0004&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;create_person&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;member&quot;,formatType:&quot;1&quot;,value:&quot;-4120520206381135530&quot;}">
                                                    <input type="text" onblur="calc(this);" class="xdTextBox validate comp" incondition="false" comp="type:&quot;selectPeople&quot;,showOriginalElement:false,isNeedCheckLevelScope:false,showAccountShortname:&quot;no&quot;,showAllOuterDepartment:true,showBtn:true,extendWidth:true,panels:&quot;Department,Team,Post,Level,Outworker,RelatePeople,JoinOrganization&quot;,selectType:&quot;Member&quot;
                                                    ,value:&quot;Member|${entity.field0004}&quot;,text:&quot;${entity.name}&quot;,minSize:0,maxSize:1,preCallback:selectOrgPreCallBack,callback:selectOrgCallBack,valueChange:orgFieldOnChange,hasRelationField:false,departmentId:${entity.org_department_id},isMasterField:true,fieldName:&quot;field0004&quot;" unique="false" name="field0004txt" mappingfield="create_person" incalculate="false" id="field0004_txt" data-role="none" validate="name:&quot;create_person&quot;,type:&quot;string&quot;,china3char:true,notNull:false" readonly="readonly" comptype="selectPeople" _inited="1"  style="width: 178px; text-overflow: clip;" oldval=${entity.name}>

                                                     <input type="hidden" id="field0004" name="field0004"  style="display: none;">
                                                  <span _isrel="1" class="ico16 radio_people_16 _autoBtn"></span>
                                              </span>
                                        </font>
                                    </div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>办理期限</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px">
                                    <div>
                                        <font face="宋体">
                                            <input  id="field0005" name="field0005"  type="text" value="${entity.field0005}" comp="type:&quot;calendar&quot;,cache:false,isOutShow:true,ifFormat:&quot;%Y-%m-%d&quot;" class="validate xdRichTextBox comp" incalculate="false" comptype="calendar"  style="width: 165px;" finalwidth="165">
                                        </font>
                                    </div>
                                </td>
                            </tr>
                            <tr style="min-height: 40px; height: 40px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>份数</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px"
                                    colspan="2">
                                    <div ><font face="宋体">
                                        <input id="field0006" style="width:98%;height:30px;border:1px solid #D4D4D4"  value="${entity.field0006}"/>
                                    </font>
                                    </div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>页数</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px">
                                    <div ><font face="宋体">
                                        <input id="field0007" style="width:98%;height:30px;border:1px solid #D4D4D4"  value="${entity.field0007}"/>
                                    </font>
                                    </div>
                                </td>
                            </tr>
                            <tr style="min-height: 40px; height: 40px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>缓急</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px"
                                    colspan="2">
                                    <div >
                                        <font face="宋体">
                                            <select level="0" id="field0008" name="field0008" style="width:100%" >
                                                <option val4cal="0" value="" selected=""></option>
                                                <option val4cal="6" value="3586464229258313866">一般</option>
                                                <option val4cal="2" value="426">紧急</option>
                                                <option val4cal="3" value="427">加急</option>
                                            </select>
                                        </font>
                                    </div>
                                </td>
                                <%-- <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt; PADDING-RIGHT: 1px"
                                     colspan="2">
                                     <div align="center">&nbsp;</div>
                                 </td>--%>
                                <%--   <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                       <div align="center"><font face="宋体" size="3" color="#ff0000">公开方式</font></div>
                                   </td>--%>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>公开方式</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                    <font face="宋体">
                                        <div align="left">
                                            <%--     <input id="field0014" style="width:100%;height:100%;border:none" value="${entity.field0014}"/>
                                            --%>
                                            <%--  <select level="0" id="field0014" name="field0014" style="width:100%" >
                                                  <option val4cal="0" value="" selected=""></option>
                                                  <option val4cal="0" value="-7932555032561041306">主动公开</option>
                                                  <option val4cal="1" value="-6555425946729429389">依申请公开</option>
                                                  <option val4cal="2" value="-3786602079642825131">不公开</option>
                                              </select>--%>

                                            <select name="field0009" id="field0009" style="width:100%"  >
                                                <option val4cal="0" value="" selected=""></option>
                                                <c:forEach items="${gkfsoption}" var="t">
                                                    <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </font>
                                </td>
                            </tr>
                            <tr style="min-height: 40px; height: 40px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>责任单位</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px"
                                    colspan="4">
                                    <div ><font face="宋体">
                                        <input readonly="readonly" id="field0010s" style="width:98%;height:30px;border:1px solid #D4D4D4"  value="${entity.zrdwmc}"></input>
                                        <input type="hidden" id="field0010" name="field0010" style="display: none;" value="${entity.field0010}">
                                           <%-- <span id="field0010_span" class="edit_class" fieldval="{name:&quot;field0010&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;undertakenoffice&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;accountAndDepartment&quot;,formatType:&quot;&quot;,value:&quot;&quot;}">
                                                <textarea readonly="readonly" onpropertychange="this.style.posHeight=this.scrollHeight" onblur="calc(this);" class="comp validate" incondition="false"
                                                          comp="isDuo:true,type:&quot;selectPeople&quot;,valueChange:orgFieldOnChange,showBtn:true,dan:1,showAllAccount:true,extendWidth:true,mode:&quot;open&quot;,panels:&quot;Account,Department,OrgTeam,ExchangeAccount&quot;,minSize:0,isCheckInclusionRelations:false,maxSize:0,selectType:&quot;Department,Account,OrgTeam,ExchangeAccount&quot;,preCallback:selectOrgPreCallBack,callback:selectOrgCallBack,hasRelationField:false,isMasterField:true,fieldName:&quot;field0010&quot;,isMultipleAccountAndDepartment: true,isCanEdit:true
                                                          ,&quot;value&quot;:&quot;${entity.field0010}&quot;,&quot;text&quot;:&quot;${entity.zrdwmc}&quot;" unique="false" name="field0010_txt" mappingfield="undertakenoffice" incalculate="false" id="field0010_txt" data-role="none" validate="name:&quot;undertakenoffice&quot;,type:&quot;string&quot;,china3char:true,maxLength:4000,notNull:false" comptype="selectPeople" _inited="1" style="width: 487px;" title=&quot;${entity.zrdwmc}&quot; oldval=&quot;${entity.zrdwmc}&quot;>
                                                </textarea>
                                                <input type="hidden" id="field0010" name="field0010" style="display: none;">
                                                <span _isrel="1" class="ico16 check_dept_16 _autoBtn"></span>
                                            </span>--%>
                                        </font>
                                    </div>
                                </td>
                            </tr>
                            <tr style="min-height: 40px; height: 40px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>附件</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px"
                                    colspan="4">
                                    <div>
                                        <font face="宋体">
                                            <div align="left" >
                                                <span class="xdlabel"></span>
                                                <!--动态-->
                                                <span id="field0011_span" mappingfield="attachments" class="edit_class" fieldval="{name:&quot;field0011&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;attachments&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;attachment&quot;,formatType:&quot;&quot;,value:&quot;&quot;}" style="display: inline-block;">
                                                    <div class="comp" comp="type:'fileupload',callMethod:'fileValueChangeCallBack',delCallMethod:'fileDelCallBack',takeOver:false,isBR:true,canDeleteOriginalAtts:true,canFavourite:'true',notNull:'false',displayMode:'visible',autoHeight:true,applicationCategory:'2',embedInput:'field0011',attachmentTrId:'1209558887199034033'"
                                                         attsdata="${fjsonArray}" comptype="fileupload" style="display: none;">
                                                        <input type="text" <%--style="display: none; width: 474px;"--%> id="field0011" name="field0011" value="${entity.field0011}">
                                                    </div>
                                                    <div id="attachmentArea-1694224470510517265" style="overflow-x: hidden; min-height: 24px; width: 450px;" requrl="/seeyon/fileUpload.do?type=0&amp;inputId=undefined&amp;applicationCategory=2&amp;extensions=&amp;maxSize=&amp;isEncrypt=&amp;popupTitleKey=&amp;attachmentTrId=-1694224470510517265&amp;embedInput=field0011" class="left">
                                                        <c:forEach items="${fjlist}" var="fj">
                                                            <div id="attachmentDiv_${fj.file_url}" class="attachment_block attachmentShowDelete" style="font-size:12px; max-width:454px; float:left; line-height:22px;*line-height:22px;background:#e6eef7;padding:2px 10px;border-radius:3px; overflow:hidden; word-wrap:break-word; word-break:break-all;"<%-- onmouseenter="onAttachmentMouseEnter(this)" onmouseleave="onAttachmentMouseLeave(this)"--%>>&nbsp;
                                                                <span style="word-wrap:break-word; word-break:break-all;" class="ico16 doc_16 margin_r_5"></span>
                                                                <a  href="/seeyon/filedown.do?method=fileDownload_zdy&amp;fileurl=${fj.file_url}&amp;createDate=${fj.date}&amp;filename=${fj.filename}" title=${fj.filename} target="downloadFileFrame" style="font-size:12px;color:#757575;">
                                                                    <span id="field0011_txt" style="line-height:normal">${fj.filename}(${fj.filesize}KB)</span>
                                                                </a>
                                                                <span class="ico16 affix_del_16" title="删除" onclick="deletefj('${fj.file_url}')"></span>&nbsp;
                                                            </div>
                                                        </c:forEach>
                                                  </div>

                                                   <div style="display:none;">
                                                        <iframe name="downloadFileFrame" id="downloadFileFrame" frameborder="0" width="0" height="0"></iframe>
                                                    </div>
                                                    <span class="ico16 affix_16" onclick="insertAttachmentPoi('1209558887199034033')">
                                                        <input type="hidden" id="field0011_0_editAtt" value="true">
                                                    </span>
                                                </span>
                                            </div>

                                        </font>
                                    </div>
                                </td>
                            </tr>
                            <tr style="min-height: 40px; height: 40px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>备注</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px"
                                    colspan="4">
                                    <div><font face="宋体"><strong>
                                        <span id="field0012_span" class="edit_class" fieldval="{name:&quot;field0012&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;text1&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;textarea&quot;,formatType:&quot;&quot;,value:&quot;&quot;}">
                                            <textarea  class="xdRichTextBox" id="field0012" style="width: 503px;">${entity.field0012}</textarea>
                                        </span>
                                    </strong></font>
                                    </div>
                                </td>
                            </tr>
                            <tr style="min-height: 49px; height: 49px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>党政办拟办意见</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px"
                                    colspan="4">
                                    <div ><font face="宋体">

                                        <c:forEach items="${dzbList}" var="op">
                                            <div id="div_${op.id}">
                                                <input type="hidden" value="${op.id}"/>
                                                <div style="float: left;width: 100%;" class="font-s">
                                                    <input id="${op.id}" style="width:98%;height:28px;;border:1px solid #D4D4D4" value="${op.content}"/>
                                                </div>
                                                <div style="width: 490px;">
                                                    <div style="float:right;padding-right:30px;padding-top:5px;padding-bottom:5px;" class="font-s">
                                                        <input readonly="readonly" class="opinionclass" value="${op.username} ${op.createTime}"></input>
                                                        <button type="button" style="background-color: lightskyblue;font-weight:bold" class="common_button" id="${op.id}_field0013_mod" onclick="buttonClick(this)" >修改保存</button>
                                                        <button type="button" style="background-color:#ea9191;font-weight:bold"  class="common_button" id="${op.id}_field0013_del" onclick="buttonClick(this)">删除</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>

                                    </font></div>
                                </td>
                            </tr>
                            <tr style="min-height: 49px; height: 49px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>校领导批示意见</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px"
                                    colspan="4">
                                    <div >
                                        <font face="宋体">
                                            <c:forEach items="${xldpsList}" var="op">
                                                <div id="div_${op.id}">
                                                    <input type="hidden" value="${op.id}"/>
                                                    <div style="float: left;width: 100%;" class="font-s">
                                                        <input id="${op.id}" style="width:98%;height:28px;;border:1px solid #D4D4D4" value="${op.content}"/>
                                                    </div>
                                                    <div style="width: 490px;">
                                                        <div style="float:right;padding-right:30px;padding-top:5px;padding-bottom:5px;" class="font-s">
                                                            <input readonly="readonly" class="opinionclass" value="${op.username} ${op.createTime}"></input>
                                                            <button type="button" style="background-color: lightskyblue;font-weight:bold" class="common_button" id="${op.id}_field0014_mod" onclick="buttonClick(this)" >修改保存</button>
                                                            <button type="button" style="background-color:#ea9191;font-weight:bold"  class="common_button" id="${op.id}_field0014_del" onclick="buttonClick(this)">删除</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                        </font></div>
                                </td>
                            </tr>
                            <tr style="min-height: 49px; height: 49px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4" color="#ff0000"><strong>部门承办意见</strong></font>
                                    </div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px"
                                    colspan="4">
                                    <div ><font face="宋体">

                                        <c:forEach items="${bmList}" var="op">
                                            <div id="div_${op.id}">
                                                <input type="hidden" value="${op.id}"/>
                                                <div style="float: left;width: 100%;" class="font-s">
                                                    <input id="${op.id}" style="width:98%;height:28px;;border:1px solid #D4D4D4" value="${op.content}"/>
                                                </div>
                                                <div style="width: 490px;">
                                                    <div style="float:right;padding-right:30px;padding-top:5px;padding-bottom:5px;" class="font-s">
                                                        <input readonly="readonly" class="opinionclass" value="${op.username} ${op.createTime}"></input>
                                                        <button type="button" style="background-color: lightskyblue;font-weight:bold" class="common_button" id="${op.id}_field0015_mod" onclick="buttonClick(this)" >修改保存</button>
                                                        <button type="button" style="background-color:#ea9191;font-weight:bold"  class="common_button" id="${op.id}_field0015_del" onclick="buttonClick(this)">删除</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </font></div>
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
    <input id="fields0019" type="hidden" value="${entity.field0011}" />
    <input id="fjdatas"   type="hidden"/>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        initOption("field0002",${entity.field0002});//处理性质
        initOption("field0008",${entity.field0008});//缓急
        initOption("field0009",${entity.field0009});//公开方式默认值

        var text = document.getElementById("field0012");
        makeExpandingArea(text);
    });


    //保存form表单数据
    function saveSwxg(){
        var fjdata="";
        if($("#fjdatas").val()!=""){
            fjdata=JSON.parse($("#fjdatas").val());
        }
        var params={
            ID:$('#formid').val(),
            field0001:$('#field0001').val(), //文件标题
            field0002:$('#field0002').val(),//处理性质
            field0003:$('#field0003').val(),//登记日期
            field0004:$('#field0004').val().replace("Member|",""),//登记人
            field0005:$('#field0005').val(),//办理期限
            field0006:$('#field0006').val(),//份数
            field0007:$('#field0007').val(),//页数
            field0008:$('#field0008').val(),//缓急
            field0010:formatdata($('#field0010').val()), //责任单位
            field0012:$('#field0012').val(),//备注
            field0011:$('#field0011').val(), //field0011  关联attachment中的sub_reference
            field0009:$('#field0009').val() //公开方式
        };
        $.ajax({
            url: _ctxPath + '/demo.do?method=toUpdateFormmain0301',
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

</script>

</body>
</html>
