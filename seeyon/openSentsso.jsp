<%@ page import="com.seeyon.apps.ext.ssoLogin.controller.OpenPendingController" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit|ie-stand|ie-comp"/>
    <title>OA已发</title>
</head>
<body>
<%
    OpenPendingController.formSent(request, response);
%>
</body>
</html>
