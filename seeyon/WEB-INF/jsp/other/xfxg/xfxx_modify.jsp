<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>信访信息修改</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" charset="UTF-8" src="${path}/common/content/form.js${ctp:resSuffix()}"></script>
    <script type="text/javascript" charset="UTF-8" src="${path}/apps_res/govdoc/js/govdocBody.js${ctp:resSuffix()}"></script>
    <script type="text/javascript" charset="UTF-8" src="${path}/apps_res/demo/util.js${ctp:resSuffix()}"></script>
</head>
<body style="height:1000px">
<div id="toolbar_4462223" style="float:right" class="toolbar_l clearfix">
    <a style="margin-right: 50px;margin-top: 20px;cursor: pointer;" class="common_button" onclick="saveXfxx()">
        <em id="saveDraft_em" class="ico16 save_traft_16"></em>
        <span id="saveDraft_span" class="menu_span" title="保存">保存</span>
    </a>
</div>
<div style="clear: both;"></div>
<div id="mainbodyDiv" style="height:100%;text-align: center;margin-top: 10px;margin-left: 70px;">
    <div align="center">
        <div id="tableName-front_formmain_1_0" style="width: 800px; overflow: auto hidden;">
            <table class="cap4-formmain__mTable" style="width: 800px;">
                <colgroup>
                    <col width="0px">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                </colgroup>
                <tr height="45">
                    <td class="rowgroup"></td>
                    <td colspan="4" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 18px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.045618102444285435_id"
                                 class="cap-field formmain_0085|auxiliary0.045618102444285435">
                                <section>
                                    <pre>中国矿业大学信访处理单</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.32242106129658965_id"
                                 class="cap-field formmain_0085|auxiliary0.32242106129658965">
                                <section>
                                    <pre>信访标题</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="3" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0018_id" class="cap-field formmain_0085|field0018"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-text is-none is-must ">
                                    <div class="cap4-text__right field-content-wrapper">
                                        <div class="cap4-text__cnt field-content" style="border: 1px solid transparent;">
                                            <input   id="field0018" style="width:99.5%;height:30px;border:1px solid #D4D4D4" value="${entity.field0018}"/>
                                        </div><!---->
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.20704942017359906_id"
                                 class="cap-field formmain_0085|auxiliary0.20704942017359906">
                                <section>
                                    <pre>登记人 </pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0017_id" class="cap-field formmain_0085|field0017"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-people is-none  ">
                                    <div class="cap4-people__right field-content-wrapper">
                                        <span id="field0017_span" class="edit_class" fieldval="{name:&quot;field0012&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;create_person&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;member&quot;,formatType:&quot;1&quot;,value:&quot;-4120520206381135530&quot;}">
                                                    <input type="text" onblur="calc(this);" class="xdTextBox validate comp" incondition="false" comp="type:&quot;selectPeople&quot;,showOriginalElement:false,isNeedCheckLevelScope:false,showAccountShortname:&quot;no&quot;,showAllOuterDepartment:true,showBtn:true,extendWidth:true,panels:&quot;Department,Team,Post,Level,Outworker,RelatePeople,JoinOrganization&quot;,selectType:&quot;Member&quot;
                                                    ,value:&quot;Member|${entity.field0017}&quot;,text:&quot;${entity.djr}&quot;,minSize:0,maxSize:1,preCallback:selectOrgPreCallBack,callback:selectOrgCallBack,valueChange:orgFieldOnChange,hasRelationField:false,departmentId:${entity.field0016},isMasterField:true,fieldName:&quot;field0017&quot;" unique="false" name="field0017_txt" mappingfield="create_person" incalculate="false" id="field0017_txt" data-role="none" validate="name:&quot;create_person&quot;,type:&quot;string&quot;,china3char:true,notNull:false" readonly="readonly" comptype="selectPeople" _inited="1"  style="width: 201px; text-overflow: clip;" oldval=${entity.djr}>

                                                     <input type="hidden" id="field0017" name="field0017"  style="display: none;">
                                                  <span _isrel="1" class="ico16 radio_people_16 _autoBtn"></span>
                                              </span>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.12537876124405267_id"
                                 class="cap-field formmain_0085|auxiliary0.12537876124405267">
                                <section>
                                    <pre>登记部门</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0016_id" class="cap-field formmain_0085|field0016"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-depart is-none  ">
                                    <div class="cap4-depart__right field-content-wrapper">
                                         <span id="field0016_span" class="editableSpan edit_class" fieldval="{name:&quot;field0016&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;send_department&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;department&quot;,formatType:&quot;1&quot;}">
                                                       <input type="text" onblur="calc(this);" class="comp validate" incondition="false"
                                                              comp="&quot;type&quot;:&quot;selectPeople&quot;,&quot;valueChange&quot;:orgFieldOnChange,&quot;showBtn&quot;:true,&quot;extendWidth&quot;:true,&quot;mode&quot;:&quot;open&quot;,&quot;panels&quot;:&quot;Department&quot;,&quot;isAllowContainsChildDept&quot;:true,&quot;isConfirmExcludeSubDepartment&quot;:false,&quot;selectType&quot;:&quot;Department&quot;,&quot;minSize&quot;:0,&quot;maxSize&quot;:1,&quot;preCallback&quot;:selectOrgPreCallBack,&quot;callback&quot;:selectOrgCallBack,&quot;hasRelationField&quot;:false,&quot;isMasterField&quot;:true,&quot;fieldName&quot;:&quot;field0016&quot;
                                                            ,&quot;value&quot;:&quot;Department|${entity.field0016}&quot;,&quot;text&quot;:&quot;${entity.djbm}&quot;" unique="false" name="field0002_txt" mappingfield="send_department" incalculate="false" id="field0016_txt" data-role="none" validate="name:&quot;send_department&quot;,type:&quot;string&quot;,china3char:true,notNull:true" readonly="readonly" comptype="selectPeople" _inited="1"  style="background-color: rgb(255, 255, 255); width: 201px; text-overflow: clip;" >
                                                       <input type="hidden" id="field0016" name="field0016" style="background-color: rgb(255, 255, 255); display: none;">
                                                       <span _isrel="1" class="ico16 radio_dept_16 _autoBtn"></span>
                                                   </span>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.6503169179827899_id"
                                 class="cap-field formmain_0085|auxiliary0.6503169179827899">
                                <section>
                                    <pre>信访人姓名</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0015_id" class="cap-field formmain_0085|field0015"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-text is-none  ">
                                    <div class="cap4-text__right field-content-wrapper">
                                        <div class="cap4-text__cnt field-content" style="border: 1px solid transparent;">
                                            <input   id="field0015" style="width:99%;height:30px;border:1px solid #D4D4D4" value="${entity.field0015}"/>
                                        </div><!---->
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.5525111011573136_id"
                                 class="cap-field formmain_0085|auxiliary0.5525111011573136">
                                <section>
                                    <pre>信访人单位</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0014_id" class="cap-field formmain_0085|field0014"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-text is-none  ">
                                    <div class="cap4-text__right field-content-wrapper">
                                        <div class="cap4-text__cnt field-content"
                                             style="border: 1px solid transparent;"> <input   id="field0014" style="width:99%;height:30px;border:1px solid #D4D4D4" value="${entity.field0014}"/></div><!---->
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.8507820306235288_id"
                                 class="cap-field formmain_0085|auxiliary0.8507820306235288">
                                <section>
                                    <pre>联系方式</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0013_id" class="cap-field formmain_0085|field0013"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-text is-none  ">
                                    <div class="cap4-text__right field-content-wrapper">
                                        <div class="cap4-text__cnt field-content"
                                             style="border: 1px solid transparent;"> <input   id="field0013" style="width:99%;height:30px;border:1px solid #D4D4D4" value="${entity.field0013}"/></div><!---->
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.5489700847335837_id"
                                 class="cap-field formmain_0085|auxiliary0.5489700847335837">
                                <section>
                                    <pre>接(处)访时间 </pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0012_id" class="cap-field formmain_0085|field0012"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-datetime is-none  ">
                                    <div class="cap4-datetime__right field-content-wrapper">
                                        <input  id="field0012" name="field0012"  type="text" value="${entity.jfsj}" comp="type:&quot;calendar&quot;,cache:false,isOutShow:true,ifFormat:&quot;%Y-%m-%d&quot;" class="validate xdRichTextBox comp" incalculate="false" comptype="calendar"  style="width: 195px;" finalwidth="165">
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.9191357782288325_id"
                                 class="cap-field formmain_0085|auxiliary0.9191357782288325">
                                <section>
                                    <pre>信访编号 </pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0011_id" class="cap-field formmain_0085|field0011"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-text is-none  ">
                                    <div class="cap4-text__right field-content-wrapper">
                                        <div class="cap4-text__cnt field-content"
                                             style="border: 1px solid transparent;"><input   id="field0011" style="width:99%;height:30px;border:1px solid #D4D4D4" value="${entity.field0011}"/></div><!---->
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.12056606686462512_id"
                                 class="cap-field formmain_0085|auxiliary0.12056606686462512">
                                <section>
                                    <pre>信访类型 </pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0022_id" class="cap-field formmain_0085|field0022" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-select is-none is-must ">
                                    <div class="cap4-select__right field-content-wrapper">
                                        <select name="field0022" id="field0022" style="width:100%" >
                                            <option val4cal="0" value="" selected=""></option>
                                            <c:forEach items="${xflxdoption}" var="t">
                                                <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.9731442986787282_id"
                                 class="cap-field formmain_0085|auxiliary0.9731442986787282">
                                <section>
                                    <pre>信访渠道</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0023_id" class="cap-field formmain_0085|field0023" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-select is-none is-must ">
                                    <div class="cap4-select__right field-content-wrapper">
                                        <select name="field0023" id="field0023" style="width:100%" >
                                            <option val4cal="0" value="" selected=""></option>
                                            <c:forEach items="${xfqdoption}" var="t">
                                                <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                </tr>
                <tr height="27">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.37643713113500765_id"
                                 class="cap-field formmain_0085|auxiliary0.37643713113500765">
                                <section>
                                    <pre>信访内容摘要</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="3" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0007_id" class="cap-field formmain_0085|field0007"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-textarea is-none  ">
                                    <div class="cap4-textarea__right field-content-wrapper">
                                        <div class="cap4-textarea__cnt field-content" style="position: relative; border: 1px solid transparent;">
                                            <span id="field0007_span" class="edit_class" fieldval="{name:&quot;field0007&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;text1&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;textarea&quot;,formatType:&quot;&quot;,value:&quot;&quot;}">
                                            <textarea  class="xdRichTextBox" id="field0007" style="width: 613px;">${entity.field0007}</textarea>
                                        </span>
                                        </div><!---->
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.8158939227577322_id"
                                 class="cap-field formmain_0085|auxiliary0.8158939227577322">
                                <section>
                                    <pre>材料 </pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="3" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0008_id" class="cap-field formmain_0085|field0008"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-textarea is-none  ">
                                    <div class="cap4-textarea__right field-content-wrapper">
                                        <div class="cap4-textarea__cnt field-content"
                                             style="position: relative; border: 1px solid transparent;">
                                            <span id="field0008_span" class="edit_class" fieldval="{name:&quot;field0008&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;text1&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;textarea&quot;,formatType:&quot;&quot;,value:&quot;&quot;}">
                                                <textarea  class="xdRichTextBox" id="field0008" style="width: 613px;">${entity.field0008}</textarea>
                                            </span>
                                        </div><!----></div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.036610928304629864_id"
                                 class="cap-field formmain_0085|auxiliary0.036610928304629864">
                                <section>
                                    <pre>附件</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="3" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0025_id" class="cap-field formmain_0085|field0025"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-attach is-none  ">
                                    <div class="cap4-attach__right field-content-wrapper">
                                        <div align="left" >
                                            <span class="xdlabel"></span>
                                            <!--动态-->
                                            <span id="field0025_span" mappingfield="attachments" class="edit_class" fieldval="{name:&quot;field0025&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;attachments&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;attachment&quot;,formatType:&quot;&quot;,value:&quot;&quot;}" style="display: inline-block;">
                                                    <div class="comp" comp="type:'fileupload',callMethod:'fileValueChangeCallBack',delCallMethod:'fileDelCallBack',takeOver:false,isBR:true,canDeleteOriginalAtts:true,canFavourite:'true',notNull:'false',displayMode:'visible',autoHeight:true,applicationCategory:'2',embedInput:'field0025',attachmentTrId:'1209558887199034033'"
                                                         attsdata="${fjsonArray}" comptype="fileupload" style="display: none;">
                                                        <input type="text" <%--style="display: none; width: 474px;"--%> id="field0025" name="field0025" value="${entity.field0025}">
                                                    </div>
                                                    <div id="attachmentArea-1694224470510517265" style="overflow-x: hidden; min-height: 24px; width: 600px;" requrl="/seeyon/fileUpload.do?type=0&amp;inputId=undefined&amp;applicationCategory=2&amp;extensions=&amp;maxSize=&amp;isEncrypt=&amp;popupTitleKey=&amp;attachmentTrId=-1694224470510517265&amp;embedInput=field0025" class="left">
                                                        <c:forEach items="${fjlist}" var="fj">
                                                            <div id="attachmentDiv_${fj.file_url}" class="attachment_block attachmentShowDelete" style="font-size:12px; max-width:454px; float:left; line-height:22px;*line-height:22px;background:#e6eef7;padding:2px 10px;border-radius:3px; overflow:hidden; word-wrap:break-word; word-break:break-all;"<%-- onmouseenter="onAttachmentMouseEnter(this)" onmouseleave="onAttachmentMouseLeave(this)"--%>>&nbsp;
                                                                <span style="word-wrap:break-word; word-break:break-all;" class="ico16 doc_16 margin_r_5"></span>
                                                                <a  href="/seeyon/filedown.do?method=fileDownload_zdy&amp;fileurl=${fj.file_url}&amp;createDate=${fj.date}&amp;filename=${fj.filename}" title=${fj.filename} target="downloadFileFrame" style="font-size:12px;color:#757575;">
                                                                    <span id="field0015_txt" style="line-height:normal">${fj.filename}(${fj.filesize}KB)</span>
                                                                </a>
                                                                <span class="ico16 affix_del_16" title="删除" onclick="deletefj('${fj.file_url}')"></span>&nbsp;
                                                            </div>
                                                        </c:forEach>
                                                  </div>

                                                   <div style="display:none;">
                                                        <iframe name="downloadFileFrame" id="downloadFileFrame" frameborder="0" width="0" height="0"></iframe>
                                                    </div>
                                                    <span class="ico16 affix_16" onclick="insertAttachmentPoi('1209558887199034033')">
                                                        <input type="hidden" id="field0025_0_editAtt" value="true">
                                                    </span>
                                                </span>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.5122610752639472_id"
                                 class="cap-field formmain_0085|auxiliary0.5122610752639472">
                                <section>
                                    <pre>党政办拟办意见</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="3" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0005_id" class="cap-field formmain_0085|field0005"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-flow is-none ">
                                    <div class="cap4-flow__right field-content-wrapper">
                                        <div class="cap4-flow__browse" style="border: 1px solid transparent;">
                                            <c:if test="${entity.field0005 !=''  && entity.field0005!=null  }">
                                                <textarea  class="xdRichTextBox" id="field0005" style="width: 613px;height:80px">${entity.field0005}</textarea>
                                            </c:if>
                                            <c:if test="${entity.field0005 =='' || entity.field0005==null }">
                                                <pre>${entity.field0005}</pre>
                                            </c:if>
                                         </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="31">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.7680595288458552_id"
                                 class="cap-field formmain_0085|auxiliary0.7680595288458552">
                                <section>
                                    <pre>校领导审批意见</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="3" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0004_id" class="cap-field formmain_0085|field0004"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-flow is-none ">
                                    <div class="cap4-flow__right field-content-wrapper">
                                        <div class="cap4-flow__browse" style="border: 1px solid transparent;">
                                            <c:if test="${entity.field0004 !=''  && entity.field0004!=null }">
                                                <textarea class="xdRichTextBox" id="field0004" style="width: 613px;height:80px">${entity.field0004}</textarea>
                                            </c:if>
                                            <c:if test="${entity.field0004 ==''  || entity.field0004==null }">
                                                <pre>${entity.field0004}</pre>
                                            </c:if>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.44595220200024_id"
                                 class="cap-field formmain_0085|auxiliary0.44595220200024">
                                <section>
                                    <pre>部门办理意见</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="3" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0002_id" class="cap-field formmain_0085|field0002"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-flow is-none ">
                                    <div class="cap4-flow__right field-content-wrapper">
                                        <div class="cap4-flow__browse" style="border: 1px solid transparent;">
                                            <c:if test="${entity.field0002 !='' && entity.field0002!=null }">
                                                <textarea class="xdRichTextBox" id="field0002" style="width: 613px;height:80px">${entity.field0002}</textarea>
                                            </c:if>
                                            <c:if test="${entity.field0002 ==''   || entity.field0002==null }">
                                                <pre>${entity.field0002}</pre>
                                            </c:if>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.4508202997363797_id"
                                 class="cap-field formmain_0085|auxiliary0.4508202997363797">
                                <section>
                                    <pre>备注</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="3" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0001_id" class="cap-field formmain_0085|field0001"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-text is-none  ">
                                    <div class="cap4-text__right field-content-wrapper">
                                        <div class="cap4-text__cnt field-content"
                                             style="border: 1px solid transparent;">
                                            <span id="field0001_span" class="edit_class" fieldval="{name:&quot;field0001&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;text1&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;textarea&quot;,formatType:&quot;&quot;,value:&quot;&quot;}">
                                                <textarea  class="xdRichTextBox" id="field0001" style="width: 613px;">${entity.field0001}</textarea>
                                            </span>
                                        </div><!---->
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <input id="formid" type="hidden" value="${entity.id}"/>
    <input id="summaryid" type="hidden" value="${entity.summaryid}" /><%--公文主表edoc_summary的id--%>
    <input id="fields0025" type="hidden" value="${entity.field0025}" />
    <input id="fjdatas"   type="hidden"/>


    <input id="field0005_yj" type="hidden" value="${entity.field0005}"/>
    <input id="field0004_yj" type="hidden" value="${entity.field0004}"/>
    <input id="field0002_yj" type="hidden" value="${entity.field0002}"/>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        initOption("field0022",${entity.field0022});//信访类型
        initOption("field0023",${entity.field0023});//信访渠道

        var field0005str=$("#field0005_yj").val();
        if(field0005str!=''){
            var field0005text = document.getElementById("field0005");
            makeExpandingArea(field0005text);
        }

        var field0004str=$("#field0004_yj").val();
        if(field0004str!=''){
            var field0004text = document.getElementById("field0004");//校领导
            makeExpandingArea(field0004text);
        }

        var field0002str=$("#field0002_yj").val();
        if(field0002str!=''){
            var field0002text = document.getElementById("field0002");//部门
            makeExpandingArea(field0002text);
        }

    });

    //保存form表单数据
    function saveXfxx(){
        var fjdata="";
        if($("#fjdatas").val()!=""){
            fjdata=JSON.parse($("#fjdatas").val());
        }
        var params={
            ID:$('#formid').val(),
            field0018:$('#field0018').val(), //信访标题
            field0017:$('#field0017').val().replace("Member|",""),//登记人
            field0016:$('#field0016').val().replace("Department|",""),//登记部门
            field0015:$('#field0015').val(),//信访人姓名
            field0014:$('#field0014').val(), //信访人单位
            field0013:$('#field0013').val(), //联系方式
            field0012:$('#field0012').val(),//接访时间
            field0011:$('#field0011').val(),//信访编号
            field0022:$('#field0022').val(),//信访类型
            field0023:$('#field0023').val(),//信访渠道
            field0007:$('#field0007').val(),//	信访内容摘要
            field0008:$('#field0008').val(),//材料
            field0005:$('#field0005').val(),//党政办拟办意见
            field0004:$('#field0004').val(),//校领导审批意见
            field0002:$('#field0002').val(),//部门办理意见
            field0025:$('#fields0025').val() //field0025  关联attachment中的sub_reference
        };

        $.ajax({
            url: _ctxPath + '/demo.do?method=toUpdateFormmain0085',
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
