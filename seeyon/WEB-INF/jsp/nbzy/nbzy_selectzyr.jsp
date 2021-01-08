<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<!DOCTYPE html>
<html class="h100b">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>选择转阅人</title>
</head>
<body class="h100b" style="height:85%">

<div id='divId' style="margin:54px;margin-top:10px;overflow: hidden">
    <div id="toolbar_4462223" style="text-align: right;margin:10px;" class="toolbar_l clearfix">
        <input type='checkbox' id="allchk" onchange="changeselect()"  name='allchk' title="全选"><span style="margin:3px;margin-right:10px;font-size:13px;">全选</span>
        <%--<input id="_allselect" type="button" class="common_button common_button_emphasize margin_r_5 hand" style="width: auto;max-width: none;min-width: 63px;" value="全选">
        <input id="_allnoselect" type="button" class="common_button common_button_emphasize margin_r_5 hand" style="width: auto;max-width: none;min-width: 63px;" value="全不选">
--%>
        <input id="_save" type="button" class="common_button common_button_emphasize margin_r_5 hand" style="width: auto;max-width: none;min-width: 63px;" value="确定">
        <input id="_cancel" type="button" class="common_button common_button_seeyon margin_r_5 hand" style="width: auto;max-width: none;min-width: 63px;" value="取消">
    </div>
    <c:forEach items="${memberlist}" var="member">
    </c:forEach>

</div>


<script type="text/javascript">
    var memberlist=${memberlist};
    var obj=$("#divId");
    var nameall="";
    var idall="";
    for(var i=0;i<memberlist.length;i++){
            obj.append(" <span id="+memberlist[i].id+">" +
                 "<input type='checkbox' name='people'  value='"+memberlist[i].id+"' title='"+memberlist[i].name+"'>&nbsp;"+
                  "<button  type='button'  style='background-color:#a7d0f6;border:1px solid #D4D4D4;text-align:center;width:100px;height:30px;margin-top:10px' >"+memberlist[i].name+" </button>" +
                "  </span>");
    }

    function changeselect(){
        var allchk = document.getElementById('allchk');
        var id = document.getElementsByName('people');
        if(allchk.checked){
            for(var i = 0; i < id.length; i++){
                id[i].checked = true;
            }
        }else{
            for(var i = 0; i < id.length; i++){
                id[i].checked = false;
            }
        }
    }

    $("#_save").click(function(){
        var id = document.getElementsByName('people');
        for(var i = 0; i < id.length; i++){
            if(id[i].checked) {
                idall+=id[i].value+",";
                nameall+=id[i].title+",";
            }
        }
        if(idall.length==0){
            $.alert("请选择转阅人！");
            return;
        }
        window.opener.document.getElementById('selectzyrids').value=idall.substring(0,idall.length-1);
        window.opener.document.getElementById('zyrname').value=nameall.substring(0,nameall.length-1);
        window.close();

    });

    $("#_cancel").click(function(){
        window.close();
    });



</script>

</body>
</html>
