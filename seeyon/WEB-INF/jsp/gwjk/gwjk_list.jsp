<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<!DOCTYPE html>
<html class="h100b">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>收文登记监控</title>
    <script type="text/javascript" charset="UTF-8" src="${path}/apps_res/gwjk/js/gwjk_list.js${ctp:resSuffix()}"></script>
</head>
<body class="h100b" onunload="">
<div id='layout' onscroll="SetH(this)">
        <div class="layout_north f0f0f0" id="north">
            <table width="100%" border="0" cellpadding="0">
                <tr>
                    <td><div id="toolbars"></div></td>
                    <td style="padding-bottom:5px" width="60" align="center" valign="center">
                    </td>
                </tr>
            </table>
        </div>
        <div class="layout_center over_hidden" id="center">
            <table  class="flexme3" id="listStudent"></table>
        </div>

</div>
<script type="text/javascript">

    var _h = 0;
    function SetH(o) {
        _h = o.scrollTop
        SetCookie("a", _h)
    }
    window.onload = function () {
        document.getElementById("x").scrollTop = GetCookie("a");//页面加载时设置scrolltop高度
    }
    function SetCookie(sName, sValue) {
        document.cookie = sName + "=" + escape(sValue) + "; ";
    }
    function GetCookie(sName) {
        var aCookie = document.cookie.split("; ");
        for (var i = 0; i < aCookie.length; i++) {
            var aCrumb = aCookie[i].split("=");
            if (sName == aCrumb[0])
                return unescape(aCrumb[1]);
        }
        return 0;
    }
</script>
</body>
</html>
