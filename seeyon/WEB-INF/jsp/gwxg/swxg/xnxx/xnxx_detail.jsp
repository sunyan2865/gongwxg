<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>校内信息详情</title>
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
                                                <span>${entity.field0001}</span>
                                        </font>
                                    </div>
                                </td>
                            </tr>

                            <tr style="min-height: 40px; height: 40px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>处理性质</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px" colspan="2">
                                    <div >
                                        <font face="宋体">
                                            <span>${entity.clxz}</span>
                                        </font>

                                    </div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>登记日期</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px">
                                    <div >
                                        <font face="宋体">
                                            <span>${entity.field0003}</span>
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
                                        <font face="宋体" >
                                            <span>${entity.name}</span>

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
                                            <span>${entity.field0005}</span>
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
                                        <span>${entity.field0006}</span>
                                    </font>
                                    </div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>页数</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px">
                                    <div ><font face="宋体">
                                        <span>${entity.field0007}</span>
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
                                            <span>${entity.hj}</span>
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
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px">

                                        <div align="left">
                                            <font face="宋体">
                                                <span>${entity.gkfs}</span>
                                            </font>
                                        </div>

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
                                        <span>${entity.zrdwmc}</span>
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
                                            <textarea readonly="readonly"  class="xdRichTextBox" id="field0012" style="border:none;width: 503px;">${entity.field0012}</textarea>
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
                                                    <input id="${op.id}" style="width:98%;height:28px;border:none" value="${op.content}"/>
                                                </div>
                                                <div style="width: 490px;">
                                                    <div style="float:right;padding-right:30px;padding-top:5px;padding-bottom:5px;" class="font-s">
                                                        <input readonly="readonly" class="opinionclass" value="${op.username} ${op.createTime}"></input>
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
                                                        <input id="${op.id}" style="width:98%;height:28px;border:none" value="${op.content}"/>
                                                    </div>
                                                    <div style="width: 490px;">
                                                        <div style="float:right;padding-right:30px;padding-top:5px;padding-bottom:5px;" class="font-s">
                                                            <input readonly="readonly" class="opinionclass" value="${op.username} ${op.createTime}"></input>
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
                                                    <input id="${op.id}" style="width:98%;height:28px;border:none" value="${op.content}"/>
                                                </div>
                                                <div style="width: 490px;">
                                                    <div style="float:right;padding-right:30px;padding-top:5px;padding-bottom:5px;" class="font-s">
                                                        <input readonly="readonly" class="opinionclass" value="${op.username} ${op.createTime}"></input>
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
        var text = document.getElementById("field0012");
        makeExpandingArea(text);
    });


</script>

</body>
</html>
