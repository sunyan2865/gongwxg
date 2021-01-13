<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<%--<html>
<head>
    <title>值班导入</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" charset="UTF-8" src="${path}/common/content/form.js${ctp:resSuffix()}"></script>
</head>
<body >
<div class="content_wrap">
    <form target="export_iframe" action="" method="post" enctype="multipart/form-data"></form>
    <input id="mycal" type="text"  class="comp" comp="type:'calendar',ifFormat:'%Y-%m-%d',showsTime:false,
cache:false,isClear:true,clearBlank:false,onUpdate:null,isMini:true"/>
    <button type="submit" id="export_button" class="common_button common_button_emphasize">导出</button>
    <iframe style="position: absolute;width: 0;height: 0;border: 0;visibility: hidden" id="export_iframe" name="export_iframe"></iframe>
</div>
</body>
</html>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<!DOCTYPE html>
<html class="h100b">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>会议情况</title>
    <style type="text/css">
        .export_form{
            height: 300px;
            width: 500px;
            position:absolute;
            top:50%;
            left: 50%;
            margin:-150px 0px 0px -250px;
            border: solid silver 1px;
            text-align:center;
            vertical-align: middle;
            background-color: #93D1FF;
        }
    </style>
</head>
<body>
<div id='layout'>
    <form class="export_form" onsubmit="return checkExportForm();" target="export_iframe" action="${path}/exportMeetingRoom.do?method=exportMeetingroom" method="post" enctype="multipart/form-data">
        <div style="margin-top: 17%;">
            <h2>会议室会议情况导出</h2>
            <input id="export_time" name="exportDate" type="text" style="height: 35px;line-height: 35px;width: 300px;font-size: 18px;"  class="comp" comp="type:'calendar',ifFormat:'%Y-%m-%d',showsTime:false,
    cache:false,isClear:true,clearBlank:false,onUpdate:null,isMini:true"/>
            <button type="submit" id="export_button" style="font-size: 16px; height: 35px; line-height: 35px; width: 100px" class="common_button">导出</button>
        </div>
    </form>
        <iframe style="position: absolute;width: 0;height: 0;border: 0;visibility: hidden" id="export_iframe" name="export_iframe"></iframe>
</div>
</body>
<script type="text/javascript" charset="UTF-8" src="${path}/apps_res/meetingroomexport/js/meetingroomexport.js${ctp:resSuffix()}"></script>
</html>

