<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
    <title>发文修改</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" charset="UTF-8" src="${path}/common/content/form.js${ctp:resSuffix()}"></script>
    <script type="text/javascript" charset="UTF-8" src="${path}/apps_res/govdoc/js/govdocBody.js${ctp:resSuffix()}"></script>
    <script type="text/javascript" charset="UTF-8" src="${path}/apps_res/govdoc/js/govdoc_common.js${ctp:resSuffix()}"></script>
    <script type="text/javascript" charset="UTF-8" src="${path}/apps_res/info/js/content.js${ctp:resSuffix()}"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/common/office/license.js?v="+new Date().getTime()></script>
    <script type="text/javascript" charset="UTF-8" src="${path}/common/office/js/baseOffice.js${ctp:resSuffix()}"></script>


</head>
<body>
<div id="toolbar_4462223" style="float:right" class="toolbar_l clearfix">
 <%--   <a  href="/seeyon/filedown.do?method=fileDownload_zdy&amp;fileurl=${zwdata.content}&amp;createDate=${zwdata.date}&amp;filename=${entity.field0005}正文.doc" style="margin-right: 50px;margin-top: 20px;cursor: pointer;" class="common_button"  id="contentGovdoc_a" onclick="downloadZw()">&lt;%&ndash;&ndash;%&gt;
        <em id="contentGovdoc_em" class="ico16 text_type_16"></em>
        <span id="contentGovdoc_span" class="menu_span" title="正文">正文下载</span>
    </a>--%>
    <a style="margin-right: 50px;margin-top: 20px;cursor: pointer;" class="common_button" onclick="save()">
        <em id="saveDraft_em" class="ico16 save_traft_16"></em>
        <span id="saveDraft_span" class="menu_span" title="保存">保存</span>
    </a>
</div>
<%--
<input type="hidden" id="govdocBodyType" name="govdocBodyType" value="OfficeWord">
--%>

<div style="clear: both;"></div>
<div id="mainbodyDiv" style="text-align: center;margin-top:-10px;margin-left: 200px;">
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
                        <tr style="min-height: 89px; height: 89px;">
                            <td style="VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; BORDER-LEFT-COLOR:; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; BORDER-RIGHT-STYLE: none; PADDING-LEFT: 1px; BORDER-RIGHT-COLOR: ; PADDING-RIGHT: 1px;border:none" colspan="4">
                                <div align="center">
                                    <font face="方正小标宋简体" color="#ff0000" style="FONT-SIZE: 20pt">中国矿业大学发文审批单</font>
                                </div>
                            </td>
                        </tr>
                        <tr style="min-height: 40px; height: 40px;">
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center">
                                    <font face="宋体" size="3" color="#ff0000">文件标题</font>
                                </div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px" colspan="3">
                                <font face="方正小标宋简体" >
                                    <div>
                                        <input   id="field0005" style="width:99%;height:30px;border:1px solid #D4D4D4" value="${entity.field0005}"/>
                                    </div>
                                </font>
                            </td>
                        </tr>
                        <tr style="min-height: 40px; height: 40px;">
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center"><font face="宋体" size="3" color="#ff0000">文种</font></div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <font face="方正小标宋简体" color="#ff0000">
                                    <div>
                                        <%--<input id="field0015" style="width:100%;height:100%;border:none" value="${entity.field0015}"/>--%>
                                        <select level="0" id="field0015" name="field0015" style="width:100%" >
                                            <option val4cal="0" value="" selected=""></option>
                                            <option val4cal="1" value="401111">公报</option>
                                            <option val4cal="2" value="402">决议</option>
                                            <option val4cal="3" value="403">决定</option>
                                            <option val4cal="4" value="404">命令（令）</option>
                                            <option val4cal="5" value="405">公告</option>
                                            <option val4cal="6" value="406">通告</option>
                                            <option val4cal="15" value="414">意见</option>
                                            <option val4cal="7" value="407">通知</option>
                                            <option val4cal="8" value="408">通报</option>
                                            <option val4cal="11" value="410">报告</option>
                                            <option val4cal="9" value="409">请示</option>
                                            <option val4cal="12" value="411">批复</option>
                                            <option val4cal="10" value="415">议案</option>
                                            <option val4cal="14" value="413">函</option>
                                            <option val4cal="13" value="412">纪要</option>
                                            <option val4cal="16" value="2017101201">保留</option>
                                            <option val4cal="17" value="2017101202">其他</option>
                                        </select>
                                    </div>
                                </font></td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center"><font face="宋体" size="3" color="#ff0000">文件类型</font></div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div>
                                    <font face="宋体">
                                        <div>
                                            <%--  <input id="field0023" style="width:100%;height:100%;border:none" value="${entity.field0023}"/>--%>
                                            <select name="field0023" id="field0023" style="width:100%" onchange="getJgdzOption()"   >
                                                <option val4cal="0" value="" selected=""></option>
                                                <c:forEach items="${wjlxoption}" var="t">
                                                    <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </font>
                                </div>
                            </td>
                        </tr>
                        <tr style="min-height: 40px; height: 40px;">
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center">
                                    <font face="宋体" size="3" color="#ff0000">机构代字</font>
                                </div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <font face="方正小标宋简体" color="#ff0000" onchange="getWjbh()"   >
                                    <div>
                                        <div>
                                            <%-- <input  style="width:100%;height:100%;border:none" value="${entity.field0024}"/>--%>
                                            <select name="field0024" id="field0024" style="width:100%"  >
                                                <%-- <option val4cal="0" value="" selected=""></option>
                                                <c:forEach items="${jgdzoption}" var="t">
                                                     <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                                 </c:forEach>--%>
                                            </select>
                                        </div>
                                    </div>
                                </font>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center">
                                    <font face="宋体" size="3" color="#ff0000">文件流水号</font>
                                </div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div>
                                    <font face="宋体">
                                        <div>
                                            <input id="field0025" onkeypress="getWjbh()" onchange="getWjbh()" style="width:98%;height:30px;border:1px solid #D4D4D4" value="${entity.field0025}"/>
                                        </div>
                                    </font>
                                </div>
                            </td>
                        </tr>
                        <tr style="min-height: 40px; height: 40px;">
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center">
                                    <font face="宋体" size="3" color="#ff0000">文件编号</font>
                                </div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px"
                                colspan="3">
                                <font face="方正小标宋简体" color="#ff0000">
                                    <div>
                                        <div>
                                            <input id="field0026" style="width:99%;height:30px;border:1px solid #D4D4D4" value="${entity.field0026}"/>
                                        </div>
                                    </div>
                                </font>
                            </td>
                        </tr>
                        <tr style="min-height: 40px; height: 40px;">
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center">
                                    <font face="宋体" size="3" color="#ff0000">缓急程度</font>
                                </div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <font face="宋体">
                                    <div>
                                        <%--     <input id="field0008" style="width:100%;height:100%;border:none" value="${entity.field0008}"/>
                                        --%>
                                        <select level="0" id="field0008" name="field0008" style="width:100%" >
                                            <option val4cal="0" value="" selected=""></option>
                                            <option val4cal="6" value="3586464229258313866">一般</option>
                                            <option val4cal="2" value="426">紧急</option>
                                            <option val4cal="3" value="427">加急</option>
                                        </select>
                                    </div>
                                </font>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center"><font face="宋体" size="3" color="#ff0000">拟稿日期</font></div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="left">
                                    <input  id="field0016" name="field0016"  type="text" value="${entity.field0016}" comp="type:&quot;calendar&quot;,cache:false,isOutShow:true,ifFormat:&quot;%Y-%m-%d&quot;" class="validate xdRichTextBox comp" incalculate="false" comptype="calendar"  style="width: 136px;" finalwidth="136">
                                    <%--    <input id="field0016" style="width:100%;height:100%;border:none" value="${entity.field0016}"/>
                                   --%>
                                </div>
                            </td>
                        </tr>
                        <tr style="min-height: 40px; height: 40px;">
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center"><font face="宋体" size="3" color="#ff0000">拟稿部门</font></div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <font face="宋体">
                                                   <span id="field0011_span" class="editableSpan edit_class" fieldval="{name:&quot;field0011&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;send_department&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;department&quot;,formatType:&quot;1&quot;}">
                                                       <input type="text" onblur="calc(this);" class="comp validate" incondition="false" comp="&quot;type&quot;:&quot;selectPeople&quot;,&quot;valueChange&quot;:orgFieldOnChange,&quot;showBtn&quot;:true,&quot;extendWidth&quot;:true,&quot;mode&quot;:&quot;open&quot;,&quot;panels&quot;:&quot;Department&quot;,&quot;isAllowContainsChildDept&quot;:true,&quot;isConfirmExcludeSubDepartment&quot;:false,&quot;selectType&quot;:&quot;Department&quot;,&quot;minSize&quot;:0,&quot;maxSize&quot;:1,&quot;preCallback&quot;:selectOrgPreCallBack,&quot;callback&quot;:selectOrgCallBack,&quot;hasRelationField&quot;:false,&quot;isMasterField&quot;:true,&quot;fieldName&quot;:&quot;field0011&quot;
                                                            ,&quot;value&quot;:&quot;Department|${entity.field0011}&quot;,&quot;text&quot;:&quot;${entity.ngbm}&quot;" unique="false" name="field0011_txt" mappingfield="send_department" incalculate="false" id="field0011_txt" data-role="none" validate="name:&quot;send_department&quot;,type:&quot;string&quot;,china3char:true,notNull:true" readonly="readonly" comptype="selectPeople" _inited="1"  style="background-color: rgb(255, 255, 255); width: 136px; text-overflow: clip;" >
                                                       <input type="hidden" id="field0011" name="field0011" style="background-color: rgb(255, 255, 255); display: none;">
                                                       <span _isrel="1" class="ico16 radio_dept_16 _autoBtn"></span>
                                                   </span>
                                </font>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center"><font face="宋体" size="3" color="#ff0000">联系电话</font></div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <font face="宋体" size="3" color="#ff0000">
                                    <div>
                                        <input id="field0017" style="width:98%;height:30px;border:1px solid #D4D4D4" value="${entity.field0017}"/>
                                    </div>
                                </font>
                            </td>
                        </tr>
                        <tr style="min-height: 40px; height: 40px;">
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center"><font face="宋体" size="3" color="#ff0000">拟稿人</font></div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <%--  <div align="left">
                                      <input id="field0003" style="width:100%;height:100%;border:none" value="${entity.field0003}"/>
                                  </div>--%>
                                <span id="field0003_span" class="edit_class" fieldval="{name:&quot;field0003&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;create_person&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;member&quot;,formatType:&quot;1&quot;,value:&quot;-4120520206381135530&quot;}">
                                                 <%-- <input type="text"  onblur="calc(this);" class="xdTextBox validate comp" incondition="false" comp="type:&quot;selectPeople&quot;,showOriginalElement:false,isNeedCheckLevelScope:false,showAccountShortname:&quot;no&quot;,showAllOuterDepartment:true,showBtn:true,extendWidth:true,panels:&quot;Department,Team,Post,Level,Outworker,RelatePeople,JoinOrganization&quot;,selectType:&quot;Member&quot;,minSize:0,maxSize:1,preCallback:selectOrgPreCallBack,callback:selectOrgCallBack,valueChange:orgFieldOnChange,hasRelationField:false,isMasterField:true,fieldName:&quot;field0003&quot;
                                                     ,&quot;value&quot;:&quot;Member|${entity.field0003}&quot;,&quot;text&quot;:&quot;${entity.ngr}&quot;" unique="false" name="field0003_txt" mappingfield="create_person" incalculate="false" id="field0003_txt" data-role="none" validate="name:&quot;create_person&quot;,type:&quot;string&quot;,china3char:true,notNull:false" readonly="readonly" comptype="selectPeople" _inited="1"  style="width: 133px; text-overflow: clip;">
                                                 --%>
                                                    <input type="text" onblur="calc(this);" class="xdTextBox validate comp" incondition="false" comp="type:&quot;selectPeople&quot;,showOriginalElement:false,isNeedCheckLevelScope:false,showAccountShortname:&quot;no&quot;,showAllOuterDepartment:true,showBtn:true,extendWidth:true,panels:&quot;Department,Team,Post,Level,Outworker,RelatePeople,JoinOrganization&quot;,selectType:&quot;Member&quot;
                                                    ,value:&quot;Member|${entity.field0003}&quot;,text:&quot;${entity.ngr}&quot;,minSize:0,maxSize:1,preCallback:selectOrgPreCallBack,callback:selectOrgCallBack,valueChange:orgFieldOnChange,hasRelationField:false,departmentId:${entity.field0011},isMasterField:true,fieldName:&quot;field0003&quot;" unique="false" name="field0003_txt" mappingfield="create_person" incalculate="false" id="field0003_txt" data-role="none" validate="name:&quot;create_person&quot;,type:&quot;string&quot;,china3char:true,notNull:false" readonly="readonly" comptype="selectPeople" _inited="1"  style="width: 133px; text-overflow: clip;" oldval=${entity.ngr}>

                                                     <input type="hidden" id="field0003" name="field0003"  style="display: none;">
                                                  <span _isrel="1" class="ico16 radio_people_16 _autoBtn"></span>
                                              </span>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center"><font face="宋体" size="3" color="#ff0000">份数</font></div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <font face="宋体">
                                    <div>
                                        <input id="field0013" style="width:98%;height:30px;border:1px solid #D4D4D4"  value="${entity.field0013}"/>
                                    </div>
                                </font>
                            </td>
                        </tr>
                        <tr style="min-height: 40px; height: 40px;">
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center">
                                    <font face="宋体" size="3" color="#ff0000">主报（送）</font>
                                </div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px" colspan="3">
                                <font face="宋体">
                                            <span  id="field0006_span" class="edit_class" fieldval="{name:&quot;field0006&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;send_to&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;accountAndDepartment&quot;,formatType:&quot;&quot;,value:&quot;&quot;}">
                                                <textarea onpropertychange="this.style.posHeight=this.scrollHeight" onblur="calc(this);" class="comp validate" incondition="false"
                                                          comp="isDuo:true,type:&quot;selectPeople&quot;,valueChange:orgFieldOnChange,showBtn:true,dan:1,showAllAccount:true,extendWidth:true,mode:&quot;open&quot;,panels:&quot;Account,Department,OrgTeam,ExchangeAccount&quot;,minSize:0,isCheckInclusionRelations:false,maxSize:0,selectType:&quot;Department,Account,OrgTeam,ExchangeAccount&quot;,preCallback:selectOrgPreCallBack,callback:selectOrgCallBack,hasRelationField:false,isMasterField:true,fieldName:&quot;field0006&quot;,isMultipleAccountAndDepartment: true,isCanSelectGroupAccount:false,isCanEdit:true
                                                            ,&quot;value&quot;:&quot;${entity.field0006}&quot;,&quot;text&quot;:&quot;${entity.zbname}&quot;" unique="false" name="field0006_txt" mappingfield="send_to" incalculate="false" id="field0006_txt" data-role="none" validate="name:&quot;send_to&quot;,type:&quot;string&quot;,china3char:true,maxLength:4000,notNull:false" comptype="selectPeople" _inited="1" style="width: 456px;">

                                                </textarea>
                                                <input type="hidden" id="field0006" name="field0006" style="display: none;" >
                                                <span _isrel="1" class="ico16 check_dept_16 _autoBtn"></span></span>
                                    <%--<div>
                                        <input id="field0006" style="width:100%;height:100%;border:none" value="${entity.field0006}"/>
                                    </div>--%>
                                </font>
                            </td>
                        </tr>
                        <tr style="min-height: 40px; height: 40px;">
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center">
                                    <font face="宋体" size="3" color="#ff0000">抄报（送）</font>
                                </div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px" colspan="3">
                                <font face="宋体">
                                    <%--<div>
                                        <input id="field0007" style="width:100%;height:100%;border:none" value="${entity.field0007}"/>
                                    </div>--%>
                                    <span id="field0007_span" class="edit_class" fieldval="{name:&quot;field0007&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;copy_to&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;accountAndDepartment&quot;,formatType:&quot;&quot;,value:&quot;&quot;}">
                                                    <textarea onpropertychange="this.style.posHeight=this.scrollHeight" onblur="calc(this);" class="comp validate" incondition="false" comp="isDuo:true,type:&quot;selectPeople&quot;,valueChange:orgFieldOnChange,showBtn:true,dan:1,showAllAccount:true,extendWidth:true,mode:&quot;open&quot;,panels:&quot;Account,Department,OrgTeam,ExchangeAccount&quot;,minSize:0,isCheckInclusionRelations:false,maxSize:0,selectType:&quot;Department,Account,OrgTeam,ExchangeAccount&quot;,preCallback:selectOrgPreCallBack,callback:selectOrgCallBack,hasRelationField:false,isMasterField:true,fieldName:&quot;field0007&quot;,isMultipleAccountAndDepartment: true,isCanEdit:true
                                                        ,&quot;value&quot;:&quot;${entity.field0007}&quot;,&quot;text&quot;:&quot;${entity.cbname}&quot;" unique="false" name="field0007_txt" mappingfield="copy_to" incalculate="false" id="field0007_txt" data-role="none" validate="name:&quot;copy_to&quot;,type:&quot;string&quot;,china3char:true,maxLength:4000,notNull:false" comptype="selectPeople" _inited="1" style="width: 456px;"></textarea>
                                                    <input type="hidden" id="field0007" name="field0007" style="display: none;">
                                                    <span _isrel="1" class="ico16 check_dept_16 _autoBtn"></span></span>
                                </font>
                            </td>
                        </tr>
                        <tr style="min-height: 40px; height: 40px;">
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center">
                                    <font face="宋体" size="3" color="#ff0000">&nbsp;</font>
                                    <font face="宋体" size="3" color="#ff0000">下发</font>
                                </div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px" colspan="3">
                                <font face="宋体" size="3" color="#ff0000">
                                    <%--  <div>
                                          <input id="field0018" style="width:100%;height:100%;border:none" value="${entity.field0018}"/>
                                      </div>--%>
                                    <span id="field0018_span" class="edit_class" fieldval="{name:&quot;field0018&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;receive_unit&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;accountAndDepartment&quot;,formatType:&quot;&quot;,value:&quot;&quot;}">
                                                  <textarea onpropertychange="this.style.posHeight=this.scrollHeight" onblur="calc(this);" class="comp validate" incondition="false" comp="isDuo:true,type:&quot;selectPeople&quot;,valueChange:orgFieldOnChange,showBtn:true,dan:1,showAllAccount:true,extendWidth:true,mode:&quot;open&quot;,panels:&quot;Account,Department,OrgTeam,ExchangeAccount&quot;,minSize:0,isCheckInclusionRelations:false,maxSize:0,selectType:&quot;Department,Account,OrgTeam,ExchangeAccount&quot;,preCallback:selectOrgPreCallBack,callback:selectOrgCallBack,hasRelationField:false,isMasterField:true,fieldName:&quot;field0018&quot;,isMultipleAccountAndDepartment: true,isCanEdit:true
                                                        ,&quot;value&quot;:&quot;${entity.field0018}&quot;,&quot;text&quot;:&quot;${entity.xfname}&quot;" unique="false" name="field0018_txt" mappingfield="receive_unit" incalculate="false" id="field0018_txt" data-role="none" validate="name:&quot;receive_unit&quot;,type:&quot;string&quot;,china3char:true,maxLength:4000,notNull:false" comptype="selectPeople" _inited="1" style="width: 456px;"></textarea>
                                                  <input type="hidden" id="field0018" name="field0018" style="display: none;">
                                                  <span _isrel="1" class="ico16 check_dept_16 _autoBtn"></span></span>
                                </font>
                            </td>
                        </tr>
                        <tr style="min-height: 40px; height: 40px;">
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center"><font face="宋体" size="3" color="#ff0000">成文日期</font></div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <font face="宋体">
                                    <div>
                                        <%--    <input id="field0012" style="width:100%;height:100%;border:none" value="${entity.field0012}"/>
                                        --%>
                                        <input  id="field0012" name="field0012"  type="text" value="${entity.field0012}" comp="type:&quot;calendar&quot;,cache:false,isOutShow:true,ifFormat:&quot;%Y-%m-%d&quot;" class="validate xdRichTextBox comp" incalculate="false" comptype="calendar"  style="width: 136px;" finalwidth="136">

                                    </div>
                                </font>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center"><font face="宋体" size="3" color="#ff0000">公开方式</font></div>
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

                                        <select name="field0014" id="field0014" style="width:100%"  >
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
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center"><font face="宋体" size="3" color="#ff0000">附件</font></div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px" colspan="3">
                                <font face="宋体">
                                    <div align="left" >
                                        <span class="xdlabel"></span>
                                        <!--动态-->
                                        <span id="field0010_span" mappingfield="attachments" class="edit_class" fieldval="{name:&quot;field0010&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;attachments&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;attachment&quot;,formatType:&quot;&quot;,value:&quot;&quot;}" style="display: inline-block;">
                                                    <div class="comp" comp="type:'fileupload',callMethod:'fileValueChangeCallBack',delCallMethod:'fileDelCallBack',takeOver:false,isBR:true,canDeleteOriginalAtts:true,canFavourite:'true',notNull:'false',displayMode:'visible',autoHeight:true,applicationCategory:'2',embedInput:'field0010',attachmentTrId:'1209558887199034033'"
                                                         attsdata="${fjsonArray}" comptype="fileupload" style="display: none;">
                                                        <input type="text" <%--style="display: none; width: 474px;"--%> id="field0010" name="field0010" value="${entity.field0010}">
                                                    </div>
                                                    <div id="attachmentArea-1694224470510517263" style="overflow-x: hidden; min-height: 24px; width: 450px;" requrl="/seeyon/fileUpload.do?type=0&amp;inputId=undefined&amp;applicationCategory=2&amp;extensions=&amp;maxSize=&amp;isEncrypt=&amp;popupTitleKey=&amp;attachmentTrId=-1694224470510517263&amp;embedInput=field0010" class="left">
                                                        <c:forEach items="${fjlist}" var="fj">
                                                            <div id="attachmentDiv_${fj.file_url}" class="attachment_block attachmentShowDelete" style="font-size:12px; max-width:454px; float:left; line-height:22px;*line-height:22px;background:#e6eef7;padding:2px 10px;border-radius:3px; overflow:hidden; word-wrap:break-word; word-break:break-all;"<%-- onmouseenter="onAttachmentMouseEnter(this)" onmouseleave="onAttachmentMouseLeave(this)"--%>>&nbsp;
                                                                <span style="word-wrap:break-word; word-break:break-all;" class="ico16 doc_16 margin_r_5"></span>
                                                                <a  href="/seeyon/filedown.do?method=fileDownload_zdy&amp;fileurl=${fj.file_url}&amp;createDate=${fj.date}&amp;filename=${fj.filename}" title=${fj.filename} target="downloadFileFrame" style="font-size:12px;color:#757575;">
                                                                    <span id="field0010_txt" style="line-height:normal">${fj.filename}(${fj.filesize}KB)</span>
                                                                </a>
                                                                <span class="ico16 affix_del_16" title="删除" onclick="deletefj('${fj.file_url}','1')"></span>&nbsp;
                                                                 <%-- <iframe id="officeEditorIframe" name="officeEditorIframe" frameborder="0" height="0" width="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                                                                    <span id="editOnline_${fj.id}">
                                                                        <a class="hand" title="编辑" onclick="editOfficeOnline4Form('${fj.id}','${fj.file_url}','${fj.filename}','${fj.mine_type}','${fj.category}','${fj.createdate}')" target="_blank">
                                                                        <span class="ico16 editor_16"></span>
                                                                        </a>
                                                                    </span>&nbsp;--%>
                                                            </div>
                                                        </c:forEach>
                                                  </div>

                                                   <div style="display:none;">
                                                        <iframe name="downloadFileFrame" id="downloadFileFrame" frameborder="0" width="0" height="0"></iframe>
                                                    </div>
                                                    <span class="ico16 affix_16" onclick="insertAttachmentPoi('1209558887199034033')">
                                                        <input type="hidden" id="field0010_0_editAtt" value="true">
                                                    </span>
                                                </span>
                                    </div>

                                </font>
                            </td>
                        </tr>


                        <tr style="min-height: 40px; height: 40px;">
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center"><font face="宋体" size="3" color="#ff0000"><span id="zwspan">正文</span></font></div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px" colspan="3">
                                <font face="宋体">
                                    <div align="left" >
                                        <span class="xdlabel"></span>
                                        <span id="field_spans_1" mappingfield="attachments" class="edit_class" fieldval="{name:&quot;field0010_1&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;attachments&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;attachment&quot;,formatType:&quot;&quot;,value:&quot;&quot;}" style="display: inline-block;">
                                                    <div class="comp" comp="type:'fileupload',callMethod:'fileValueChangeCallBack',delCallMethod:'fileDelCallBack',takeOver:false,isBR:true,canDeleteOriginalAtts:true,canFavourite:'true',notNull:'false',displayMode:'visible',autoHeight:true,applicationCategory:'2',embedInput:'field0010_1',attachmentTrId:'1209558887199034034'"
                                                         attsdata="${zwdata}" comptype="fileupload" style="display: none;">

                                                    </div>
                                                    <div id="attachmentArea-1694224470510517263_1" style="overflow-x: hidden; min-height: 24px; width: 450px;" requrl="/seeyon/fileUpload.do?type=0&amp;inputId=undefined&amp;applicationCategory=2&amp;extensions=&amp;maxSize=&amp;isEncrypt=&amp;popupTitleKey=&amp;attachmentTrId=-1694224470510517263&amp;embedInput=field0010" class="left">
                                                           	 <input type="text" style="display: none; width: 474px;" id="field0010_1" name="field0010" value="${zwdata.id}">
                                                        <c:if test="${zwdata.content !='' }">
                                                                <div id="attachmentDiv_${zwdata.content}" class="attachment_block attachmentShowDelete" style="font-size:12px; max-width:454px; float:left; line-height:22px;*line-height:22px;background:#e6eef7;padding:2px 10px;border-radius:3px; overflow:hidden; word-wrap:break-word; word-break:break-all;"<%-- onmouseenter="onAttachmentMouseEnter(this)" onmouseleave="onAttachmentMouseLeave(this)"--%>>&nbsp;
                                                                    <span style="word-wrap:break-word; word-break:break-all;" class="ico16 doc_16 margin_r_5"></span>
                                                                    <a  href="/seeyon/filedown.do?method=fileDownload_zdy&amp;fileurl=${zwdata.content}&amp;createDate=${zwdata.date}&amp;filename=正文.doc" title="正文" target="downloadFileFrame" style="font-size:12px;color:#757575;">
                                                                        <span id="field0010_txts" style="line-height:normal">正文</span>
                                                                    </a>
                                                                    <span class="ico16 affix_del_16" title="删除" onclick="deletefj('${zwdata.content}','2')"></span>&nbsp;
                                                                     <%-- <iframe id="officeEditorIframe" name="officeEditorIframe" frameborder="0" height="0" width="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                                                                        <span id="editOnline_${fj.id}">
                                                                            <a class="hand" title="编辑" onclick="editOfficeOnline4Form('-6716956894056724289','-2199317821978820492','test.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','2','2020-10-10 10:31:33')" target="_blank">
                                                                                <span class="ico16 editor_16"></span>
                                                                            </a>
                                                                        </span>&nbsp;--%>
                                                                </div>
                                                        </c:if>



                                                  </div>

                                                   <div style="display:none;">
                                                        <iframe name="downloadFileFrame" id="downloadFileFrame_1" frameborder="0" width="0" height="0"></iframe>
                                                    </div>
                                                    <span class="ico16 affix_16" onclick="insertAttachmentPoi('1209558887199034034')">
                                                        <input type="hidden" id="field0010_0_editAtt_1" value="true">
                                                    </span>
                                                </span>
                                    </div>

                                </font>
                            </td>
                        </tr>

                        <tr style="min-height: 60px; height: 60px;">
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center"><font face="宋体" size="3" color="#ff0000">拟稿部门</font></div>
                                <div align="center"><font face="宋体" size="3" color="#ff0000">负责人意见</font></div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px" colspan="3">
                                <font face="宋体" size="3">
                                    <%--<textarea id="field0004" style="width:100%;height:100%;border:none" ></textarea>--%>
                                    <c:forEach items="${bmfzrList}" var="op">
                                        <div id="div_${op.id}">
                                            <input type="hidden" value="${op.id}"/>
                                            <div style="float: left;width: 100%;" class="font-s">
                                                <input id="${op.id}" style="width:98%;height:28px;;border:1px solid #D4D4D4" value="${op.content}"/>
                                            </div>
                                            <div style="width: 490px;">
                                                <div style="float:right;padding-right:30px;padding-top:5px;padding-bottom:5px;" class="font-s">
                                                    <input readonly="readonly" style=" height:100%;border:none" value="${op.username} ${op.createTime}"></input>
                                                    <button type="button" style="background-color: lightskyblue;font-weight:bold" class="common_button" id="${op.id}_field0004_mod" onclick="buttonClick(this)" >修改保存</button>
                                                    <button type="button" style="background-color:#ea9191;font-weight:bold"  class="common_button" id="${op.id}_field0004_del" onclick="buttonClick(this)">删除</button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </font>
                            </td>
                        </tr>
                        <tr style="min-height: 60px; height: 60px;">
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center"><font face="宋体" size="3" color="#ff0000">部门会签</font></div>
                                <div align="center"><font face="宋体" size="3" color="#ff0000">意见</font></div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px" colspan="3">
                                <font face="宋体">
                                    <%-- <textarea id="field0020" style="width:100%;height:100%;border:none" ></textarea>--%>
                                    <c:forEach items="${bmhqList}" var="op">
                                        <div id="div_${op.id}">
                                            <input type="hidden" value="${op.id}"/>
                                            <div style="float: left;width: 100%;" class="font-s">
                                                <input id="${op.id}" style="width:98%;height:28px;;border:1px solid #D4D4D4" value="${op.content}"/>
                                            </div>
                                            <div style="width: 490px;">
                                                <div style="float:right;padding-right:30px;padding-top:5px;padding-bottom:5px;" class="font-s">
                                                    <input readonly="readonly" style=" height:100%;border:none" value="${op.username} ${op.createTime}"></input>
                                                    <button type="button" style="background-color: lightskyblue;font-weight:bold" class="common_button" id="${op.id}_field0020_mod" onclick="buttonClick(this)" >修改保存</button>
                                                    <button type="button" style="background-color:#ea9191;font-weight:bold" class="common_button" id="${op.id}_field0020_del" onclick="buttonClick(this)">删除</button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </font>
                            </td>
                        </tr>
                        <tr style="min-height: 60px; height: 60px;">
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center"><font face="宋体" size="3" color="#ff0000">党政办</font></div>
                                <div align="center"><font face="宋体" size="3" color="#ff0000">意见</font></div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px" colspan="3">
                                <font face="宋体" size="3" color="#ff0000">
                                    <%--  <textarea id="field0021" style="width:100%;height:100%;border:none"></textarea>--%>
                                    <c:forEach items="${dzbList}" var="op">
                                        <div id="div_${op.id}">
                                            <input type="hidden" value="${op.id}"/>
                                            <div style="float: left;width: 100%;" class="font-s">
                                                <input id="${op.id}" style="width:98%;height:28px;;border:1px solid #D4D4D4" value="${op.content}"/>
                                            </div>
                                            <div style="width: 490px;">
                                                <div style="float:right;padding-right:30px;padding-top:5px;padding-bottom:5px;" class="font-s">
                                                    <input readonly="readonly" style=" height:100%;border:none" value="${op.username} ${op.createTime}"></input>
                                                    <button type="button" style="background-color: lightskyblue;font-weight:bold" class="common_button" id="${op.id}_field0021_mod" onclick="buttonClick(this)" >修改保存</button>
                                                    <button type="button" style="background-color:#ea9191;font-weight:bold" class="common_button" id="${op.id}_field0021_del" onclick="buttonClick(this)">删除</button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </font>
                            </td>
                        </tr>
                        <tr style="min-height: 60px; height: 60px;">
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center"><font face="宋体" size="3" color="#ff0000">校领导</font></div>
                                <div align="center"><font face="宋体" size="3" color="#ff0000">审批意见</font></div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px" colspan="3">
                                <font face="宋体" size="3" color="#ff0000">
                                    <%--  <textarea id="field0019" style="width:100%;height:100%;border:none" ></textarea>--%>
                                    <c:forEach items="${xldspList}" var="op">
                                        <div id="div_${op.id}">
                                            <input type="hidden" value="${op.id}"/>
                                            <div style="float: left;width: 100%;" class="font-s">
                                                <input id="${op.id}" style="width:98%;height:28px;;border:1px solid #D4D4D4" value="${op.content}"/>
                                            </div>
                                            <div style="width: 490px;">
                                                <div style="float:right;padding-right:30px;padding-top:5px;padding-bottom:5px;" class="font-s">
                                                    <input readonly="readonly" style=" height:100%;border:none" value="${op.username} ${op.createTime}"></input>
                                                    <button type="button" style="background-color: lightskyblue;font-weight:bold" class="common_button" id="${op.id}_field0019_mod" onclick="buttonClick(this)" >修改保存</button>
                                                    <button type="button" style="background-color:#ea9191;font-weight:bold"  class="common_button" id="${op.id}_field0019_del" onclick="buttonClick(this)">删除</button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </font>
                            </td>
                        </tr>
                        <tr style="min-height: 60px; height: 60px;">
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px">
                                <div align="center"><font face="宋体" size="3" color="#ff0000">校对</font></div>
                                <div align="center"><font face="宋体" size="3" color="#ff0000">意见</font></div>
                            </td>
                            <td style="BORDER-TOP: #ff0000 1.5pt solid; BORDER-RIGHT: #ff0000 1.5pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1.5pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1.5pt solid; PADDING-RIGHT: 1px" colspan="3">
                                <font face="宋体" size="3" color="#ff0000">
                                    <%--  <textarea id="field0022" style="width:100%;height:100%;border:none" ></textarea>--%>
                                    <c:forEach items="${xdyjList}" var="op">
                                        <div id="div_${op.id}">
                                            <input type="hidden" value="${op.id}"/>
                                            <div style="float: left;width: 100%;" class="font-s">
                                                <input id="${op.id}" style="width:98%;height:28px;;border:1px solid #D4D4D4" value="${op.content}"/>
                                            </div>
                                            <div style="width: 490px;">
                                                <div style="float:right;padding-right:30px;padding-top:5px;padding-bottom:5px;" class="font-s">
                                                    <input readonly="readonly" style=" height:100%;border:none" value="${op.username} ${op.createTime}"></input>
                                                    <button type="button" style="background-color: lightskyblue;font-weight:bold" class="common_button" id="${op.id}_field0022_mod" onclick="buttonClick(this)" >修改保存</button>
                                                    <button type="button" style="background-color:#ea9191;font-weight:bold"  class="common_button" id="${op.id}_field0022_del" onclick="buttonClick(this)">删除</button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </font>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
    <input id="formid" type="hidden" value="${entity.id}"/>
    <input id="fjdatas" type="hidden" />
    <input id="fields0010" type="hidden" value="${entity.field0010}" />
    <input id="summaryid" type="hidden" value="${entity.summaryid}" /><%--公文主表edoc_summary的id--%>

    <input id="zwfjdatas" type="text" />
    <input type="text"  id="zwid" value="${zwdata.id}">
    <input type="text"  id="zwcontent" value="${zwdata.content}">
    <input type="text"  id="zwdate" value="${zwdata.date}">

</div>


<script type="text/javascript">

    $(document).ready(function(){
        initOption("field0015",${entity.field0015});//文种默认值
        initOption("field0008",${entity.field0008});//紧急程度默认值
        initOption("field0014",${entity.field0014});//公开方式默认值
        initOption("field0023",${entity.field0023});//文件类型
        $.ajax({
            url: _ctxPath + '/demo.do?method=getJgdzData',
            type:'POST',
            data:{parent_id: $("#field0023").val()},
            error:function(res){},
            success:function (res) {
                var list=res["data"];
                var obj=$("#field0024");
                obj.children().remove();
                obj.append("<option val4cal='0' value='' selected=''></option>");
                for(var i=0;i<list.length;i++){
                    obj.append("<option value="+list[i].id+" title="+list[i].showvalue+"  >"+list[i].showvalue+"</option>");
                }

                initOption("field0024",${entity.field0024});//机构代字
            }
        });
    });

    function getWjbh(){
        var lsh=$("#field0025").val(); //文件流水号
        if(lsh==''){
            $('#field0026').val("");
        }else{
            var date = new Date();
            var obj = document.getElementById("field0024");
            $("#field0026").val(obj.options[obj.selectedIndex].text+"〔"+date .getFullYear()+"〕"+lsh+"号");
        }

    }

    function getJgdzOption(){
        $.ajax({
            url: _ctxPath + '/demo.do?method=getJgdzData',
            type:'POST',
            data:{parent_id: $("#field0023").val()},
            dataType: "json",
            success:function (res) {
                var list=res["data"];
                var obj=$("#field0024");
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

    function formatdata(str){
        var ci=str.indexOf("hiddenValueDepartment");
        return str.substring(ci,str.length).replace("hiddenValueDepartment","Department").replace("\n","").trim();
    }



    //保存form表单数据
    function save(){
        var fjdata="";
        if($("#fjdatas").val()!=""){
            fjdata=JSON.parse($("#fjdatas").val());
        }
      /*  var zwfjdata='';
        if($("#zwfjdatas").val()!=""){
            zwfjdata=JSON.parse($("#zwfjdatas").val());
        }*/

        var params={
            ID:$('#formid').val(),
            field0005:$('#field0005').val(), //文件标题
            field0015:$('#field0015').val(), //文种
            field0023:$('#field0023').val(), //文件类型
            field0024:$('#field0024').val(), //机构代字
            field0025:$('#field0025').val(), //文件流水号
            field0026:$('#field0026').val(), //文件编号
            field0008:$('#field0008').val(), //缓急程度
            field0016:$('#field0016').val(), //拟稿日期
            field0011:$('#field0011').val().replace("Department|",""), //拟稿部门
            field0017:$('#field0017').val(), //联系电话
            field0003:$('#field0003').val().replace("Member|",""), //拟稿人
            field0013:$('#field0013').val(), //份数
            field0006:formatdata($('#field0006').val()), //主报（送）
            field0007:formatdata($('#field0007').val()), //抄报（送）
            field0018:formatdata($('#field0018').val()), //下发
            field0012:$('#field0012').val(), //成文日期
            field0014:$('#field0014').val(), //公开方式
            field0010:$('#fields0010').val(), //formmain中field0010  关联attachment中的sub_reference

        };
        $.ajax({
            url: _ctxPath + '/demo.do?method=toUpdateFormmain',
            type:'POST',
            data:{
                params:JSON.stringify(params),
                fjparams:JSON.stringify(fjdata["instance"]),
                att_reference:$('#summaryid').val()
               /* ,
                zwparams:JSON.stringify(zwfjdata["instance"]),
               /!* zwcontent:$('#zwcontent').val(),*!/
                zwid:$('#zwid').val()*/
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


    function initOption(component,id){
        var all_options = document.getElementById(component).options;
        for (i=0; i<all_options.length; i++){
            if (all_options[i].value == id)  // 根据option标签的ID来进行判断
            {
                all_options[i].selected = true;
            }
        }
    }

    function  deleteXx(url,param){
        $.ajax({
            url: url,
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

    /**
     * 删除附件
     */
    function deletefj(fileurl,type){
        var url="";
        if(type=="1"){
            url=_ctxPath + '/demo.do?method=toDeleteFj';
            deleteXx(url,fileurl);
        }else if(type=="2"){
            url=_ctxPath + '/demo.do?method=toDeleteZw';
        }
        var obj=$("#attachmentDiv_"+fileurl);
        obj.remove();
        /*$.ajax({
            url: _ctxPath + '/demo.do?method=toDeleteFj',
            type:'POST',
            data:{file_url:fileurl},
            error:function(res){
                $.alert("删除成功!");
            },
            success:function (res) {
                $.alert("删除成功!");
            }
        });*/
    }


</script>
</body>
</html>
