<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<!DOCTYPE html>
<html class="h100b">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>查看意见</title>
</head>
<body style="overflow:hidden">
    <div style="width:100%;height:100%;margin:20px;" id="center">
        <c:choose>
            <c:when test="${not empty opinion.content }">
                <textarea readonly="readonly"  style="color:green;border:1px solid #D4D4D4;width:88%;height:180px;margin:5px" id="textarea">${opinion.content}</textarea>
            </c:when>
            <c:otherwise>
                <textarea readonly="readonly"  style="color:red;border:1px solid #D4D4D4;width:88%;height:180px;margin:5px" id="textarea">未填写意见</textarea>
            </c:otherwise>
        </c:choose>
    </div>

</body>
</html>
