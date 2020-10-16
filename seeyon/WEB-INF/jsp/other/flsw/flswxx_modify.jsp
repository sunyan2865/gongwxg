<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>法律事务修改</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" charset="UTF-8" src="${path}/common/content/form.js${ctp:resSuffix()}"></script>
    <script type="text/javascript" charset="UTF-8" src="${path}/apps_res/govdoc/js/govdocBody.js${ctp:resSuffix()}"></script>
    <script type="text/javascript" charset="UTF-8" src="${path}/apps_res/demo/util.js${ctp:resSuffix()}"></script>
</head>
<body style="height:1000px">
<div id="toolbar_4462223" style="float:right" class="toolbar_l clearfix">
    <a style="margin-right: 50px;margin-top: 20px;cursor: pointer;" class="common_button" onclick="saveFlxx()">
        <em id="saveDraft_em" class="ico16 save_traft_16"></em>
        <span id="saveDraft_span" class="menu_span" title="保存">保存</span>
    </a>
</div>
<div style="clear: both;"></div>
<div id="mainbodyDiv" style="height:100%;text-align: center;margin-top: 10px;margin-left: 70px;">
    <div align="center">
        <div id="tableName-front_formmain_1_0" style="width: 800px;overflow: auto hidden;">
            <table class="cap4-formmain__mTable" style="width: 800px;">
                <colgroup>
                    <col width="0px">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                </colgroup>
                <tr height="46">
                    <td class="rowgroup"></td>
                    <td colspan="4" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 18px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.18346920651842158_id"
                                 class="cap-field formmain_0084|auxiliary0.18346920651842158">
                                <section>
                                    <pre>中国矿业大学法律事务处理单</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="30">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.24075066754032837_id"
                                 class="cap-field formmain_0084|auxiliary0.24075066754032837">
                                <section>
                                    <pre>标题 </pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="3" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0001_id" class="cap-field formmain_0084|field0001"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-text is-none is-must ">
                                    <div class="cap4-text__right field-content-wrapper">
                                        <div class="cap4-text__cnt field-content"
                                             style="border: 1px solid transparent;"><input   id="field0001" style="width:99%;height:30px;border:1px solid #D4D4D4" value="${entity.field0001}"/></div><!---->
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
                            <div id="auxiliary0.02577353539358973_id"
                                 class="cap-field formmain_0084|auxiliary0.02577353539358973">
                                <section>
                                    <pre>登记人 </pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0002_id" class="cap-field formmain_0084|field0002"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-people is-none  ">
                                    <div class="cap4-people__right field-content-wrapper">
                                         <span id="field0002_span" class="edit_class" fieldval="{name:&quot;field0002&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;create_person&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;member&quot;,formatType:&quot;1&quot;,value:&quot;-4120520206381135530&quot;}">
                                                    <input type="text" onblur="calc(this);" class="xdTextBox validate comp" incondition="false" comp="type:&quot;selectPeople&quot;,showOriginalElement:false,isNeedCheckLevelScope:false,showAccountShortname:&quot;no&quot;,showAllOuterDepartment:true,showBtn:true,extendWidth:true,panels:&quot;Department,Team,Post,Level,Outworker,RelatePeople,JoinOrganization&quot;,selectType:&quot;Member&quot;
                                                    ,value:&quot;Member|${entity.field0002}&quot;,text:&quot;${entity.djr}&quot;,minSize:0,maxSize:1,preCallback:selectOrgPreCallBack,callback:selectOrgCallBack,valueChange:orgFieldOnChange,hasRelationField:false,departmentId:${entity.field0003},isMasterField:true,fieldName:&quot;field0002&quot;" unique="false" name="field0002_txt" mappingfield="create_person" incalculate="false" id="field0002_txt" data-role="none" validate="name:&quot;create_person&quot;,type:&quot;string&quot;,china3char:true,notNull:false" readonly="readonly" comptype="selectPeople" _inited="1"  style="width: 201px; text-overflow: clip;" oldval=${entity.djr}>

                                                     <input type="hidden" id="field0002" name="field0002"  style="display: none;">
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
                            <div id="auxiliary0.4155544421393449_id"
                                 class="cap-field formmain_0084|auxiliary0.4155544421393449">
                                <section>
                                    <pre>登记部门</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0003_id" class="cap-field formmain_0084|field0003"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-depart is-none  ">
                                    <div class="cap4-depart__right field-content-wrapper">
                                        <span id="field0003_span" class="editableSpan edit_class" fieldval="{name:&quot;field0003&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;send_department&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;department&quot;,formatType:&quot;1&quot;}">
                                                       <input type="text" onblur="calc(this);" class="comp validate" incondition="false"
                                                              comp="&quot;type&quot;:&quot;selectPeople&quot;,&quot;valueChange&quot;:orgFieldOnChange,&quot;showBtn&quot;:true,&quot;extendWidth&quot;:true,&quot;mode&quot;:&quot;open&quot;,&quot;panels&quot;:&quot;Department&quot;,&quot;isAllowContainsChildDept&quot;:true,&quot;isConfirmExcludeSubDepartment&quot;:false,&quot;selectType&quot;:&quot;Department&quot;,&quot;minSize&quot;:0,&quot;maxSize&quot;:1,&quot;preCallback&quot;:selectOrgPreCallBack,&quot;callback&quot;:selectOrgCallBack,&quot;hasRelationField&quot;:false,&quot;isMasterField&quot;:true,&quot;fieldName&quot;:&quot;field0003&quot;
                                                            ,&quot;value&quot;:&quot;Department|${entity.field0003}&quot;,&quot;text&quot;:&quot;${entity.djbm}&quot;" unique="false" name="field0002_txt" mappingfield="send_department" incalculate="false" id="field0003_txt" data-role="none" validate="name:&quot;send_department&quot;,type:&quot;string&quot;,china3char:true,notNull:true" readonly="readonly" comptype="selectPeople" _inited="1"  style="background-color: rgb(255, 255, 255); width: 201px; text-overflow: clip;" >
                                                       <input type="hidden" id="field0003" name="field0003" style="background-color: rgb(255, 255, 255); display: none;">
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
                            <div id="auxiliary0.5168828855576579_id"
                                 class="cap-field formmain_0084|auxiliary0.5168828855576579">
                                <section>
                                    <pre>送达人</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0004_id" class="cap-field formmain_0084|field0004"
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
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.7257280759414391_id"
                                 class="cap-field formmain_0084|auxiliary0.7257280759414391">
                                <section>
                                    <pre>送达方式</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0005_id" class="cap-field formmain_0084|field0005"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-text is-none  ">
                                    <div class="cap4-text__right field-content-wrapper">
                                        <div class="cap4-text__cnt field-content"
                                             style="border: 1px solid transparent;"><input   id="field0005" style="width:99%;height:30px;border:1px solid #D4D4D4" value="${entity.field0005}"/></div><!---->
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
                            <div id="auxiliary0.7369750147650265_id"
                                 class="cap-field formmain_0084|auxiliary0.7369750147650265">
                                <section>
                                    <pre>来文单位 </pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0006_id" class="cap-field formmain_0084|field0006"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-text is-none  ">
                                    <div class="cap4-text__right field-content-wrapper">
                                        <div class="cap4-text__cnt field-content"
                                             style="border: 1px solid transparent;"><input   id="field0006" style="width:99%;height:30px;border:1px solid #D4D4D4" value="${entity.field0006}"/></div><!---->
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.585452862322271_id"
                                 class="cap-field formmain_0084|auxiliary0.585452862322271">
                                <section>
                                    <pre>联系电话 </pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0007_id" class="cap-field formmain_0084|field0007"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-number is-none  ">
                                    <div class="cap4-number__right field-content-wrapper">
                                        <div class="cap4-number__cnt field-content"
                                             style="border: 1px solid transparent;">
                                            <input   id="field0007" style="width:99%;height:30px;border:1px solid #D4D4D4" value="${entity.field0007}"/>

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
                            <div id="auxiliary0.5434482853545566_id"
                                 class="cap-field formmain_0084|auxiliary0.5434482853545566">
                                <section>
                                    <pre>来文编号 </pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0008_id" class="cap-field formmain_0084|field0008"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-text is-none  ">
                                    <div class="cap4-text__right field-content-wrapper">
                                        <div class="cap4-text__cnt field-content"
                                             style="border: 1px solid transparent;"><input   id="field0008" style="width:99%;height:30px;border:1px solid #D4D4D4" value="${entity.field0008}"/></div><!---->
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.7052893240225473_id"
                                 class="cap-field formmain_0084|auxiliary0.7052893240225473">
                                <section>
                                    <pre>登记时间 </pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0009_id" class="cap-field formmain_0084|field0009"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-datetime is-none  ">
                                    <div class="cap4-datetime__right field-content-wrapper">
                                        <input  id="field0009" name="field0009"  type="text" value="${entity.djsj}" comp="type:&quot;calendar&quot;,cache:false,isOutShow:true,ifFormat:&quot;%Y-%m-%d&quot;" class="validate xdRichTextBox comp" incalculate="false" comptype="calendar"  style="width: 195px;" finalwidth="165">

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
                            <div id="auxiliary0.9482543232487501_id"
                                 class="cap-field formmain_0084|auxiliary0.9482543232487501">
                                <section>
                                    <pre>内容概要 </pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="3" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0010_id" class="cap-field formmain_0084|field0010"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-textarea is-none  ">
                                    <div class="cap4-textarea__right field-content-wrapper">
                                        <div class="cap4-textarea__cnt field-content"
                                             style="position: relative; border: 1px solid transparent;">
                                               <span id="field0010_span" class="edit_class" fieldval="{name:&quot;field0010&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;text1&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;textarea&quot;,formatType:&quot;&quot;,value:&quot;&quot;}">
                                            <textarea  class="xdRichTextBox" id="field0010" style="width: 613px;">${entity.field0010}</textarea>
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
                            <div id="auxiliary0.5988687123213652_id"
                                 class="cap-field formmain_0084|auxiliary0.5988687123213652">
                                <section>
                                    <pre>附件</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="3" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0011_id" class="cap-field formmain_0084|field0011"
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
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.46195126967720035_id"
                                 class="cap-field formmain_0084|auxiliary0.46195126967720035">
                                <section>
                                    <pre>备注 </pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="3" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0012_id" class="cap-field formmain_0084|field0012"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-textarea is-none  ">
                                    <div class="cap4-textarea__right field-content-wrapper">
                                        <div class="cap4-textarea__cnt field-content"
                                             style="position: relative; border: 1px solid transparent;"> <span id="field0012_span" class="edit_class" fieldval="{name:&quot;field0012&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;text1&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;textarea&quot;,formatType:&quot;&quot;,value:&quot;&quot;}">
                                                <textarea  class="xdRichTextBox" id="field0012" style="width: 613px;">${entity.field0012}</textarea>
                                            </span>
                                        </div><!---->
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="30">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.9973455743738115_id"
                                 class="cap-field formmain_0084|auxiliary0.9973455743738115">
                                <section>
                                    <pre>部门领导意见</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="3" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0013_id" class="cap-field formmain_0084|field0013"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-flow is-none ">
                                    <div class="cap4-flow__right field-content-wrapper">
                                        <div class="cap4-flow__browse" style="border: 1px solid transparent;">
                                            <c:if test="${entity.field0013 !='' && entity.field0013!=null }">
                                                <textarea class="xdRichTextBox" id="field0013" style="width: 613px;height:80px">${entity.field0013}</textarea>
                                            </c:if>
                                            <c:if test="${entity.field0013 ==''  || entity.field0013==null }">
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
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.0034803794481612638_id"
                                 class="cap-field formmain_0084|auxiliary0.0034803794481612638">
                                <section>
                                    <pre>校领导意见</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="3" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0015_id" class="cap-field formmain_0084|field0015"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-flow is-none ">
                                    <div class="cap4-flow__right field-content-wrapper">
                                        <div class="cap4-flow__browse" style="border: 1px solid transparent;">
                                            <c:if test="${entity.field0015 !=''  && entity.field0015!=null }">
                                                <textarea class="xdRichTextBox" id="field0015" style="width: 613px;height:80px">${entity.field0015}</textarea>
                                            </c:if>
                                            <c:if test="${entity.field0015 ==''  || entity.field0015==null }">
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
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: rgb(221, 239, 255); padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-left: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.19522926877273106_id"
                                 class="cap-field formmain_0084|auxiliary0.19522926877273106">
                                <section>
                                    <pre>承办部门意见 </pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="3" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(134, 184, 225); border-right: 1px solid rgb(134, 184, 225); width: 200px;">
                        <div class="cap4-formmain__td">
                            <div id="field0017_id" class="cap-field formmain_0084|field0017"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-flow is-none ">
                                    <div class="cap4-flow__right field-content-wrapper">
                                        <div class="cap4-flow__browse" style="border: 1px solid transparent;">
                                            <c:if test="${entity.field0017 !=''  && entity.field0017!=null }">
                                                <textarea class="xdRichTextBox" id="field0017" style="width: 613px;height:80px">${entity.field0017}</textarea>
                                            </c:if>
                                            <c:if test="${entity.field0017 =='' || entity.field0017==null }">
                                                <pre>${entity.field0017}</pre>
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

    <input id="field0013_yj" type="hidden" value="${entity.field0013}"/><%--部门领导意见--%>
    <input id="field0015_yj" type="hidden" value="${entity.field0015}"/><%--校领导意见--%>
    <input id="field0017_yj" type="hidden" value="${entity.field0017}"/><%--承办部门意见--%>

    <input id="field0010_nrgy" type="hidden" value="${entity.field0010}"/><%--内容概要--%>
    <input id="field0012_bz" type="hidden" value="${entity.field0012}"/><%--备注--%>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        var field0013_yj=$("#field0013_yj").val();
        if(field0013_yj!=''){
            var field0013text = document.getElementById("field0013");
            makeExpandingArea(field0013text);
        }

        var field0015_yj=$("#field0015_yj").val();
        if(field0015_yj!=''){
            var field0015text = document.getElementById("field0015");//校领导
            makeExpandingArea(field0015text);
        }

        var field0017_yj=$("#field0017_yj").val();
        if(field0017_yj!=''){
            var field0017text = document.getElementById("field0017");//部门
            makeExpandingArea(field0017text);
        }


        var field0010_nrgy=$("#field0010_nrgy").val();
        if(field0010_nrgy!=''){
            var field0010text = document.getElementById("field0010");//内容概要
            makeExpandingArea(field0010text);
        }

        var field0012_bz=$("#field0012_bz").val();
        if(field0012_bz!=''){
            var field0012text = document.getElementById("field0012");//备注
            makeExpandingArea(field0012text);
        }


    });

    //保存form表单数据
    function saveFlxx(){
        var fjdata="";
        if($("#fjdatas").val()!=""){
            fjdata=JSON.parse($("#fjdatas").val());
        }
        var params={
            ID:$('#formid').val(),
            field0001:$('#field0001').val(), //标题
            field0002:$('#field0002').val().replace("Member|",""),//登记人
            field0003:$('#field0003').val().replace("Department|",""),//登记部门
            field0004:$('#field0004').val(),//送达人
            field0005:$('#field0005').val(), //送达方式
            field0006:$('#field0006').val(), //来文单位
            field0007:$('#field0007').val(),//联系电话
            field0008:$('#field0008').val(),//来文编号
            field0009:$('#field0009').val(),//登记时间
            field0010:$('#field0010').val(),//内容概要
            field0012:$('#field0012').val(),//备注
            field0013:$('#field0013').val(),//部门领导意见
            field0015:$('#field0015').val(),//校领导意见
            field0017:$('#field0017').val(),//承办部门意见
            field0011:$('#fields0011').val() //field0011  关联attachment中的sub_reference
        };
        $.ajax({
            url: _ctxPath + '/demo.do?method=toUpdateFormmain0084',
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
