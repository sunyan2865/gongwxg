<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>查看表单附件</title>
    <style>
        html, body {
            margin: 0;
            padding: 0;
        }

        a {
            text-decoration: none;
            color: #000;
        }

        .active {
            font-weight: bold;
        }

        td {
            font-family: Arial, "Ping Fang SC", "Microsoft YaHei", Helvetica, sans-serif, "SimSun";
            height: 30px;
            line-height: 30px;
            white-space: nowrap;
            padding-left: 5px;
            font-size: 14px;
        }
    </style>
</head>

<body>
<div class="container">
    <div style="padding-top: 10px;" id="confirmDiv">
        <table width="100%" class="lc_table" style="border-left: 1px solid #ADD9EA;border-top: 1px solid #ADD9EA;">
            <tbody>
            <c:if test="${not empty fjlist}">
                <c:forEach var="fj" items="${fjlist}">
                    <tr>
                        <td width="50%" style="border-bottom: 1px solid #ADD9EA;border-right: 1px solid #ADD9EA;height: 30px;line-height: 20px;padding: 3px;">
                            <a style="font-size:14px;color:blue;text-decoration:underline;" href="/seeyon/filedown.do?method=fileDownload_zdy&amp;fileurl=${fj.file_url}&amp;createDate=${fj.date}&amp;filename=${fj.filename}"  title="${fj.filename}">${fj.filename}</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty fjlist}">
                <tr>
                    <td width="50%" style="border-bottom: 1px solid #ADD9EA;border-right: 1px solid #ADD9EA;height: 30px;line-height: 20px;padding: 3px;">
                        暂无数据...
                    </td>
                </tr>
            </c:if>
            </tbody>

        </table>
    </div>
</div>

</body>

<%--<body >
<table  style="width:95%;border-color:lightgray;margin:10px " border="1" cellspacing="0" cellpadding="0" >
    <tbody>
    <c:if test="${not empty fjlist}">
        <c:forEach var="fj" items="${fjlist}">
            <tr>
                <td width="50%" class="active">
                    <a style="font-size:14px;color:blue;text-decoration: blue" href="/seeyon/filedown.do?method=fileDownload_zdy&amp;fileurl=${fj.file_url}&amp;createDate=${fj.date}&amp;filename=${fj.filename}" >${fj.filename}</a>
                </td>
            </tr>
        </c:forEach>
    </c:if>
    <c:if test="${empty fjlist}">
        <tr>
            <td width="50%" class="active" colspan="3">
                暂无数据...
            </td>
        </tr>
    </c:if>
    </tbody>
</table>

</body>--%>
</html>
