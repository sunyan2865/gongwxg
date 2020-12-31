<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>校内请示详情</title>
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
                                    <div >
                                        <font face="宋体" >
                                            <span>${entity.qsbmname}</span>
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
                                    <div >
                                        <font face="宋体" >
                                            <span>${entity.qcr}</span>
                                        </font>
                                    </div>

                                </td>
                            </tr>
                            <tr style="min-height: 40px; height: 40px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>请示标题</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent" colspan="3">
                                    <div >
                                        <font face="宋体" >
                                            <span>${entity.field0003}</span>
                                        </font>
                                    </div>
                                  </td>
                            </tr>
                            <tr style="min-height: 40px; height: 40px;">
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent">
                                    <div align="center"><font face="宋体" size="4"
                                                              color="#ff0000"><strong>请示内容</strong></font></div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: transparent" colspan="3">
                                    <div >
                                        <font face="宋体" >
                                            <textarea  id="field0004" style="width: 497px;border:none" readonly="readonly">${entity.field0004}</textarea>
                                        </font>
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
                                    <div align="center">
                                        <font face="宋体">
                                            <div align="left" >
                                                <span class="xdlabel"></span>
                                                <!--动态-->
                                                <span id="field0005_span" mappingfield="attachments" class="edit_class" fieldval="{name:&quot;field0005&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;attachments&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;attachment&quot;,formatType:&quot;&quot;,value:&quot;&quot;}" style="display: inline-block;">
                                                    <div class="comp" comp="type:'fileupload',callMethod:'fileValueChangeCallBack',delCallMethod:'fileDelCallBack',takeOver:false,isBR:true,canDeleteOriginalAtts:true,canFavourite:'true',notNull:'false',displayMode:'visible',autoHeight:true,applicationCategory:'2',embedInput:'field0005',attachmentTrId:'1209558887199034033'"
                                                         attsdata="${fjsonArray}" comptype="fileupload" style="display: none;">
                                                        <input type="text" <%--style="display: none; width: 474px;"--%> id="field0005" name="field0005" value="${entity.field0005}">
                                                    </div>
                                                    <div id="attachmentArea-1694224470510517265" style="overflow-x: hidden; min-height: 24px; width: 450px;" requrl="/seeyon/fileUpload.do?type=0&amp;inputId=undefined&amp;applicationCategory=2&amp;extensions=&amp;maxSize=&amp;isEncrypt=&amp;popupTitleKey=&amp;attachmentTrId=-1694224470510517265&amp;embedInput=field0005" class="left">
                                                        <c:forEach items="${fjlist}" var="fj">
                                                            <div id="attachmentDiv_${fj.file_url}" class="attachment_block attachmentShowDelete" style="font-size:12px; max-width:454px; float:left; line-height:22px;*line-height:22px;background:#e6eef7;padding:2px 10px;border-radius:3px; overflow:hidden; word-wrap:break-word; word-break:break-all;"<%-- onmouseenter="onAttachmentMouseEnter(this)" onmouseleave="onAttachmentMouseLeave(this)"--%>>&nbsp;
                                                                <span style="word-wrap:break-word; word-break:break-all;" class="ico16 doc_16 margin_r_5"></span>
                                                                <a  href="/seeyon/filedown.do?method=fileDownload_zdy&amp;fileurl=${fj.file_url}&amp;createDate=${fj.date}&amp;filename=${fj.filename}" title=${fj.filename} target="downloadFileFrame" style="font-size:12px;color:#757575;">
                                                                    <span id="field0005_txt" style="line-height:normal">${fj.filename}(${fj.filesize}KB)</span>
                                                                </a>
                                                            </div>
                                                        </c:forEach>
                                                  </div>
                                                </span>
                                            </div>

                                        </font>
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
                                    <div><font face="宋体">
                                        <c:forEach items="${qsbmList}" var="op">
                                            <div id="div_${op.id}">
                                                <input type="hidden" value="${op.id}"/>
                                                <div style="float: left;width: 100%;" class="font-s">
                                                    <span id="${op.id}" style="width:98%;height:28px;" >${op.content}</span>
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
                                    <div align="center"><font face="宋体" size="4" color="#ff0000"><strong>党政办意见</strong></font>
                                    </div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px" colspan="3">
                                    <div>
                                        <font face="宋体">
                                            <c:forEach items="${dzbList}" var="op">
                                                <div id="div_${op.id}">
                                                    <input type="hidden" value="${op.id}"/>
                                                    <div style="float: left;width: 100%;" class="font-s">
                                                        <span id="${op.id}" style="width:98%;height:28px;" >${op.content}</span>
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
                                    <div align="center"><font face="宋体" size="4" color="#ff0000"><strong>校领导意见</strong></font>
                                    </div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px"
                                    colspan="3">
                                    <div><font face="宋体">
                                        <c:forEach items="${xldList}" var="op">
                                            <div id="div_${op.id}">
                                                <input type="hidden" value="${op.id}"/>
                                                <div style="float: left;width: 100%;" class="font-s">
                                                    <span id="${op.id}" style="width:98%;height:28px;" >${op.content}</span>
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
                                    <div align="center"><font face="宋体" size="4" color="#ff0000"><strong>主办部门意见</strong></font>
                                    </div>
                                </td>
                                <td style="BORDER-TOP: #ff0000 1pt solid; BORDER-RIGHT: #ff0000 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #ff0000 1pt solid; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 1px; BORDER-LEFT: #ff0000 1pt solid; PADDING-RIGHT: 1px"
                                    colspan="3">
                                    <div><font face="宋体">
                                        <c:forEach items="${zbbmList}" var="op">
                                            <div id="div_${op.id}">
                                                <input type="hidden" value="${op.id}"/>
                                                <div style="float: left;width: 100%;" class="font-s">
                                                    <span id="${op.id}" style="width:98%;height:28px;" >${op.content}</span>
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
</div>


</body>
</html>
