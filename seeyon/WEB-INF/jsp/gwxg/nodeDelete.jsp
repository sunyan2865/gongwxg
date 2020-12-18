<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<!DOCTYPE html>
<html class="h100b">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>删除节点</title>
</head>
<body class="h100b" style="height:85%">
<div id='divId' style="margin:54px;overflow: hidden">
    <c:forEach items="${memberlist}" var="member">
       <%--     <button type='button' onclick="alert('dd')" style='background-color:#a7d0f6;border:1px solid #D4D4D4;text-align:center;width:60px;height:30px;margin-top:10px' >${member.name} </button>
            <span style='position:absolute;color:red;padding-top:1px;margin-left:-12px;font-size:18px'>⬤</span>
            <span id="spanId" style='position:absolute;color:white;padding-top:5px;margin-left:-9px;font-size:10px'>✖</span>&nbsp;&nbsp;&nbsp;
    --%></c:forEach>
    <input id="summary" value="${summaryid}" type="hidden"/>
</div>
<script type="text/javascript">
    var memberlist=${memberlist};
    var obj=$("#divId");
    for(var i=0;i<memberlist.length;i++){
        if(i!=0 && i%1==0){
            obj.append(" <span id="+memberlist[i].member_id+"><button  type='button' onclick='dodelete(&quot;"+memberlist[i].member_id+"&quot;)' style='background-color:#a7d0f6;border:1px solid #D4D4D4;text-align:center;width:60px;height:30px;margin-top:10px' >"+memberlist[i].name+" </button>" +
                "            <span style='position:absolute;color:red;padding-top:1px;margin-left:-12px;font-size:18px'>⬤</span>" +
                "            <span id='spanId' style='position:absolute;color:white;padding-top:5px;margin-left:-9px;font-size:10px'>✖</span>&nbsp;&nbsp;&nbsp;<br>" +
                "    </span>");
        }else{
            obj.append(" <span id="+memberlist[i].member_id+"> <button  type='button' onclick='dodelete(&quot;"+memberlist[i].member_id+"&quot;)' style='background-color:#a7d0f6;border:1px solid #D4D4D4;text-align:center;width:60px;height:30px;margin-top:10px' >"+memberlist[i].name+" </button>" +
                "            <span style='position:absolute;color:red;padding-top:1px;margin-left:-12px;font-size:18px'>⬤</span>" +
                "            <span id='spanId' style='position:absolute;color:white;padding-top:5px;margin-left:-9px;font-size:10px'>✖</span>&nbsp;&nbsp;&nbsp;" +
                "    </span>");
        }
    }

    function dodelete(memberid){

        var confirm = $.confirm({
            // 该操作不能恢复，是否进行删除操作
            'msg': $.i18n("simulation.page.confirm.delete.js"),
            ok_fn: function () {
                // table提交
                $.ajax({
                    url: _ctxPath + '/demo.do?method=toDeleteNode',
                    type:'POST',
                    data:{ summaryid: $("#summary").val(),memberid: memberid},
                    success:function (res) {
                        $.messageBox({
                            'title':$.i18n('collaboration.system.prompt.js'),
                            'type': 0,
                            'msg': $.i18n("simulation.page.inform.deleteSuccess.js"),//删除数据成功
                            'imgType':0,
                            ok_fn:function(){
                                var nodeobj=$("#"+memberid);
                                nodeobj.remove();
                            }
                        });
                    }
                });
            },
            error : function(request, settings, e){
                $.alert(e);
            }
        });


    }


</script>

</body>
</html>
