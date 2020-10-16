<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>哲社报告修改</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" charset="UTF-8" src="${path}/common/content/form.js${ctp:resSuffix()}"></script>
    <script type="text/javascript" charset="UTF-8" src="${path}/apps_res/govdoc/js/govdocBody.js${ctp:resSuffix()}"></script>
    <script type="text/javascript" charset="UTF-8" src="${path}/apps_res/demo/util.js${ctp:resSuffix()}"></script>
</head>
<body style="height:1000px">
<div id="toolbar_4462223" style="float:right" class="toolbar_l clearfix">
    <a style="margin-right: 50px;margin-top: 20px;cursor: pointer;" class="common_button" onclick="saveZsbg()">
        <em id="saveDraft_em" class="ico16 save_traft_16"></em>
        <span id="saveDraft_span" class="menu_span" title="保存">保存</span>
    </a>
</div>
<div style="clear: both;"></div>
<div id="mainbodyDiv" style=" overflow: auto hidden;height:100%;text-align: center;margin-top: 10px;margin-left: -35px;">
    <div align="center">
        <div id="tableName-front_formmain_1_0" style="width: 800px;">
            <table class="cap4-formmain__mTable" style="width: 800px;">
                <colgroup>
                    <col width="0px">
                    <col width="134">
                    <col width="134">
                    <col width="133">
                    <col width="133">
                    <col width="133">

                </colgroup>
                <tr height="39">
                    <td class="rowgroup"></td>
                    <td colspan="6" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 18px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); width: 134px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.2754746364170899_id"
                                 class="cap-field formmain_0091|auxiliary0.2754746364170899">
                                <section>
                                    <pre>哲学社会科学报告会、研讨会、讲座、论坛审批表</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td  rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 268px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.4412488328326536_id"
                                 class="cap-field formmain_0091|auxiliary0.4412488328326536">
                                <section>
                                    <pre>申请单位</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 133px;">
                        <div class="cap4-formmain__td">
                            <div id="field0001_id" class="cap-field formmain_0091|field0001"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-depart is-none  ">
                                    <div class="cap4-depart__right field-content-wrapper">
                                        <span id="field0001_span" class="editableSpan edit_class" fieldval="{name:&quot;field0001&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;send_department&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;department&quot;,formatType:&quot;1&quot;}">
                                                       <input type="text" onblur="calc(this);" class="comp validate" incondition="false"
                                                              comp="&quot;type&quot;:&quot;selectPeople&quot;,&quot;valueChange&quot;:orgFieldOnChange,&quot;showBtn&quot;:true,&quot;extendWidth&quot;:true,&quot;mode&quot;:&quot;open&quot;,&quot;panels&quot;:&quot;Department&quot;,&quot;isAllowContainsChildDept&quot;:true,&quot;isConfirmExcludeSubDepartment&quot;:false,&quot;selectType&quot;:&quot;Department&quot;,&quot;minSize&quot;:0,&quot;maxSize&quot;:1,&quot;preCallback&quot;:selectOrgPreCallBack,&quot;callback&quot;:selectOrgCallBack,&quot;hasRelationField&quot;:false,&quot;isMasterField&quot;:true,&quot;fieldName&quot;:&quot;field0001&quot;
                                                            ,&quot;value&quot;:&quot;Department|${entity.field0001}&quot;,&quot;text&quot;:&quot;${entity.djbm}&quot;" unique="false" name="field0001_txt" mappingfield="send_department" incalculate="false" id="field0001_txt" data-role="none" validate="name:&quot;send_department&quot;,type:&quot;string&quot;,china3char:true,notNull:true" readonly="readonly" comptype="selectPeople" _inited="1"  style="background-color: rgb(255, 255, 255); width: 615px; text-overflow: clip;" >
                                                       <input type="hidden" id="field0001" name="field0001" style="background-color: rgb(255, 255, 255); display: none;">
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
                    <td rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 268px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.9085632408526656_id"
                                 class="cap-field formmain_0091|auxiliary0.9085632408526656">
                                <section>
                                    <pre>申请人</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 133px;">
                        <div class="cap4-formmain__td">
                            <div id="field0002_id" class="cap-field formmain_0091|field0002"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-people is-none  ">
                                    <div class="cap4-people__right field-content-wrapper">
                                       <span id="field0002_span" class="edit_class" fieldval="{name:&quot;field0002&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;create_person&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;member&quot;,formatType:&quot;1&quot;,value:&quot;-4120520206381135530&quot;}">
                                                    <input type="text" onblur="calc(this);" class="xdTextBox validate comp" incondition="false" comp="type:&quot;selectPeople&quot;,showOriginalElement:false,isNeedCheckLevelScope:false,showAccountShortname:&quot;no&quot;,showAllOuterDepartment:true,showBtn:true,extendWidth:true,panels:&quot;Department,Team,Post,Level,Outworker,RelatePeople,JoinOrganization&quot;,selectType:&quot;Member&quot;
                                                    ,value:&quot;Member|${entity.field0002}&quot;,text:&quot;${entity.djr}&quot;,minSize:0,maxSize:1,preCallback:selectOrgPreCallBack,callback:selectOrgCallBack,valueChange:orgFieldOnChange,hasRelationField:false,departmentId:${entity.field0001},isMasterField:true,fieldName:&quot;field0002&quot;" unique="false" name="field0002_txt" mappingfield="create_person" incalculate="false" id="field0002_txt" data-role="none" validate="name:&quot;create_person&quot;,type:&quot;string&quot;,china3char:true,notNull:false" readonly="readonly" comptype="selectPeople" _inited="1"  style="width: 615px; text-overflow: clip;" oldval=${entity.djr}>

                                                     <input type="hidden" id="field0002" name="field0002"  style="display: none;">
                                                  <span _isrel="1" class="ico16 radio_people_16 _autoBtn"></span>
                                              </span>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td  rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 268px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.42031466401345097_id"
                                 class="cap-field formmain_0091|auxiliary0.42031466401345097">
                                <section>
                                    <pre>报告现场责任人</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 133px;">
                        <div class="cap4-formmain__td">
                            <div id="field0003_id" class="cap-field formmain_0091|field0003"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-people is-none  ">
                                    <div class="cap4-people__right field-content-wrapper">
                                       <span id="field0003_span" class="edit_class" fieldval="{name:&quot;field0003&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;create_person&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;member&quot;,formatType:&quot;1&quot;,value:&quot;-4120520206381135530&quot;}">
                                                   <c:if test="${entity.field0003 !=''  && entity.field0003!=null  }">
                                                       <input type="text" onblur="calc(this);" class="xdTextBox validate comp" incondition="false" comp="type:&quot;selectPeople&quot;,showOriginalElement:false,isNeedCheckLevelScope:false,showAccountShortname:&quot;no&quot;,showAllOuterDepartment:true,showBtn:true,extendWidth:true,panels:&quot;Department,Team,Post,Level,Outworker,RelatePeople,JoinOrganization&quot;,selectType:&quot;Member&quot;
                                                        ,value:&quot;Member|${entity.field0003}&quot;,text:&quot;${entity.xcbgzrr}&quot;,minSize:0,maxSize:1,preCallback:selectOrgPreCallBack,callback:selectOrgCallBack,valueChange:orgFieldOnChange,hasRelationField:false,departmentId:${entity.xcbgzrrdw},isMasterField:true,fieldName:&quot;field0003&quot;" unique="false" name="field0003_txt" mappingfield="create_person" incalculate="false" id="field0003_txt" data-role="none" validate="name:&quot;create_person&quot;,type:&quot;string&quot;,china3char:true,notNull:false" readonly="readonly" comptype="selectPeople" _inited="1"  style="width: 615px; text-overflow: clip;" oldval=${entity.xcbgzrr}>

                                                   </c:if>
                                                    <c:if test="${entity.field0003 ==''  || entity.field0003==null  }">
                                                       <input type="text" onblur="calc(this);" class="xdTextBox validate comp" incondition="false" comp="type:&quot;selectPeople&quot;,showOriginalElement:false,isNeedCheckLevelScope:false,showAccountShortname:&quot;no&quot;,showAllOuterDepartment:true,showBtn:true,extendWidth:true,panels:&quot;Department,Team,Post,Level,Outworker,RelatePeople,JoinOrganization&quot;,selectType:&quot;Member&quot;
                                                        ,value:&quot;&quot;,text:&quot;&quot;,minSize:0,maxSize:1,preCallback:selectOrgPreCallBack,callback:selectOrgCallBack,valueChange:orgFieldOnChange,hasRelationField:false,departmentId:&quot;&quot;,isMasterField:true,fieldName:&quot;field0003&quot;" unique="false" name="field0003_txt" mappingfield="create_person" incalculate="false" id="field0003_txt" data-role="none" validate="name:&quot;create_person&quot;,type:&quot;string&quot;,china3char:true,notNull:false" readonly="readonly" comptype="selectPeople" _inited="1"  style="width: 615px; text-overflow: clip;" >

                                                    </c:if>

                                                     <input type="hidden" id="field0003" name="field0003"  style="display: none;">
                                                  <span _isrel="1" class="ico16 radio_people_16 _autoBtn"></span>
                                              </span>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 268px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.6027341006605265_id"
                                 class="cap-field formmain_0091|auxiliary0.6027341006605265">
                                <section>
                                    <pre>手机号码</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 133px;">
                        <div class="cap4-formmain__td">
                            <div id="field0004_id" class="cap-field formmain_0091|field0004"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-text is-none  ">
                                    <div class="cap4-text__right field-content-wrapper">
                                        <div class="cap4-text__cnt field-content"
                                             style="border: 1px solid transparent;"> <input   id="field0004" style="width:99%;height:30px;border:1px solid #D4D4D4" value="${entity.field0004}"/></div><!---->
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td  rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 268px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.49100071769353804_id"
                                 class="cap-field formmain_0091|auxiliary0.49100071769353804">
                                <section>
                                    <pre>报告会、研讨会、讲座、论坛的名称</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 133px;">
                        <div class="cap4-formmain__td">
                            <div id="field0005_id" class="cap-field formmain_0091|field0005"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-text is-none is-must ">
                                    <div class="cap4-text__right field-content-wrapper">
                                        <div class="cap4-text__cnt field-content"
                                             style="border: 1px solid transparent;"> <input   id="field0005" style="width:99%;height:30px;border:1px solid #D4D4D4" value="${entity.field0005}"/></div><!---->
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 268px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.6483487198214297_id"
                                 class="cap-field formmain_0091|auxiliary0.6483487198214297">
                                <section>
                                    <pre>举办时间</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 133px;">
                        <div class="cap4-formmain__td">
                            <div id="field0006_id" class="cap-field formmain_0091|field0006"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-datetime is-none is-must ">
                                    <div class="cap4-datetime__right field-content-wrapper">
                                        <input  id="field0006" name="field0006"  type="text" value="${entity.jbsj}" comp="type:&quot;calendar&quot;,cache:false,isOutShow:true,ifFormat:&quot;%Y-%m-%d&quot;" class="validate xdRichTextBox comp" incalculate="false" comptype="calendar"  style="width: 195px;" finalwidth="165">

                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td  rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 268px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.9361535571219546_id"
                                 class="cap-field formmain_0091|auxiliary0.9361535571219546">
                                <section>
                                    <pre>举办地点</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 133px;">
                        <div class="cap4-formmain__td">
                            <div id="field0007_id" class="cap-field formmain_0091|field0007"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-text is-none is-must ">
                                    <div class="cap4-text__right field-content-wrapper">
                                        <div class="cap4-text__cnt field-content"
                                             style="border: 1px solid transparent;"><input   id="field0007" style="width:99%;height:30px;border:1px solid #D4D4D4" value="${entity.field0007}"/></div><!---->
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td  rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 268px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.5652367896083368_id"
                                 class="cap-field formmain_0091|auxiliary0.5652367896083368">
                                <section>
                                    <pre>参加人员范围及人数</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 133px;">
                        <div class="cap4-formmain__td">
                            <div id="field0008_id" class="cap-field formmain_0091|field0008"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-text is-none is-must ">
                                    <div class="cap4-text__right field-content-wrapper">
                                        <div class="cap4-text__cnt field-content"
                                             style="border: 1px solid transparent;"><input   id="field0008" style="width:99%;height:30px;border:1px solid #D4D4D4" value="${entity.field0008}"/></div><!---->
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td  rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 268px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.6696545875072235_id"
                                 class="cap-field formmain_0091|auxiliary0.6696545875072235">
                                <section>
                                    <pre>报告人基本情况</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 133px;">
                        <div class="cap4-formmain__td">
                            <div id="field0009_id" class="cap-field formmain_0091|field0009"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-textarea is-none is-must ">
                                    <div class="cap4-textarea__right field-content-wrapper">
                                        <span id="field0009_span" class="edit_class" fieldval="{name:&quot;field0009&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;text1&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;textarea&quot;,formatType:&quot;&quot;,value:&quot;&quot;}">
                                                <textarea  class="xdRichTextBox" id="field0009" style="width: 613px;">${entity.field0009}</textarea>
                                            </span>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td  rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 268px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.5453803167969704_id"
                                 class="cap-field formmain_0091|auxiliary0.5453803167969704">
                                <section>
                                    <pre>报告会、研讨会、讲座、论坛的主题框架</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 133px;">
                        <div class="cap4-formmain__td">
                            <div id="field0010_id" class="cap-field formmain_0091|field0010"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-textarea is-none is-must ">
                                    <div class="cap4-textarea__right field-content-wrapper">
                                         <span id="field0010_span" class="edit_class" fieldval="{name:&quot;field0010&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;text1&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;textarea&quot;,formatType:&quot;&quot;,value:&quot;&quot;}">
                                                <textarea  class="xdRichTextBox" id="field0010" style="width: 613px;">${entity.field0010}</textarea>
                                            </span>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td  rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 268px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.2249821542792363_id"
                                 class="cap-field formmain_0091|auxiliary0.2249821542792363">
                                <section>
                                    <pre>附件</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 133px;">
                        <div class="cap4-formmain__td">
                            <div id="field0011_id" class="cap-field formmain_0091|field0011"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-attach is-none  ">
                                    <div class="cap4-attach__right field-content-wrapper">
                                        <div align="left" >
                                            <span class="xdlabel"></span>
                                            <!--动态-->
                                            <span id="field0011_span" mappingfield="attachments" class="edit_class" fieldval="{name:&quot;field0011&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;attachments&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;attachment&quot;,formatType:&quot;&quot;,value:&quot;&quot;}" style="display: inline-block;">
                                                    <div class="comp" comp="type:'fileupload',callMethod:'fileValueChangeCallBack',delCallMethod:'fileDelCallBack',takeOver:false,isBR:true,canDeleteOriginalAtts:true,canFavourite:'true',notNull:'false',displayMode:'visible',autoHeight:true,applicationCategory:'2',embedInput:'field0011',attachmentTrId:'1209558887199034033'"
                                                         attsdata="${fjsonArray}" comptype="fileupload" style="display: none;">
                                                        <input type="text" <%--style="display: none; width: 474px;"--%> id="field0011" name="field0011" value="${entity.field0011}">
                                                    </div>
                                                    <div id="attachmentArea-1694224470510517265" style="overflow-x: hidden; min-height: 24px; width: 600px;" requrl="/seeyon/fileUpload.do?type=0&amp;inputId=undefined&amp;applicationCategory=2&amp;extensions=&amp;maxSize=&amp;isEncrypt=&amp;popupTitleKey=&amp;attachmentTrId=-1694224470510517265&amp;embedInput=field0011" class="left">
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
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td  rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 268px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.5927027639652498_id"
                                 class="cap-field formmain_0091|auxiliary0.5927027639652498">
                                <section>
                                    <pre>申请单位审批意见</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 133px;">
                        <div class="cap4-formmain__td">
                            <div id="field0012_id" class="cap-field formmain_0091|field0012"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-flow is-none ">
                                    <div class="cap4-flow__right field-content-wrapper">
                                        <div class="cap4-flow__browse" style="border: 1px solid transparent;">
                                           <c:if test="${entity.field0012 !=''  && entity.field0012!=null  }">
                                                <textarea  class="xdRichTextBox" id="field0012" style="width: 613px;height:80px">${entity.field0012}</textarea>
                                            </c:if>
                                            <c:if test="${entity.field0012 =='' || entity.field0012==null}">
                                                <pre>${entity.field0012}</pre>
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
                    <td  rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 268px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.033362585427454405_id"
                                 class="cap-field formmain_0091|auxiliary0.033362585427454405">
                                <section>
                                    <pre>国际合作交流处审批意见</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 133px;">
                        <div class="cap4-formmain__td">
                            <div id="field0013_id" class="cap-field formmain_0091|field0013"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-flow is-none ">
                                    <div class="cap4-flow__right field-content-wrapper">
                                        <div class="cap4-flow__browse" style="border: 1px solid transparent;">
                                           <c:if test="${entity.field0013 !=''  && entity.field0013!=null  }">
                                                <textarea  class="xdRichTextBox" id="field0013" style="width: 613px;height:80px">${entity.field0013}</textarea>
                                            </c:if>
                                            <c:if test="${entity.field0013 =='' || entity.field0013==null }">
                                                <pre>${entity.field0013}</pre>
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
                    <td  rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 268px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.47129427250160427_id"
                                 class="cap-field formmain_0091|auxiliary0.47129427250160427">
                                <section>
                                    <pre>党委宣传部审批意见</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 133px;">
                        <div class="cap4-formmain__td">
                            <div id="field0014_id" class="cap-field formmain_0091|field0014"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-flow is-none ">
                                    <div class="cap4-flow__right field-content-wrapper">
                                        <div class="cap4-flow__browse" style="border: 1px solid transparent;">
                                            <c:if test="${entity.field0014 !=''  && entity.field0014!=null  }">
                                                <textarea  class="xdRichTextBox" id="field0013" style="width: 613px;height:80px">${entity.field0014}</textarea>
                                            </c:if>
                                            <c:if test="${entity.field0014 ==''  || entity.field0014==null }">
                                                <pre>${entity.field0014}</pre>
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
                    <td  rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 268px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.02243858090240547_id"
                                 class="cap-field formmain_0091|auxiliary0.02243858090240547">
                                <section>
                                    <pre>科学技术研究院审批意见</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 133px;">
                        <div class="cap4-formmain__td">
                            <div id="field0015_id" class="cap-field formmain_0091|field0015"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-flow is-none ">
                                    <div class="cap4-flow__right field-content-wrapper">
                                        <div class="cap4-flow__browse" style="border: 1px solid transparent;">
                                            <c:if test="${entity.field0015 !=''  && entity.field0015!=null  }">
                                                <textarea  class="xdRichTextBox" id="field0013" style="width: 613px;height:80px">${entity.field0015}</textarea>
                                            </c:if>
                                            <c:if test="${entity.field0015 =='' || entity.field0015==null  }">
                                                <pre>${entity.field0015}</pre>
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
                    <td  rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 268px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.5720797699975324_id"
                                 class="cap-field formmain_0091|auxiliary0.5720797699975324">
                                <section>
                                    <pre>校领导审批意见</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 133px;">
                        <div class="cap4-formmain__td">
                            <div id="field0016_id" class="cap-field formmain_0091|field0016"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-flow is-none ">
                                    <div class="cap4-flow__right field-content-wrapper">
                                        <div class="cap4-flow__browse" style="border: 1px solid transparent;">
                                           <c:if test="${entity.field0016 !=''  && entity.field0016!=null  }">
                                                <textarea  class="xdRichTextBox" id="field0016" style="width: 613px;height:80px">${entity.field0016}</textarea>
                                            </c:if>
                                            <c:if test="${entity.field0016 =='' }">
                                                <pre>${entity.field0016}</pre>
                                            </c:if>
                                        </div>
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
    <input id="summaryid" type="hidden" value="${entity.summaryid}" /><%--主表col_summary的id--%>
    <input id="fields0011" type="hidden" value="${entity.field0011}" />
    <input id="fjdatas"   type="hidden"/>


    <input id="field0012_yj" type="hidden" value="${entity.field0012}"/><%--申请单位审批意见--%>
    <input id="field0013_yj" type="hidden" value="${entity.field0013}"/><%--国际合作交流处审批意见--%>
    <input id="field0014_yj" type="hidden" value="${entity.field0014}"/><%--党委宣传部审批意见--%>
    <input id="field0015_yj" type="hidden" value="${entity.field0015}"/><%--科学技术研究院审批意见--%>
    <input id="field0016_yj" type="hidden" value="${entity.field0016}"/><%--校领导审批意见--%>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        var field0012_yj=$("#field0012_yj").val();
        if(field0012_yj!=''){
            var field0012text = document.getElementById("field0012");//申请单位审批意见
            makeExpandingArea(field0012text);
        }

        var field0013_yj=$("#field0013_yj").val();
        if(field0013_yj!=''){
            var field0013text = document.getElementById("field0013");//国际合作交流处审批意见
            makeExpandingArea(field0013text);
        }

        var field0014_yj=$("#field0014_yj").val();
        if(field0014_yj!=''){
            var field0014text = document.getElementById("field0014");//党委宣传部审批意见
            makeExpandingArea(field0014text);
        }


        var field0015_yj=$("#field0015_yj").val();
        if(field0015_yj!=''){
            var field0015text = document.getElementById("field0015");//科学技术研究院审批意见
            makeExpandingArea(field0015text);
        }

        var field0016_yj=$("#field0016_yj").val();
        if(field0016_yj!=''){
            var field0016text = document.getElementById("field0016");//校领导审批意见
            makeExpandingArea(field0016text);
        }

    });


    //保存form表单数据
    function saveZsbg(){
        var fjdata="";
        if($("#fjdatas").val()!=""){
            fjdata=JSON.parse($("#fjdatas").val());
        }
        var params={
            ID:$('#formid').val(),
            field0001:$('#field0001').val().replace("Department|",""),//申请单位
            field0002:$('#field0002').val().replace("Member|",""),//申请人
            field0003:$('#field0003').val().replace("Member|",""),//报告现场责任人
            field0004:$('#field0004').val(), //手机号码
            field0005:$('#field0005').val(), //名称
            field0006:$('#field0006').val(),//举办时间
            field0007:$('#field0007').val(),//举办地点
            field0008:$('#field0008').val(), //参加人员范围及人数
            field0009:$('#field0009').val(), //报告人基本情况
            field0010:$('#field0010').val(),//主题框架
            field0012:$('#field0012').val(),//申请单位审批意见
            field0013:$('#field0013').val(),//国际合作交流处审批意见
            field0014:$('#field0014').val(),//党委宣传部审批意见
            field0015:$('#field0015').val(),//科学技术研究院审批意见
            field0016:$('#field0016').val(),//校领导审批意见
            field0011:$('#fields0011').val() //field0011  关联attachment中的sub_reference
        };
        $.ajax({
            url: _ctxPath + '/demo.do?method=toUpdateFormmain0091',
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
