<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>党委常委会议题申报信息</title>
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
                <table class="cap4-formmain__mTable" style="width: 800px;">
                    <colgroup>
                        <col width="0px">
                        <col width="134">
                        <col width="134">
                        <col width="67">
                        <col width="66">
                        <col width="67">
                        <col width="66">
                        <col width="34">
                        <col width="33">
                        <col width="66">
                        <col width="67">
                        <col width="66">
                    </colgroup>
                    <tr height="50">
                        <td class="rowgroup"></td>
                        <td colspan="11" rowspan="1" style="font-family: simsun; font-size: 16px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="auxiliary0.1913316850390867_id" class="cap-field formmain_0264|auxiliary0.1913316850390867">
                                    <section>
                                        <pre>中国矿业大学党委常委会议题申报表</pre>
                                    </section>
                                </div>
                           </div>
                        </td>
                    </tr>
                    <tr height="40">
                        <td class="rowgroup"></td>
                        <td colspan="1" rowspan="1" style="font-family: simsun; font-size: 14px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="auxiliary0.747565262595008_id" class="cap-field formmain_0264|auxiliary0.747565262595008">
                                    <section>
                                        <pre>议题名称</pre>
                                    </section>
                                </div>
                            </div>
                        </td>
                        <td colspan="10" rowspan="1" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="field0001_id" class="cap-field formmain_0264|field0001" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                        <section class="cap4-text is-none is-must ">
                                            <div class="cap4-text__right field-content-wrapper">
                                                <div class="cap4-text__cnt field-content" style="border: 1px solid transparent;">
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
                        <td colspan="1" rowspan="1" style="font-family: simsun; font-size: 14px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                             <div id="auxiliary0.48959838729459815_id" class="cap-field formmain_0264|auxiliary0.48959838729459815">
                                 <section>
                                     <pre>需要决策事项</pre>
                                 </section>
                             </div>
                            </div>
                        </td>
                        <td colspan="10" rowspan="1" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="field0002_id" class="cap-field formmain_0264|field0002" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                    <section class="cap4-textarea is-none  ">
                                        <div class="cap4-textarea__right field-content-wrapper">
                                            <div class="cap4-textarea__cnt field-content" style="position: relative; border: 1px solid transparent;">
                                            <span id="field0002_span" class="edit_class" fieldval="{name:&quot;field0002&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;text1&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;textarea&quot;,formatType:&quot;&quot;,value:&quot;&quot;}">
                                            <textarea  class="xdRichTextBox" id="field0002" style="width: 613px;">${entity.field0002}</textarea>
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
                        <td colspan="1" rowspan="1" style="font-family: simsun; font-size: 14px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="auxiliary0.031271074999029924_id" class="cap-field formmain_0264|auxiliary0.031271074999029924">
                                    <section><pre>建议列席单位</pre></section>
                                </div>
                            </div>
                        </td>
                        <td colspan="10" rowspan="1" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="field0003_id" class="cap-field formmain_0264|field0003" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                    <section class="cap4-text is-none is-must ">
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
                        <td colspan="1" rowspan="1" style="font-family: simsun; font-size: 14px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="auxiliary0.21785417318870048_id" class="cap-field formmain_0264|auxiliary0.21785417318870048">
                                    <section><pre>预计时长</pre></section>
                                </div>
                            </div>
                        </td>
                        <td colspan="1" rowspan="1" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="field0004_id" class="cap-field formmain_0264|field0004" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
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
                        <td colspan="1" rowspan="1" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); width: 67px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); width: 66px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); width: 67px;">
                            <div class="cap4-formmain__td"></div></td>
                        <td colspan="1" rowspan="1" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); width: 66px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); width: 34px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); width: 33px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); width: 66px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); width: 67px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 66px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                    </tr>
                    <tr height="40">
                        <td class="rowgroup"></td>
                        <td colspan="1" rowspan="1" style="font-family: simsun; font-size: 14px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="auxiliary0.35029773712659695_id" class="cap-field formmain_0264|auxiliary0.35029773712659695">
                                    <section><pre>议题材料</pre></section>
                                </div>
                            </div>
                        </td>
                        <td colspan="10" rowspan="1" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="field0005_id" class="cap-field formmain_0264|field0005" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
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
                        <td colspan="1" rowspan="1" style="font-family: simsun; font-size: 14px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="auxiliary0.33308318032607853_id" class="cap-field formmain_0264|auxiliary0.33308318032607853">
                                    <section><pre>申报单位</pre></section>
                                </div>
                            </div>
                        </td>
                        <td colspan="3" rowspan="1" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="field0027_id" class="cap-field formmain_0264|field0027" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
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
                        <td colspan="2" rowspan="1" style="font-family: simsun; font-size: 14px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 67px;">
                            <div class="cap4-formmain__td">
                                <div id="auxiliary0.5790478702794097_id" class="cap-field formmain_0264|auxiliary0.5790478702794097">
                                    <section><pre>申报人</pre></section>
                                </div>
                            </div>
                        </td>
                        <td colspan="5" rowspan="1" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 34px;">
                            <div class="cap4-formmain__td">
                                <div id="field0028_id" class="cap-field formmain_0264|field0028" style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
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
                        <td colspan="1" rowspan="9" style="font-family: simsun; font-size: 14px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="auxiliary0.21679806288915549_id" class="cap-field formmain_0264|auxiliary0.21679806288915549">
                                    <section><pre>牵头部门及分管校领导意见</pre></section>
                                </div>
                            </div>
                        </td>
                        <td colspan="2" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="auxiliary0.00983531829962403_id"
                                     class="cap-field formmain_0264|auxiliary0.00983531829962403">
                                    <section>
                                        <pre>1、已组织调查研究</pre>
                                    </section>
                                </div>
                            </div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 66px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 67px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 66px;">
                            <div class="cap4-formmain__td">
                                <div id="field0006_id" class="cap-field formmain_0264|field0006"
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
                        <td colspan="3" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 34px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="2" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-right: 1px solid rgb(102, 102, 102); width: 67px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                    </tr>
                    <tr height="32">
                        <td class="rowgroup"></td>
                        <td colspan="2" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="auxiliary0.6462412553165182_id"
                                     class="cap-field formmain_0264|auxiliary0.6462412553165182">
                                    <section>
                                        <pre>2、已进行意见征求</pre>
                                    </section>
                                </div>
                            </div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 66px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 67px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 66px;">
                            <div class="cap4-formmain__td">
                                <div id="field0008_id" class="cap-field formmain_0264|field0008"
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
                        <td colspan="3" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 34px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="2" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-right: 1px solid rgb(102, 102, 102); width: 67px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                    </tr>
                    <tr height="32">
                        <td class="rowgroup"></td>
                        <td colspan="2" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="auxiliary0.9715364422923971_id"
                                     class="cap-field formmain_0264|auxiliary0.9715364422923971">
                                    <section>
                                        <pre>3、已组织咨询论证</pre>
                                    </section>
                                </div>
                            </div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 66px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 67px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 66px;">
                            <div class="cap4-formmain__td">
                                <div id="field0010_id" class="cap-field formmain_0264|field0010"
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
                        <td colspan="3" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 34px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="2" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-right: 1px solid rgb(102, 102, 102); width: 67px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                    </tr>
                    <tr height="32">
                        <td class="rowgroup"></td>
                        <td colspan="2" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="auxiliary0.3310798448638175_id"
                                     class="cap-field formmain_0264|auxiliary0.3310798448638175">
                                    <section>
                                        <pre>4、已进行风险评估</pre>
                                    </section>
                                </div>
                            </div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 66px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 67px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 66px;">
                            <div class="cap4-formmain__td">
                                <div id="field0012_id" class="cap-field formmain_0264|field0012"
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
                        <td colspan="3" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 34px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="2" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-right: 1px solid rgb(102, 102, 102); width: 67px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                    </tr>
                    <tr height="32">
                        <td class="rowgroup"></td>
                        <td colspan="4" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="auxiliary0.8861877092465285_id"
                                     class="cap-field formmain_0264|auxiliary0.8861877092465285">
                                    <section>
                                        <pre>5、若是交叉工作议题，是否征求过部门意见</pre>
                                    </section>
                                </div>
                            </div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 66px;">
                            <div class="cap4-formmain__td">
                                <div id="field0014_id" class="cap-field formmain_0264|field0014"
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
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 34px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 66px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 67px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-right: 1px solid rgb(102, 102, 102); width: 66px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                    </tr>
                    <tr height="65">
                        <td class="rowgroup"></td>
                        <td colspan="10" rowspan="1"
                            style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="field0022_id" class="cap-field formmain_0264|field0022"
                                     style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                    <section class="cap4-flow is-none ">
                                        <div class="cap4-flow__right field-content-wrapper">
                                            <div class="cap4-flow__browse" style="border: 1px solid transparent;">
                                                <c:if test="${entity.field0022 !=''  && entity.field0022!=null  }">
                                                    <textarea  class="xdRichTextBox" id="field0005" style="width: 613px;height:80px">${entity.field0022}</textarea>
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
                        <td colspan="4" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="auxiliary0.8336732850717927_id"
                                     class="cap-field formmain_0264|auxiliary0.8336732850717927">
                                    <section>
                                        <pre>1、已组织分管部门充分论证调查研究</pre>
                                    </section>
                                </div>
                            </div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 66px;">
                            <div class="cap4-formmain__td">
                                <div id="field0016_id" class="cap-field formmain_0264|field0016"
                                     style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; text-align: left; color: rgb(51, 51, 51);">
                                    <section class="cap4-select is-none  ">
                                        <div class="cap4-select__right field-content-wrapper">
                                            <select name="field0016" id="field0016" style="width:100%" >
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
                            style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 34px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 66px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 67px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-right: 1px solid rgb(102, 102, 102); width: 66px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                    </tr>
                    <tr height="32">
                        <td class="rowgroup"></td>
                        <td colspan="4" rowspan="1"
                            style="font-family: simsun; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="auxiliary0.149900802369896_id"
                                     class="cap-field formmain_0264|auxiliary0.149900802369896">
                                    <section>
                                        <pre>2、若是交叉性工作，是否征求相关领导意见</pre>
                                    </section>
                                </div>
                            </div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 66px;">
                            <div class="cap4-formmain__td">
                                <div id="field0018_id" class="cap-field formmain_0264|field0018"
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
                        <td colspan="2" rowspan="1"
                            style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 34px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 66px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; width: 67px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                        <td colspan="1" rowspan="1"
                            style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-right: 1px solid rgb(102, 102, 102); width: 66px;">
                            <div class="cap4-formmain__td"></div>
                        </td>
                    </tr>
                    <tr height="65">
                        <td class="rowgroup"></td>
                        <td colspan="10" rowspan="1"
                            style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="field0023_id" class="cap-field formmain_0264|field0023"
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
                    <tr height="76">
                        <td class="rowgroup"></td>
                        <td colspan="1" rowspan="2"
                            style="font-family: simsun; font-size: 14px; font-weight: bold; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: center; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="auxiliary0.5452024306403125_id"
                                     class="cap-field formmain_0264|auxiliary0.5452024306403125">
                                    <section><pre>协同部门及分管校领导意见</pre>
                                    </section>
                                </div>
                            </div>
                        </td>
                        <td colspan="10" rowspan="1"
                            style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="field0024_id" class="cap-field formmain_0264|field0024"
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
                        <td colspan="10" rowspan="1"
                            style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="field0025_id" class="cap-field formmain_0264|field0025"
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
                                <div id="auxiliary0.32484686323184_id"
                                     class="cap-field formmain_0264|auxiliary0.32484686323184">
                                    <section><pre>秘书组意见</pre>
                                    </section>
                                </div>
                            </div>
                        </td>
                        <td colspan="10" rowspan="1"
                            style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(51, 51, 51); text-align: left; vertical-align: middle; background-color: transparent; padding: 1px 2px; border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); width: 134px;">
                            <div class="cap4-formmain__td">
                                <div id="field0034_id" class="cap-field formmain_0264|field0034"
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
                tablename:'formmain_0264'
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
