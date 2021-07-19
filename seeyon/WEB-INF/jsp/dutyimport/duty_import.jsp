<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>值班导入</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" charset="UTF-8" src="${path}/common/content/form.js${ctp:resSuffix()}"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/apps_res/dutyimport//layui/css/layui.css" />" media="all">
    <style type="text/css">
        a.custom-a{
            color:#01AAED;
        }
        a.custom-a:hover{
            cursor:pointer;
            text-decoration-line: underline;
        }
        table.explain-table tbody tr td{
            height: 30px;
            line-height: 30px;
            font-size: 18px;
        }
        table.explain-table tbody tr td a{
            height: 30px;
            line-height: 30px;
            font-size: 18px;
        }
        label.layui-form-label{
            font-size: 14px;
        }
    </style>
</head>
<body >
<div class="content_wrap">
    <fieldset class="layui-elem-field" style="margin: 10px 20px 10px 10px; background-color: #F2F9FD; font-size: 14px;">
        <div class="layui-field-box">
            <%--onsubmit="return checkForm();"--%>
                <%-- ${path}/dutyImport.do?method=importDutyData --%>
            <form target="upload_iframe" action="${path}/dutyImport.do?method=importDutyData" onsubmit="return checkForm();" method="post" enctype="multipart/form-data"  class="layui-form">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">选择计划</label>
                        <div class="layui-input-inline">
                            <select lay-ignore style="width: 100%; font-size: 14px;" id="dutyplan" name="dutyplan">
                                <option value="">请选择</option>
                                <c:forEach items="${dutyPlanList}" var="dutyPlan">
                                    <option value="${dutyPlan.id}" title="${dutyPlan.title}">${dutyPlan.title}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">所属部门</label>
                        <div class="layui-input-inline" style="width: auto">
                            <div style="width: 100%;">
                                <font face="宋体">
                                            <span id="field0002_span" class="editableSpan edit_class" fieldval="{name:&quot;field0002&quot;,isMasterFiled:&quot;true&quot;,displayName:&quot;send_department&quot;,fieldType:&quot;VARCHAR&quot;,inputType:&quot;department&quot;,formatType:&quot;1&quot;}">
                                                       <input type="text" onblur="calc(this);" class="comp validate" incondition="false"
                                                              comp="&quot;type&quot;:&quot;selectPeople&quot;,&quot;valueChange&quot;:orgFieldOnChange,&quot;showBtn&quot;:true,&quot;extendWidth&quot;:true,&quot;mode&quot;:&quot;open&quot;,&quot;panels&quot;:&quot;Department&quot;,&quot;isAllowContainsChildDept&quot;:true,&quot;isConfirmExcludeSubDepartment&quot;:false,&quot;selectType&quot;:&quot;Department&quot;,&quot;minSize&quot;:0,&quot;maxSize&quot;:1,&quot;preCallback&quot;:selectOrgPreCallBack,&quot;callback&quot;:selectOrgCallBack,&quot;hasRelationField&quot;:false,&quot;isMasterField&quot;:true,&quot;fieldName&quot;:&quot;field0002&quot;
                                                            ,&quot;value&quot;:&quot;Department|${currentDepartment}&quot;,&quot;text&quot;:&quot;${currentDepartmentName}&quot;" unique="false" name="field0002_txt" mappingfield="send_department" incalculate="false" id="field0002_txt" data-role="none" validate="name:&quot;send_department&quot;,type:&quot;string&quot;,china3char:true,notNull:true" readonly="readonly" comptype="selectPeople" _inited="1"  style="background-color: rgb(255, 255, 255); width: 170px; text-overflow: clip;" >
                                                       <input type="hidden" id="field0002" name="field0002" style="background-color: rgb(255, 255, 255); display: none;">
                                                       <span _isrel="1" class="ico16 radio_dept_16 _autoBtn"></span>
                                                   </span>
                                </font>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-from-item">
                    <div class="layui-inline">
                        <label class="layui-form-label" style="width: auto;">导入文件(Excel文件，后缀名为xls)</label>
                        <div class="layui-input-inline">
                            <input class="layui-input" id="file" style="font-size: 14px; width: auto;" type="file" name="file"/>
                        </div>
                        <button type="submit" id="import_button" class="common_button common_button_emphasize">导入</button>
                        <button type="reset" class="common_button">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </fieldset>
    <fieldset class="layui-elem-field" style="margin: 10px 20px 10px 10px; background-color: #F2F9FD;">
        <div class="layui-field-box">
            <div>
                <table style="margin: 15px;" class="explain-table">
                    <tbody style=" font-size: 16px;"><tr>
                        <td>说明：</td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;"><a class="custom-a" href="<c:url value="/apps_res/dutyimport/templet/importFile.xls" />">模板下载</a></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;color:green">说明：模板中已设置好单元格格式，无需再修改，直接粘贴数据即可。 </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">开始时间 ( 日期型，2013/12/1 ) </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">结束时间 ( 日期型，2013/12/1 ) </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">值班地点 ( 常规或文本型，长度1000 ) </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">带班领导 ( 常规或文本型，长度1000 ) </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">带班领导电话 ( 常规或文本型，长度1000 ) </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">值班人员 ( 常规或文本型，长度1000 ) </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">值班人员电话 ( 常规或文本型，长度1000 ) </td>
                    </tr>
                    </tbody></table>
            </div>
        </div>
    </fieldset>
</div>
<iframe style="position: absolute;width: 0;height: 0;border: 0;visibility: hidden" id="upload_iframe" name="upload_iframe"></iframe>
</body>
<script type="text/javascript" charset="UTF-8" src="${path}/apps_res/dutyimport/js/dutyimport.js${ctp:resSuffix()}"></script>
</html>
