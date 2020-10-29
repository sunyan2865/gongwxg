

/**
 * 正文编辑调用
 * @type {string}
 */
var oldfilename="";
var oldzwdate="";
function editOfficeOnline4Form_zw(b, o, a, c, d, n) {
    oldfilename=o;
    oldzwdate=n;
    getCtpTop().needShowContent = true;
    var l = getMimeType(c, a);
    a = encodeURIComponent(a);
    var h = getOfficeMustParams(o);
    var g = h.split("|");
    if (_fileId == "") {
        var k = document.getElementsByTagName("head")[0];
        var j = document.createElement("script");
        j.src = "/seeyon/common/office/js/i18n/" + g[2] + ".js";
        j.type = "text/javascript";
        k.appendChild(j);
        var m = document.getElementsByTagName("head")[0];
        var e = document.createElement("script");
        e.src = "/seeyon/common/office/js/baseOffice.js";
        e.type = "text/javascript";
        m.appendChild(e)
    }
    var p = getExactFileType4Ocx({filename: a, _fileType: g[0]});
    _id = b;
    _fileId = g[4];
    var f = {
        fileId: g[4],
        originalFileId: o,
        createDate: n,
        officeOcxUploadMax: g[1],
        handWriteCurrentUserId: g[3],
        webRoot: getWebRoot(),
        officeDom: document.getElementById("editOnline_" + b),
        fileType: p,
        editType: "1,0",
        isFullSize: true,
        needReadFile: true,
        locale: v3x.currentLanguage ? v3x.currentLanguage : g[2],
        callback: callback_zw
    };
    if (typeof (OfficeAPI) == "undefined") {
        setTimeout(function () {
            OfficeAPI.dynamicShowOffice(f)
        }, 1000)
    } else {
        OfficeAPI.dynamicShowOffice(f)
    }
}



function callback_zw(a) {
    var c = OfficeAPI.saveOffice("true");
    if (c) {
        var b = "";
        if (OfficeAPI.getFileSize()) {
            b = OfficeAPI.getFileSize()
        }
        setTimeout(function () {
            updateAttachmentInfo_zw(_id, _fileId, getNowFormatDate(), b,oldfilename,oldzwdate)
        }, 1000)
    }
    return c
}




function updateAttachmentInfo_zw(id,fileUrl,createDate,fileSize,oldfilename,oldzwdate){
    $.ajax({
        url: _ctxPath + '/filedown.do?method=toDelAndReNameFile',
        type:'POST',
        data:{oldfilename: oldfilename,newfilename:fileUrl,oldzwdate:oldzwdate,newzwdate:createDate},
        success:function (res) {}
    });

}

function getCtpTop() {
    try {
        var a = getCtpParentWindow(window);
        if (a) {
            return a
        } else {
            return top
        }
    } catch (b) {
        return top
    }
}



function getMimeType(d, c) {
    var b = c.toLocaleLowerCase();
    var a = b.lastIndexOf(".");
    if (a != -1) {
        b = b.substring(a)
    }
    if (attFileType) {
        if (attFileType.get(d)) {
            return attFileType.get(d)
        }
        if (attFileType.get(b)) {
            return attFileType.get(b)
        }
    }
    return null
}


function getOfficeMustParams(b) {
    var a = new XMLHttpRequestCaller(this, "ajaxHandWriteManager", "ajaxGetOfficeMustParams", false);
    a.addParameter(1, "String", b);
    var c = a.serviceRequest();
    return c
}


function getExactFileType4Ocx(c, a) {
    var b = getFileTypeByFilename(c);
    if (b != "docx" && b != "xlsx" && b != "pptx") {
        b = getOfficeExtension(b, a)
    }
    return b
}


function getWebRoot() {
    if (typeof (window.location.origin) == "undefined") {
        basePath = window.location.protocol + "//" + window.location.hostname + (window.location.port ? ":" + window.location.port : "") + "/seeyon"
    } else {
        basePath = window.location.origin + "/seeyon"
    }
    return basePath
}



function getFileTypeByFilename(e) {
    var a = "";
    var b = e.filename;
    if (b != "") {
        var f = b.lastIndexOf(".");
        var d = b.length;
        var c = b.substring(f + 1, d);
        if (c != null) {
            if ("docx" == c || "DOCX" == c) {
                a = "docx"
            } else {
                if ("xlsx" == c || "XLSX" == c) {
                    a = "xlsx"
                } else {
                    if ("pptx" == c || "PPTX" == c) {
                        a = "pptx"
                    } else {
                        a = c
                    }
                }
            }
        }
    }
    return a
}