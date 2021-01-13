(function () {
    var a = {};
    var b = {};
    b.cacheWorkflowData = function () {
        a = {};
        var c = {includeDisabled: false, validate: false};
        var d = $("#workflow_definition").formobj();
        a = $.extend({}, d)
    };
    b.fallbackWorkflowCacheData = function () {
        for (var c in a) {
            $("#workflow_definition #" + c).val(a[c])
        }
        a = {}
    };
    window.WorkflowApi = b
})();
var wfAjax = new WFAjax();
var workfowFlashDialog = null;

function removeWorkflowMatchResultCache() {
    try {
        return wfAjax.removeWorkflowMatchResultCache(matchRequestToken)
    } catch (a) {
        alert(a.message)
    }
}

function canTakeBack(c, i, h, d, b, a, f) {
    try {
        if ($("#workflow_node_condition_input")[0]) {
            $("#workflow_node_condition_input")[0].value = '{"matchRequestToken":"' + matchRequestToken + '"}'
        }
        return wfAjax.canTakeBack(a, i, h, c)
    } catch (g) {
        alert(g.message)
    }
}

function saveProcessTempleteAndEvents() {
    var c = function () {
        var g;
        if ($.browser.mozilla) {
            g = document.getElementById("wfIframe").contentWindow
        } else {
            g = document.wfIframe
        }
        return g
    };
    if (!$("#wfIframe")[0]) {
        alert("No Iframe named 'wfIframe' was found.");
        return false
    }
    var f = c();
    var a = $("#process_event").val();
    if (!initPageDataToParentPage(f, this)) {
        return false
    }
    var e = $("#process_xml").val();
    var d = f.getProcessId();
    var b = wfAjax.saveProcessTempleteAndEvents(d, e, a, f.showDiagramTime);
    if (b) {
        $.alert(b);
        return false
    }
    return true
}

function canStopFlow(a) {
    try {
        if ($("#workflow_node_condition_input")[0]) {
            $("#workflow_node_condition_input")[0].value = '{"matchRequestToken":"' + matchRequestToken + '"}'
        }
        return wfAjax.canStopFlow(a)
    } catch (b) {
        alert(b.message)
    }
}

function canRepeal(a, d, c) {
    try {
        if ($("#workflow_node_condition_input")[0]) {
            $("#workflow_node_condition_input")[0].value = '{"matchRequestToken":"' + matchRequestToken + '"}'
        }
        return wfAjax.canRepeal(a, d, c)
    } catch (b) {
        alert(b.message)
    }
}

function canStepBack(b, h, g, a, c, d) {
    try {
        if ($("#workflow_node_condition_input")[0]) {
            $("#workflow_node_condition_input")[0].value = '{"matchRequestToken":"' + matchRequestToken + '"}'
        }
        d = d == undefined ? "" : d;
        c = c == undefined ? "" : c;
        return wfAjax.canStepBack(b, a, h, g, c, d)
    } catch (f) {
        alert(f.message)
    }
}

function lockWorkflowForStepBack(c, a, l, o, q, j, k, g, i, n, p, r, u, s, m, f, d, h, t) {
    if ($("#workflow_node_condition_input")[0]) {
        $("#workflow_node_condition_input")[0].value = '{"matchRequestToken":"' + matchRequestToken + '"}'
    }
    d = d == undefined ? "" : d;
    f = f == undefined ? "" : f;
    var b = new Object();
    b.formData = p;
    b.mastrid = p;
    b.processTemplateId = g;
    b.processId = i;
    b.caseId = l;
    b.currentActivityId = n;
    b.currentWorkitemId = a;
    b.currentUserId = c;
    b.bussinessId = j;
    b.affairId = k;
    b.appName = r;
    b.formAppId = u;
    b.formViewOperation = m;
    b.matchRequestToken = matchRequestToken;
    if (!b.businessData) {
        b.businessData = new Object()
    }
    b.businessData["attribute"] = h;
    b.businessData["commentContent"] = t;
    b.businessData["stepBackType"] = "normal";
    var e = {action: o, event: q, permissionAccountId: f, configCategory: d};
    return wfAjax.onBeforeValidate4StepBack(b, e)
}

function canTemporaryPending(a) {
    try {
        if ($("#workflow_node_condition_input")[0]) {
            $("#workflow_node_condition_input")[0].value = '{"matchRequestToken":"' + matchRequestToken + '"}'
        }
        return wfAjax.canTemporaryPending(a)
    } catch (b) {
        alert(b.message)
    }
}

function canSubmitWorkFlow(a) {
    if (null != a && a != "" && a != "-1") {
        return wfAjax.canWorkflowCurrentNodeSubmit(a)
    }
    return null
}

function lockWorkflow(f, b, c) {
    try {
        var a = wfAjax.lockWorkflow(f, b, c);
        if (a == null) {
            a = new Array("false", $.i18n("workflow.wapi.exception.msg002"))
        }
        return a
    } catch (d) {
        alert(d.message)
    }
}

function lockWorkflowUseNowexpirationTime(g, c, d, b) {
    try {
        if (b && b == "true") {
            b = "true"
        } else {
            b = "false"
        }
        var a = wfAjax.lockWorkflow(g, c, d, b);
        if (a == null) {
            a = new Array("false", $.i18n("workflow.wapi.exception.msg002"))
        }
        return a
    } catch (f) {
        alert(f.message)
    }
}

function releaseWorkflow(c, a) {
    try {
        return wfAjax.releaseWorkflow(c, a)
    } catch (b) {
        alert(b.message)
    }
}

function releaseWorkflowByAction(d, a, b) {
    try {
        return wfAjax.releaseWorkflow(d, a, b)
    } catch (c) {
        alert(c.message)
    }
}

function checkWorkflowLock(d, b) {
    try {
        var a = wfAjax.checkWorkflowLock(d, b);
        if (a == null) {
            a = new Array("false", $.i18n("workflow.wapi.exception.msg002"))
        }
        return a
    } catch (c) {
        alert(c.message)
    }
}

function checkWorkflowLock(f, b, c) {
    try {
        var a = wfAjax.checkWorkflowLock(f, b, c);
        if (a == null) {
            a = new Array("false", $.i18n("workflow.wapi.exception.msg002"))
        }
        return a
    } catch (d) {
        alert(d.message)
    }
}

function _closeFlashDialogBeforeOpen(a) {
    if (workfowFlashDialog) {
        workfowFlashDialog.isHide = false;
        workfowFlashDialog.close(workfowFlashDialog.index)
    } else {
        if (a && $("#workflow_dialog_workflowDesigner_Id", a.document).size() > 0) {
            a.$("#workflow_dialog_workflowDesigner_Id_mask").remove();
            a.$("#workflow_dialog_workflowDesigner_Id").remove()
        }
    }
}

function _closeOrHideFlashDialog() {
    if (!$.browser.msie) {
        workfowFlashDialog.close()
    } else {
        workfowFlashDialog.hideDialog()
    }
}

function createWFTemplate(l, m, e, o, b, j, p, c, s, d, h, r, g, q, i, a, n, f, k) {
    alert("重构中，发现有问题请上报BUG")
}

function modifyWFTemplateForEgg(a) {
    var o = a.tWindow;
    var p = a.appName;
    var f = a.formApp;
    var q = a.viewId;
    var c = a.ptemplateId;
    var m = a.vWindow;
    var r = a.defaultPolicyId;
    var d = a.currentUserId;
    var u = a.currentUserName;
    var e = a.currentUserAccountName;
    var i = a.flowPermAccountId;
    var t = a.operationId;
    var h = a.startOperationId;
    var s = a.defaultPolicyName;
    var n = a.canCopyFlow;
    var j = a.SPK;
    var k = a.NPS;
    var g = o;
    if (m) {
        g = m
    }
    var b = "";
    var l = "";
    if (h && h != "-1") {
        if (q && q != "-1") {
            b += q + "."
        }
        b += h
    }
    if (t && t != "-1") {
        if (q && q != "-1") {
            l += q + "."
        }
        l += t
    }
    editWorkflowForEgg({
        targetWin: o,
        valueWin: m,
        appName: p,
        processId: c,
        defaultPolicyId: r,
        defaultPolicyName: s,
        currentUserId: d,
        currentUserName: u,
        currentAccountName: e,
        flowPermAccountId: i,
        formApp: f,
        startDefualtRightId: b,
        normalDefualtRightId: l,
        canCopyFlow: n,
        SPK: j,
        NPS: k
    })
}

function cloneWFTemplate(s) {
    var n = s.tWindow;
    var o = s.appName;
    var j = s.NPS;
    var g = s.formApp;
    var p = s.viewId;
    var b = s.ptemplateId;
    var l = s.vWindow;
    var q = s.defaultPolicyId;
    var c = s.currentUserId;
    var u = s.currentUserName;
    var e = s.currentUserAccountName;
    var i = s.flowPermAccountId;
    var t = s.operationId;
    var h = s.startOperationId;
    var r = s.defaultPolicyName;
    var d = s.oldWendanId;
    var f = s.newWendanId;
    var m = s.canCopyFlow;
    var a = "";
    var k = "";
    if (h && h != "-1") {
        if (p && p != "-1") {
            a += p + "."
        }
        a += h
    }
    if (t && t != "-1") {
        if (p && p != "-1") {
            k += p + "."
        }
        k += t
    }
    editWorkflowForClone({
        targetWin: n,
        valueWin: l,
        appName: o,
        processId: b,
        defaultPolicyId: q,
        defaultPolicyName: r,
        currentUserId: c,
        currentUserName: u,
        currentAccountName: e,
        flowPermAccountId: i,
        formApp: g,
        startDefualtRightId: a,
        normalDefualtRightId: k,
        wendanId: f,
        oldWendanId: d,
        canCopyFlow: m,
        NPS: j
    })
}

var workfowFlashDialog = null;

function showDiagram(c) {
    ;var a = {
        targetWin: getCtpTop(),
        valueWin: getCtpTop(),
        isModalDialog: true,
        isHistoryFlag: false,
        isDebugger: false,
        scene: 3,
        orginalTemplateWorkFlowId: "",
        caseId: "",
        currentNodeId: "",
        formMutilOprationIds: "",
        showHastenButton: false,
        selectPeopleExtParams: "",
        isTemplate: false,
        targetWin: null,
        valueWin: null,
        title: $.i18n("workflow.designer.title"),
        flowPermAccountId: "",
        defaultPolicyId: "",
        defaultPolicyName: "",
        buttons: [{id: "close"}],
        superviseId: "",
        SPK: "default",
        NPS: "default",
        currentUserId: "",
        currentUserName: "",
        masterId: "",
        formAppId: "",
        isAdminMangerModel: false,
        canExePrediction: false,
        needClonedProcessId: "",
        isSkipNode: "false",
        canSetCircleBranch: "true",
        callBackFn: null
    };
    var b = false;
    if (c.scene == 2 || c.scene == 3) {
        b = true
    }
    initParam4Diagram(c, b);
    var c = $.extend(a, c);
    _closeFlashDialogBeforeOpen(c.targetWin);
    setTimeout(function () {
        var l = $(c.targetWin).width();
        var e = $(c.targetWin).height();
        if (l <= 0) {
            l = $(document.body).width();
            e = $(document.body).height()
        }
        var f = _wfctxPath + "/workflow/designer.do?method=showDiagram";
        f += "&isDebugger=" + c.isDebugger;
        f += "&isModalDialog=" + c.isModalDialog;
        f += "&isTemplate=" + c.isTemplate;
        f += "&formApp=" + (c.formAppId || "");
        f += "&appName=" + c.appName;
        f += "&processId=" + c.processId;
        f += "&currentUserId=" + c.currentUserId || window._wfcurrentUserId || "";
        f += "&currentUserName=" + encodeURIComponent(c.currentUserName);
        f += "&currentUserAccountName=" + encodeURIComponent(c.currentAccountName);
        f += "&defaultPolicyId=" + encodeURIComponent(c.defaultPolicyId);
        f += "&defaultPolicyName=" + encodeURIComponent(c.defaultPolicyName);
        f += "&flowPermAccountId=" + c.flowPermAccountId;
        f += "&wendanId=" + (c.wendanId || "-1");
        f += "&isvalidate=false&oldPTId=" + (c.oldTemplateId == undefined ? "" : c.oldTemplateId);
        f += "&startFormViewOperation=" + c.startDefualtRightId;
        f += "&nodeFormViewOperation=" + c.normalDefualtRightId;
        f += "&needValidate=" + c.isValidate;
        f += "&canCopyFlow=" + c.canCopyFlow;
        f += "&isHistoryFlag=" + c.isHistoryFlag;
        f += "&caseId=" + c.caseId;
        f += "&currentNodeId=" + c.currentNodeId;
        f += "&formMutilOprationIds=" + c.formMutilOprationIds;
        f += "&showHastenButton=" + encodeURIComponent(c.showHastenButton);
        f += "&superviseId=" + c.superviseId;
        f += "&selectPeopleExtParams=" + c.selectPeopleExtParams;
        f += "&SPK=" + c.SPK;
        f += "&NPS=" + c.NPS;
        f += "&masterId=" + c.masterId;
        f += "&canExePrediction=" + c.canExePrediction;
        f += "&needClonedProcessId=" + c.needClonedProcessId;
        f += "&CWID=" + c.currentWorkitemId;
        f += "&SD=" + c.splitDisplay;
        f += "&isSkipNode=" + c.isSkipNode;
        f += "&canSetCircleBranch=" + c.canSetCircleBranch;
        f += "&orginalTemplateWorkFlowId=" + c.orginalTemplateWorkFlowId;
        var d = c.isAdminMangerModel;
        if (!d) {
            d = c.scene == 5 || c.scene == 4
        }
        if (d) {
            f += "&addWorkflowExpirationTimeLock=true"
        }
        var h = 1;
        f += "&action=" + h;
        f += CsrfGuard.getUrlSurffix();
        if (c.embedIframeObj) {
            f += "&openFromIframe=true";
            f += "&scene=" + c.scene;
            $(c.embedIframeObj).attr("src", f);
            return
        }
        var m = c.targetWin;
        if (c.valueWin) {
            m = c.valueWin
        }
        var g = false;
        var j = ["", ""];
        var i = false;
        if (d) {
            var k = wfAjax.getCaseState(c.caseId);
            g = k[0] == "true" ? true : false;
            if (!g) {
                j = lockWorkflowUseNowexpirationTime(c.processId, (c.currentUserId || window._wfcurrentUserId || ""), h, "true");
                if (j[0] == "false") {
                    g = true
                } else {
                    i = true
                }
            }
        }
        if (!g) {
            f += "&scene=" + c.scene
        } else {
            f += "&scene=3"
        }
        workfowFlashDialog = $.dialog({
            id: "workflow_dialog_workflowDesigner_Id",
            isHide: true,
            url: f,
            width: l - 20,
            height: e - 100,
            title: c.title,
            targetWindow: c.targetWin,
            transParams: {
                subProcessJson: $("#process_subsetting", m.document).val(),
                formId: $("#formId").val(),
                dwidths: l,
                dheights: e - 20,
                workflowRule: $("#process_rulecontent", m.document).val(),
                returnValueWindow: m,
                callBackFn: c.callBackFn
            },
            closeParam: {
                show: true, handler: function () {
                    if (i) {
                        releaseWorkflowByAction(c.processId, (c.currentUserId || window._wfcurrentUserId || ""), 1)
                    }
                }
            },
            minParam: {show: false},
            maxParam: {show: false},
            notCopyReturnValue: true,
            buttons: assembleButtons(c, g, i)
        });
        if (j && j[0] && j[0] == "false") {
            $.alert(j[1])
        }
    }, 10)
}

function initParam4Diagram(b, a) {
    if (!b.title) {
        if (a) {
            b.title = $.i18n("workflow.designer.title.readonly")
        } else {
            b.title = $.i18n("workflow.designer.title")
        }
    }
    if (!b.buttons || b.buttons.length == 0) {
        if (!a) {
            b.buttons = [{id: "ok"}, {id: "cancel"}]
        } else {
            b.buttons = [{id: "close"}]
        }
    }
}

function getBtn(d, c) {
    if (d) {
        for (var b = 0; b < d.length; b++) {
            var a = d[b];
            if (a.id == c) {
                return a
            }
        }
    }
    return null
}

function assembleButtons(d, f, g) {
    var h = [];
    if (d.isSkipNode === "true") {
        return h
    }
    var s = getBtn(d.buttons, "modify");
    var j = getBtn(d.buttons, "repeal");
    var n = getBtn(d.buttons, "stop");
    var l = getBtn(d.buttons, "cancel");
    var b = getBtn(d.buttons, "ok");
    var p = getBtn(d.buttons, "close");
    var i = getBtn(d.buttons, "saveDBOK");
    var m = false;
    if (s) {
        var m = true;
        var a = {
            id: "modifyButton",
            text: $.i18n("workflow.designer.page.button.modify"),
            isEmphasize: true,
            disabled: f,
            handler: function () {
                var u = workfowFlashDialog.getReturnValue({innerButtonId: "supervious_modify"});
                if (u) {
                    var x = u[0];
                    var y = u[1];
                    var w = u[2];
                    var v = u[3];
                    var t = u[4];
                    x.refreshMonitor(y, w, v, t, 1, true, 5);
                    workfowFlashDialog.showBtn("saveDBOKButton");
                    workfowFlashDialog.hideBtn("modifyButton");
                    workfowFlashDialog.disabledBtn("repealButton");
                    workfowFlashDialog.disabledBtn("stopButton");
                    if (typeof s.callBackFn == "function") {
                        s.callBackFn(d, workfowFlashDialog)
                    }
                }
            }
        };
        h.push(a)
    }
    if (i || s) {
        var q = {
            id: "saveDBOKButton",
            hide: m,
            btnType: 1,
            isEmphasize: true,
            disabled: f,
            text: $.i18n("workflow.designer.page.button.ok"),
            handler: function () {
                var t = workfowFlashDialog.getReturnValue({innerButtonId: "supervious_ok"});
                if (t) {
                    _closeOrHideFlashDialog();
                    if (g) {
                        releaseWorkflowByAction(d.processId, (d.currentUserId || window._wfcurrentUserId || ""), 1)
                    }
                    if (i && typeof i.callBackFn == "function") {
                        i.callBackFn()
                    }
                }
            }
        };
        h.push(q)
    }
    if (j) {
        var r = {
            id: "repealButton",
            text: $.i18n("workflow.designer.page.button.repeal"),
            disabled: f,
            handler: function () {
                var t = canRepeal(d.appName, d.processId, "");
                if (t[0] == "false") {
                    $.alert(t[1]);
                    return
                }
                if (typeof j.callBackFn == "function") {
                    j.callBackFn(d, workfowFlashDialog)
                }
            }
        };
        h.push(r)
    }
    if (n) {
        var k = {
            id: "stopButton",
            text: $.i18n("workflow.designer.page.button.stop"),
            disabled: f,
            handler: function () {
                if (typeof n.callBackFn == "function") {
                    n.callBackFn(d, workfowFlashDialog)
                }
            }
        };
        h.push(k)
    }
    if (p) {
        var c = {
            text: $.i18n("workflow.designer.button.close"), handler: function () {
                _closeOrHideFlashDialog();
                if (g) {
                    releaseWorkflowByAction(d.processId, (d.currentUserId || window._wfcurrentUserId || ""), 1)
                }
                if (typeof p.callBackFn == "function") {
                    p.callBackFn(d, workfowFlashDialog)
                }
            }
        };
        h.push(c)
    }
    if (b) {
        var o = {
            text: $.i18n("workflow.designer.page.button.ok"), isEmphasize: true, handler: function () {
                var t = workfowFlashDialog.getReturnValue({innerButtonId: "ok"});
                if (t) {
                    var u = d.valueWin == null ? d.targetWin : d.valueWin;
                    initDialogDataToParentPage(t, u, d.targetWin);
                    _closeOrHideFlashDialog();
                    if (typeof finishWorkFlowModify == "function") {
                        finishWorkFlowModify()
                    }
                    try {
                        window.distroy_token = true
                    } catch (v) {
                    }
                    if (typeof b.callBackFn == "function") {
                        b.callBackFn(d, workfowFlashDialog)
                    }
                    if (g) {
                        releaseWorkflowByAction(d.processId, (d.currentUserId || window._wfcurrentUserId || ""), 1)
                    }
                }
            }
        };
        h.push(o)
    }
    if (l) {
        var e = {
            text: $.i18n("workflow.designer.page.button.cancel"), handler: function () {
                _closeOrHideFlashDialog();
                if (typeof recoverWorkFlowHistoryData == "function") {
                    recoverWorkFlowHistoryData()
                }
                if (typeof l.callBackFn == "function") {
                    l.callBackFn(d, workfowFlashDialog)
                }
                if (g) {
                    releaseWorkflowByAction(d.processId, (d.currentUserId || window._wfcurrentUserId || ""), 1)
                }
            }
        };
        h.push(e)
    }
    return h
}

function editWorkflowForEgg(s) {
    var o = s.targetWin;
    var m = s.valueWin;
    var p = s.appName;
    var h = s.processId;
    var b = s.oldTemplateId;
    var l = s.templateId;
    var t = s.defaultPolicyId;
    var u = s.defaultPolicyName;
    var c = s.currentUserId;
    var v = s.currentUserName;
    var e = s.currentAccountName;
    var g = s.flowPermAccountId;
    var d = s.formApp;
    var a = s.startDefualtRightId;
    var q = s.normalDefualtRightId;
    var k = s.wendanId;
    var r = s.isvalidate;
    var n = s.canCopyFlow;
    var f = o;
    if (m) {
        f = m
    }
    var i = s.SPK;
    var j = s.NPS;
    _closeFlashDialogBeforeOpen(o);
    setTimeout(function () {
        var w = $("#process_xml", currentTr).val();
        var y = $("#process_subsetting", currentTr).val();
        y = y == undefined ? "" : y;
        var C = wfAjax.validateProcessTemplateXMLForEgg(p, j, h, w, d, y);
        $("#process_xml", currentTr).val(C[0]);
        $("#process_subsetting", currentTr).val(C[3]);
        $("#process_xml", f.document).val(C[0]);
        $("#process_subsetting", f.document).val(C[3]);
        b = $("#process_id", currentTr).val();
        b = b == undefined ? "" : b;
        var z = $(o).width();
        var A = $(o).height();
        if (z <= 0) {
            z = $(document.body).width();
            A = $(document.body).height()
        }
        var B = false;
        if (r) {
            B = true
        }
        var x = _wfctxPath + "/workflow/designer.do?method=showDiagram&isDebugger=false&scene=0&isModalDialog=true";
        x += "&formApp=" + d;
        x += "&appName=" + p;
        x += "&processId=" + h;
        x += "&currentUserId=" + c;
        x += "&currentUserName=" + encodeURIComponent(v);
        x += "&currentUserAccountName=" + encodeURIComponent(e);
        x += "&defaultPolicyId=" + encodeURIComponent(t);
        x += "&defaultPolicyName=" + encodeURIComponent(u);
        x += "&flowPermAccountId=" + g;
        x += "&wendanId=" + (k || "-1");
        x += "&isvalidate=false&oldPTId=" + b;
        x += "&startFormViewOperation=" + a;
        x += "&nodeFormViewOperation=" + q;
        x += "&needValidate=" + B;
        x += "&templateId=" + (l || "-1");
        x += "&isTemplate=true";
        x += "&canCopyFlow=" + n;
        x += "&SPK=" + i;
        x += "&NPS=" + j;
        workfowFlashDialog = $.dialog({
            id: "workflow_dialog_workflowDesigner_Id",
            isHide: true,
            url: x,
            width: z - 20,
            height: A - 100,
            title: $.i18n("workflow.designer.title"),
            targetWindow: o,
            transParams: {
                subProcessJson: $("#process_subsetting", currentTr).val(),
                formId: $("#formId").val(),
                dwidths: z,
                dheights: A - 20,
                workflowRule: $("#process_rulecontent", currentTr).val(),
                returnValueWindow: f,
                verifyResultXml: C[1]
            },
            closeParam: {
                show: true, handler: function () {
                    if (typeof recoverWorkFlowHistoryData == "function") {
                        recoverWorkFlowHistoryData()
                    }
                }
            },
            minParam: {show: false},
            maxParam: {show: false},
            notCopyReturnValue: true,
            buttons: [{
                text: $.i18n("workflow.designer.page.button.ok"), isEmphasize: true, handler: function () {
                    var D = workfowFlashDialog.getReturnValue({innerButtonId: "ok"});
                    if (D) {
                        var F = wfAjax.validateFormTemplate(p, j, d || "", D[1], D[4]);
                        if (F == null || F.length < 2) {
                            $.alert($.i18n("workflow.label.dialog.validateError.js"));
                            return
                        }
                        if ("false" == F[0]) {
                            if ($("#needRedirect", currentTr)[0]) {
                                $("#needRedirect", currentTr).val("true")
                            }
                            var H = $($.parseXML(F[1].substr(38)));
                            var M = H.find("n[s=false]");
                            var E = true, P = "";
                            if (M.size() > 0) {
                                loopFlag1:for (var J = 0, K = M.size(); J < K; J++) {
                                    var G = M.eq(J);
                                    for (var I = 0; I < 6; I++) {
                                        if ("false" == G.find("r" + I).text()) {
                                            E = false;
                                            P = G.find("r" + I + "msg").text();
                                            break loopFlag1
                                        }
                                    }
                                }
                            }
                            var N = H.find("l[s=false]");
                            if (E && N.size() > 0) {
                                loopFlag2:for (var J = 0, K = N.size(); J < K; J++) {
                                    var L = N.eq(J);
                                    if ("false" == L.find("r0").text()) {
                                        E = false;
                                        P = L.find("r0msg").text();
                                        break loopFlag2
                                    }
                                }
                            }
                            var O = H.find("cl[s=false]");
                            if (E && O.size() > 0) {
                                loopFlag2:for (var J = 0, K = O.size(); J < K; J++) {
                                    var L = O.eq(J);
                                    if ("false" == L.find("r0").text()) {
                                        E = false;
                                        P = L.find("r0msg").text();
                                        break loopFlag2
                                    }
                                }
                            }
                            H = M = N = G = L = O = null;
                            if (!E) {
                                $.alert(P);
                                return
                            }
                        }
                        initDialogDataToParentPage4egg(D, f, o);
                        if ($("#needRedirect", currentTr)[0]) {
                            $("#needRedirect", currentTr).val("false")
                        }
                        _closeOrHideFlashDialog();
                        if (typeof finishWorkFlowModify == "function") {
                            finishWorkFlowModify()
                        }
                    }
                }
            }, {
                text: $.i18n("workflow.designer.page.button.cancel"), handler: function () {
                    _closeOrHideFlashDialog();
                    if (typeof recoverWorkFlowHistoryData == "function") {
                        recoverWorkFlowHistoryData()
                    }
                }
            }]
        })
    }, 10)
}

function editWorkflowForClone(t) {
    var p = t.targetWin;
    var n = t.valueWin;
    var q = t.appName;
    var j = t.processId;
    var b = t.oldTemplateId;
    var m = t.templateId;
    var u = t.defaultPolicyId;
    var v = t.defaultPolicyName;
    var c = t.currentUserId;
    var x = t.currentUserName;
    var f = t.currentAccountName;
    var i = t.flowPermAccountId;
    var e = t.formApp;
    var a = t.startDefualtRightId;
    var r = t.normalDefualtRightId;
    var l = t.wendanId;
    var d = t.oldWendanId;
    var s = t.isvalidate;
    var o = t.canCopyFlow;
    var h = t.SPK;
    var k = t.NPS;
    var w = wfAjax.selectProcessTemplateXMLForClone(q, k, j, e, d || "-1", l || "-1", "{}");
    if (w == null || w.length < 2) {
        $.alert($.i18n("workflow.label.dialog.cloneFailure.js"));
        return
    }
    var g = p;
    if (n) {
        g = n
    }
    _closeFlashDialogBeforeOpen(p);
    setTimeout(function () {
        var z = $("#process_xml", g.document).val();
        b = $("#process_id", g.document).val();
        b = b == undefined ? "" : b;
        $("#process_xml", g.document).val(w[0]);
        var A = $(p).width();
        var B = $(p).height();
        if (A <= 0) {
            A = $(document.body).width();
            B = $(document.body).height()
        }
        var C = false;
        if (s) {
            C = true
        }
        var y = _wfctxPath + "/workflow/designer.do?method=showDiagram&isDebugger=false&scene=0&isModalDialog=true";
        y += "&formApp=" + e;
        y += "&appName=" + q;
        y += "&SPK=" + h;
        y += "&NPS=" + k;
        y += "&currentUserId=" + c;
        y += "&currentUserName=" + encodeURIComponent(x);
        y += "&currentUserAccountName=" + encodeURIComponent(f);
        y += "&defaultPolicyId=" + encodeURIComponent(u);
        y += "&defaultPolicyName=" + encodeURIComponent(v);
        y += "&flowPermAccountId=" + i;
        y += "&wendanId=" + (l || "-1");
        y += "&isvalidate=false&oldPTId=" + b;
        y += "&startFormViewOperation=" + a;
        y += "&nodeFormViewOperation=" + r;
        y += "&needValidate=" + C;
        y += "&templateId=" + (m || "-1");
        y += "&isTemplate=true";
        y += "&canCopyFlow=" + o;
        workfowFlashDialog = $.dialog({
            id: "workflow_dialog_workflowDesigner_Id",
            isHide: true,
            url: y,
            width: A - 20,
            height: B - 100,
            title: $.i18n("workflow.designer.title"),
            targetWindow: p,
            transParams: {
                subProcessJson: $("#process_subsetting", g.document).val(),
                formId: $("#formId").val(),
                dwidths: A,
                dheights: B - 20,
                workflowRule: $("#process_rulecontent", g.document).val(),
                returnValueWindow: g,
                verifyResultXml: w[1],
                isClone: true,
                appName: q,
                formApp: e
            },
            closeParam: {
                show: true, handler: function () {
                    $("#process_xml", g.document).val(z);
                    if (typeof recoverWorkFlowHistoryData == "function") {
                        recoverWorkFlowHistoryData()
                    }
                }
            },
            minParam: {show: false},
            maxParam: {show: false},
            notCopyReturnValue: true,
            buttons: [{
                text: $.i18n("workflow.designer.page.button.ok"), isEmphasize: true, handler: function () {
                    var D = workfowFlashDialog.getReturnValue({innerButtonId: "ok"});
                    if (D) {
                        var F = wfAjax.validateFormTemplate(q, "default", e || newWendanId || "", D[1], D[4]);
                        if (F == null || F.length < 2) {
                            $.alert($.i18n("workflow.label.dialog.validateError.js"));
                            return
                        }
                        if ("false" == F[0]) {
                            var H = $($.parseXML(F[1].substr(38)));
                            var M = H.find("n[s=false]");
                            var E = true, P = "";
                            if (M.size() > 0) {
                                loopFlag1:for (var J = 0, K = M.size(); J < K; J++) {
                                    var G = M.eq(J);
                                    for (var I = 0; I < 6; I++) {
                                        if ("false" == G.find("r" + I).text()) {
                                            E = false;
                                            P = G.find("r" + I + "msg").text();
                                            break loopFlag1
                                        }
                                    }
                                }
                            }
                            var N = H.find("l[s=false]");
                            if (E && N.size() > 0) {
                                loopFlag2:for (var J = 0, K = N.size(); J < K; J++) {
                                    var L = N.eq(J);
                                    if ("false" == L.find("r0").text()) {
                                        E = false;
                                        P = L.find("r0msg").text();
                                        break loopFlag2
                                    }
                                }
                            }
                            var O = H.find("cl[s=false]");
                            if (E && O.size() > 0) {
                                loopFlag3:for (var J = 0, K = O.size(); J < K; J++) {
                                    var L = O.eq(J);
                                    if ("false" == L.find("r0").text()) {
                                        E = false;
                                        P = L.find("r0msg").text();
                                        break loopFlag3
                                    }
                                }
                            }
                            H = M = N = G = O = L = null;
                            if (!E) {
                                P = "<div style='width:270px;' class='word_break_all'>" + P + "<div>";
                                $.alert(P);
                                return
                            }
                        }
                        initDialogDataToParentPage(D, g, p);
                        _closeOrHideFlashDialog();
                        if (typeof finishWorkFlowModify == "function") {
                            finishWorkFlowModify()
                        }
                    }
                }
            }, {
                text: $.i18n("workflow.designer.page.button.cancel"), handler: function () {
                    $("#process_xml", g.document).val(z);
                    _closeOrHideFlashDialog();
                    if (typeof recoverWorkFlowHistoryData == "function") {
                        recoverWorkFlowHistoryData()
                    }
                }
            }]
        })
    }, 10)
}

function initDialogDataToParentPage4egg(w, i, t) {
    var b = w[0];
    var f = w[1];
    var q = w[2];
    var v = w[3];
    var d = w[4];
    var o = w[5];
    var m = $("#process_desc_by", currentTr)[0];
    var j = $("#process_xml", currentTr)[0];
    var a = $("#value4Show", currentTr)[0];
    var p = $("#process_rulecontent", currentTr)[0];
    var r = $("#process_subsetting", currentTr)[0];
    var g = $("#process_event", currentTr)[0];
    if (!m && b) {
        showFlashAlert("Error: not found process_desc_by input element in parent page!");
        throw new Error("Error: not found process_desc_by input element in parent page!")
    }
    if (!j && f) {
        showFlashAlert("Error: not found process_xml input element in parent page!");
        throw new Error("Error: not found process_xml input element in parent page!")
    }
    if (!a && q) {
        showFlashAlert("Error: not found process_info input element in parent page!");
        throw new Error("Error: not found process_info input element in parent page!")
    }
    if (!p && v) {
        alert("Error: not found process_rulecontent input element in parent page!");
        throw new Error("Error: not found process_rulecontent input element in parent page!")
    }
    if (!r && d) {
        showFlashAlert("Error: not found process_subsetting input element in parent page!");
        throw new Error("Error: not found process_subsetting input element in parent page!")
    }
    if (b) {
        m.value = b
    }
    if (f) {
        j.value = f
    }
    if (q) {
        a.value = q;
        $(a).trigger("propertychange").trigger("input");
        try {
            $("#process_info").tokenInput("destroy")
        } catch (u) {
        }
    }
    try {
        p.value = (v == undefined || v == null) ? "" : v
    } catch (u) {
    }
    if (d) {
        r.value = d
    }
    if (g) {
        g.value = o
    }
    try {
        var c = $("#process_desc_by", currentTr)[0];
        var s = $("#process_xml", currentTr)[0];
        var n = $("#value4Show", currentTr)[0];
        var k = $("#process_rulecontent", currentTr)[0];
        var l = $("#process_subsetting", currentTr)[0];
        var h = $("#process_event", currentTr)[0];
        c.value = b;
        s.value = f;
        n.value = q;
        k.value = v;
        l.value = d;
        h.value = o;
        afterValueChange()
    } catch (u) {
    }
}

function initDialogDataToParentPage(w, i, t) {
    if (i == null) {
        i = t
    }
    var b = w[0];
    var f = w[1];
    var q = w[2];
    var v = w[3];
    var d = w[4];
    var o = w[5];
    var m = $("#process_desc_by", i.document)[0];
    var j = $("#process_xml", i.document)[0];
    var a = $("#process_info", i.document)[0];
    var p = $("#process_rulecontent", i.document)[0];
    var r = $("#process_subsetting", i.document)[0];
    var g = $("#process_event", i.document)[0];
    if (!m && b) {
        showFlashAlert("Error: not found process_desc_by input element in parent page!");
        throw new Error("Error: not found process_desc_by input element in parent page!")
    }
    if (!j && f) {
        showFlashAlert("Error: not found process_xml input element in parent page!");
        throw new Error("Error: not found process_xml input element in parent page!")
    }
    if (!a && q) {
        showFlashAlert("Error: not found process_info input element in parent page!");
        throw new Error("Error: not found process_info input element in parent page!")
    }
    if (!p && v) {
        alert("Error: not found process_rulecontent input element in parent page!");
        throw new Error("Error: not found process_rulecontent input element in parent page!")
    }
    if (!r && d) {
        showFlashAlert("Error: not found process_subsetting input element in parent page!");
        throw new Error("Error: not found process_subsetting input element in parent page!")
    }
    if (b) {
        m.value = b
    }
    if (f) {
        j.value = f
    }
    if (q) {
        $("#process_info", i.document).attr("value", q);
        $("#process_info", i.document).trigger("propertychange").trigger("input");
        try {
            $("#process_info", i.document).tokenInput("destroy");
            if (typeof (hideCommonContact) != "undefined") {
                hideCommonContact()
            }
        } catch (u) {
        }
        $("#process_info", i.document).attr("value", q)
    }
    try {
        p.value = (v == undefined || v == null) ? "" : v
    } catch (u) {
    }
    if (d) {
        r.value = d
    }
    if (g) {
        g.value = o
    }
    try {
        var c = $("#process_desc_by", t.document)[0];
        var s = $("#process_xml", t.document)[0];
        var n = $("#process_info", t.document)[0];
        var k = $("#process_rulecontent", t.document)[0];
        var l = $("#process_subsetting", t.document)[0];
        var h = $("#process_event", t.document)[0];
        c.value = b;
        s.value = f;
        n.value = q;
        k.value = v;
        l.value = d;
        h.value = o
    } catch (u) {
    }
}

function createWFPersonal(j, g, d, f, c, b, i, e, h, a) {
    alert("重构中，发现有问题请上报BUG")
}

function showWFCDiagram(n, d, a, h, i, f, k, j, l, b, o, m, g, c, e) {
    alert("重构中，发现有问题请上报BUG")
}

function superviousWFCDiagram(k, e, b, f, h, g, i, d, a, j, c) {
    alert("已经被废弃，发现有调用请上报BUG")
}

function editWFCDiagram(a) {
    a.alertStyle = true;
    editWFCDiagramEdocModalDialog(a)
}

function editWFCDiagramEdocModalDialog(e) {
    var p = e.tWindow;
    var m = e.caseId;
    var i = e.processId;
    var n = e.vWindow;
    var q = e.appName;
    var o = e.isTemplate;
    var h = e.flowPermAccountId;
    var r = e.defaultPolicyId;
    var s = e.defaultPolicyName;
    var d = e.callback;
    var a = e.alertStyle;
    var k = e.myTitle;
    var c = e.isHistoryFlag;
    var j = e.SPK;
    var l = e.NPS;
    c = c || false;
    var b = lockWorkflowUseNowexpirationTime(i, _wfcurrentUserId, 2, "true");
    if (b[0] == "false") {
        a = (a == undefined || a == true) ? true : false;
        if (a) {
            $.alert(b[1])
        } else {
            alert(b[1])
        }
        return
    }
    var t = wfAjax.getCaseState(m);
    var f = t[0] == "true" ? true : false;
    var g = p;
    if (n) {
        g = n
    }
    _closeFlashDialogBeforeOpen(p);
    setTimeout(function () {
        var v = $(p).width();
        var x = $(p).height();
        if (v <= 0) {
            v = $(document.body).width();
            x = $(document.body).height()
        }
        var u = $.i18n("workflow.designer.title");
        if (k && k != "") {
            u = k
        }
        if (!a) {
            if ($.browser.chrome) {
                var w = v3x.openDialog({
                    id: "password_new_Win",
                    title: u,
                    url: _wfctxPath + "/workflow/designer.do?method=showDiagram&isDebugger=false&scene=4&isModalDialog=true&processId=" + i + "&caseId=" + m + "&isTemplate=" + o + "&appName=" + q + "&flowPermAccountId=" + h + "&defaultPolicyId=" + encodeURIComponent(r) + "&defaultPolicyName=" + encodeURIComponent(s) + "&isEdoc=true&dialogTitle=" + encodeURIComponent(u) + "&isHistoryFlag=" + c + "&action=2&SPK=" + j + "&NPS=" + l + "&addWorkflowExpirationTimeLock=true",
                    width: v - 100,
                    height: x - 50,
                    minParam: {show: false},
                    maxParam: {show: false},
                    closeParam: {
                        show: true, handler: function () {
                            if (!$.browser.msie) {
                                w.close()
                            } else {
                                w.hideDialog()
                            }
                            releaseWorkflowByAction(i, _wfcurrentUserId, 2)
                        }
                    },
                    targetWindow: p,
                    notCopyReturnValue: true,
                    buttons: [{
                        id: "okButton",
                        text: $.i18n("workflow.designer.page.button.ok"),
                        disabled: f,
                        handler: function () {
                            var z = w.getReturnValue({innerButtonId: "supervious_ok"});
                            if (z) {
                                if (!$.browser.msie) {
                                    w.close()
                                } else {
                                    w.hideDialog()
                                }
                                releaseWorkflowByAction(i, _wfcurrentUserId, 2);
                                if (d && typeof d == "function") {
                                    d()
                                }
                            }
                        }
                    }, {
                        text: $.i18n("workflow.designer.page.button.cancel"), handler: function () {
                            if (!$.browser.msie) {
                                w.close()
                            } else {
                                w.hideDialog()
                            }
                            releaseWorkflowByAction(i, _wfcurrentUserId, 2)
                        }
                    }]
                })
            } else {
                var y = getA8Top().v3x.openWindow({
                    url: _wfctxPath + "/workflow/designer.do?method=showDiagram&isDebugger=false&scene=4&isModalDialog=false&processId=" + i + "&caseId=" + m + "&isTemplate=" + o + "&appName=" + q + "&flowPermAccountId=" + h + "&defaultPolicyId=" + encodeURIComponent(r) + "&defaultPolicyName=" + encodeURIComponent(s) + "&isEdoc=true&dialogTitle=" + encodeURIComponent(u) + "&isHistoryFlag=" + c + "&action=2&SPK=" + j + "&NPS=" + l + "&addWorkflowExpirationTimeLock=true",
                    width: v - 10,
                    height: x,
                    resizable: "no"
                });
                releaseWorkflowByAction(i, _wfcurrentUserId, 2);
                if (d && typeof d == "function") {
                    d()
                }
            }
        } else {
            workfowFlashDialog = $.dialog({
                id: "workflow_dialog_workflowDesigner_Id",
                isHide: true,
                url: _wfctxPath + "/workflow/designer.do?method=showDiagram&isDebugger=false&scene=4&isModalDialog=true&processId=" + i + "&caseId=" + m + "&isTemplate=" + o + "&appName=" + q + "&flowPermAccountId=" + h + "&defaultPolicyId=" + encodeURIComponent(r) + "&defaultPolicyName=" + encodeURIComponent(s) + "&isHistoryFlag=" + c + "&action=2&SPK=" + j + "&NPS=" + l + "&addWorkflowExpirationTimeLock=true",
                width: v - 20,
                height: x - 100,
                title: u,
                transParams: {dwidths: v, dheights: x - 20, returnValueWindow: g},
                minParam: {show: false},
                maxParam: {show: false},
                closeParam: {
                    show: true, handler: function () {
                        releaseWorkflowByAction(i, _wfcurrentUserId, 2)
                    }
                },
                targetWindow: p,
                notCopyReturnValue: true,
                buttons: [{
                    id: "okButton",
                    text: $.i18n("workflow.designer.page.button.ok"),
                    disabled: f,
                    handler: function () {
                        var z = workfowFlashDialog.getReturnValue({innerButtonId: "supervious_ok"});
                        if (z) {
                            _closeOrHideFlashDialog();
                            releaseWorkflowByAction(i, _wfcurrentUserId, 2);
                            if (d && typeof d == "function") {
                                d()
                            }
                        }
                    }
                }, {
                    text: $.i18n("workflow.designer.page.button.cancel"), handler: function () {
                        _closeOrHideFlashDialog();
                        releaseWorkflowByAction(i, _wfcurrentUserId, 2)
                    }
                }]
            })
        }
    }, 10)
}

function adminWFCDiagram(k, f, b, g, j, h, l, e, i, d, a, c) {
    alert("已经被废弃，如果有调用请上报BUG")
}

function confirmCircleBackSubmit(g, e, b, f, d, c) {
    var a = $.confirm({
        msg: g, ok_fn: function () {
            if (typeof (e) != "undefined" && e != null) {
                e.close()
            }
            stepBackToTargetNodeCallBack(b, c.processId, c.caseId, c.currentActivityId, f, d, null, "", "", "1")
        }, cancel_fn: function () {
            a.close();
            try {
                releaseApplicationButtons()
            } catch (h) {
            }
        }
    })
}

function preSendOrHandleWorkflow(b) {
    var a = b.tWindow;
    if (b.vWindow) {
        a = b.vWindow
    }
    var c = new Object();
    c.appName = b.appName;
    c.processXml = b.processXml;
    c.processId = b.processId;
    c.caseId = b.caseId;
    c.currentActivityId = b.activityId;
    c.currentWorkitemId = b.workitemId;
    c.currentUserId = b.currentUserId;
    c.currentAccountId = b.currentAccountId;
    c.formData = b.formData;
    c.mastrid = b.formData;
    c.debugMode = false;
    c.processTemplateId = b.processTemplateId;
    c.currentWorkItemIsInSpecial = b.currentWorkItemIsInSpecial;
    c.matchRequestToken = matchRequestToken;
    c.useNowexpirationTime = b.useNowexpirationTime;
    c.NPS = b.NPS;
    c.canBugReport = b.canBugReport == "false" ? false : true;
    c.workitemId = b.workitemId;
    preDoWFNew(b.tWindow, c, null, a, b.fn, b.processId, b.workitemId, b.wfTraceType)
}

function validateCircleOperation(a, i, e, b, d, g, f, h, j) {
    j = typeof (j) == "undefined" ? "collaboration" : j;
    var c = wfAjax.validateCurrentSelectedNode(a.appName, a.caseId, i, "", a.currentActivityId, a.processXml, a.currentAccountId, j, a.processId);
    if (c[0] == "true") {
        if (e == "true") {
            if (c[2] == "true" || c[8] == "true") {
                confirmGo($.i18n("workflow.special.circleback.alert7.js"), f, g);
                return
            } else {
                if (d.indexOf("1") == -1) {
                    confirmCircleBackSubmit($.i18n("workflow.special.circleback.alert8.js"), g, b, i, "1", a);
                    return
                }
            }
        } else {
            if (c[2] == "true" || c[8] == "true") {
                if (d.indexOf("0") == -1) {
                    confirmCircleBackSubmit($.i18n("workflow.special.circleback.alert12.js"), g, b, i, "0", a);
                    return
                }
            }
        }
    }
    if (c[14] == "true") {
        confirmGo($.i18n("workflow.special.circleback.alert15.js"), f, g);
        return
    }
    if (c[13] == "true") {
        confirmGo($.i18n("workflow.special.circleback.alert13.js"), f, g);
        return
    }
    if (c[12] == "true") {
        confirmGo($.i18n("workflow.special.circleback.alert4.js"), f, g);
        return
    } else {
        if (c[11] == "true") {
            confirmGo($.i18n("workflow.special.circleback.alert11.js"), f, g);
            return
        } else {
            if (c[3] == "true") {
                confirmGo($.i18n("workflow.special.circleback.alert1.js"), f, g);
                return
            } else {
                if (c[4] == "true") {
                    confirmGo($.i18n("workflow.special.circleback.alert2.js"), f, g);
                    return
                } else {
                    if (c[17] == "true") {
                        confirmGo($.i18n("workflow.special.circleback.alert18.js"), f, g);
                        return
                    } else {
                        if (c[15] == "true") {
                            confirmGo($.i18n("workflow.special.circleback.alert16.js"), f, g);
                            return
                        } else {
                            if (c[16] == "true") {
                                confirmGo($.i18n("workflow.special.circleback.alert17.js"), f, g);
                                return
                            } else {
                                if (c[5] == "true") {
                                    confirmGo($.i18n("workflow.special.circleback.alert3.js"), f, g);
                                    return
                                } else {
                                    if (c[6] == "true") {
                                        if (c[9] == "true") {
                                            confirmGo($.i18n("workflow.special.circleback.alert4.js"), f, g)
                                        } else {
                                            confirmGo($.i18n("workflow.special.circleback.alert5.js"), f, g)
                                        }
                                        return
                                    } else {
                                        if (c[7] == "true") {
                                            confirmGo($.i18n("workflow.special.circleback.alert6.js"), f, g);
                                            return
                                        } else {
                                            if (typeof (g) != "undefined" && g != null) {
                                                g.close()
                                            }
                                            stepBackToTargetNodeCallBack(b, a.processId, a.caseId, a.currentActivityId, i, d, null, "", h, "1")
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

function confirmGo(d, c, b) {
    var a = $.confirm({
        msg: d, ok_fn: function () {
            a.close();
            if (typeof (b) != "undefined" && b != null) {
                b.close()
            }
            c()
        }, cancel_fn: function () {
            a.close();
            try {
                releaseApplicationButtons()
            } catch (f) {
            }
        }
    })
}

function $DialogBugReport(a, f, c, k) {
    var h = a.appName;
    var j = a.processId;
    var b = a.workitemId;
    f = !f ? "5" : f;
    var d = c || $.i18n("workflow.wapi.exception.msg002");
    var e = "";
    if (a.canBugReport && f != "3") {
        e = '<a href="#" onclick="reportProblem(\'' + j + "','" + b + "','" + h + "','" + f + "')\">" + $.i18n("workflow.bug.encounter.problems.js") + "</a>"
    }
    if (h == undefined || h == "office") {
        e = ""
    }
    var i = '<div class="dialog_main_content_html " style="width:350px;height:120px;overflow:auto;border:0px;">  <table width="100%" class="margin_t_20" style="font-size:12px;">     <tbody>       <tr>         <td valign="top" width="24" class="padding_l_20"><span class="msgbox_img_2"></span></td>         <td class="msgbox_content padding_l_10" style="padding-right:15px;">' + d + "</td>       </tr>     </tbody>  </table></div>";
    var g = $.dialog({
        html: i,
        bottomHTML: e,
        width: 350,
        height: 120,
        title: $.i18n("workflow.bug.alert.js"),
        targetWindow: getCtpTop(),
        buttons: [{
            text: $.i18n("common.button.close.label"), handler: function () {
                g.close();
                if (k) {
                    k()
                }
            }
        }],
        closeParam: {
            show: true, handler: function () {
                if (k) {
                    k()
                }
            }
        }
    })
}

function submitWorkflowContinue(H, w, T, O, F, v, m, y, n) {
    var D = H.pop;
    var S = H.token;
    var V = H.canSubmit;
    var R = H.problemType;
    var f = H.circleNodes;
    var p = H.isInSpecialStepBackStatus;
    var M = H.toReGo;
    var g = H.dynamicFormMasterIds;
    var u = T.appName;
    var c = T.processId;
    var U = T.NPS;
    if (!c) {
        c = T.processTemplateId
    }
    if (S && S == "WORKFLOW") {
    } else {
        $DialogBugReport(T, R, "", function () {
            try {
                releaseApplicationButtons()
            } catch (W) {
            }
        });
        return
    }
    if (V == "false") {
        var B = H.cannotSubmitMsg;
        $DialogBugReport(T, R, B, function () {
            try {
                releaseApplicationButtons()
            } catch (W) {
            }
        });
        return
    }
    var r = F.document;
    var K = $("#workflow_last_input", r)[0];
    if (K) {
        K.value = H.last
    }
    var E = $("#workflow_thisNodelast_input", r)[0];
    if (E) {
        E.value = H.currentNodeLast
    }
    var i = $("#toReGo", r)[0];
    if (i) {
        i.value = M
    }
    var A = $("#dynamicFormMasterIds", r)[0];
    if (A && g) {
        A.value = g
    }
    var G = H.oneSubProcessJson;
    if (G) {
        $("#workflow_newflow_input", F.document)[0].value = G
    }
    var b = H.invalidateActivityMap || {};
    var x = $.parseJSON(H.humenNodeMatchAlertMsg);
    var z = true;
    var I = "";
    var j = "";
    $(H.allSelectNodes).each(function (W, Y) {
        var Z = b[Y];
        var X = (Z != null && Z.trim() != "") ? true : false;
        if (X) {
            z = false;
            I += (I != null && I.trim() == "") ? Z : "、" + Z
        }
        if (x) {
            j = x[Y];
            var e = (j != null && j.trim() != "") ? true : false;
            if (e) {
                z = false;
                return false
            }
        }
    });
    if (!z) {
        var N = j || $.i18n("workflow.invalidateActivity.label", I);

        function l() {
            if (m != "" && y != null && y != "-1" && y != "0") {
                releaseWorkflowByAction(m, _wfcurrentUserId, 14)
            }
            try {
                releaseApplicationButtons()
            } catch (W) {
            }
        }

        $DialogBugReport(T, R, N, l);
        return
    }
    var h = function () {
        if (D == true) {
            var ad = H.hasSubProcess;
            var W = "";
            if (ad) {
                W = $.i18n("workflow.commonpage.branchpeoplenewflow.select")
            } else {
                W = $.i18n("workflow.commonpage.branchpeoplenewflow.select1")
            }
            var Z = "";
            if (T.canBugReport && R != "3") {
                Z = '<a href="#" onclick="reportProblem(\'' + c + "','" + y + "','" + u + "','" + R + "')\">" + $.i18n("workflow.bug.encounter.problems.js") + "</a>"
            }
            if (u == undefined || u == "office") {
                Z = ""
            }
            var ac = $.dialog({
                id: "workflow_dialog_showWorkFlowMatchResultPage_Id",
                url: _wfctxPath + "/workflow/designer.do?method=showWorkFlowMatchResultPage&appName=" + u,
                width: 740,
                height: 400,
                title: W,
                isFromModle: true,
                bottomHTML: Z,
                targetWindow: getCtpTop(),
                closeParam: {
                    show: true, handler: function () {
                        releaseWorkflowByAction(m, _wfcurrentUserId, 14);
                        removeWorkflowMatchResultCache();
                        try {
                            releaseApplicationButtons()
                        } catch (af) {
                        }
                    }
                },
                transParams: {context: T, cpMatchResult: H, isNeedCheckLevelScope: true},
                notCopyReturnValue: true,
                buttons: [{
                    text: $.i18n("common.button.ok.label"), isEmphasize: true, handler: function () {
                        var ag = $("#workflow_newflow_input", F.document)[0];
                        if (!ag) {
                            showFlashAlert('Error : no hidden input <input type="hidden" name="workflow_newflow_input" id="workflow_newflow_input">  in the page!');
                            if (m != "" && y != null && y != "-1" && y != "0") {
                                releaseWorkflowByAction(m, _wfcurrentUserId, 14)
                            }
                            try {
                                releaseApplicationButtons()
                            } catch (ai) {
                            }
                            return false
                        }
                        var af = $("#workflow_node_peoples_input", F.document)[0];
                        if (!af) {
                            showFlashAlert('Error : no hidden input <input type="hidden" name="workflow_node_peoples_input" id="workflow_node_peoples_input"> in the page!');
                            if (m != "" && y != null && y != "-1" && y != "0") {
                                releaseWorkflowByAction(m, _wfcurrentUserId, 14)
                            }
                            try {
                                releaseApplicationButtons()
                            } catch (ai) {
                            }
                            return false
                        }
                        var ah = $("#workflow_node_condition_input", F.document)[0];
                        if (!ah) {
                            showFlashAlert('Error:no hidden input <input type="hidden" name="workflow_node_condition_input" id="workflow_node_condition_input"> in the page!');
                            if (m != "" && y != null && y != "-1" && y != "0") {
                                releaseWorkflowByAction(m, _wfcurrentUserId, 14)
                            }
                            try {
                                releaseApplicationButtons()
                            } catch (ai) {
                            }
                            return false
                        }
                        setTimeout(function () {
                            var ak = ac.getReturnValue({innerButtonId: "ok"});
                            if (ak) {
                                if (ak[0] == "") {
                                    ak[0] = '{"matchRequestToken":"' + matchRequestToken + '"}'
                                } else {
                                    ak[0] = '{"matchRequestToken":"' + matchRequestToken + '",' + ak[0].substring(1)
                                }
                                $("#workflow_node_condition_input", F.document)[0].value = ak[0];
                                $("#workflow_node_peoples_input", F.document)[0].value = ak[1];
                                $("#workflow_newflow_input", F.document)[0].value = ak[2];
                                if ($("#workflow_last_input", F.document)[0]) {
                                    $("#workflow_last_input", F.document)[0].value = ak[3]
                                }
                                ac.close();
                                var aj = T.caseId;
                                if (typeof v == "function") {
                                    v()
                                } else {
                                    if ($.content.callback.workflowNew) {
                                        $.content.callback.workflowNew()
                                    } else {
                                        if ($.content.callback.workflowFinish) {
                                            $.content.callback.workflowFinish()
                                        } else {
                                            showFlashAlert("Error : cannot find submit function workflowNew()!");
                                            if (m != "" && y != null && y != "-1" && y != "0") {
                                                releaseWorkflowByAction(m, _wfcurrentUserId, 14)
                                            }
                                            try {
                                                releaseApplicationButtons()
                                            } catch (al) {
                                            }
                                            return
                                        }
                                    }
                                }
                            } else {
                                if (m != "" && y != null && y != "-1" && y != "0") {
                                    releaseWorkflowByAction(m, _wfcurrentUserId, 14)
                                }
                                try {
                                    releaseApplicationButtons()
                                } catch (al) {
                                }
                                return false
                            }
                        }, 50)
                    }
                }, {
                    text: $.i18n("common.button.cancel.label"), handler: function () {
                        try {
                            var ag;
                            if ($.browser.mozilla) {
                                ag = document.getElementById("zwIframe").contentWindow
                            } else {
                                ag = document.zwIframe
                            }
                            if (ag && typeof ag.deleteContentById == "function") {
                                ag.deleteContentById()
                            }
                            ag = null
                        } catch (af) {
                        }
                        $("#workflow_newflow_input", F.document)[0].value = "";
                        $("#workflow_node_peoples_input", F.document)[0].value = "";
                        $("#workflow_node_condition_input", F.document)[0].value = "";
                        if (m != "" && y != null && y != "-1" && y != "0") {
                            releaseWorkflowByAction(m, _wfcurrentUserId, 14)
                        }
                        removeWorkflowMatchResultCache();
                        try {
                            releaseApplicationButtons()
                        } catch (af) {
                        }
                        ac.close()
                    }
                }]
            })
        } else {
            var Y = $("#workflow_node_condition_input", F.document)[0];
            if (!Y) {
                showFlashAlert('Error : cannot find hidden input <input type="hidden" name="workflow_node_condition_input" id="workflow_node_condition_input"> in the page');
                if (m != "" && y != null && y != "-1" && y != "0") {
                    releaseWorkflowByAction(m, _wfcurrentUserId, 14)
                }
                try {
                    releaseApplicationButtons()
                } catch (ab) {
                }
                return false
            }
            var aa = "";
            $(H.allSelectNodes).each(function (e, af) {
                if (e == 0) {
                    aa += '{"condition":[';
                    aa += '{"nodeId":"' + af + '",';
                    aa += '"isDelete":"false"}'
                } else {
                    aa += ',{"nodeId":"' + af + '",';
                    aa += '"isDelete":"false"}'
                }
            });
            if (H.allNotSelectNodes && H.allNotSelectNodes.length > 0) {
                var ae = H.allNotSelectNodes.length - 1;
                $(H.allNotSelectNodes).each(function (e, af) {
                    aa += ',{"nodeId":"' + af + '",';
                    aa += '"isDelete":"true"}'
                })
            }
            if (aa != "") {
                aa += "]}"
            }
            if (aa == "") {
                aa = '{"matchRequestToken":"' + matchRequestToken + '"}'
            } else {
                aa = '{"matchRequestToken":"' + matchRequestToken + '",' + aa.substring(1)
            }
            $("#workflow_node_condition_input", F.document)[0].value = aa;
            var X = T.caseId;
            if (typeof v == "function") {
                v()
            } else {
                if ($.content.callback.workflowNew) {
                    $.content.callback.workflowNew()
                } else {
                    if ($.content.callback.workflowFinish) {
                        $.content.callback.workflowFinish()
                    } else {
                        showFlashAlert("Error : cannot find submit function workflowNew()!");
                        if (m != "" && y != null && y != "-1" && y != "0") {
                            releaseWorkflowByAction(m, _wfcurrentUserId, 14)
                        }
                        try {
                            releaseApplicationButtons()
                        } catch (ab) {
                        }
                        return
                    }
                }
            }
        }
    };
    var k = f != null && typeof (f) != "undefined" && f.length > 0;
    if (k) {
        var J = T.currentWorkItemIsInSpecial;
        var d = (J == null || typeof (J) == "undefined" || J == "") ? false : J;
        if (p == "true" && !d) {
            $.alert($.i18n("workflow.wapi.presend.alert.js"));
            releaseWorkflowByAction(m, _wfcurrentUserId, 14);
            try {
                releaseApplicationButtons()
            } catch (P) {
            }
            return
        }
        if (f.length == 1 && f[0].submitStyle != "0,1") {
            var q = f[0];
            var Q = q.nodeId;
            var t = q.submitStyle;
            var a = validateCircleOperation(T, Q, p, y, t, null, h, 1, U);
            return
        } else {
            var s = (n == 1) ? ' checked="checked" ' : "";
            var C = (n == 1 || n == 2) ? ' disabled="true" ' : "";
            var o = "<span >" + $.i18n("workflow.trace.msg") + "</span>";
            if (u == "edoc") {
                o = "<span >" + $.i18n("workflow.trace.monitormsg") + "</span>"
            }
            var L = $.dialog({
                id: "workflow_dialog_showCircleBackSelectDialog_Id",
                url: _wfctxPath + "/workflow/designer.do?method=showCircleBackSelectDialog",
                width: 740,
                height: 400,
                title: $.i18n("workflow.commonpage.circleback.select.js"),
                isFromModle: true,
                bottomHTML: o,
                targetWindow: getCtpTop(),
                closeParam: {
                    show: true, handler: function () {
                        releaseWorkflowByAction(m, _wfcurrentUserId, 14);
                        try {
                            releaseApplicationButtons()
                        } catch (W) {
                        }
                    }
                },
                transParams: {circleNodes: f, contextParam: T, isInSpecialStepBackStatus: p},
                notCopyReturnValue: true,
                buttons: [{
                    text: $.i18n("common.button.ok.label"), isEmphasize: true, id: "ok", handler: function () {
                        var X = L.getReturnValue();
                        var Z = X[0];
                        var W = X[1];
                        var Y = X[2];
                        var e = validateCircleOperation(T, Z, p, y, W, L, h, Y, U);
                        return
                    }
                }, {
                    text: $.i18n("common.button.cancel.label"), handler: function () {
                        try {
                            var X;
                            if ($.browser.mozilla) {
                                X = document.getElementById("zwIframe").contentWindow
                            } else {
                                X = document.zwIframe
                            }
                            if (X && typeof X.deleteContentById == "function") {
                                X.deleteContentById()
                            }
                            X = null
                        } catch (W) {
                        }
                        $("#workflow_newflow_input", F.document)[0].value = "";
                        $("#workflow_node_peoples_input", F.document)[0].value = "";
                        $("#workflow_node_condition_input", F.document)[0].value = "";
                        L.close();
                        if (m != "" && y != null && y != "-1" && y != "0") {
                            releaseWorkflowByAction(m, _wfcurrentUserId, 14)
                        }
                        try {
                            releaseApplicationButtons()
                        } catch (W) {
                        }
                    }
                }]
            })
        }
    }
    if (!k) {
        h()
    }
}

function preDoWFNew(m, d, f, n, l, c, e, o) {
    d.isValidate = "true";
    var h = new Object();
    if (f) {
        h = f
    } else {
        h = new Object();
        var i = new Array();
        var k = new Array();
        var b = new Array();
        h.allNotSelectNodes = i;
        h.allSelectNodes = k;
        h.allSelectInformNodes = b
    }
    h.pop = false;
    h.token = "";
    h.last = "false";
    h.alreadyChecked = "false";
    var j = wfAjax.transBeforeInvokeWorkFlow(d, h) || {};
    var g = j.submitConfirmMsg;
    if (g && g != "") {
        var a = $.confirm({
            msg: g, ok_fn: function () {
                submitWorkflowContinue(j, m, d, f, n, l, c, e, o)
            }, cancel_fn: function () {
                try {
                    releaseApplicationButtons()
                } catch (p) {
                }
            }
        })
    } else {
        submitWorkflowContinue(j, m, d, f, n, l, c, e, o)
    }
}

function getProcessChangeMessage() {
    return $("#processChangeMessage").val()
}

function setProcessChangeMessage(a) {
    $("#processChangeMessage").val(a)
}

function selectPeople(u, h, v, y, g, c, s) {
    var f = "", e = "";
    if (y) {
        var q = y.userType, w = y.userId, l = y.userName;
        var k = y.userExcludeChildDepartment;
        if (q != null && w != null) {
            var j = [], n = [];
            for (var r = 0, t = q.length; r < t; r++) {
                if (k[r]) {
                    j.push(q[r] + "|" + w[r] + "|1")
                } else {
                    j.push(q[r] + "|" + w[r])
                }
                n.push(l[r])
            }
            f = j.join(","), e = n.join(",")
        }
    } else {
        y = new Object()
    }
    var p = false;
    if (c) {
        p = true
    }
    var d = new WFAjax();
    var x = d.getAcountExcludeElements(u, h);
    var b = x[2];
    var m = x[3];
    var o = x[0] + ",Node|BlankNode";
    if (s !== "true") {
        o = o + ",Node|SenderDeptMember,Node|SenderSuperDeptDeptMember,Node|SenderManageDepDeptMember,Node|SenderLeaderDepDeptMember";
        o = o + ",Node|NodeUserDeptMember,Node|NodeUserSuperDeptDeptMember,Node|NodeUserManageDepDeptMember,Node|NodeUserLeaderDepDeptMember"
    } else {
        b = b.replace(",Role", "")
    }
    var a = {
        type: "selectPeople",
        text: $.i18n("workflow.insertPeople.urgerAlt"),
        showFlowTypeRadio: false,
        isConfirmExcludeSubDepartment: true,
        unallowedSelectEmptyGroup: true,
        minSize: 1,
        excludeElements: o,
        params: {text: e, value: f},
        targetWindow: getCtpTop(),
        panels: b,
        selectType: m,
        showFlowText: p,
        flowText: c,
        callback: function (D) {
            if (!D || !D.obj || D.obj.length == 0) {
                return
            }
            var I = [], E = [], C = [], H = [], J = [], G = [];
            var F = false, z = D.obj;
            for (var A = 0, B = z.length; A < B; A++) {
                I.push(z[A].id);
                E.push(z[A].name);
                C.push(z[A].type);
                H.push(z[A].excludeChildDepartment);
                J.push(z[A].accountId);
                G.push(z[A].accountShortname)
            }
            y.userId = I;
            y.userName = E;
            y.userType = C;
            y.userExcludeChildDepartment = H;
            y.accountId = J;
            y.accountShortname = G;
            if (g) {
                g(y)
            }
        }
    };
    if (b.indexOf("FormField") > -1 && typeof (v) != "undefined" && v != "" && v != "-1" && v != "null" && v != "undefined") {
        a.extParameters = v + ",33330030"
    }
    $.selectPeople(a)
}

function selectMember4OprationChangeProcess(q, o, a, c, l) {
    if (!q) {
        q = new Object()
    }
    var e = "";
    if (q) {
        var m = q.userType, n = q.userId;
        var h = q.userExcludeChildDepartment;
        if (m != null && n != null) {
            var k = [];
            for (var d = 0, g = m.length; d < g; d++) {
                if (h[d]) {
                    k.push(m[d] + "|" + n[d] + "|1")
                } else {
                    k.push(m[d] + "|" + n[d])
                }
            }
            e = k.join(",")
        }
    }
    var b = true;
    for (var d = 0; d < m.length; d++) {
        if (m[d] != "Account") {
            b = false;
            break
        }
    }
    var f = m.length == 1 && m[0] == "Department";
    if ((f || b) && l != "false") {
        selectPeopleOnlyDepartOrAccount(q, o, f, b)
    } else {
        var j = new WFAjax();
        allMembers = j.selectMember4OprationChangeProcess(e, a, c);
        var p = $.dialog({
            id: "workflow_dialog_showWorkFlowInsertPeopleSelectPage_Id",
            isFromModle: true,
            url: _ctxPath + "/workflow/designer.do?method=showWorkFlowInsertPeopleSelectPage",
            width: 400,
            height: 300,
            title: $.i18n("workflow.addnode.selectMember"),
            transParams: {allMembers: allMembers, canSelectMember: l},
            targetWindow: getCtpTop(),
            buttons: [{
                text: "$.i18n('common.button.ok.label')", isEmphasize: true, handler: function () {
                    var i = p.getReturnValue({innerButtonId: "ok"});
                    if (l == "false" && o) {
                        p.close();
                        o()
                    } else {
                        if (i && i != "{}" && o) {
                            p.close();
                            i.allMembers = $.toJSON(allMembers);
                            o(i)
                        }
                    }
                }
            }, {
                text: $.i18n("common.button.cancel.label"), handler: function () {
                    p.close()
                }
            }]
        })
    }
}

function selectPeopleOnlyDepartOrAccount(i, g, d, c) {
    if (i) {
        var e = i.userType, f = i.userId, h = i.accountId;
        var a = i.userExcludeChildDepartment;
        var b = {
            type: "selectPeople",
            text: $.i18n("workflow.insertPeople.urgerAlt"),
            showFlowTypeRadio: false,
            unallowedSelectEmptyGroup: true,
            minSize: 1,
            targetWindow: getCtpTop(),
            panels: "Department",
            selectType: "Member",
            showRecent: false,
            callback: function (k) {
                var j = selectPeopleResultFormat(k);
                if (g) {
                    g(j)
                }
            }
        };
        if (d) {
            b.departmentId = f[0];
            b.accountId = h[0];
            if (!a[0]) {
                b.showDepartmentsOfTree = f[0]
            } else {
                b.showDepartmentsNoChildrenOfTree = f[0]
            }
            b.onlyLoginAccount = true
        } else {
            if (c) {
                if (f[0] == "-1730833917365171641") {
                    b.allowSeachGroup = true
                } else {
                    b.accountId = f[0];
                    b.showAccountIds = f.join(",");
                    b.allowSeachGroup = false
                }
            }
        }
        $.selectPeople(b)
    }
}

function selectPeopleResultFormat(g) {
    var d = new Object();
    if (!g || !g.obj || g.obj.length == 0) {
        return d
    }
    var l = [], h = [], f = [], k = [], m = [], j = [];
    var e = false, a = g.obj;
    for (var b = 0, c = a.length; b < c; b++) {
        l.push(a[b].id);
        h.push(a[b].name);
        f.push(a[b].type);
        k.push(a[b].excludeChildDepartment);
        m.push(a[b].accountId);
        j.push(a[b].accountShortname)
    }
    d.userId = l;
    d.userName = h;
    d.userType = f;
    d.userExcludeChildDepartment = k;
    d.accountId = m;
    d.accountShortname = j;
    return d
}

function selectPeople4ChangeProcess(j, o, m, p, n, e, d, a, c) {
    var b = !d && p && p.addMember == "1";
    var k = p && typeof (p.userId) != "undefined" && p.userId != "";
    if (d || !p || !k) {
        selectPeople(j, o, m, p, n, e, d)
    } else {
        if (b) {
            selectMember4OprationChangeProcess(p, n, a, c)
        } else {
            var g = false;
            var l = new Array();
            if (p && p.userType) {
                l = p.userType
            }
            if (l != null) {
                for (var f = 0, h = l.length; f < h; f++) {
                    if (l[f] != "Member") {
                        g = true;
                        break
                    }
                }
            }
            if (g) {
                selectMember4OprationChangeProcess(p, n, a, c, "false")
            } else {
                n()
            }
        }
    }
}

function insertNode(k) {
    var c = k.workitemId;
    var o = k.processId;
    var j = k.nodeId;
    var d = k.performer;
    var t = k.caseId;
    var x = k.appName;
    var e = k.isForm;
    var w = k.accountId;
    var g = k.callback;
    var b = k.summaryId;
    var r = k.affairId;
    var y = k.isTemplete;
    var A = k.formId;
    var z = k.formRecordId;
    var i = k.useNowexpirationTime;
    var s = k.NPS;
    var q = k.SPK;
    var v = k.selectPeopleDialogLeftTitle;
    var p = k.changeNodeMessage;
    var u = k.isOperationDesignerModel;
    var n = true;
    if (k.needAddNodeDiagram) {
        n = k.needAddNodeDiagram == "true"
    }
    var a = true;
    if (k.needValidateOnBeforeAdd) {
        a = k.needValidateOnBeforeAdd == "true"
    }
    var m = k.canBugReport == "false" ? false : true;
    if (!u && a) {
        var h = onBeforeWorkflowOperationValidate(o, c, j, t, i, x, "insertNode");
        var f = "";
        if (h && !h.pass) {
            f = h.msg
        }
        if (f) {
            $.alert(f);
            return
        }
    }
    if (!y) {
        y = false
    }
    var l = function (B) {
        if (!p) {
            p = new Object()
        }
        p = $.extend(p, B);
        showInsertNodePageCallBack(c, o, j, d, t, x, e, w, g, b, r, y, i, s, q, p, u, v, n, A)
    };
    selectPeople4ChangeProcess(x, q, A, p, l, v, u, c, z)
}

function showInsertNodePageCallBack(c, j, h, d, p, u, e, r, f, b, n, v, g, o, l, k, s, q, i, w) {
    if (!i) {
        assignNodeOpe(c, j, h, d, p, u, e, "", r, f, b, n, k, 1);
        return
    }
    var a = h;
    if (addNodeTargetNodeId != "") {
        a = addNodeTargetNodeId
    }
    var m = {};
    var t = $.dialog({
        url: _ctxPath + "/workflow/designer.do?method=preAddNodeToDiagram&appName=" + u + "&isForm=" + e + "&accountId=" + r + "&processId=" + j + "&nodeId=" + a + "&caseId=" + p + "&isTemplete=" + v + "&NPS=" + o + "&SPK=" + l + "&isOperationDesignerModel=" + s + "&formAppId=" + w + "&formViewOperation=" + k.formViewOperation,
        transParams: {
            processId: j,
            nodeId: h,
            processXML: $("#process_xml").val(),
            dialogObj: m,
            changeNodeMessage: k,
            selectPeopleDialogLeftTitle: q
        },
        id: "workflow_dialog_insertNodePage_id",
        width: 685,
        height: 500,
        title: $.i18n("workflow.insertPeople.title"),
        notCopyReturnValue: true,
        buttons: [{
            text: $.i18n("common.button.ok.label"), isEmphasize: true, handler: function () {
                try {
                    var y = t.getReturnValue();
                    if (y != null && y.length > 0) {
                        var A = $.parseJSON(y);
                        if (!s) {
                            assignNodeOpe(c, j, h, d, p, u, e, "", r, f, b, n, A, 1)
                        } else {
                            var x = {changeNodeMessage: A};
                            if (typeof f == "function") {
                                f(x)
                            }
                        }
                        t.close()
                    } else {
                        return
                    }
                } catch (z) {
                    showFlashAlert(z.message)
                }
            }
        }, {
            text: $.i18n("common.button.cancel.label"), handler: function () {
                t.close()
            }
        }],
        targetWindow: getCtpTop()
    });
    m.dialog = t
}

function isInArr(a, c) {
    if (!a || !c) {
        return false
    }
    for (var b = 0; b < a.length; b++) {
        if (a[b] === c) {
            return true
        }
    }
    return false
}

function excludeFromChangeNodeMessage(l, j) {
    var g = [];
    var e = [];
    var a = [];
    var f = [];
    var h = [];
    var c = [];
    var k = [];
    var b = l.userId;
    for (var d = 0; d < b.length; d++) {
        if (isInArr(j, d)) {
            continue
        }
        g.push(l.accountId[d]);
        e.push(l.accountShortname[d]);
        a.push(l.node_process_mode[d]);
        f.push(l.userId[d]);
        h.push(l.userName[d]);
        c.push(l.userType[d]);
        k.push(l.userExcludeChildDepartment[d])
    }
    l.accountId = g;
    l.accountShortname = e;
    l.node_process_mode = a;
    l.userId = f;
    l.userName = h;
    l.userType = c;
    l.userExcludeChildDepartment = k;
    return l
}

function assignNode(a) {
    var c = a.workitemId;
    var n = a.processId;
    var l = a.nodeId;
    var d = a.performer;
    var v = a.caseId;
    var D = a.appName;
    var e = a.isForm;
    var E = a.defaultPolicyId;
    var A = a.accountId;
    var g = a.callback;
    var b = a.summaryId;
    var t = a.affairId;
    var G = a.formId;
    var F = a.formRecordId;
    var k = a.useNowexpirationTime;
    var s = a.SPK;
    var u = a.NPS;
    var o = a.changeNodeMessage;
    var z = a.isOperationDesignerModel;
    var y = a.selectPeopleDialogLeftTitle;
    var m = true;
    if (a.needAddNodeDiagram) {
        m = a.needAddNodeDiagram == "true"
    }
    if (!z && o && o.addMember == "0" && o.userId != "undefined" && o.userId != "") {
        var x = o.userType, H = o.userId;
        var r = o.userName;
        var q = o.userExcludeChildDepartment;
        var p = [];
        if (x != null && H != null) {
            for (var w = 0, B = x.length; w < B; w++) {
                if (q[w]) {
                    p.push(x[w] + "|" + H[w] + "|1")
                } else {
                    p.push(x[w] + "|" + H[w])
                }
            }
            selectValues = p.join(",")
        }
        if (p.length > 0) {
            var h = new WFAjax();
            for (var w = 0; w < p.length; w++) {
                if (p[w].indexOf("Member|") > -1) {
                    continue
                }
                var I = h.selectMember4OprationChangeProcess(p[w], c, F);
                if (!I || I.length <= 0) {
                    $.alert($.i18n("workflow.addnode.nodeNoMember", r[w]));
                    return
                }
            }
        }
    }
    if (!z) {
        var j = onBeforeWorkflowOperationValidate(n, c, l, v, k, D, "assignNode");
        var f = "";
        if (j && !j.pass) {
            f = j.msg
        }
        if (f) {
            $.alert(f);
            return
        }
    }
    var C = function (i) {
        if (!o) {
            o = new Object()
        }
        o = $.extend(o, i);
        showAssignNodePageCallBack(c, n, l, d, v, D, e, E, A, b, t, k, s, u, o, z, y, g, m, G)
    };
    selectPeople4ChangeProcess(D, s, G, o, C, y, z, c, F)
}

function showAssignNodePageCallBack(b, i, g, c, n, s, d, t, o, a, l, f, k, m, j, q, p, e, h, u) {
    ;
    if (!h) {
        assignNodeOpe(b, i, g, c, n, s, d, "", o, e, a, l, j, 3);
        return
    }
    var r = $.dialog({
        url: _ctxPath + "/workflow/designer.do?method=preAssignNode&appName=" + s + "&isForm=" + d + "&defaultPolicyId=" + encodeURIComponent(t) + "&accountId=" + o + "&nodeId=" + g + "&SPK=" + k + "&NPS=" + m + "&isOperationDesignerModel=" + q + "&formAppId=" + u + "&formViewOperation=" + j.formViewOperation,
        transParams: {
            processId: i,
            nodeId: g,
            processXML: $("#process_xml").val(),
            changeNodeMessage: j,
            selectPeopleDialogLeftTitle: p
        },
        id: "workflow_dialog_assignNodePage_id",
        width: 560,
        height: 280,
        title: $.i18n("workflow.assignNode.assign"),
        notCopyReturnValue: true,
        buttons: [{
            text: $.i18n("common.button.ok.label"), isEmphasize: true, handler: function () {
                try {
                    var w = r.getReturnValue();
                    if (w != null && w.length > 0) {
                        var y = $.parseJSON(w);
                        if (!q) {
                            assignNodeOpe(b, i, g, c, n, s, d, "", o, e, a, l, y, 3)
                        } else {
                            var v = {changeNodeMessage: y};
                            if (typeof e == "function") {
                                e(v)
                            }
                        }
                        r.close();
                        parent.document.getElementById("_dealSaveWait").click();
                    }
                } catch (x) {
                    showFlashAlert(x.message)
                }
            }
        }, {
            text: $.i18n("common.button.cancel.label"), handler: function () {
                r.close()
            }
        }],
        targetWindow: getCtpTop()
    })
}

var addNodeTargetNodeId = "";
var newGenerateOtherNodeIds = "";

function assignNodeOpe(c, n, l, d, s, w, f, y, u, i, b, q, z, t) {
    var r = $("#process_xml");
    var h = $("#process_info");
    var a = $("#readyObjectJSON");
    if (r.size() <= 0) {
        $.alert("请添加id=process_xml的隐藏域！");
        return
    }
    if (a.size() <= 0) {
        $.alert("请添加id=readyObjectJSON的隐藏域！");
        return
    }
    var v = r.val();
    var g = a.val();
    var m = "";
    var j = $("#process_message_data");
    if (j.size() > 0) {
        m = j.val()
    }
    z.summaryId = b;
    z.affairId = q;
    z.caseId = s;
    z.workitemId = c;
    z.appName = w;
    if (addNodeTargetNodeId == "") {
        addNodeTargetNodeId = l
    }
    var k = wfAjax.addNode(n, l, addNodeTargetNodeId, d, t, z, v, g, m, getProcessChangeMessage());
    if ("false" == k[2]) {
        $.alert(k[3]);
        return
    }
    try {
        $("#process_info").tokenInput("destroy")
    } catch (x) {
    }
    if (k && k[8]) {
        addNodeTargetNodeId = k[8]
    }
    if (k && k[9]) {
        if (newGenerateOtherNodeIds == "") {
            newGenerateOtherNodeIds = k[9]
        } else {
            newGenerateOtherNodeIds = newGenerateOtherNodeIds + "," + k[9]
        }
        $("#newGenerateOtherNodeIds").val(newGenerateOtherNodeIds)
    }
    var p = false;
    if (addNodeTargetNodeId != l) {
        $("#newGenerateNodeId").val(addNodeTargetNodeId);
        p = true
    }
    if (k && k[0]) {
        r.val(k[0])
    }
    if (k && k[1]) {
        a.val(k[1])
    }
    if (k && k[4] && j.size() > 0) {
        j.val(k[4]);
        j = null
    }
    if (k && k[5]) {
        setProcessChangeMessage(k[5])
    }
    r = null;
    a = null;
    var o = {
        type: 3,
        currentNodeId: addNodeTargetNodeId,
        currentWorkitemId: c,
        splitDisplay: p,
        names: z.userName,
        messageDataList: k[4],
        workflowNodeInfo: k[6]
    };
    if (typeof i == "function") {
        i(o)
    } else {
        if (typeof refreshWorkflow == "function") {
            refreshWorkflow(o)
        } else {
            $.alert("请添加一个名字为refreshWorkflow的函数，以刷新流程图页面，看到加签/减签效果！")
        }
    }
}

function informNode(u) {
    var b = u.workitemId;
    var k = u.processId;
    var j = u.nodeId;
    var c = u.performer;
    var o = u.caseId;
    var s = u.appName;
    var d = u.isForm;
    var t = u.defaultPolicyId;
    var r = u.accountId;
    var f = u.callback;
    var a = u.summaryId;
    var n = u.affairId;
    var w = u.formId;
    var i = u.useNowexpirationTime;
    var m = u.SPK;
    var v = u.formRecordId;
    var l = u.changeNodeMessage;
    var q = u.isOperationDesignerModel;
    var p = u.selectPeopleDialogLeftTitle;
    if (!q) {
        var h = onBeforeWorkflowOperationValidate(k, b, j, o, i, s, "infoNode");
        var e = "";
        if (h && !h.pass) {
            e = h.msg
        }
        if (e) {
            $.alert(e);
            return
        }
    }
    var g = function (A) {
        if (!l) {
            l = new Object()
        }
        l = $.extend(l, A);
        var B = new Array();
        for (var z = 0, x = l.userId.length; z < x; z++) {
            B.push("all")
        }
        l.flowType = "5";
        l.node_process_mode = B;
        l.policyId = t;
        l.policyName = $.i18n("permission.operation.Infom");
        if (d) {
            l.formOperationPolicy = "0"
        } else {
            l.formOperationPolicy = "1"
        }
        if ((!q || q == "false") && l && l.userId) {
            assignNodeOpe(b, k, j, c, o, s, d, "", r, f, a, n, l, 2)
        } else {
            l.showTitle = l.userName.join(",");
            var y = {changeNodeMessage: l};
            if (typeof f == "function") {
                f(y)
            }
        }
    };
    selectPeople4ChangeProcess(s, m, w, l, g, p, q, b, v)
}

function deleteNode(b, a, e, m, c, n, k, g, f, l, j, h) {
    j = j || "collaboration";
    var o = onBeforeWorkflowOperationValidate(a, b, e, c, l, "", "deleteNode");
    var d = "";
    if (o && !o.pass) {
        d = o.msg
    }
    if (d) {
        $.alert(d);
        return
    }
    if (addNodeTargetNodeId == "") {
        addNodeTargetNodeId = e
    }
    var i = $.dialog({
        id: "workflow_dialog_prePreDeleteNodeFromDiagram",
        isFromModle: true,
        url: _wfctxPath + "/workflow/designer.do?method=prePreDeleteNodeFromDiagram",
        transParams: {
            processId: a,
            nodeId: addNodeTargetNodeId,
            isProcessTemplate: f,
            templateCanDeleteNode: h,
            processXML: $("#process_xml").val()
        },
        width: 400,
        height: 280,
        title: $.i18n("workflow.deletePeople.title"),
        notCopyReturnValue: true,
        buttons: [{
            text: $.i18n("common.button.ok.label"), isEmphasize: true, handler: function () {
                try {
                    var r = i.getReturnValue();
                    if (r != null && r.length > 0) {
                        var s = $.parseJSON(r);
                        var q = s.idArray;
                        if (q.length <= 0) {
                            $.alert($.i18n("workflow.least.select.one"));
                            return
                        }
                        var t = $("#process_xml");
                        var p = $("#process_message_data");
                        var w = "";
                        if (p.size() > 0) {
                            w = p.val()
                        }
                        var u = t.val();
                        var y = wfAjax.deleteNode(a, addNodeTargetNodeId, m, q, u, w, getProcessChangeMessage(), k, g, newGenerateOtherNodeIds);
                        if (y && y.processXML) {
                            t.val(y.processXML);
                            if (p.size() > 0) {
                                p.val(y.messageDataList);
                                p = null
                            }
                        }
                        if (y && y.processChangeMessage) {
                            setProcessChangeMessage(y.processChangeMessage)
                        }
                        if (y.newGenerateOtherNodeIds == "") {
                            newGenerateOtherNodeIds = "";
                            addNodeTargetNodeId = ""
                        }
                        $("#newGenerateOtherNodeIds").val(y.newGenerateOtherNodeIds);
                        t = null;
                        var x = {
                            type: 4,
                            currentNodeId: addNodeTargetNodeId,
                            names: s.nameArray,
                            messageDataList: y.messageDataList
                        };
                        if (typeof n == "function") {
                            n(x)
                        } else {
                            if (typeof refreshWorkflow == "function") {
                                refreshWorkflow(x)
                            } else {
                                $.alert("请添加一个名字为refreshWorkflow的函数，以刷新流程图页面，看到加签/减签效果！")
                            }
                        }
                    }
                } catch (v) {
                    showFlashAlert(v.message)
                }
                i.close()
            }
        }, {
            text: $.i18n("common.button.cancel.label"), handler: function () {
                i.close()
            }
        }],
        targetWindow: getCtpTop()
    })
}

function getUUID() {
    var a = new Date().getTime() + "" + (UUID_seqence++);
    if (UUID_seqence >= 100000) {
        UUID_seqence = 0
    }
    return a
}

var tempSelectPeopleElements = null;
var myflowtype = "";

function createProcessXml(a) {
    var o = a.appName;
    var n = a.tWindow;
    var m = a.vWindow;
    var c = a.currentUserId;
    var v = a.currentUserName;
    var e = a.currentUserAccountName;
    var p = a.defaultPolicyId;
    var g = a.flowPermAccountId;
    var q = a.defaultPolicyName;
    var j = a.isShowMultiRadio;
    var b = a.model;
    var u = a.selectValue;
    var d = a.myflowtype1;
    var i = a.SPK;
    var k = a.NPS;
    var f = n;
    if (m) {
        f = m
    }
    b = b == undefined ? "" : b;
    var t = wfAjax.getAcountExcludeElements(o, i);
    var h = t[2];
    var r = t[3];
    var l = parseElements(t[0]);
    if (myflowtype == "") {
        myflowtype = d
    }
    j = j == undefined ? true : j;
    if (o == "collaboration" || o == "edoc") {
        tempSelectPeopleElements = null
    }
    var s = $.selectPeople({
        type: "selectPeople",
        panels: h,
        selectType: r,
        text: $.i18n("workflow.insertPeople.urgerAlt"),
        showFlowTypeRadio: true,
        hiddenColAssignRadio: true,
        hiddenMultipleRadio: !j,
        flowtype: myflowtype,
        mode: b,
        targetWindow: n,
        isConfirmExcludeSubDepartment: true,
        unallowedSelectEmptyGroup: true,
        excludeElements: l,
        params: {value: u == undefined ? "" : u},
        elements: tempSelectPeopleElements,
        callback: function (w) {
            try {
                if (w.obj && w.obj[0]) {
                    tempSelectPeopleElements = w.obj[0];
                    if (w.obj[1] == 0) {
                        myflowtype = "sequence"
                    } else {
                        myflowtype = "concurrent"
                    }
                }
                var x = $("#process_info_selectvalue", f.document);
                var z = $("#process_info_selectvalue", n.document);
                x.val(w.value);
                z.val(w.value);
                try {
                    if (window.distroy_token == false) {
                        dealSPData2Token("process_info", w)
                    }
                } catch (y) {
                }
            } catch (y) {
            }
            createProcessXmlCallBack(n, w, o, f, c, v, e, p, g, q, i, k)
        }
    })
}

function createProcessXmlForward(j, l, k, c, g, f, m, n, h) {
    var o = "";
    try {
        var d = $("#process_info_selectvalue", k.document);
        var b = $("#process_info_selectvalue", l.document);
        if (d[0]) {
            o = d.val()
        } else {
            o = b.val()
        }
    } catch (i) {
    }
    var a = {};
    a.appName = j;
    a.tWindow = l;
    a.vWindow = k;
    a.currentUserId = "-1";
    a.currentUserName = "";
    a.currentUserAccountName = "";
    a.defaultPolicyId = f;
    a.flowPermAccountId = "-1";
    a.defaultPolicyName = m;
    a.isShowMultiRadio = c;
    a.model = g;
    a.selectValue = o;
    a.myflowtype = "concurrent";
    a.SPK = n;
    a.NPS = h;
    createProcessXml(a)
}

function createProcessXmlCallBack(L, S, K, V, Q, O, U, ad, P, R, G, al, M) {
    if (S && S.obj && S.obj.length > 0 && S.obj[0].length > 0) {
        var T = [], H = S.obj[2], Y = ad, y = R, aj = "0", ac = S.obj[1], q = "", I = "", n = "", b = "", D = "",
            p = "", a = "";
        H = H == undefined ? "" : H;
        var u = [], w = S.obj[0];
        var C = 0;
        var A = 0;
        var l = 0;
        var r = true;
        if (ac == 0 || u.length == 1) {
            r = false
        }
        if (r) {
            A = (w.length - 1) / 2;
            l = 4
        } else {
            A = 0;
            l = w.length + 1
        }
        var j = A;
        T.push("<ps>");
        T.push('<p s="' + H + '" u="" y="0" x="0" i="" n="" d="" t="">');
        T.push('<n m="0" y="' + A + '" x="' + C + '" t="8" d="" n="' + O + '" i="start">');
        T.push('<a a="" b="" c="1" d="" e="" f="' + Q + '" g="user" i="false" j="false" k=""/>');
        T.push('<s c="1" r="" e="" f="" g="0" j="multiple" k="" l="" m="false" s="success" d="" t="" n="" i="' + Y + '"/>');
        T.push("</n>");
        T.push('<n m="0" y="' + j + '" x="' + l + '" t="4" d="" n="end" i="end">');
        T.push('<a a="" b="" c="1" d="" e="" f="" g="" i="false" j="false" k=""/>');
        T.push('<s c="1" r="" e="" f="" g="0" j="multiple" k="" l="" m="false" s="success" d="" t="" n="' + y + '" i="' + Y + '"/>');
        T.push("</n>");
        for (var af = 0, v = w.length; af < v; af++) {
            var o = w[af];
            var ae = getUUID(), q = o.id, I = o.name, n = o.type, b = o.excludeChildDepartment, D = o.accountId,
                g = o.accountShortname || "";
            u.push(ae);
            var ag = "all";
            if (n == "Member") {
                n = "user";
                ag = "single"
            }
            b = b == undefined ? false : b;
            var z = 1;
            if (n == "Post" && D == "-1730833917365171641") {
                z = 2
            }
            var X = y;
            var ab = Y;
            var N = ag;
            if (typeof (M) != "undefined" && M[af]) {
                var m = M[af];
                if (m) {
                    if (m.nodePolicyName && m.nodePolicyId) {
                        X = m.nodePolicyName;
                        ab = m.nodePolicyId
                    }
                    if (m.processMode) {
                        N = m.processMode
                    }
                }
            }
            var am = af + 1;
            var ak = 0;
            if (r) {
                am = 2;
                ak = af
            }
            T.push('<n a="1"  y="' + ak + '" x="' + am + '"  b="normal" c="false" l="1000" e="0" t="6" d="" n="' + escapeSpecialChar(I) + '" i="' + ae + '">');
            T.push('<a a="' + escapeSpecialChar(g) + '" b="' + D + '" c="1" d="' + escapeSpecialChar(I) + '" e="" f="' + q + '" h="' + b + '" g="' + n + '" i="false" j="false" k="roleadmin"/>');
            T.push('<s c="' + z + '" r="" e="" f="" g="0" j="' + N + '" k="" l="" m="false" s="success" d="" t="" n="' + X + '" i="' + ab + '"/>');
            T.push("</n>");
            if (af < 12) {
                if (af > 0) {
                    a += $.i18n("workflow.createProcessXml.common_separator_label")
                }
                var J = I;
                if (g != null && g != "null" && g != "undefined" && g != "") {
                    J = J + "(" + g + ")"
                }
                J += "(" + y + ")";
                a += J
            }
        }
        if (ac == 0 || u.length == 1) {
            T.push('<l a="" b="" c="" e="" m="" h="3" o="0" j="' + u[0] + '" k="start" t="11" d="" n="" i="' + getUUID() + '"/>');
            T.push('<l a="" b="" c="" e="" m="" h="3" o="0" j="end" k="' + u[u.length - 1] + '" t="11" d="" n="" i="' + getUUID() + '"/>');
            for (var af = 0; af < u.length - 1; af++) {
                var ah = u[af];
                var W = u[af + 1];
                T.push('<l a="" c="" b="" e="" m="" h="3" o="0" j="' + W + '" k="' + ah + '" t="11" d="" n="" i="' + getUUID() + '"/>')
            }
        } else {
            var s = getUUID();
            var aa = getUUID();
            T.push('<n o="" p="true" y="' + A + '" x="1" t="2" d="" n="split" i="' + s + '">');
            T.push('<s c="1" r="" e="" f="" g="0" j="' + ag + '" k="" l="" m="false" s="success" d="" t="" n="' + y + '" i="' + Y + '"/>');
            T.push("</n>");
            T.push('<n o="" p="false" y="' + A + '" x="3" t="2" d="" n="join" i="' + aa + '">');
            T.push('<s c="1" r="" e="" f="" g="0" j="' + ag + '" k="" l="" m="false" s="success" d="" t="" n="' + y + '" i="' + Y + '"/>');
            T.push("</n>");
            T.push('<l a="" b="" c="" e="" m="" h="3" o="0" j="' + s + '" k="start" t="11" d="" n="" i="' + getUUID() + '"/>');
            T.push('<l a="" b="" c="" e="" m="" h="3" o="0" j="end" k="' + aa + '" t="11" d="" n="" i="' + getUUID() + '"/>');
            for (var af = u.length - 1; af >= 0; af--) {
                var x = u[af];
                T.push('<l a="" b="" c="" e="" m="" h="3" o="0" j="' + x + '" k="' + s + '" t="11" d="" n="" i="' + getUUID() + '"/>');
                T.push('<l a="" b="" c="" e="" m="" h="3" o="0" j="' + aa + '" k="' + x + '" t="11" d="" n="" i="' + getUUID() + '"/>')
            }
        }
        T.push("</p></ps>");
        var k = T.join("");
        var h = $("#process_xml", V.document);
        if (h.size() <= 0) {
            $.alert("请添加id=process_xml的输入域！")
        }
        h.val(k);
        var d = $("#process_desc_by", V.document);
        if (d.size() <= 0) {
            $.alert("请添加id=process_desc_by的输入域！")
        }
        d.val("xml");
        var c = $("#process_info", V.document);
        if (c.size() <= 0) {
            $.alert("请添加id=process_info的输入域！")
        }
        c.val(a);
        h = d = c = null;
        try {
            var E = $("#process_desc_by", V.document)[0];
            var B = $("#process_xml", V.document)[0];
            var Z = $("#process_info", V.document)[0];
            E.value = "xml";
            B.value = k;
            Z.value = a
        } catch (ai) {
        }
        if (ac == 2) {
            var F = {
                targetWin: L,
                valueWin: V,
                appName: K,
                currentUserId: Q,
                currentUserName: O,
                currentAccountName: U,
                defaultPolicyName: R,
                defaultPolicyId: ad,
                flowPermAccountId: P,
                processId: "-1",
                scene: 1,
                SPK: G,
                NPS: al
            };
            showDiagram(F)
        }
    }
}

function showFlashAlert(a) {
    try {
        var c = $.alert(a)
    } catch (b) {
        c(a)
    }
}

function stepBackToTargetNode(o) {
    var s = o.tWindow;
    var q = o.vWindow;
    var a = o.workitemId;
    var k = o.processId;
    var n = o.caseId;
    var p = o.activityId;
    var v = o.stepBackToTargetNodeCallBackFn;
    var b = o.showReGo;
    var d = o.showToMe;
    var f = o.permissionAccountId;
    var t = o.appName;
    var j = o.SPK;
    var l = o.NPS;
    var r = o.isTemplate;
    var g = o.wfTraceType;
    var m = o.wfTraceType;
    var w = o.stepBackToNodeId;
    var i = onBeforeWorkflowOperationValidate(k, a, p, n, "", "", "specialStepBack");
    var c = "";
    if (i && !i.pass) {
        c = i.msg
    }
    if (c) {
        $.alert(c);
        try {
            releaseApplicationButtons()
        } catch (u) {
        }
        return false
    }
    d = d == undefined ? true : d;
    b = b == undefined ? true : b;
    f = f == undefined ? "" : f;
    var h = s;
    if (q) {
        h = q
    }
    _closeFlashDialogBeforeOpen(s);
    setTimeout(function () {
        var B = $(s).width();
        var C = $(s).height();
        if (B <= 0) {
            B = $(document.body).width();
            C = $(document.body).height()
        }
        C = C - 50;
        try {
            var z = "<span >" + $.i18n("workflow.trace.msg") + "</span>";
            if (t == "edoc") {
                z = "<span >" + $.i18n("workflow.trace.monitormsg") + "</span>"
            }
            z = typeof (m) != "undefined" && m ? z : "";
            var E = B - 300;
            var A = C - 70;
            var y = B - 270;
            var x = C - 110;
            if (w) {
                E = 750;
                A = 120;
                y = 750;
                x = 120
            }
            workfowFlashDialog = $.dialog({
                id: "workflow_dialog_workflowDesigner_Id",
                isHide: true,
                bottomHTML: z,
                url: _wfctxPath + "/workflow/designer.do?method=showDiagram&isDebugger=false&scene=6&isModalDialog=true&processId=" + k + "&caseId=" + n + "&currentNodeId=" + p + "&showToMe=" + d + "&showReGo=" + b + "&permissionAccountId=" + f + "&appName=" + t + "&isTemplate=" + r + "&NPS=" + l + "&SPK=" + j + "&stepBackToNodeId=" + w,
                width: E,
                height: A,
                title: $.i18n("workflow.special.stepback.title"),
                transParams: {dwidths: y, dheights: x, returnValueWindow: h},
                minParam: {show: false},
                maxParam: {show: false},
                closeParam: {
                    show: true, handler: function () {
                        releaseWorkflowByAction(k, _wfcurrentUserId, 10);
                        try {
                            releaseApplicationButtons()
                        } catch (F) {
                        }
                    }
                },
                targetWindow: s,
                notCopyReturnValue: true,
                buttons: [{
                    text: $.i18n("workflow.designer.page.button.ok"),
                    isEmphasize: true,
                    id: "workflowDesigner_ok",
                    handler: function () {
                        var G = workfowFlashDialog.getReturnValue({innerButtonId: "stepback_ok"});
                        var F = G[0];
                        if (F) {
                            var e = wfAjax.canSpecialStepBack(a);
                            if (e[0] == "false") {
                                showFlashAlert(e[1])
                            } else {
                                v(a, k, n, p, G[1], G[2], workfowFlashDialog, G[3], G[4]);
                                releaseWorkflowByAction(k, _wfcurrentUserId, 10)
                            }
                        } else {
                            showFlashAlert($.i18n("workflow.special.stepback.label9"))
                        }
                    }
                }, {
                    text: $.i18n("workflow.designer.page.button.cancel"),
                    id: "workflow_dialog_workflowDesigner_cancelBtn",
                    handler: function () {
                        _closeOrHideFlashDialog();
                        releaseWorkflowByAction(k, _wfcurrentUserId, 10);
                        try {
                            releaseApplicationButtons()
                        } catch (F) {
                        }
                        return false
                    }
                }]
            })
        } catch (D) {
            alert(D)
        }
    }, 10)
}

function multistageSign(F) {
    var E = F.appName;
    var d = F.summaryId;
    var w = F.affairId;
    var m = F.affairMemberId;
    var e = F.workitemId;
    var r = F.processId;
    var o = F.nodeId;
    var j = F.currentUserId;
    var J = F.currentUserName;
    var f = F.currentLoginAccountId;
    var p = F.flowPermAccountId;
    var h = F.panels;
    var y = F.selectType;
    var b = F.departmentId;
    var k = F.callBackFn;
    var z = F.NPS;
    var t = F.changeNodeMessage;
    var C = F.isOperationDesignerModel;
    if (!C) {
        var s = wfAjax.canChangeNode(e);
        if (s[0] == "false") {
            $.alert(s[1]);
            return
        }
        var c = lockWorkflow(r, _wfcurrentUserId, 8);
        if (c[0] == "false") {
            $.alert(c[1]);
            return
        }
    }
    if ((!C || C == "false") && t && t.userId) {
        t.summaryId = d;
        t.affairId = w;
        t.currentUserId = j;
        t.performer = m;
        t.workitemId = e;
        t.currentLoginAccountId = f;
        assignNodeOpe(e, r, o, m, "", E, "", "", f, k, d, w, t, 5);
        return
    }
    var n = "", l = "";
    if (t) {
        var B = t.userType, H = t.userId, v = t.userName;
        if (B != null && H != null) {
            var u = [], x = [];
            for (var A = 0, D = B.length; A < D; A++) {
                u.push(B[A] + "|" + H[A]);
                x.push(v[A])
            }
            n = u.join(","), l = x.join(",")
        }
    }
    var q = h == undefined ? "Department,BusinessDepartment" : h;
    var G = y == undefined ? "Department,Member,BusinessDepartment" : y;
    var b = b;
    var g = -1;
    var a = 1;
    var I = $.selectPeople({
        type: "selectPeople",
        panels: q,
        selectType: G,
        text: $.i18n("workflow.insertPeople.urgerAlt"),
        showFlowTypeRadio: false,
        targetWindow: getCtpTop(),
        departmentId: b + "",
        unallowedSelectEmptyGroup: true,
        params: {text: l, value: n},
        callback: function (i) {
            showMultistageSignPageCallBack(i, k, d, w, m, e, r, o, j, J, f, p, E, z, C, t)
        }
    })
}

function escapeSpecialChar(a) {
    if (!a) {
        return a
    }
    a = a.replace(/\&/g, "&amp;").replace(/\</g, "&lt;").replace(/\>/g, "&gt;").replace(/\"/g, "&quot;");
    a = a.replace(/\'/g, "&#039;").replace(/"/g, "&#034;");
    return a
}

function showMultistageSignPageCallBack(q, e, a, l, g, b, j, h, d, r, c, i, p, m, n, k) {
    var f = q.value;
    var o = $.dialog({
        url: _ctxPath + "/workflow/designer.do?method=preAddMoreSign&NPS=" + m + "&_r=" + (new Date()).getTime(),
        width: 500,
        height: 350,
        title: $.i18n("workflow.moreSign.findPerson"),
        minParam: {show: false},
        maxParam: {show: false},
        transParams: {selObj: f, appName: p, flowPermAccountId: i, nodeId: h, changeNodeMessage: k},
        id: "workflow_dialog_MultistageSignPage_id",
        targetWindow: getCtpTop(),
        notCopyReturnValue: true,
        buttons: [{
            text: $.i18n("workflow.designer.page.button.ok"), isEmphasize: true, handler: function () {
                var u = o.getReturnValue();
                if (u == false) {
                } else {
                    if (u != null && u.length > 0) {
                        var t = $.parseJSON(u);
                        if (!n) {
                            t.summaryId = a;
                            t.affairId = l;
                            t.currentUserId = d;
                            t.performer = g;
                            t.workitemId = b;
                            t.currentLoginAccountId = c;
                            assignNodeOpe(b, j, h, g, "", p, "", "", c, e, a, l, t, 5)
                        } else {
                            var s = {changeNodeMessage: t};
                            if (typeof e == "function") {
                                e(s)
                            }
                        }
                    }
                    o.close()
                }
            }
        }, {
            text: $.i18n("workflow.designer.page.button.cancel"), handler: function () {
                o.close()
            }
        }]
    })
}

function passRead(f) {
    var e = f.workitemId;
    var k = f.processId;
    var i = f.nodeId;
    var g = f.performer;
    var q = f.appName;
    var p = f.accountId;
    var c = f.summaryId;
    var n = f.affairId;
    var a = f.departmentId;
    var h = f.callback;
    var m = f.SPK;
    var j = f.canBugReport == "false" ? false : true;
    var l = wfAjax.canChangeNode(e);
    if (l[0] == "false") {
        $.alert(l[1]);
        return
    }
    var d = lockWorkflow(k, _wfcurrentUserId, 7);
    if (d[0] == "false") {
        $.alert(d[1]);
        return
    }
    var r = wfAjax.getAcountExcludeElements(q, m);
    var o = parseElements(r[0]);
    var b = {
        type: "selectPeople",
        text: $.i18n("workflow.insertPeople.urgerAlt"),
        showFlowTypeRadio: false,
        isConfirmExcludeSubDepartment: true,
        excludeElements: o,
        params: {value: ""},
        departmentId: a + "",
        unallowedSelectEmptyGroup: true,
        targetWindow: getCtpTop(),
        callback: function (K) {
            if (K && K.obj && K.obj.length > 0) {
                var A = [], u = [], J = [], t = [], x = [], v = [], E = [];
                var I = {};
                for (var F = 0, G = K.obj.length; F < G; F++) {
                    A.push(K.obj[F].id);
                    u.push(K.obj[F].name);
                    J.push(K.obj[F].type);
                    t.push(K.obj[F].excludeChildDepartment);
                    x.push(K.obj[F].accountId);
                    v.push(K.obj[F].accountShortname);
                    E.push("all")
                }
                I.userId = A;
                I.userName = u;
                I.userType = J;
                I.userExcludeChildDepartment = t;
                I.accountId = x;
                I.accountShortname = v;
                I.node_process_mode = E;
                var D = $("#process_xml"), s = $("#readyObjectJSON");
                if (D.size() <= 0) {
                    $.alert("请添加id=process_xml的隐藏域！");
                    return
                }
                var H = D.val();
                var w = $("#process_message_data");
                var z = "";
                if (w.size() > 0) {
                    z = w.val()
                }
                I.summaryId = c;
                I.affairId = n;
                if (addNodeTargetNodeId == "") {
                    addNodeTargetNodeId = i
                }
                var y = wfAjax.addNode(k, i, addNodeTargetNodeId, g, 6, I, H, "", z, getProcessChangeMessage());
                if (y && y[8]) {
                    addNodeTargetNodeId = y[8]
                }
                if (y && y[9]) {
                    if (newGenerateOtherNodeIds == "") {
                        newGenerateOtherNodeIds = y[9]
                    } else {
                        newGenerateOtherNodeIds = newGenerateOtherNodeIds + "," + y[9]
                    }
                    $("#newGenerateOtherNodeIds").val(newGenerateOtherNodeIds)
                }
                var C = false;
                if (addNodeTargetNodeId != i) {
                    $("#newGenerateNodeId").val(addNodeTargetNodeId);
                    C = true
                }
                if (y && y[0]) {
                    D.val(y[0])
                }
                if (y && y[4] && w.size() > 0) {
                    w.val(y[4]);
                    w = null
                }
                if (y && y[5]) {
                    setProcessChangeMessage(y[5])
                }
                D = null;
                var B = {messageDataList: y[4], currentNodeId: addNodeTargetNodeId, splitDisplay: C, type: 3};
                if (typeof h == "function") {
                    h(B)
                } else {
                    if (typeof refreshWorkflow == "function") {
                        refreshWorkflow(B)
                    } else {
                        $.alert("请添加一个名字为refreshWorkflow的函数，以刷新流程图页面，看到加签/减签效果！")
                    }
                }
            } else {
                $("#collSelectPeopleInput").val("<" + $.i18n("workflow.insertPeople.urgerAlt") + ">")
            }
        }
    };
    b.panels = r[2];
    b.selectType = r[3];
    $.selectPeople(b)
}

function replaceTemplateNode(f, a, e, d, c) {
    c = c || {};
    var b = a;
    if (e == "form") {
        b = "form"
    }
    window.templateReplaceNodeDialog = $.dialog({
        id: "templateReplaceNode",
        url: _ctxPath + "/workflow/designer.do?method=replaceIndex&appName=" + a + "&NPS=" + e + "&searchModule=" + b,
        width: 700,
        height: 475,
        title: d || $.i18n("workflow.replaceNode.40"),
        minParam: {show: false},
        maxParam: {show: false},
        transParams: {paramWin: window, initData: c.datas, initType: c.type},
        close_fn: function () {
            window.dialog.transParams = null
        },
        targetWindow: getCtpTop()
    });
    f = null
}

function executeWorkflowBeforeEvent(b, j, i, n, a, c, g, k, e, m, h, l, f, o) {
    var d = new Object();
    d.event = b;
    d.formData = g;
    d.mastrid = g;
    d.processTemplateId = n;
    d.processId = a;
    d.currentActivityId = c;
    d.bussinessId = j;
    d.affairId = i;
    d.appName = k;
    d.formAppId = e;
    d.formViewOperation = h;
    d.matchRequestToken = matchRequestToken;
    d.processXml = l;
    d.currentNodeLast = $("#workflow_thisNodelast_input").val();
    if (!d.businessData) {
        d.businessData = new Object()
    }
    d.businessData["attribute"] = f;
    d.businessData["commentContent"] = o;
    return executeWorkflowBeforeEventJson(d)
}

function executeWorkflowBeforeEventJson(d) {
    var b = {
        event: "",
        formData: "",
        mastrid: "",
        processTemplateId: "",
        processId: "",
        currentActivityId: "",
        bussinessId: "",
        affairId: "",
        appName: "",
        formAppId: "",
        formViewOperation: "",
        matchRequestToken: matchRequestToken,
        processXml: "",
        currentNodeLast: $("#workflow_thisNodelast_input").val(),
        selectTargetNodeId: "",
        submitStyleAfterStepBack: "",
        businessData: {attribute: "", commentContent: "", stepBackType: "normal"}
    };
    var d = $.extend(b, d);
    if (d.processTemplateId == null || d.processTemplateId == "" || hasWorkflowEvent == "false" || hasWorkflowEvent == false) {
        return true
    }
    var a = wfAjax.executeWorkflowBeforeEvent(d.event, d);
    if (a && a != "") {
        $.alert(a);
        try {
            releaseApplicationButtons()
        } catch (c) {
        }
        return false
    }
    return true
}

function validateWorkflowXML(b) {
    var a = b.sourceWindow;
    var c = b.callback;
    a.executeValidateWorkflowXML({
        callback: function (d) {
            c && c(d)
        }
    })
}

function initPageDataToParentPage(z, b) {
    if (!z) {
        $.alert("sourceWindow is null!");
        return false
    }
    if (typeof (z.OK) != "function") {
        $.alert("sourceWindow can't find OK Function!");
        return false
    }
    var e = z.OK({innerButtonId: "ok"});
    if (!e) {
        return false
    }
    var x = z.isvalidate;
    var v = z.appName;
    var h = z.formApp;
    if (h == "-1") {
        h = ""
    }
    var f = z.wendanId;
    if (f == "-1") {
        f = ""
    }
    var o = z.NPS;
    if (!o) {
        o = "default"
    }
    if (x == "true" && e) {
        var a = wfAjax.validateFormTemplate(v, o, h || f || "", e[1], e[4]);
        if (a == null || a.length < 2) {
            $.alert($.i18n("workflow.label.dialog.validateError.js"));
            return false
        }
        if ("false" == a[0]) {
            var c = $($.parseXML(a[1].substr(38)));
            var q = c.find("n[s=false]");
            var A = true, m = "";
            if (q.size() > 0) {
                loopFlag1:for (var g = 0, t = q.size(); g < t; g++) {
                    var u = q.eq(g);
                    for (var s = 0; s < 6; s++) {
                        if ("false" == u.find("r" + s).text()) {
                            A = false;
                            m = u.find("r" + s + "msg").text();
                            break loopFlag1
                        }
                    }
                }
            }
            var n = c.find("l[s=false]");
            if (A && n.size() > 0) {
                loopFlag2:for (var l = 0, d = n.size(); l < d; l++) {
                    var k = n.eq(l);
                    if ("false" == k.find("r0").text()) {
                        A = false;
                        m = k.find("r0msg").text();
                        break loopFlag2
                    }
                }
            }
            var p = c.find("cl[s=false]");
            if (A && p.size() > 0) {
                loopFlag3:for (var r = 0, y = p.size(); r < y; r++) {
                    var w = p.eq(r);
                    if ("false" == w.find("r0").text()) {
                        A = false;
                        m = w.find("r0msg").text();
                        break loopFlag3
                    }
                }
            }
            if (!A) {
                m = "<div style='width:270px;' class='word_break_all'>" + m + "<div>";
                $.alert(m);
                return false
            }
        }
    }
    initDialogDataToParentPage(e, b);
    return true
}

function workflowHasPolicy(c, a) {
    var b = false;
    if (a && a.hasPolicy) {
        b = a.hasPolicy(c)
    }
    return b
}

function setCondition(p) {
    var c = p.linkId;
    var o = p.appName;
    var l = p.conditionId;
    var g = p.formCondition;
    var d = p.conditionTitle;
    var k = p.conditionType;
    var b = p.isForce;
    var m = p.conditionBase;
    var e = p.conditionDesc;
    var j = p.isCircle;
    var f = p.submitStyle;
    var a = p.subAppName;
    var h = p.urlParams;
    var s = p.formAppId;
    var i = p.wendanId;
    var r = p.isShowForce;
    var q = 1;
    if ((l != null && l != undefined && l.trim() != "" && l.trim() != "null" && l.trim() != "undefined") && (g != null && g != undefined && g.trim() != "" && g.trim() != "null" && g.trim() != "undefined") && (d != null && d != undefined && d.trim() != "" && d.trim() != "null" && d.trim() != "undefined") && (m != null && m != undefined && m.trim() != "" && m.trim() != "null" && m.trim() != "undefined")) {
        q = 0
    }
    var n = $.dialog({
        url: _ctxPath + "/workflow/designer.do?method=showWorkflowBranchSettingPage&appName=" + o + "&subAppName=" + a + "&urlParams=" + h + "&linkId=" + c + "&isNew=" + q + "&conditionBase=" + m + "&formApp=" + s + "&wendanId=" + i + "&isShowForce=" + r,
        width: 560,
        height: 520,
        title: $.i18n("workflow.formBranch.validate.16"),
        minParam: {show: false},
        maxParam: {show: false},
        transParams: {
            appName: o,
            linkId: c,
            isNew: q,
            conditionId: l,
            formCondition: g,
            conditionTitle: d,
            conditionType: k,
            isForce: b,
            conditionBase: m,
            conditionDesc: e,
            isCircle: j,
            submitStyle: f
        },
        targetWindow: getCtpTop(),
        buttons: [{
            text: $.i18n("common.button.reset.label"), handler: function () {
                n.getReturnValue({reset: true})
            }
        }, {
            text: $.i18n("workflow.designer.page.button.ok"), isEmphasize: true, handler: function () {
                var w = n.getReturnValue({innerButtonId: "ok"});
                try {
                    w = $.parseJSON(w)
                } catch (v) {
                    w = null
                }
                if (w) {
                    var t = w[1];
                    if ("office" != o) {
                        if (t.search(/{[^{}]+}/) > -1) {
                            $.alert($.i18n("workflow.formBranch.validate.17"));
                            return
                        }
                    }
                    if (w[5] != true) {
                        $.alert($.i18n("workflow.formBranch.validate.25"));
                        return
                    }
                    if (j == "true" && w[6] == "") {
                        $.alert($.i18n("workflow.branch.condition.select.alert.js"));
                        return false
                    }
                    var u = [1, w[1], w[0], w[4], w[3], w[2], w[6]];
                    if (p.successCallBack) {
                        p.successCallBack(u)
                    }
                    n.close()
                }
            }
        }, {
            text: $.i18n("workflow.designer.page.button.cancel"), handler: function () {
                if (p.failCallBack) {
                    p.failCallBack()
                }
                n.close()
            }
        }]
    })
}

function onBeforeWorkflowOperationValidate(a, b, d, c, g, f, e, h) {
    var i = "";
    if (e == "insertNode") {
        i = wfAjax.onBeforeValidate4InsertNode(a, b, d, _wfcurrentUserId, g, f)
    } else {
        if (e == "assignNode") {
            i = wfAjax.onBeforeValidate4AssignNode(a, b, d, _wfcurrentUserId, g, f)
        } else {
            if (e == "infoNode") {
                i = wfAjax.onBeforeValidate4InfoNode(a, b, d, _wfcurrentUserId, g, f)
            } else {
                if (e == "deleteNode") {
                    i = wfAjax.onBeforeValidate4DeleteNode(a, b, d, _wfcurrentUserId, g, f)
                } else {
                    if (e == "repeal") {
                        if (!h) {
                            h = "false"
                        }
                        i = wfAjax.onBeforeValidate4Repeal(a, b, d, _wfcurrentUserId, g, f, h)
                    } else {
                        if (e == "stepStop") {
                            i = wfAjax.onBeforeValidate4StepStop(a, c, _wfcurrentUserId, g, f)
                        } else {
                            if (e == "takeBack") {
                                i = wfAjax.onBeforeValidate4TakeBack(a, b, d, _wfcurrentUserId, g, f)
                            } else {
                                if (e == "specialStepBack") {
                                    i = wfAjax.onBeforeValidate4SpecialStepBack(a, b, d, _wfcurrentUserId, g, f)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return i
}

function reportProblem(e, c, a, b) {
    var d = $.dialog({
        id: "workflow_dialog_reportProblem_Id",
        url: _wfctxPath + "/workflow/designer.do?method=reportProblem&appName=" + a + "&processId=" + e + "&workitemId=" + c + "&bugType=" + b,
        width: 505,
        height: 370,
        title: $.i18n("workflow.bug.report.js"),
        targetWindow: getCtpTop(),
        buttons: [{
            text: $.i18n("common.button.ok.label"), isEmphasize: true, handler: function () {
                var f = d.getReturnValue();
                if (f) {
                    f.processId = e;
                    f.workitemId = c;
                    f.appName = a;
                    wfAjax.saveWorkflowBugReport(f);
                    $.infor($.i18n("workflow.bug.report.success.js"));
                    d.close()
                }
            }
        }, {
            text: $.i18n("common.button.cancel.label"), handler: function () {
                d.close()
            }
        }]
    })
}

function selectUnavailableNodeFunction(c) {
    var a = {
        title: $.i18n("workflow.replaceNode.24"),
        dialogWidth: 500,
        dialogHeight: 300,
        orgType: "V3xOrgMember,V3xOrgAccount,V3xOrgDepartment,V3xOrgLevel,V3xOrgPost,Role,V3xOrgTeam",
        column: "",
        maxSize: 10,
        callBack: ""
    };
    var c = $.extend(a, c);
    var b = $.dialog({
        id: "findUnavailableNode",
        url: _ctxPath + "/workflow/designer.do?method=enabledPeople",
        width: c.dialogWidth,
        height: c.dialogHeight,
        title: c.title,
        minParam: {show: false},
        maxParam: {show: false},
        transParams: {maxSize: c.maxSize, column: c.column, orgType: c.orgType},
        close_fn: function () {
        },
        targetWindow: getCtpTop(),
        buttons: [{
            isEmphasize: true, text: $.i18n("workflow.designer.page.button.ok"), handler: function () {
                var d = b.getReturnValue();
                if (d != null) {
                    var e = $.parseJSON(d);
                    if (e != null && e.length > 0) {
                        if (c.callBack) {
                            c.callBack(e)
                        }
                        b.close();

                    }
                }
            }
        }, {
            text: $.i18n("workflow.designer.page.button.cancel"), handler: function () {
                b.close()
            }
        }]
    })
};