<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<!DOCTYPE html>
<html class="h100b">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>服务器7附件同步</title>
    <style type="text/css">
        .btn {
            background-color: #008CBA; /* Green */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            width:300px;
        }
    </style>
</head>
<body class="h100b" onunload="">
<div id='layout' style="margin:250px;margin-left:500px">
    <input class="btn" type="button" onclick="filetb(1)" value="7_发文同步"/>
    <span style="width:200px"></span>
    <input  class="btn"  type="button" onclick="filetb(2)" value="7_收文同步"/>
</div>

<script type="text/javascript">
    function filetb(str) {
        var tablename="";
        if(str=="1"){
            tablename="formson_0132";
        }else if(str=="2"){
            tablename="formson_0135";
        }

        $.ajax({
            url: _ctxPath + '/demo.do?method=toFileTb',
            type:'POST',
            data:{tablename:tablename,path:'/oa/Seeyon/A8/ApacheJetspeed/webapps/seeyon/gwfj'},
            //data:{tablename:tablename,path:'D:/file'},
            success:function (res) {
                if(str=="1"){
                    $.alert("服务器7中【发文附件】同步成功！");
                }else if(str=="2"){
                    $.alert("服务器7中【收文附件】同步成功！");
                }

            }
        });
    }

</script>


</body>
</html>
