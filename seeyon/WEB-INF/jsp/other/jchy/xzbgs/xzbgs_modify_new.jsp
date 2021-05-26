<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>校长办公会议题申报信息</title>
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
        <div id="tableName-front_formmain_1_0" style="width: 900px; overflow: auto hidden;">
            <table class="cap4-formmain__mTable" style="width: 799px;">
                <colgroup>
                    <col width="0px">
                    <col width="134">
                    <col width="146">
                    <col width="67">
                    <col width="20">
                    <col width="76">
                    <col width="144">
                    <col width="33">
                    <col width="59">
                    <col width="67">
                    <col width="53">
                </colgroup>
                <tr height="50">
                    <td class="rowgroup"></td>
                    <td colspan="10" rowspan="1"
                        style="font-family: simsun; font-size: 16px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); width: 134px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.8409866582613774_id"
                                 class="cap-field formmain_0285|auxiliary0.8409866582613774">
                                <section style="line-height: normal;">
                                    <pre>中国矿业大学校长办公会议题申报表</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="40">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: simsun; font-size: 14px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51,51,51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.6208462873986804_id"
                                 class="cap-field formmain_0285|auxiliary0.6208462873986804">
                                <section style="line-height: normal;">
                                    <pre>议题名称</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="9" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 146px;">
                        <div class="cap4-formmain__td">
                            <div id="field0001_id" class="cap-field formmain_0285|field0001"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-text is-none is-must ">
                                    <div class="cap4-text__right field-content-wrapper">
                                        <div class="cap4-text__cnt field-content" style="font-family: simsun; border: 1px solid transparent;">
                                            <input   id="field0001" style="width:99.5%;height:30px;border:1px solid #D4D4D4" value="${entity.field0001}"/>
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
                        style="font-family: simsun; font-size: 14px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.6932440962945887_id"
                                 class="cap-field formmain_0285|auxiliary0.6932440962945887">
                                <section style="line-height: normal;">
                                    <pre>需要决策事项</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="9" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 146px;">
                        <div class="cap4-formmain__td">
                            <div id="field0002_id" class="cap-field formmain_0285|field0002"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-textarea is-none is-must ">
                                    <div class="cap4-textarea__right field-content-wrapper">
                                        <div class="cap4-textarea__cnt field-content" style="position: relative; border: 1px solid transparent;">
                                            <span id="field0002_span" class="edit_class" fieldval="{name:&quot;field0002&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;text1&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;textarea&quot;,formatType:&quot;&quot;,value:&quot;&quot;}">
                                            <textarea  class="xdRichTextBox" id="field0002" style="width: 690px;">${entity.field0002}</textarea>
                                        </span>
                                        </div><!---->
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="40">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: simsun; font-size: 14px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.6544377245565247_id"
                                 class="cap-field formmain_0285|auxiliary0.6544377245565247">
                                <section style="line-height: normal;">
                                    <pre>建议列席单位</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="9" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 146px;">
                        <div class="cap4-formmain__td">
                            <div id="field0003_id" class="cap-field formmain_0285|field0003"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-text is-none  ">
                                    <div class="cap4-text__right field-content-wrapper">
                                        <div class="cap4-text__cnt field-content" style="border: 1px solid transparent;">
                                            <input   id="field0003" style="width:99.5%;height:30px;border:1px solid #D4D4D4" value="${entity.field0003}"/>
                                        </div><!---->
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="40">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: simsun; font-size: 14px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.05739427742109271_id"
                                 class="cap-field formmain_0285|auxiliary0.05739427742109271">
                                <section style="line-height: normal;">
                                    <pre>预计时长</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); width: 146px;">
                        <div class="cap4-formmain__td">
                            <div id="field0004_id" class="cap-field formmain_0285|field0004"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-select is-none  ">
                                    <div class="cap4-select__right field-content-wrapper">
                                        <select name="field0004" id="field0004" style="width:100%" >
                                            <option val4cal="0" value="" selected=""></option>
                                            <c:forEach items="${yjscoption}" var="t">
                                                <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); width: 67px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); width: 20px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); width: 76px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); width: 144px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); width: 33px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); width: 59px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); width: 67px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 53px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                </tr>
                <tr height="40">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: simsun; font-size: 14px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.7114176895255717_id"
                                 class="cap-field formmain_0285|auxiliary0.7114176895255717">
                                <section style="line-height: normal;">
                                    <pre>议题材料</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="9" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 146px;">
                        <div class="cap4-formmain__td">
                            <div id="field0005_id" class="cap-field formmain_0285|field0005"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-attach is-none  ">
                                    <div class="cap4-attach__right field-content-wrapper">
                                        <div align="left" >
                                            <span class="xdlabel"></span>
                                            <!--动态-->
                                            <span id="field0005_span" mappingfield="attachments" class="edit_class" fieldval="{name:&quot;field0005&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;attachments&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;attachment&quot;,formatType:&quot;&quot;,value:&quot;&quot;}" style="display: inline-block;">
                                                            <div class="comp" comp="type:'fileupload',callMethod:'fileValueChangeCallBack',delCallMethod:'fileDelCallBack',takeOver:false,isBR:true,canDeleteOriginalAtts:true,canFavourite:'true',notNull:'false',displayMode:'visible',autoHeight:true,applicationCategory:'2',embedInput:'field0005',attachmentTrId:'1209558887199034033'"
                                                                 attsdata="${fjsonArray}" comptype="fileupload" style="display: none;">
                                                                <input type="text" <%--style="display: none; width: 474px;"--%> id="field0005" name="field0005" value="${entity.field0005}">
                                                            </div>
                                                            <div id="attachmentArea-1694224470510517265" style="overflow-x: hidden; min-height: 24px; width: 600px;" requrl="/seeyon/fileUpload.do?type=0&amp;inputId=undefined&amp;applicationCategory=2&amp;extensions=&amp;maxSize=&amp;isEncrypt=&amp;popupTitleKey=&amp;attachmentTrId=-1694224470510517265&amp;embedInput=field0005" class="left">
                                                                <c:forEach items="${fjlist}" var="fj">
                                                                    <div id="attachmentDiv_${fj.file_url}" class="attachment_block attachmentShowDelete" style="font-size:12px; max-width:454px; float:left; line-height:22px;*line-height:22px;background:#e6eef7;padding:2px 10px;border-radius:3px; overflow:hidden; word-wrap:break-word; word-break:break-all;"<%-- onmouseenter="onAttachmentMouseEnter(this)" onmouseleave="onAttachmentMouseLeave(this)"--%>>&nbsp;
                                                                        <span style="word-wrap:break-word; word-break:break-all;" class="ico16 doc_16 margin_r_5"></span>
                                                                        <a  href="/seeyon/filedown.do?method=fileDownload_zdy&amp;fileurl=${fj.file_url}&amp;createDate=${fj.date}&amp;filename=${fj.filename}" title=${fj.filename} target="downloadFileFrame" style="font-size:12px;color:#757575;">
                                                                            <span id="field0005_txt" style="line-height:normal">${fj.filename}(${fj.filesize}KB)</span>
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
                <tr height="40">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: simsun; font-size: 14px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.5501806980298916_id"
                                 class="cap-field formmain_0285|auxiliary0.5501806980298916">
                                <section style="line-height: normal;">
                                    <pre>申报单位</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="3" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 146px;">
                        <div class="cap4-formmain__td">
                            <div id="field0027_id" class="cap-field formmain_0285|field0027"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-depart is-none  ">
                                    <div class="cap4-depart__right field-content-wrapper">
                                         <span id="field0027_span" class="editableSpan edit_class" fieldval="{name:&quot;field0027&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;send_department&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;department&quot;,formatType:&quot;1&quot;}">
                                                       <input type="text" onblur="calc(this);" class="comp validate" incondition="false"
                                                              comp="&quot;type&quot;:&quot;selectPeople&quot;,&quot;valueChange&quot;:orgFieldOnChange,&quot;showBtn&quot;:true,&quot;extendWidth&quot;:true,&quot;mode&quot;:&quot;open&quot;,&quot;panels&quot;:&quot;Department&quot;,&quot;isAllowContainsChildDept&quot;:true,&quot;isConfirmExcludeSubDepartment&quot;:false,&quot;selectType&quot;:&quot;Department&quot;,&quot;minSize&quot;:0,&quot;maxSize&quot;:1,&quot;preCallback&quot;:selectOrgPreCallBack,&quot;callback&quot;:selectOrgCallBack,&quot;hasRelationField&quot;:false,&quot;isMasterField&quot;:true,&quot;fieldName&quot;:&quot;field0027&quot;
                                                            ,&quot;value&quot;:&quot;Department|${entity.field0027}&quot;,&quot;text&quot;:&quot;${entity.sbdwmc}&quot;" unique="false" name="field0027_txt" mappingfield="send_department" incalculate="false" id="field0027_txt" data-role="none" validate="name:&quot;send_department&quot;,type:&quot;string&quot;,china3char:true,notNull:true" readonly="readonly" comptype="selectPeople" _inited="1"  style="background-color: rgb(255, 255, 255); width: 201px; text-overflow: clip;" >
                                                       <input type="hidden" id="field0027" name="field0027" style="background-color: rgb(255, 255, 255); display: none;">
                                                       <span _isrel="1" class="ico16 radio_dept_16 _autoBtn"></span>
                                                   </span>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: simsun; font-size: 14px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 76px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.9655308490232992_id"
                                 class="cap-field formmain_0285|auxiliary0.9655308490232992">
                                <section style="line-height: normal;">
                                    <pre>申报人</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 33px;">
                        <div class="cap4-formmain__td">
                            <div id="field0028_id" class="cap-field formmain_0285|field0028"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-people is-none  ">
                                    <div class="cap4-people__right field-content-wrapper">
                                        <span id="field0028_span" class="edit_class" fieldval="{name:&quot;field0028&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;create_person&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;member&quot;,formatType:&quot;1&quot;,value:&quot;-4120520206381135530&quot;}">
                                                    <input type="text" onblur="calc(this);" class="xdTextBox validate comp" incondition="false" comp="type:&quot;selectPeople&quot;,showOriginalElement:false,isNeedCheckLevelScope:false,showAccountShortname:&quot;no&quot;,showAllOuterDepartment:true,showBtn:true,extendWidth:true,panels:&quot;Department,Team,Post,Level,Outworker,RelatePeople,JoinOrganization&quot;,selectType:&quot;Member&quot;
                                                    ,value:&quot;Member|${entity.field0028}&quot;,text:&quot;${entity.name}&quot;,minSize:0,maxSize:1,preCallback:selectOrgPreCallBack,callback:selectOrgCallBack,valueChange:orgFieldOnChange,hasRelationField:false,departmentId:${entity.field0028},isMasterField:true,fieldName:&quot;field0028&quot;" unique="false" name="field0028_txt" mappingfield="create_person" incalculate="false" id="field0028_txt" data-role="none" validate="name:&quot;create_person&quot;,type:&quot;string&quot;,china3char:true,notNull:false" readonly="readonly" comptype="selectPeople" _inited="1"  style="width: 201px; text-overflow: clip;" oldval=${entity.name}>

                                                     <input type="hidden" id="field0028" name="field0028"  style="display: none;">
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
                    <td colspan="1" rowspan="14"
                        style="font-family: simsun; font-size: 14px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.8409319728140148_id"
                                 class="cap-field formmain_0285|auxiliary0.8409319728140148">
                                <section style="line-height: normal;"><pre>牵头部门及
分管校领导
意见</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 146px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="3" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 67px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.925618505394733_id"
                                 class="cap-field formmain_0285|auxiliary0.925618505394733">
                                <section style="line-height: normal;">
                                    <pre>是否有时限要求？</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 144px;">
                        <div class="cap4-formmain__td">
                            <div id="field0040_id" class="cap-field formmain_0285|field0040"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-date is-none  ">
                                    <div class="cap4-date__right field-content-wrapper">
                                        <div class="cap4-date__cnt field-content" style="border: 1px solid transparent;">
                                            <input  id="field0040" name="field0040"  type="text" value="${entity.field0040}" comp="type:&quot;calendar&quot;,cache:false,isOutShow:true,ifFormat:&quot;%Y-%m-%d&quot;" class="validate xdRichTextBox comp" incalculate="false" comptype="calendar"  style="width: 105px;" finalwidth="165">
                                        </div><!---->
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 33px;">
                        <div class="cap4-formmain__td">
                            <div id="field0038_id" class="cap-field formmain_0285|field0038"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-select is-none is-must ">
                                    <div class="cap4-select__right field-content-wrapper">
                                        <select name="field0038" id="field0038" style="width:100%" >
                                            <option val4cal="0" value="" selected=""></option>
                                            <c:forEach items="${sfoption}" var="t">
                                                <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-right: 1px solid rgb(102, 102, 102); width: 67px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 146px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 67px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.645658924702716_id"
                                 class="cap-field formmain_0285|auxiliary0.645658924702716">
                                <section style="line-height: normal;">
                                    <pre>1、是否深入开展调查研究</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 33px;">
                        <div class="cap4-formmain__td">
                            <div id="field0006_id" class="cap-field formmain_0285|field0006"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-select is-none is-must ">
                                    <div class="cap4-select__right field-content-wrapper">
                                        <select name="field0006" id="field0006" style="width:100%" >
                                            <option val4cal="0" value="" selected=""></option>
                                            <c:forEach items="${sfoption}" var="t">
                                                <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-right: 1px solid rgb(102, 102, 102); width: 67px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 146px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 67px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.796544254915299_id"
                                 class="cap-field formmain_0285|auxiliary0.796544254915299">
                                <section style="line-height: normal;">
                                    <pre>2、是否充分听取各方面意见</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 33px;">
                        <div class="cap4-formmain__td">
                            <div id="field0008_id" class="cap-field formmain_0285|field0008"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-select is-none is-must ">
                                    <div class="cap4-select__right field-content-wrapper">
                                        <select name="field0008" id="field0008" style="width:100%" >
                                            <option val4cal="0" value="" selected=""></option>
                                            <c:forEach items="${sfoption}" var="t">
                                                <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-right: 1px solid rgb(102, 102, 102); width: 67px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 146px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 67px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.10742789001215902_id"
                                 class="cap-field formmain_0285|auxiliary0.10742789001215902">
                                <section style="line-height: normal;">
                                    <pre>3、是否进行合法合规性审查</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 33px;">
                        <div class="cap4-formmain__td">
                            <div id="field0010_id" class="cap-field formmain_0285|field0010"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-select is-none is-must ">
                                    <div class="cap4-select__right field-content-wrapper">
                                        <select name="field0010" id="field0010" style="width:100%" >
                                            <option val4cal="0" value="" selected=""></option>
                                            <c:forEach items="${sfoption}" var="t">
                                                <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-right: 1px solid rgb(102, 102, 102); width: 67px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(204, 204, 204); width: 146px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(204, 204, 204); width: 67px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.6534313518442985_id"
                                 class="cap-field formmain_0285|auxiliary0.6534313518442985">
                                <section style="line-height: normal;">
                                    <pre>4、是否进行风险评估</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(204, 204, 204); width: 33px;">
                        <div class="cap4-formmain__td">
                            <div id="field0012_id" class="cap-field formmain_0285|field0012"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-select is-none is-must ">
                                    <div class="cap4-select__right field-content-wrapper">
                                        <select name="field0012" id="field0012" style="width:100%" >
                                            <option val4cal="0" value="" selected=""></option>
                                            <c:forEach items="${sfoption}" var="t">
                                                <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(204, 204, 204); border-right: 1px solid rgb(102, 102, 102); width: 67px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 146px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 67px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.4803195922600434_id"
                                 class="cap-field formmain_0285|auxiliary0.4803195922600434">
                                <section style="line-height: normal;">
                                    <pre>是否为专业性、技术性较强的重要事项</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 33px;">
                        <div class="cap4-formmain__td">
                            <div id="field0014_id" class="cap-field formmain_0285|field0014"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-select is-none is-must ">
                                    <div class="cap4-select__right field-content-wrapper">
                                        <select name="field0014" id="field0014" style="width:100%" >
                                            <option val4cal="0" value="" selected=""></option>
                                            <c:forEach items="${sfoption}" var="t">
                                                <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-right: 1px solid rgb(102, 102, 102); width: 67px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 146px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 67px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.43156262663969436_id"
                                 class="cap-field formmain_0285|auxiliary0.43156262663969436">
                                <section style="line-height: normal;">
                                    <pre>    是否经过专家评估及技术、政策、法律咨询</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 33px;">
                        <div class="cap4-formmain__td">
                            <div id="field0042_id" class="cap-field formmain_0285|field0042"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-select is-none  ">
                                    <div class="cap4-select__right field-content-wrapper">
                                        <select name="field0042" id="field0042" style="width:100%" >
                                            <option val4cal="0" value="" selected=""></option>
                                            <c:forEach items="${sfoption}" var="t">
                                                <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-right: 1px solid rgb(102, 102, 102); width: 67px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 146px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 67px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.2236417745230519_id"
                                 class="cap-field formmain_0285|auxiliary0.2236417745230519">
                                <section style="line-height: normal;">
                                    <pre>    是否充分听取学术委员会等学术组织意见</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 33px;">
                        <div class="cap4-formmain__td">
                            <div id="field0044_id" class="cap-field formmain_0285|field0044"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-select is-none  ">
                                    <div class="cap4-select__right field-content-wrapper">
                                        <select name="field0044" id="field0044" style="width:100%" >
                                            <option val4cal="0" value="" selected=""></option>
                                            <c:forEach items="${xsoption}" var="t">
                                                <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-right: 1px solid rgb(102, 102, 102); width: 67px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 146px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 67px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.6102306596045339_id"
                                 class="cap-field formmain_0285|auxiliary0.6102306596045339">
                                <section style="line-height: normal;">
                                    <pre>是否为事关师生员工切身利益的重要事项</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 33px;">
                        <div class="cap4-formmain__td">
                            <div id="field0045_id" class="cap-field formmain_0285|field0045"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-select is-none is-must ">
                                    <div class="cap4-select__right field-content-wrapper">
                                        <select name="field0045" id="field0045" style="width:100%" >
                                            <option val4cal="0" value="" selected=""></option>
                                            <c:forEach items="${sfoption}" var="t">
                                                <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-right: 1px solid rgb(102, 102, 102); width: 67px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(204, 204, 204); width: 146px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(204, 204, 204); width: 67px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.008370119780665375_id"
                                 class="cap-field formmain_0285|auxiliary0.008370119780665375">
                                <section style="line-height: normal;">
                                    <pre>    是否广泛听取师生员工意见</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(204, 204, 204); width: 33px;">
                        <div class="cap4-formmain__td">
                            <div id="field0046_id" class="cap-field formmain_0285|field0046"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-select is-none  ">
                                    <div class="cap4-select__right field-content-wrapper">
                                        <select name="field0046" id="field0046" style="width:100%" >
                                            <option val4cal="0" value="" selected=""></option>
                                            <c:forEach items="${sfoption}" var="t">
                                                <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(204, 204, 204); border-right: 1px solid rgb(102, 102, 102); width: 67px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                </tr>
                <tr height="65">
                    <td class="rowgroup"></td>
                    <td colspan="9" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(0, 0, 0); border-right: 1px solid rgb(102, 102, 102); width: 146px;">
                        <div class="cap4-formmain__td">
                            <div id="field0022_id" class="cap-field formmain_0285|field0022"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-flow is-none ">
                                    <div class="cap4-flow__right field-content-wrapper">
                                        <div class="cap4-flow__browse" style="border: 1px solid transparent;">
                                            <c:if test="${entity.field0022 !=''  && entity.field0022!=null  }">
                                                <textarea  class="xdRichTextBox" id="field0022" style="width: 613px;height:80px">${entity.field0022}</textarea>
                                            </c:if>
                                            <c:if test="${entity.field0022 =='' || entity.field0022==null }">
                                                <pre>${entity.field0022}</pre>
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
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 146px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 67px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.6039983055151612_id"
                                 class="cap-field formmain_0285|auxiliary0.6039983055151612">
                                <section style="line-height: normal;">
                                    <pre>1、已组织分管部门充分论证调查研究</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 33px;">
                        <div class="cap4-formmain__td">
                            <div id="field0016_id" class="cap-field formmain_0285|field0016"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-select is-none  ">
                                    <select name="field0016" id="field0016" style="width:100%" >
                                        <option val4cal="0" value="" selected=""></option>
                                        <c:forEach items="${sfoption}" var="t">
                                            <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                        </c:forEach>
                                    </select>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 67px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-right: 1px solid rgb(102, 102, 102); width: 53px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                </tr>
                <tr height="32">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(204, 204, 204); width: 146px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="4" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(204, 204, 204); width: 67px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.3147997596203329_id"
                                 class="cap-field formmain_0285|auxiliary0.3147997596203329">
                                <section style="line-height: normal;">
                                    <pre>2、若是交叉性工作，是否征求相关领导意见</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(204, 204, 204); width: 33px;">
                        <div class="cap4-formmain__td">
                            <div id="field0018_id" class="cap-field formmain_0285|field0018"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-select is-none  ">
                                    <div class="cap4-select__right field-content-wrapper">
                                        <select name="field0018" id="field0018" style="width:100%" >
                                            <option val4cal="0" value="" selected=""></option>
                                            <c:forEach items="${sfoption}" var="t">
                                                <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(204, 204, 204); width: 67px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(204, 204, 204); border-right: 1px solid rgb(102, 102, 102); width: 53px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                </tr>
                <tr height="65">
                    <td class="rowgroup"></td>
                    <td colspan="9" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 146px;">
                        <div class="cap4-formmain__td">
                            <div id="field0023_id" class="cap-field formmain_0285|field0023"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-flow is-none ">
                                    <div class="cap4-flow__right field-content-wrapper">
                                        <div class="cap4-flow__browse" style="border: 1px solid transparent;">
                                            <c:if test="${entity.field0023 !=''  && entity.field0023!=null  }">
                                                <textarea  class="xdRichTextBox" id="field0023" style="width: 613px;height:80px">${entity.field0023}</textarea>
                                            </c:if>
                                            <c:if test="${entity.field0023 =='' || entity.field0023==null }">
                                                <pre>${entity.field0023}</pre>
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
                    <td colspan="1" rowspan="3"
                        style="font-family: simsun; font-size: 14px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.4616110008888934_id"
                                 class="cap-field formmain_0285|auxiliary0.4616110008888934">
                                <section style="line-height: normal;"><pre>协同部门及
分管校领导
意见</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 146px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 67px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.4407411024129644_id"
                                 class="cap-field formmain_0285|auxiliary0.4407411024129644">
                                <section style="line-height: normal;">
                                    <pre>是否同意：</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="2" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 76px;">
                        <div class="cap4-formmain__td">
                            <div id="field0036_id" class="cap-field formmain_0285|field0036"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-radio is-none  ">
                                    <div class="cap4-select__right field-content-wrapper">
                                        <select name="field0036" id="field0036" style="width:42%" >
                                            <option val4cal="0" value="" selected=""></option>
                                            <c:forEach items="${sfoption}" var="t">
                                                <option value="${t.id}" title="${t.showvalue}">${t.showvalue}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="3" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 33px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                    <td colspan="1" rowspan="1"
                        style="font-family: FangSong; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-right: 1px solid rgb(102, 102, 102); width: 53px;">
                        <div class="cap4-formmain__td"></div>
                    </td>
                </tr>
                <tr height="76">
                    <td class="rowgroup"></td>
                    <td colspan="9" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: rgb(255, 255, 255); padding: 1px 2px; border-bottom: 1px solid rgb(204, 204, 204); border-right: 1px solid rgb(102, 102, 102); width: 146px;">
                        <div class="cap4-formmain__td">
                            <div id="field0024_id" class="cap-field formmain_0285|field0024"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-flow is-none ">
                                    <div class="cap4-flow__right field-content-wrapper">
                                        <div class="cap4-flow__browse" style="border: 1px solid transparent;">
                                            <c:if test="${entity.field0024 !=''  && entity.field0024!=null  }">
                                                <textarea  class="xdRichTextBox" id="field0024" style="width: 613px;height:80px">${entity.field0024}</textarea>
                                            </c:if>
                                            <c:if test="${entity.field0024 =='' || entity.field0024==null }">
                                                <pre>${entity.field0024}</pre>
                                            </c:if>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="71">
                    <td class="rowgroup"></td>
                    <td colspan="9" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 146px;">
                        <div class="cap4-formmain__td">
                            <div id="field0025_id" class="cap-field formmain_0285|field0025"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-flow is-none ">
                                    <div class="cap4-flow__right field-content-wrapper">
                                        <div class="cap4-flow__browse" style="border: 1px solid transparent;">
                                            <c:if test="${entity.field0025 !=''  && entity.field0025!=null  }">
                                                <textarea  class="xdRichTextBox" id="field0025" style="width: 613px;height:80px">${entity.field0025}</textarea>
                                            </c:if>
                                            <c:if test="${entity.field0025 =='' || entity.field0025==null }">
                                                <pre>${entity.field0025}</pre>
                                            </c:if>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="76">
                    <td class="rowgroup"></td>
                    <td colspan="1" rowspan="1"
                        style="font-family: simsun; font-size: 14px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                        <div class="cap4-formmain__td">
                            <div id="auxiliary0.23618438586502144_id"
                                 class="cap-field formmain_0285|auxiliary0.23618438586502144">
                                <section style="line-height: normal;"><pre>秘书组
意见</pre>
                                </section>
                            </div>
                        </div>
                    </td>
                    <td colspan="9" rowspan="1"
                        style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 146px;">
                        <div class="cap4-formmain__td">
                            <div id="field0034_id" class="cap-field formmain_0285|field0034"
                                 style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                <section class="cap4-flow is-none ">
                                    <div class="cap4-flow__right field-content-wrapper">
                                        <div class="cap4-flow__browse" style="border: 1px solid transparent;">
                                            <c:if test="${entity.field0034 !=''  && entity.field0034!=null  }">
                                                <textarea  class="xdRichTextBox" id="field0034" style="width: 613px;height:80px">${entity.field0034}</textarea>
                                            </c:if>
                                            <c:if test="${entity.field0034 =='' || entity.field0034==null }">
                                                <pre>${entity.field0034}</pre>
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
    <input id="summaryid" type="hidden" value="${entity.summaryid}" /><%--公文主表edoc_summary的id--%>
    <input id="fields0019" type="hidden" value="${entity.field0011}" />

    <input id="fjdatas"   type="hidden"/>


    <input id="field0022_yj" type="hidden" value="${entity.field0022}"/>
    <input id="field0023_yj" type="hidden" value="${entity.field0023}"/>
    <input id="field0024_yj" type="hidden" value="${entity.field0024}"/>
    <input id="field0025_yj" type="hidden" value="${entity.field0025}"/>
    <input id="field0034_yj" type="hidden" value="${entity.field0034}"/>

    <input id="field0030" type="hidden" value="${entity.field0030}"/> <%--单据编号关联审批表--%>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        initOption("field0004",${entity.field0004});//预计时长
        initOption("field0006",${entity.field0006});//已组织调查研究
        initOption("field0008",${entity.field0008});//已进行意见征求
        initOption("field0010",${entity.field0010});//已组织咨询论证
        initOption("field0012",${entity.field0012});//已进行风险评估
        initOption("field0014",${entity.field0014});//交叉工作议题是否征求过部门意见
        initOption("field0016",${entity.field0016});//已组织分管部门充分论证调查研究
        initOption("field0018",${entity.field0018});//若是交叉性工作是否征求相关领导意见
        initOption("field0036",${entity.field0036});//是否同意
        initOption("field0038",${entity.field0038});//是否有决策时限要求
        initOption("field0042",${entity.field0042});//经过专家评估
        initOption("field0044",${entity.field0044});//听取学术委员会意见
        initOption("field0045",${entity.field0045});//事关师生切身利益
        initOption("field0046",${entity.field0046});//听取师生员工意见



        var field0002text = document.getElementById("field0002");//需要决策事项
        makeExpandingArea(field0002text);

        var field0022str=$("#field0022_yj").val();
        if(field0022str!=''){
            var field0022text = document.getElementById("field0022");//需牵头部门意见
            makeExpandingArea(field0022text);
        }

        var field0023str=$("#field0023_yj").val();
        if(field0023str!=''){
            var field0023text = document.getElementById("field0023");//牵头部门分管校领导意见
            makeExpandingArea(field0023text);
        }

        var field0024str=$("#field0024_yj").val();
        if(field0024str!=''){
            var field0024text = document.getElementById("field0024");//协同部门意见
            makeExpandingArea(field0024text);
        }


        var field0025str=$("#field0025_yj").val();
        if(field0025str!=''){
            var field0025text = document.getElementById("field0025");//协同部门分管校领导意见
            makeExpandingArea(field0025text);
        }


        var field0034str=$("#field0034_yj").val();
        if(field0034str!=''){
            var field0034text = document.getElementById("field0034");//秘书组意见
            makeExpandingArea(field0034text);
        }


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
            field0002:$('#field0002').val(),//需要决策事项
            field0003:$('#field0003').val(),//建议列席单位
            field0004:$('#field0004').val(),//预计时长
            field0005:$('#field0005').val(), //field0005  议题材料 关联attachment中的sub_reference
            field0027:$('#field0027').val().replace("Department|",""), //申报单位
            field0028:$('#field0028').val().replace("Member|",""),//登记人
            field0032:$('#field0032').val(),//申报时间
            field0006:$('#field0006').val(),//已组织调查研究
            field0008:$('#field0008').val(),//已进行意见征求
            field0010:$('#field0010').val(),//已组织咨询论证
            field0012:$('#field0012').val(),//已进行风险评估
            field0014:$('#field0014').val(),//交叉工作议题是否征求过部门意见
            field0016:$('#field0016').val(),//已组织分管部门充分论证调查研究
            field0018:$('#field0018').val(),//若是交叉性工作是否征求相关领导意见

            field0036:$('#field0036').val(),//是否同意
            field0038:$('#field0038').val(),//是否有决策时限要求
            field0042:$('#field0042').val(),//经过专家评估
            field0044:$('#field0044').val(),//听取学术委员会意见
            field0045:$('#field0045').val(),//事关师生切身利益
            field0046:$('#field0046').val(),//听取师生员工意见

            field0022:$('#field0022').val(),//牵头部门意见
            field0023:$('#field0023').val(),//牵头部门分管校领导意见
            field0024:$('#field0024').val(),//协同部门意见
            field0025:$('#field0025').val(),//协同部门分管校领导意见
            field0034:$('#field0034').val(),//秘书组意见
        };
        $.ajax({
            url: _ctxPath + '/demo.do?method=toUpdateFormmainJchy',
            type:'POST',
            data:{
                params:JSON.stringify(params),
                fjparams:JSON.stringify(fjdata["instance"]),
                att_reference:$('#summaryid').val(),
                tablename:'formmain_0285',
                sptablename:'formmain_0265',
                field0030:$('#field0030').val()//单据编号关联审批表
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
