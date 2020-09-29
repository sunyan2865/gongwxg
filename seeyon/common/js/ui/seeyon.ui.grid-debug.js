var timer = null;
var grayTimer = null;
function MxtSeeGrid(tObj, p) {
    this.tObj = tObj;
    this.hset = {};
    this.finished = true;
    this.combo_flag = true;
    this.pager = 0;
    var t = this.tObj;
    //初始化表格的初始值
    this.initDefOptions();
    //为表格销毁提供相应的缓存数据
    try{
        if(tObj.parentNode!=null){
            this.gridTempContent=tObj.parentNode.innerHTML;
            this.parentNode=tObj.parentNode;
        }
    }catch (ex){

    }
}
//初始化参数
MxtSeeGrid.prototype.initDefOptions = function () {
    this.options = { // apply default properties
        id: Math.floor(Math.random() * 100000000) + '_grid',
        height: 200, // default height
        width: 'auto', // auto width
        gridType:'oldGrid',
        closeError: false,
        striped: true, // apply odd even stripes
        novstripe: false,
        minwidth: 30, // min width of columns
        minheight: 0, // min height of columns
        resizable: true, // allow table resizing
        method: 'POST', // data sending method
        errormsg: 'Connection Error',
        usepager: true, // 分页
        nowrap: true,
        page: 1, // current page
        total: 1, // total pages
        useRp: true, // use the results per page select box   change input
        useRpInput: true, // use the results per page select box   change input
        rp: ($.ctx && $.ctx._pageSize) ? $.ctx._pageSize : 20, // results per page
        rpMaxSize: 200, // results per page
        rpOptions: [10, 20, 30, 40, 50, 100, 150, 200], // allowed per-page values
        title: false,
        idProperty: 'id',
        pagestat: 'Displaying {from} to {to} of {total} items',
        pagetext: $.i18n('validate.grid.over_page6.js'), //第
        outof: $.i18n('validate.grid.over_page5.js'), //页
        findtext: 'Find ' + $.i18n('validate.grid.over_page5.js'),
        params: {}, // allow optional parameters to be passed around
        procmsg: 'Processing, please wait ...',
        query: '',
        qtype: '',
        nomsg: 'No items',
        minColToggle: 2, // minimum allowed column to be hidden
        showToggleBtn: true, // show or hide column toggle popup
        hideOnSubmit: true,
        autoload: true,
        blockOpacity: 0.5,
        preProcess: false,
        addTitleToCell: false, // add a title attr to cells with truncated
        // contents
        dblClickResize: false, // auto resize column by double clicking
        onDragCol: false,
        onToggleCol: false,
        onChangeSort: false,
        onCurrentPageSort: true, //是否只对当前页的数据进行排序
        onSuccess: false,
        onNoDataSuccess: false,
        onError: false,
        onSubmit: false, // using a custom populate function,
        datas: null,
        click: null,
        dblclick: null,
        render: null,
        callBackTotle: null,
        singleSelect: true,
        managerName: null,
        managerMethod: null,
        isEscapeHTML: true,
        heightSubtract: 0, //总体高度减去的值-左右结构toolbar高度
        customize: true, //是否支持个性化信息自动存储，默认支持
        vChangeParam: {
            'changeTar': 'grid_detail',
            overflow: "auto",
            'subHeight': 0,
            'position': 'static',
            autoResize: true
        }, // 三个参数必须同时存在--拖动下方条更改列表高度，顺带而改变的对象[parentId:父div,changeTar:更改对象,subHeight:自定义减去的高度]{'parentId':'center','changeTar':'form_area','subHeight':90}
        vChange: false, // 三个参数必须同时存在--拖动右方条更改列表宽度，顺带而改变的对象[parentId:父div,changeTar:更改对象,subWidth:自定义减去的宽度]{'parentId':'center','changeTar':'form_area','subWidth':10}
        isHaveIframe: false, //如果detail下部包含iframe，则拖动更改不好拖拽
        hChangeParam: {
            'subHeight': 55
        },
        hChange: false,
        parentId: null, // 用来获取grid的高度，使grid高度自适应
        slideToggleBtn: false, //上下伸缩按钮
        UMD: 'down',
        slideToggleUpHandle: __slideToggleUpHandle,
        slideToggleDownHandle: __slideToggleDownHandle,
        dataTable: false
    }
}

//销毁当前表格
MxtSeeGrid.prototype.destroyGrid = function () {
    //如果头部列表存在 则移除
    if(this.hTable!=null){
        SeeUtils.removeEl(this.hTable);
        this.hTable=null;
    }
    if(this.hDiv!=null){
        SeeUtils.removeEl(this.hDiv);
        this.hDiv=null;
    }
    if(this.vDiv!=null){
        SeeUtils.removeEl(this.vDiv);
        this.vDiv=null;
    }
    //如果表格内容存在 则移除
    if( this.bDiv!=null){
        SeeUtils.removeEl(this.bDiv);
        this.bDiv=null;
    }
    //如果分页组件对象存在 则移除
    if( this.pDiv!=null){
        SeeUtils.removeEl(this.pDiv);
        this.pDiv=null;
    }
    if(this.nDiv!=null){
        SeeUtils.removeEl(this.nDiv);
    }
    //列操作组件 移除
    if(this.nBtn!=null){
        SeeUtils.removeEl(this.nBtn);
    }
    //列表对象
    if(this.gDiv!=null){
        SeeUtils.removeEl(this.gDiv);
    }
    SeeUtils.innerHTMl(this.parentNode,this.gridTempContent);
    this.tObj.grid=null;
}
//表格列移动
MxtSeeGrid.prototype.dragColMoveStart = function (e, obj) {
    var g = this;
    var p = this.options;

    SeeUtils.hideEl(g.nDiv);
    SeeUtils.hideEl(g.nBtn);

    g.hset = SeeUtils.offset(g.hDiv);

    g.hset.right = g.hset.left + SeeUtils.getElWidth(p.id + "_h_table");
    g.hset.bottom = g.hset.top + SeeUtils.getElHeight(p.id + "_h_table");
    g.dcol = obj;

    //获取列的序号
    g.dcoln = SeeUtils.indexByTag(g.hDiv, "th", obj);

    function _getColCopyClass() {
        if (SeeUtils.isIE) {
            return "colCopy ie";
        } else {
            return "colCopy";
        }
    }

    var colCopyId = SeeUtils.getUUid();
    var colCopyHtml = "<div id='" + colCopyId + "' class='" + _getColCopyClass() + "' style='position:absolute;float:left;display:none;'>" + obj.innerHTML + "</div>";
    //设置对象
    SeeUtils.appendToBody(colCopyHtml);

    this.colCopy = SeeUtils.getElObj(colCopyId);
    SeeUtils.hideEl(g.cDrag);
}
//表格列顺序调整拖拽中
MxtSeeGrid.prototype.dragColMoveMove = function (e, obj) {
    var g = this;
    var p = this.options;

    SeeUtils.addClass(g.dcol, "thMove");
    SeeUtils.removeClass(g.dcol, "thOver");

    if (e.pageX > g.hset.right || e.pageX < g.hset.left
        || e.pageY > g.hset.bottom || e.pageY < g.hset.top) {
        // g.dragEnd();
        SeeUtils.css(SeeUtils.getElByTag(document, "body")[0], "cursor", "move");
    } else {
        SeeUtils.css(SeeUtils.getElByTag(document, "body")[0], "cursor", "pointer");
    }

    SeeUtils.css(g.colCopy, "top", (e.pageY + 10) + "px");
    SeeUtils.css(g.colCopy, "left", (e.pageX + 20) + "px");
    SeeUtils.css(g.colCopy, "display", "block");
}

//表格列顺序调整 拖拽结束
MxtSeeGrid.prototype.dragColMoveEnd = function () {
    var g = this;
    var p = this.options;

    //移除相应的拖动元素
    SeeUtils.removeEl(g.colCopy);
    if (g.dcolt != null) {
        var thEl = SeeUtils.getElByTagAndIndex(g.hDiv, "th", g.dcolt);
        if (g.dcoln > g.dcolt) {
            SeeUtils.insertBefore(g.dcol, thEl);
        } else {
            SeeUtils.insertAfter(g.dcol, thEl);
        }

        //变更2列的位置
        g.switchCol(g.dcoln, g.dcolt);

        SeeUtils.removeEl(g.cdropleft);
        SeeUtils.removeEl(g.cdropright);

        g.rePosDrag();
        if (p.onDragCol) {
            p.onDragCol(g.dcoln, g.dcolt);
        }
    }

    this.dcol = null;
    this.hset = null;
    this.dcoln = null;
    this.dcolt = null;
    this.colCopy = null;
    //移除相应的样式
    SeeUtils.eachByClass(g.hDiv, ".thMove", function (elObj) {
        SeeUtils.removeClass(elObj, "thMove");
    })

    SeeUtils.showEl(g.cDrag);

    var _cols = SeeUtils.getElByTag(g.hDiv, 'th');
    var _modes = [];
    var _modesMap = [];


    //循环每列
    for (var num = 0; num < _cols.length; num++) {
        var colEl = _cols[num];
        var _colmodes = SeeUtils.getAttrEl(colEl, "colmode");
        //循环 调整列的顺序
        SeeUtils.each(p.colModelBak, function (i, n) {
            if (n.name == _colmodes && typeof(n) === "object") {
                _modesMap[num] = i;
                _modes.push(n);
            }
        });
    }
    p.colModel = _modes;
    p._modesMap = _modesMap;
    this.saveCustomize();
}
//表格拖动
MxtSeeGrid.prototype.dragTableStart = function (e, obj) {
    var g = this;
    var p = this.options;
    var hgo = false;
    SeeUtils.css(SeeUtils.getElByTag(document, "body")[0], "cursor", "row-resize");
    if (obj) {
        hgo = true;
        SeeUtils.css(SeeUtils.getElByTag(document, "body")[0], "cursor", "col-resize");
    }
    // 重新获取高度,如果点击行，重新设置grid高度，再拖动下面的工具条更改grig高度的时候需要重新获取高度--div
    p.height = SeeUtils.getElHeight(g.bDiv);

    if (p.vChange == true && p.isHaveIframe == true) {
        var gridDetail = SeeUtils.getElObj(p.vChangeParam.changeTar);
        SeeUtils.css(gridDetail, 'position', "relative")

        //此处 使用jquery的性能优于原生js  所以没有进行处理
        $("<div class='grid_mask'></div>").css({
            'position' : 'absolute',
            'background' : 'red',
            'top' : 0,
            'left' : 0,
            'width' : SeeUtils.getElWidth(gridDetail) + 'px',
            'height' : SeeUtils.getElHeight(gridDetail) + 'px',
            'z-index' : 20,
            '-moz-opacity' : 0.0,
            'opacity' : 0.0
        }).appendTo($(gridDetail));
    }
    this.vresize = {
        h : p.height,
        sy : e.pageY,
        w : p.width,
        sx : e.pageX,
        hgo : hgo
    };
}
//表格拖拽中
MxtSeeGrid.prototype.dragTableMove = function (e) {
    var g = this;
    var p = this.options;
    var v = this.vresize;
    var y = SeeUtils.getPageY(e);

    var diff = y - v.sy;
    if (!p.defwidth)
        p.defwidth = p.width;
    if (p.width != 'auto' && !p.nohresize && v.hgo) {
        var x =SeeUtils.getPageX(e);
        var xdiff = x - v.sx;
        var newW = v.w + xdiff;
        if (newW > p.defwidth) {
            this.gDiv.style.width = newW + 'px';
            p.width = newW;
        }
    }
    var newH = v.h + diff;
    if ((newH > p.minheight || p.height < p.minheight) && !v.hgo) {
        this.bDiv.style.height = newH + 'px';
        p.height = newH;
        this.fixHeight(newH);
    }
    v = null;
}
//表格拖拽结束
MxtSeeGrid.prototype.dragTableEnd = function () {
    var g = this;
    var p = this.options;
    if (p.vChange == true && p.isHaveIframe == true) {
        var gridDetail = SeeUtils.getElObj(p.vChangeParam.changeTar);
        var _position = p.vChangeParam.position;
        SeeUtils.css(gridDetail, 'position', _position)
        SeeUtils.eachByClass(SeeUtils.getElObj(p.vChangeParam.changeTar),"grid_mask",function(elObj){
            SeeUtils.removeEl(elObj);
        })
    }
    g.saveCustomize(); //保存用户的自定义信息
}
//获取显示的表头信息
function _getVisibleTh(g) {
    var newSelecteEls = [];
    //获取表头tr对象
    var thTrObj = _getHeaderThTrObj(g);
    if (thTrObj != null) {
        //帅选出显示的th 排除掉隐藏的th
        var selecteEls = SeeUtils.getElByTag(thTrObj, "th");
        for (var selNums = 0; selNums < selecteEls.length; selNums++) {
            var selecteElObj = selecteEls[selNums];
            if (selecteElObj.style.display === 'none') {
                continue;
            } else {
                newSelecteEls.push(selecteElObj);
            }
        }
    }
    return newSelecteEls
}
//获取标题元素当前的序号 根据标题对象
function _getVisibleThIndex(g, t) {
    //获取表头tr对象
    var thTrObj = _getHeaderThTrObj(g);
    if (thTrObj != null) {
        //帅选出显示的th 排除掉隐藏的th
        var selecteEls = SeeUtils.getElByTag(thTrObj, "th");
        var newSelecteEls = [];
        for (var selNums = 0; selNums < selecteEls.length; selNums++) {
            var selecteElObj = selecteEls[selNums];
            if (selecteElObj.style.display === 'none') {
                continue;
            } else {
                newSelecteEls.push(selecteElObj);
            }
        }
        //再根据序号定位显示的th对象 再获取其中的div对象
        if (t != null) {
            for (var num = 0; num < newSelecteEls.length; num++) {
                if (newSelecteEls[num] === t) {
                    return num;
                }
            }
        }
    }
    return -1;
}
//根据列的序号 获取该表格头中的div的对象
function _getVisibleThDivByIndex(g, n) {
    //获取表头tr对象
    var thTrObj = _getHeaderThTrObj(g);
    if (thTrObj != null) {
        //帅选出显示的th 排除掉隐藏的th
        var selecteEls = SeeUtils.getElByTag(thTrObj, "th");
        var newSelecteEls = [];
        for (var selNums = 0; selNums < selecteEls.length; selNums++) {
            var selecteElObj = selecteEls[selNums];
            if (selecteElObj.style.display === 'none') {
                continue;
            } else {
                newSelecteEls.push(selecteElObj);
            }
        }
        //再根据序号定位显示的th对象 再获取其中的div对象
        if (n >= 0 && newSelecteEls[n] != null) {
            var divEls = SeeUtils.getElByTag(newSelecteEls[n], "div");
            if (divEls.length > 0) {
                return divEls[0];
            }
        }
    }
    return null;
}
//列宽度拖动
MxtSeeGrid.prototype.dragColStart = function (e, obj) {
    var g = this;
    var p = this.options;
    // column resize
    //拖动开始时 先将列显示隐藏设置panel 以及设置的下拉按钮隐藏掉
    SeeUtils.hideEl(g.nDiv);
    SeeUtils.hideEl(g.nBtn);

    var n = SeeUtils.indexByTag(g.cDrag, "div", obj);

    var tdDiv = _getVisibleThDivByIndex(g, n);
    var ow = SeeUtils.getElWidth(tdDiv);
    SeeUtils.addClass(obj, "dragging");
    SeeUtils.eachBySiblings(obj, function (elObj) {
        SeeUtils.hideEl(elObj);
    })
    var prevEl = SeeUtils.getPrevEle(obj);
    SeeUtils.addClass(prevEl, "dragging");
    SeeUtils.showEl(prevEl);
    var isIE8ORIE9 = false;
    if (navigator.userAgent.indexOf("MSIE 8") != -1 || navigator.userAgent.indexOf("MSIE 9") != -1) {
        isIE8ORIE9 = true
    }
    g.colresize = {
        startX: (isIE8ORIE9 ? window.event.clientX : e.pageX),
        ol: parseInt(obj.style.left),
        ow: ow,
        n: n
    };
    SeeUtils.css(SeeUtils.getElByTag(document, "body")[0], "cursor", "col-resize");
}
//列拖动 移动中
MxtSeeGrid.prototype.dragColMove = function (e) {
    var g = this;
    var p = this.options;
    var n = g.colresize.n;
    var isIE8ORIE9 = false;
    if (navigator.userAgent.indexOf("MSIE 8") != -1 || navigator.userAgent.indexOf("MSIE 9") != -1) {
        isIE8ORIE9 = true
    }
    var diff = (isIE8ORIE9 ? window.event.clientX : e.pageX) - g.colresize.startX;
    var nleft = g.colresize.ol + diff;
    var nw = g.colresize.ow + diff;
    if (nw > p.minwidth) {
        var divObj = SeeUtils.getElByTagAndIndex(g.cDrag, "div", n);
        SeeUtils.css(divObj, "left", nleft + "px");
        g.colresize.nw = nw;
    }
}
//列宽度大小 拖拽结束
MxtSeeGrid.prototype.dragColEnd = function (e) {
    var g = this;
    var p = this.options;
    var n = g.colresize.n;
    var nw = g.colresize.nw;
    //如果不是通过拖拽来扩展表格的时候 则这个值nw则是undifined
    if (nw != null) {
        var tdDiv = _getVisibleThDivByIndex(g, n);
        SeeUtils.setElWidth(tdDiv, nw);

        SeeUtils.eachByTag(g.bDiv, "tr", function (elObj) {
            var tdObj = _getVisibleTdDivByIndex(elObj, n);
            SeeUtils.setElWidth(tdObj, nw);
        })
    }


    g.hDiv.scrollLeft = g.bDiv.scrollLeft;

    var cDragDiv = SeeUtils.getElByTagAndIndex(g.cDrag, "div", n);
    SeeUtils.eachBySiblings(cDragDiv, function (elObj) {
        SeeUtils.showEl(elObj);
    })

    SeeUtils.eachByClass(g.cDrag, "dragging", function (elObj) {
        SeeUtils.removeClass(elObj, "dragging");
    });
    g.rePosDrag();
    this.fixHeight(null, g);
    g.colresize = false;
    var name = p.colModel[n].name; // Store the widths in the cookies
    g.saveCustomize(); //保存用户的自定义信息
}
//根据列的序号 获取该表格头中的div的对象
function _getVisibleTdDivByIndex(thTrObj, n) {
    //帅选出显示的th 排除掉隐藏的th
    var selecteEls = SeeUtils.getElByTag(thTrObj, "td");
    var newSelecteEls = [];
    for (var selNums = 0; selNums < selecteEls.length; selNums++) {
        var selecteElObj = selecteEls[selNums];
        if (selecteElObj.style.display === 'none') {
            continue;
        } else {
            newSelecteEls.push(selecteElObj);
        }
    }
    //再根据序号定位显示的th对象 再获取其中的div对象
    if (n >= 0 && newSelecteEls[n] != null) {
        var divEls = SeeUtils.getElByTag(newSelecteEls[n], "div");
        if (divEls.length > 0) {
            return divEls[0];
        }
    }
    return null;
}
//创建span获取列的标准宽度  获取宽度后将列span移除。
function _createSpanGetInfo(tdDiv, nw, g, n) {
    //根据表头的标题来新增span 获取其宽度信息
    var spanTempId = SeeUtils.getUUid();
    var spanHtml = "<span id='" + spanTempId + "' style='padding-right:" + SeeUtils.getCss(tdDiv, "padding-right") + ";" +
        "padding-left:" + SeeUtils.getCss(tdDiv, "padding-left") + ";" +
        "font-size: " + SeeUtils.getCss(tdDiv, "font-size") + "'>" + tdDiv.innerHTML + "</span>";
    SeeUtils.prepend(spanHtml, SeeUtils.getElByTag(document, "body")[0]);
    var spanObj = SeeUtils.getElObj(spanTempId);
    nw = SeeUtils.getElWidth(spanObj);

    //循环每行信息 获取每行对应的宽度 与表头标题进行对比 获取其中最大的列宽
    SeeUtils.eachByTag(g.bDiv, "tr", function (elObj) {
        var spanW = 0;
        var tdObj = _getVisibleTdDivByIndex(elObj, n);
        spanObj.innerHTML = tdObj.innerHTML;
        SeeUtils.css(spanObj, "fontSize", SeeUtils.getCss(tdObj, "font-size"));
        SeeUtils.css(spanObj, "paddingLeft", SeeUtils.getCss(tdObj, "padding-left"))
        SeeUtils.css(spanObj, "paddingRight", SeeUtils.getCss(tdObj, "padding-right"))
        spanW = SeeUtils.getElWidth(spanObj) + 5;
        nw = (spanW > nw) ? spanW : nw;
    })
    SeeUtils.removeEl(spanObj);
    return nw;
}
//双击拖动列 实现列的宽度还原
MxtSeeGrid.prototype.autoResizeColumn = function (obj, g) {
    var g = this;
    var p = this.options;
    if (!p.dblClickResize) {
        return;
    }
    //获取当前对象处于的序号位置
    var n = SeeUtils.indexByTag(g.cDrag, "div", obj);

    var tdDiv = _getVisibleThDivByIndex(g, n);
    var ol = parseInt(obj.style.left),
        ow = SeeUtils.getElWidth(tdDiv),
        nw = 0,
        nl = 0;


    nw = _createSpanGetInfo(tdDiv, nw, g, n);
    nw = (p.minWidth > nw) ? p.minWidth : nw;
    nl = ol + (nw - ow);
    var divEl = SeeUtils.getElByTagAndIndex(g.cDrag, "div", n);
    SeeUtils.css(divEl, "left", nl);
    g.colresize = {
        nw: nw,
        n: n
    };
    this.dragEnd(g);
}
//开始拖动的方法
MxtSeeGrid.prototype.dragStart = function (dragtype, e, obj) { // default drag function start
    var g = this;
    var p = this.options;
    //colresize表示列拖动
    if (dragtype == 'colresize') {
        //表示列宽度拖拽
        this.dragColStart(e, obj);
    } else if (dragtype == 'vresize') {
        //表示整个table表格的拖动 table resize
        this.dragTableStart(e, obj);
    } else if (dragtype == 'colMove') {
        this.dragColMoveStart(e, obj);
    }
    $('body').noSelect();
}
//拖动事件  分列拖动  以及表格拖动  列顺序拖动
MxtSeeGrid.prototype.dragMove = function (e) {
    var g = this;
    var p = this.options;
    if (g.colresize) { // column resize
        this.dragColMove(e);
    } else if (g.vresize) { // table resize
        this.dragTableMove(e);
    } else if (g.colCopy) {
        this.dragColMoveMove(e);
    }
}
MxtSeeGrid.prototype.dragEnd = function () {
    var p = this.options;
    var g = this;
    if (g.colresize) {
        //列宽度拖动结束
        this.dragColEnd();
    } else if (g.vresize) {
        //table的范围进行变动
        g.vresize = false;
        this.dragTableEnd();
    } else if (g.colCopy) {
        //列位置变动
        this.dragColMoveEnd();
    }
    SeeUtils.css(SeeUtils.getElByTag(document, "body")[0], "cursor", "default");
    $('body').noSelect(false);
}
//将默认参数 和用户参数进行合并
MxtSeeGrid.prototype.extendOptions = function (p) {
    p = $.extend(this.options, p);
    p.colModelBak = $.extend({}, p.colModel);//备份原始colModel
    this.closeError = p.closeError;
    this.options = p;
    //设置变更参数
    __initVChangeParam(this.options);
    return p;
}
MxtSeeGrid.prototype.initGridCtl = function () {
    var gridObj = this;
//初始化表格元素的相关属性
    gridObj._initTableElAttr();
    //添加表格最外层容器
    gridObj._initGridContainer();

    //添加表格头部
    gridObj._addGridHeader();
    //添加表格body
    gridObj._addGridBody();
    //初始化表格高度
    gridObj._initTableHeight();
    //设置列头的label信息
    gridObj._initGridHeaderLabel();
    //定义表格 表头事件
    gridObj._initThEvent();
    //初始化 gridbody的相关属性
    gridObj.initGridBodyProp();
    // add td & row properties
    gridObj.addRowProp();
    //为列头添加拖拽提示的线条
    gridObj.addLinDrap();
    //添加向分隔条
    gridObj.addVGrip();
    //添加分页信息
    gridObj._addGridPage();
    //基本没用到，不做事件绑定的优化
    gridObj._addGridTitle();
    //添加表格列显示和隐藏配置
    gridObj._addFieldShowHidePanel();
    //添加编辑层  基本没用
    gridObj._addEditorLayer();
    //添加表格的默认事件信息
    gridObj._initDocumentEvents();
    gridObj.rePosDrag();
    gridObj.fixHeight();
    //加载数据
    gridObj._loadData();
    //结束表格初始化，
    initFlag = false;
    gridObj._endGridInit();
}
//点击grid的title的右边  收放按钮
function _tableToggleClick(tableId, showTableToggleBtn, elObj) {
    if (showTableToggleBtn || showTableToggleBtn === 'true') {
        //切换表格样式
        SeeUtils.toggleClass(tableId, 'hideBody');
        SeeUtils.toggleClass(elObj, 'vsble');
    }
}
//添加查询区域
MxtSeeGrid.prototype._addSearchitems = function (g, p) {
    if (p.searchitems) {
        var pSearchclickId = "pSearchclick_" + p.id;
        //这里用到了动画 而且这个功能基本不用 这里的jquery暂时保留
        window[pSearchclickId] = function (e, t) {
            $(g.sDiv).slideToggle('fast', function () {
                $('.sDiv:visible input:first', g.gDiv).trigger('focus');
            });
        }
        SeeUtils.prepend("<div class='pGroup'> <div class='pSearch pButton' onclick='" + pSearchclickId + "(event,this)'><span></span></div> </div>  <div class='btnseparator'></div>", p.id + "_pDiv_page");

        // add search box

        var sitems = p.searchitems;
        var sopt = '',
            sel = '';
        for (var s = 0; s < sitems.length; s++) {
            if (p.qtype == '' && sitems[s].isdefault == true) {
                p.qtype = sitems[s].name;
                sel = 'selected="selected"';
            } else {
                sel = '';
            }
            sopt += "<option value='" + sitems[s].name + "' " + sel + " >"
                + sitems[s].display + "&nbsp;&nbsp;</option>";
        }
        if (p.qtype == '') {
            p.qtype = sitems[0].name;
        }

        //输入框 点击回车
        var inputKeyDownId = "inputKeyDownId_" + p.id;
        window[inputKeyDownId] = function (e) {
            if (e.keyCode == 13) {
                g.doSearch();
            }
        }

        var selectKeyDownId = "selectKeyDownId_" + p.id;
        window[selectKeyDownId] = function (e) {
            if (e.keyCode == 13) {
                g.doSearch();
            }
        }

        //点击清空按钮
        var clearClickId = "clearClickId_" + p.id;
        window[clearClickId] = function (e) {
            //根据输入框的属性 获取输入框对象
            SeeUtils.eachElsByTagAndProp(g.sDiv, "input", "name", "q", function (elObj) {
                SeeUtils.setElVal(elObj, "");
            });
            p.query = '';
            g.doSearch();
        }

        var sDivId = SeeUtils.getUUid();
        var sDivHtml = "<div class='sDiv2'>" + p.findtext
            + " <input type='text' value='" + p.query
            + "' size='30' name='q' id='" + p.id + "_search_input' onkeydown='" + inputKeyDownId + "(event)' class='qsbox' /> "
            + " <select name='qtype' onkeydown='" + selectKeyDownId + "(event)'>" + sopt + "</select></div>";

        var gSdivHtml = "<div class='sDiv' id='" + sDivId + "'>" + sDivHtml + "<div style='clear:both' onclick='" + clearClickId + "()'></div></div>";
        //插入内容
        SeeUtils.insertAfter(gSdivHtml, g.bDiv);
        g.sDiv = SeeUtils.getElObj(sDivId);

    }
}
//添加分页记录数label信息
MxtSeeGrid.prototype._addPageRecordLabel = function (g, p) {
    var p = this.options;
    var g = this;
    g.pageInputId = SeeUtils.getUUid();


    var blurInputEventId = "blurInputEventId_" + p.id;
    window[blurInputEventId] = function (e, t) {
        var _val = SeeUtils.getElVal(g.pageInputId);
        var _nval = _val.replace(/\D/g, '');
        if (_nval <= 0) {
            _nval = p.rp;
        }
        SeeUtils.setElVal(g.pageInputId, _nval);
        SeeUtils.getElObj(g.gridGoId).click();
    }


    if (p.useRpInput) {
        var targetEl = SeeUtils.getElObj(p.id + '_pDiv_page');
        if(typeof(p.noTotal) === "undefined" || typeof(p.noTotal) != "undefined" && p.noTotal == false){
            SeeUtils.prepend("<span>" + $.i18n('validate.grid.over_page.js')
            + "<input type='text' id='" + g.pageInputId + "' name='rp' onblur='" + blurInputEventId + "(event)' maxlength='8' value='" + p.rp + "' class='common_over_page_txtbox' style='width:32px;'/>" +
            "<span class='margin_r_10 total' id='" + p.id + "_total_number'>" + $.i18n('validate.grid.over_page2.js') + "0" + $.i18n('validate.grid.over_page3.js') + "</span>" +
            "<span class='total_page' id='" + p.id + "_total_page'>1</span></span>", targetEl);
        }else{
            SeeUtils.prepend("<span>" + $.i18n('validate.grid.over_page.js')
            + "<input type='text' id='" + g.pageInputId + "' name='rp' onblur='" + blurInputEventId + "(event)' maxlength='8' value='" + p.rp + "' class='common_over_page_txtbox' style='width:32px;'/>"+$.i18n('validate.grid.over_page3.js')+"</span>", targetEl);
        }
    }
}
//添加表格分页
MxtSeeGrid.prototype._addGridPage = function () {
    var p = this.options;
    var g = this;
    // add pager
    if (p.usepager) {
        var pReloadClick = 'pReload_click' + p.id;
        var pFirstClick = 'pFirst_click' + p.id;
        var pPrevClick = 'pPrev_click' + p.id;
        var pNextClick = 'pNext_click' + p.id;
        var pLastClick = 'pLast_click' + p.id;
        var pcontrol_input_keydown = 'pcontrol_input_keydown' + p.id;
        var grid_goClick = 'grid_go_click' + p.id;

        window[pReloadClick] = function () {
            g.populate();
        }
        window[pFirstClick] = function () {
            g.changePage('first');
        }
        window[pPrevClick] = function () {
            g.changePage('prev');
        }
        window[pNextClick] = function () {
            g.changePage('next');
        }
        window[pLastClick] = function () {
            g.changePage('last');
        }
        window[pcontrol_input_keydown] = function (e) {
            if (e.keyCode == 13) g.changePage('input');
        }
        window[grid_goClick] = function () {
            g.changePage('input', true);
        }

        g.gridGoId = SeeUtils.getUUid();
        if(typeof(p.noTotal) === "undefined" || typeof(p.noTotal) != "undefined" && p.noTotal == false){
            var html = '<a  onclick="' + pFirstClick + '()"  class="pFirst pButton common_over_page_btn"><span class="pageFirst"></span></a>' +
            '<a  onclick="' + pPrevClick + '()" class="pPrev pButton common_over_page_btn"><span class="pagePrev"></span></a><span class="pcontrol margin_l_10">'
            + p.pagetext
            + '<input id="' + p.id + '_page_number" onkeydown="' + pcontrol_input_keydown + '(event)" type="text" maxlength="8" size="8" value="1" class="common_over_page_txtbox"/>'
            + p.outof
            + '</span><a onclick="' + pNextClick + '()"  class="pNext pButton common_over_page_btn"><span class="pageNext"></span></a>' +
            '<a  onclick="' + pLastClick + '()" class="pLast pButton common_over_page_btn"><span class="pageLast"></span></a>' +
            '<a  class="common_over_page_btn" style="display:none"><span onclick="' + pReloadClick + '()"  id="' + p.id + '_pReload" class="pReload pButton "><span class="ico16 refresh_16 margin_lr_5">&nbsp;</span></span></a>' +
            '<a onclick="' + grid_goClick + '()"  href="javascript:void(0)" id="' + g.gridGoId + '" class="common_button margin_lr_10 common_over_page_go">GO</a>' +
            '<div class="pGroup"><span class="pPageStat" id="' + p.id + '_pPageStat"></span></div>';
        }else{
            var html = '<a  onclick="' + pFirstClick + '()"  class="pFirst pButton common_over_page_btn"><span class="pageFirst"></span></a>' +
            '<a  onclick="' + pPrevClick + '()" class="pPrev pButton common_over_page_btn"><span class="pagePrev"></span></a><span class="pcontrol margin_l_10">'
            + p.pagetext
            + '<input id="' + p.id + '_page_number" onkeydown="' + pcontrol_input_keydown + '(event)" type="text" maxlength="8" size="8" value="1" class="common_over_page_txtbox"/>'
            + p.outof
            + '</span><a onclick="' + pNextClick + '()"  class="pNext pButton common_over_page_btn"><span class="pageNext"></span></a>' +
            '<a  class="common_over_page_btn" style="display:none"><span onclick="' + pReloadClick + '()"  id="' + p.id + '_pReload" class="pReload pButton "><span class="ico16 refresh_16 margin_lr_5">&nbsp;</span></span></a>' +
            '<a onclick="' + grid_goClick + '()"  href="javascript:void(0)" id="' + g.gridGoId + '" class="common_button margin_lr_10 common_over_page_go">GO</a>' +
            '<div class="pGroup"><span class="pPageStat" id="' + p.id + '_pPageStat"></span></div>';
        }
        //添加分页容器
        var pageHtml = '<div class="pDiv" id="' + p.id + '_pDiv"><div id="' + p.id + '_pDiv_page" class="pDiv2 common_over_page align_right" style="padding-top:10px;padding-bottom:10px;">' + html + '</div></div>';
        SeeUtils.insertAfter(pageHtml, g.bDiv);
        g.pDiv = document.getElementById(p.id + "_pDiv");
        //添加分页的  记录数展示区域
        this._addPageRecordLabel(g, p);
        // add search button
        //基本没用到，不做事件绑定的优化
        this._addSearchitems(g, p);
    }
}
//添加gridtitle标题
MxtSeeGrid.prototype._addGridTitle = function () {
    var p = this.options;
    var g = this;
    if (p.title) {
        function _getToggleBtn() {
            if (p.showTableToggleBtn) {
                return '<div class="ptogtitle" onclick="_tableToggleClick(\'' + p.id + '\',\'' + p.showTableToggleBtn + '\',this)" title="Minimize/Maximize Table"><span></span></div>';
            }
            return '';
        }

        var htmls = [];
        htmls.push("<div class='mDiv'><div class='ftitle'>" + p.title + "</div>" + _getToggleBtn() + "</div>");
        SeeUtils.prepend(htmls.join(""), g.gDiv);
    }
}
//添加表格列显示和隐藏配置
function _initShowToggleClick(p, g) {
    var nBtn_click = 'nBtn' + p.id;
    window[nBtn_click] = function () {
        SeeUtils.addClass(g.nBtn, "set_col");
        SeeUtils.showEl(g.nDiv);
        //yinr  91182
        if (SeeUtils.getElHeight(g.nDiv) >= (SeeUtils.getElHeight(g.bDiv) + SeeUtils.getElHeight(g.pDiv))) {
            SeeUtils.setElHeight(g.nDiv, SeeUtils.getElHeight(g.bDiv) + SeeUtils.getElHeight(g.pDiv) + "px")
        }
        return true;
    }
    return nBtn_click;
}
function _initCheckBoxHideShowCol(p, g) {
//点击显示隐藏的checkbox输入框
    var togCol_Click = 'togColClick' + p.id;
    window[togCol_Click] = function (t) {
        var inputs = SeeUtils.getCheckedInpus(g.nDiv);
        if (inputs.length < p.minColToggle && t.checked == false) {
            t.checked = true;
            return false;
        }

        var labelSpanEl = SeeUtils.getNextEl(SeeUtils.getElObj(t).parentNode);
        if (labelSpanEl != null) {
            labelSpanEl.click();
        }
        if (SeeUtils.getElObj("total_0_" + p.id) != null) {
            SeeUtils.setElWidth("total_0_" + p.id, SeeUtils.getElWidth(p.id + "_hDivBox"));
        }

    }
    return togCol_Click;
}
function _initLableHideShowCol(p, g) {
// 点击显示隐藏的列名称
    var ndcol2_Click = 'ndcol2Click' + p.id;
    window[ndcol2_Click] = function (t) {
        var inputs = SeeUtils.getCheckedInpus(g.nDiv);
        if (inputs.length <= p.minColToggle && SeeUtils.getElByTagAndIndex(SeeUtils.getPrevEle(t), "input", 0).checked) {
            return false;
        }
        var inputVal = SeeUtils.getElByTagAndIndex(SeeUtils.getPrevEle(t), "input", 0).value;

        if (SeeUtils.getElByTagAndIndex(SeeUtils.getPrevEle(t), "input", 0).value == '_reset_width_') {
            //重置查询视图,保存成功后刷新列表
            g.saveCustomize(true, function () {
                window.location.reload();
            });
            t.checked = false;
        } else {
            var colValue = SeeUtils.getElByTagAndIndex(SeeUtils.getPrevEle(t), "input", 0).value;
            return g.toggleCol(colValue);
        }
    }
    return ndcol2_Click;
}
MxtSeeGrid.prototype._addFieldShowHidePanel = function () {
    var g = this;
    var p = this.options;


    g.nBtn = document.createElement('div'); // 鼠标移动到列头上右侧显示的下拉图标div
    // setup cdrops
    g.cdropleft = document.createElement('span');
    g.cdropleft.className = 'cdropleft';
    g.cdropright = document.createElement('span');
    g.cdropright.className = 'cdropright';

    var gh = SeeUtils.getElHeight(g.bDiv);
    var gtop = g.bDiv.offsetTop - 2;


    //设置点击label实现 列的显示和隐藏操作
    var ndcol2_Click = _initLableHideShowCol(p, g);
    //设置 checkbox的点击事件 通过点击实现列的显示和隐藏
    var togCol_Click = _initCheckBoxHideShowCol(p, g);

    if (SeeUtils.getElByTag(g.hDiv, "th").length) {
        var nBtnContent = [];
        var cn = 0;
        SeeUtils.eachByTag(g.hDiv, "th", function (thObj) {
            SeeUtils.eachByTag(thObj, "div", function (divObj) {
                //根据属性 以及 标签获取对应的元素
                var kcol = SeeUtils.eachElsByTagAndProp(g.hDiv, "th", "axis", "col" + cn)[0];
                var chk = 'checked="checked"';
                if (kcol.style.display == 'none') {
                    chk = '';
                }

                var _parent = divObj.parentNode;
                var ishidden = '';
                var _isToggleHideShow = SeeUtils.getAttrEl(_parent, "isToggleHideShow");
                if (_isToggleHideShow == 'false') {
                    ishidden = 'none'
                }

                if(divObj.innerHTML.indexOf('type="checkbox"') > -1){
                    ishidden = 'none'
                }

                if (divObj.innerHTML.indexOf("locking_white_16") > -1||divObj.innerHTML.indexOf('type="checkbox"') > -1) {//图标替换
                    newInnerHTML = divObj.innerHTML.replace(/locking_white_16/g, "locking_16");
                    nBtnContent.push(
                        '<tr style="display:' + ishidden + '"><td class="ndcol1"><input onclick="' + togCol_Click + '(this)" type="checkbox" ' + chk
                        + ' class="togCol" value="' + cn
                        + '" /></td><td class="ndcol2" onclick="' + ndcol2_Click + '(this)">' + newInnerHTML
                        + '</td></tr>'
                    );
                } else {
                    nBtnContent.push(
                        '<tr style="display:' + ishidden + '"><td class="ndcol1"><input onclick="' + togCol_Click + '(this)" type="checkbox" ' + chk
                        + ' class="togCol" value="' + cn
                        + '" /></td><td class="ndcol2" onclick="' + ndcol2_Click + '(this)">' + divObj.innerHTML
                        + '</td></tr>'
                    );
                }
                cn++;
            })
        })

        var nDivId = SeeUtils.getUUid();
        var gnDivHtml = "<div class='nDiv' id='" + nDivId + "' style='display: none;top:" + gtop + "px;marginBottom:" + (gh * -1) + "px'><table cellpadding='0' cellspacing='0'><tbody>" + nBtnContent.join("") + "</tbody></table></div>";
        SeeUtils.prepend(gnDivHtml, g.gDiv);
        g.nDiv = SeeUtils.getElObj(nDivId);

        //是否显示下拉来设置列进行显示隐藏
        if (p.showToggleBtn) {
            //初始化 显示 隐藏 列设置panel的点击事件
            var nBtn_click = _initShowToggleClick(p, g);
            var nBtnId = SeeUtils.getUUid();
            var nBtnHtml = "<div class='nBtn' id='" + nBtnId + "' onclick='" + nBtn_click + "()'><div title='" + $.i18n('grid.togglefield.js') + "'></div></div>"
            SeeUtils.prepend(nBtnHtml, g.gDiv);
            g.nBtn = SeeUtils.getElObj(nBtnId);
        }
    }
}
MxtSeeGrid.prototype.fixHeight = function (newH, g) {
    var g = this;
    var p = this.options;
    newH = false;
    if (!newH)
        newH = SeeUtils.getElHeight(g.bDiv);
    //表格头部 的高度
    var hdHeight = SeeUtils.getElHeight(g.hDiv);

    //设置表列头拖拽条的高度
    SeeUtils.eachByTag(g.cDrag, "div", function (elObj, index) {
        SeeUtils.setElHeight(elObj, newH + hdHeight);
    })

    //列显示隐藏panel的高度
    var nd = parseInt(SeeUtils.getElHeight(g.nDiv));
    //如果是panel的高度大于了 body的高度则设置高度为body的高度
    if (nd > newH) {
        //设置下拉出来的panel 的宽高
        SeeUtils.setElHeight(g.nDiv, newH);
        SeeUtils.setElWidth(g.nDiv, 200);
    } else {
        SeeUtils.setElHeight(g.nDiv, 'auto');
        SeeUtils.setElWidth(g.nDiv, 'auto');
    }

    g.blockHeight = newH;

    SeeUtils.css(g.block, "marginBottom", (newH * -1) + "px");

    var hrH = g.bDiv.offsetTop + newH;
    if (p.height != 'auto' && p.resizable)
        hrH = g.vDiv.offsetTop;

    //如果存在左右拉动条 才相应设置
    if (g.rDiv) {
        //设置左右拉动条的高度
        SeeUtils.setElHeight(g.rDiv, hrH);
    }

    if (p.vChange) {
        var tt = SeeUtils.getElObj(p.vChangeParam.changeTar);
        if (tt != null && g.gDiv.parentNode != null) {
            var h = SeeUtils.getElHeight(g.gDiv.parentNode);
            SeeUtils.css(tt, "overflow", p.vChangeParam.overflow);
            SeeUtils.setElHeight(tt, h - SeeUtils.getElHeight(g.gDiv) - p.vChangeParam.subHeight);
        }
    }
}
//初始化触发元素的相关属性
MxtSeeGrid.prototype._initTableElAttr = function () {
    var p = this.options;
    //	如果该元素是隐藏元素 则进行显示
    SeeUtils.showEl(this.tObj);
    //设置部分属性默认值
    SeeUtils.attrEl(this.tObj, "cellPadding", 0);
    SeeUtils.attrEl(this.tObj, "cellSpacing", 0);
    SeeUtils.attrEl(this.tObj, "border", 0);
    SeeUtils.removeAttrEl("width");
    p.gridClassName = p.id + '_classtag'; // 添加class--点击表头的复选框不能绑定事件,只能通过onclick的方式[表头]<div
}
MxtSeeGrid.prototype.getGridInterface = function (t, p) {
    return this;
}
MxtSeeGrid.prototype.rePosDrag = function () {
    var g = this;
    var p = this.options;
    var hsl = this.hDiv.scrollLeft;
    var cdleft = 0 - hsl;
    // cdleft = 0 - hsl;
    if (hsl > 0)
        cdleft -= Math.floor(p.cgwidth / 2);
    SeeUtils.css(g.cDrag, "top", (g.hDiv.offsetTop + 1)+"px");
    var cdpad = this.cdpad;
    SeeUtils.eachByTag(g.cDrag, "div", function (elObj) {
        SeeUtils.hideEl(elObj);
    })

    var arr = _getVisibleTh(g);
    //aoh each没有for的性能好，故把下面的each代码注释
    //aoh 2016-8-2 OA-98030ie8无流程表单列表字段较多时出现滚动条，点击左右箭头移动时没啥反应，多点击几下就ie卡掉不能操作，ie9正常
    for (var i = 0; i < arr.length; i++) {
        var cdpos = parseInt(SeeUtils.getElWidth(_getVisibleThDivByIndex(g, i)));
        if (cdleft == 0)
            cdleft -= Math.floor(p.cgwidth / 2);
        cdpos = cdpos + cdleft + cdpad;
        if (isNaN(cdpos)) {
            cdpos = 0;
        }
        var cDragDiv = SeeUtils.getElByTagAndIndex(g.cDrag, "div", i);
        if (cDragDiv != null) {
            SeeUtils.css(cDragDiv, "left", cdpos + 'px');
            SeeUtils.showEl(cDragDiv);
        }
        cdleft = cdpos;
    }

    var bTables = SeeUtils.getElByTag(g.bDiv, 'table');
    var hDivBoxs = SeeUtils.getByClass(g.hDiv, "hDivBox");
    var tableObjs = [];
    if (hDivBoxs.length > 0) {
        tableObjs = SeeUtils.getElByTag(hDivBoxs[0], 'table');
    }
    //设置body里面table 的宽度
    if (bTables.length > 0 && tableObjs.length > 0) {
        SeeUtils.css(bTables[0], 'width', SeeUtils.getElWidth(tableObjs[0]));
    }
    //拖动之后更新一下表头的宽度，表头宽度比表格宽度宽20px，20px为下面数据区域滚动条的宽度
    //设置表头里面table的宽度
    if (hDivBoxs.length > 0 && tableObjs.length > 0) {
        SeeUtils.css(hDivBoxs[0], "width", SeeUtils.getElWidth(tableObjs[0]) + 20 + "px")
    }
}
function _getThColInfo(_cols, p, _modes, showWidth, orders) {
    for (var num = 0; num < _cols.length; num++) {
        var t = _cols[num], _colmodes = SeeUtils.getAttrEl(t, "colmode"), v = SeeUtils.isVisible(t);
        if (_colmodes && _colmodes != '') {
            for (var i = 0; i < p.colModel.length; i++) {
                var n = p.colModel[i];
                if (n.name == _colmodes) {
                    // 只记录隐藏的
                    if (!v) {
                        _modes[n.name] = 0;
                    } else {
                        //对于不是隐藏的列表，我们需要保存展示列的实际的值
                        //规则为name + "#" + 用户设置的实际值
                        showWidth.push(n.name + "#" + SeeUtils.getElWidth(t));
                    }
                    //_modes[n.name] = v ? 1 : 0;
                    orders.push(n.name);
                }
            }
        }
    }
}
function _saveInfoToDb(ck, _modes, resetFlag, orders, callBackFn) {
//对展示字段进行处理end
    var upm = new ctpUserPreferenceManager();
    upm.saveGridPreference(ck, _modes, {
        success: function () {
            //对表格进行Ajax访问构造时,将个性化信息一并进行更新，这样不需要与后台数据库进行交互也可以进行获取表格的个性化信息
            //(现状是系统将表格的个性化信息保存在js的全局变量中)
            //OA-96702,支艳强，2016/05/10
            if (getCtpTop().vPortal && getCtpTop().vPortal.customize) {
                var ugpStr = getCtpTop().vPortal.customize.grid_pref;
                //获取相关的配置信息
                var newGridPrefStr = __getPrefStr(ugpStr, ck, resetFlag, orders);
                getCtpTop().vPortal.customize.grid_pref = newGridPrefStr;
            }else{
                //如果不存在 vportal对象 则将缓存信息放到localstorage中
                var ugpStr = __getGridPrefFromLocalStorage();
                var newGridPrefStr = __getPrefStr(ugpStr, ck, resetFlag, orders);
                __saveToLocalStorage(ck,newGridPrefStr);
            }
            if (callBackFn != undefined) {
                callBackFn();
            }
        }
    });
}
MxtSeeGrid.prototype.saveCustomize = function (resetFlag, callBackFn) {
    var g = this;
    var p = this.options;
//参数说明：resetFlag:是否为宽度重置操作,callBackFn:自定义保存成功回调函数
    if (p.customize) {
        var ck = p.customId;
        if (ck) {
            var _cols = SeeUtils.getElByTag(g.hDiv, "th");
            var _modes = {};
            var orders = [];
            var showWidth = [];
            //循环每列 获取相应的列名称和宽度信息
            _getThColInfo(_cols, p, _modes, showWidth, orders);
            //宽度重置处理，重置时仅仅需要保存重置标志，减少与数据库的数据交互量(按照文若的建议进行了优化处理,支艳强(2016/04/14))
            if (resetFlag) {
                _modes = {};
                _modes['resetWidth'] = true;
            } else {
                _modes['__ORDER'] = orders;
            }
            //对展示字段进行处理start(支艳强，2016/04/08):如果是展示的话，则需要把展示字段的长度做一个记录
            //处理后的效果是这样的:
            //"collTemplate_collTemplate_templateSysMgr":{"__ORDER":["id#59","subject#274","type#155","modifyDate#159","auth#218","state#104"]
            // 其中#后面的内容表示字段展示的实际值

            for (var ordersNum = 0; ordersNum < orders.length; ordersNum++) {
                var n = orders[ordersNum];
                var matchVar = n + "#";
                for (var j = 0; j < showWidth.length; j++) {
                    var m = showWidth[j];
                    if (m.substring(0, matchVar.length) == matchVar) {
                        orders[ordersNum] = m;
                    }
                }
            }

            //将信息保存到数据库中
            _saveInfoToDb(ck, _modes, resetFlag, orders, callBackFn);
        }
    }
}
/**
 * 对列进行显示隐藏操作
 * @param cid
 * @param visible
 * @returns {*}
 */
MxtSeeGrid.prototype.toggleCol = function (cid, visible) {
    var g = this;
    var p = this.options;
    var t = this.tObj;
    var ncol = SeeUtils.eachElsByTagAndProp(this.hDiv, "th", "axis", "col" + cid)[0];
    //根据对象 获取相应的序号
    var n = SeeUtils.indexByTag(g.hDiv, "th", ncol);
    //根据属性值获取对象
    var cb = SeeUtils.eachElsByTagAndProp(g.nDiv, "input", "value", cid)[0];
    if (visible == null) {
        visible = ncol.hidden;
    }
    var inputs = SeeUtils.getCheckedInpus(g.nDiv);
    if (inputs.length < p.minColToggle && !visible) {
        return false;
    }
    if (visible) {
        ncol.hidden = false;
        SeeUtils.showEl(ncol);
        cb.checked = true;
    } else {
        ncol.hidden = true;
        SeeUtils.hideEl(ncol);
        cb.checked = false;
    }
    //循环所有行 将相应的列设置为隐藏
    this.hideColByIndex(n, visible);

    this.rePosDrag();
    if (p.onToggleCol) {
        p.onToggleCol(cid, visible);
    }
    this.saveCustomize();
    return visible;
}
/**
 * 隐藏或者显示某列数据
 */
MxtSeeGrid.prototype.hideColByIndex = function (n, visible) {
    var tbodys = SeeUtils.getElByTag(this.tObj, "tbody");
    if (tbodys.length > 0) {
        SeeUtils.eachByTag(tbodys[0], "tr", function (trObj) {
            if (visible) {
                var tdObj = SeeUtils.getElByTagAndIndex(trObj, "td", n);
                SeeUtils.showEl(tdObj);
            } else {
                var tdObj = SeeUtils.getElByTagAndIndex(trObj, "td", n);
                SeeUtils.hideEl(tdObj);
            }
        });
    }
}
MxtSeeGrid.prototype.switchCol = function (cdrag, cdrop) {
    var g = this;
    var p = this.options;

    //循环每一行 进行列位置调换
    var tbodyEl = SeeUtils.getElByTagAndIndex(this.tObj, "tbody", 0);
    SeeUtils.eachByTag(tbodyEl, "tr", function (trObj) {
        var targetEl = SeeUtils.getElByTagAndIndex(trObj, "td", cdrop);
        var curEl = SeeUtils.getElByTagAndIndex(trObj, "td", cdrag);
        if (cdrag > cdrop) {
            SeeUtils.beforeEL(targetEl,curEl);
        } else {
            SeeUtils.afterEL(targetEl,curEl);
        }
    })

    //调换表格里列顺序的同时 调换显示隐藏列控制panel中列的位置
    var targetEl = SeeUtils.getElByTagAndIndex(this.nDiv, "tr", cdrop);
    var curEl = SeeUtils.getElByTagAndIndex(this.nDiv, "tr", cdrag);
    if (cdrag > cdrop) {
        SeeUtils.beforeEL(targetEl,curEl);
    } else {
        SeeUtils.afterEL(targetEl,curEl);
    }

    this.hDiv.scrollLeft = this.bDiv.scrollLeft;
}
MxtSeeGrid.prototype.scroll = function () {
    var g = this;
    var p = this.options;
    this.hDiv.scrollLeft = this.bDiv.scrollLeft;
    this.rePosDrag();
}
//创建加载数据时候的蒙层
MxtSeeGrid.prototype._addGblock = function () {
    var p = this.options;
    var g = this;
    var gh = SeeUtils.getElHeight(g.bDiv);
    var gtop = g.bDiv.offsetTop - 2;
    var gBlockId = SeeUtils.getUUid();
    var blockHtmls = "<div class='gBlock' id='" + gBlockId + "' style='height:" + gh + "px;" +
        "opacity:" + p.blockOpacity + ";" +
        "filter:alpha(opacity=" + p.blockOpacity + ");" +
        "z-index:1;left:0px;top:" + (gtop - 2) + "px;" +
        "margin-bottom:" + (gh * -1) + "px;width: " + SeeUtils.getElWidth(g.bDiv) + "px;position:relative;'></div>";
    SeeUtils.prepend(blockHtmls, this.gDiv);
    g.block = document.getElementById(gBlockId);
}
MxtSeeGrid.prototype.populate = function (paras) {
    var g = this;
    var p = this.options;
    // get latest data
    if (this.loading) {
        return true;
    }
    if (p.onSubmit) {
        var gh = p.onSubmit();
        if (!gh) {
            return false;
        }
    }
    this.loading = true;

    if(SeeUtils.getElObj(p.id + "_pPageStat")!=null){
        SeeUtils.getElObj(p.id + "_pPageStat").innerHTML = p.procmsg;
    }
    SeeUtils.addClass(p.id + "_pReload", "loading");

    SeeUtils.css(g.block, "top", g.bDiv.offsetTop + "px")

    if (p.hideOnSubmit) {
        this._addGblock();
    }

    if (SeeUtils.isOpera) {
        SeeUtils.css(this.tObj, "visibility", "hidden");
    }
    if (!p.newp) {
        p.newp = 1;
    }
    if (p.page > p.pages) {
        p.page = p.pages;
    }
    if (paras) {
        p.params = paras;
        if (paras.newp) {
            p.newp = paras.newp
        }
        if (paras.page) {
            p.newp = paras.page;
        } //OA-87949
    }

    var fp = {
        page: p.newp,
        size: p.rp,
        sortField: p.sortname,
        sortOrder: p.sortorder
    };
    if (p.onCurrentPageSort) { //如果只对当页数据排序，翻页的时候不排序
        fp.sortField = undefined;
        fp.sortOrder = undefined;
    }
    if (p.managerName && p.managerMethod && window[p.managerName]) {
        var callerResponder = new CallerResponder();
        callerResponder.success = function (fpi) {
            if (fpi == null) { //OA-79694   hr修改自己的用户名和密码，确定的时候报js
                return;
            }
            fpi.rows = fpi.data;
            g.addData(fpi);
        };
        //如果发生异常 则移除loading 并且设置loaing为false
        var oldError=callerResponder.error;
        callerResponder.error = function (request, settings, e) {
            SeeUtils.removeEl(g.block);
            g.loading=false;
            //清除以前查询出来的数据
            g.addData([]);
            oldError(request, settings, e);
        };
        //如果执行完了 成功与错误都执行该方法
        if (g.closeError) {
            callerResponder.complete = function () {
                SeeUtils.removeEl(g.block);
            };
        }

        var _bs = new window[p.managerName]();
        _bs[p.managerMethod](fp, p.params, callerResponder);

    } else if (p.datas != null) {
        g.addData(p.datas);
    }
}
//执行表格查询操作
MxtSeeGrid.prototype.doSearch = function () {
    var g = this;
    var p = this.options;
    //获取查询输入框值
    p.query = SeeUtils.getElVal(p.id + "_search_input");
    var selectTypeEl = SeeUtils.eachElsByTagAndProp(g.sDiv, "select", "name", "qtype")[0];
    if (selectTypeEl != null) {
        p.qtype = SeeUtils.getElVal(selectTypeEl);
        p.params[p.qtype] = p.query;
        p.newp = 1;
        this.populate();
    }

}
MxtSeeGrid.prototype.changePage = function (ctype, fc) {
    var g = this;
    var p = this.options;
    // change page
    // ah OA-104046【风暴测试206】表单应用流水号管理，流水号分页显示时，点击第一页的列头降序排列，切换到第二页，列头降序标志还在，但是顺序是乱的
    // 点击翻页后，隐藏排序的小图标
    //如果存在排序样式的时候  点击翻页需要移除相应的样式信息
    SeeUtils.eachByClass(this.hDiv, 'sdesc', function (elObj) {
        SeeUtils.removeClass(elObj, 'sdesc');
    });
    SeeUtils.eachByClass(this.hDiv, 'sasc', function (elObj) {
        SeeUtils.removeClass(elObj, 'sasc');
    });
    //noTotal:true的时候，可能会翻出空白页，这里不能拦截
    if(typeof(p.noTotal) === "undefined" || typeof(p.noTotal) != "undefined" && p.noTotal == false){
        if (p.total == 0) {
            return false;
        }
    }
    if (this.loading) {
        return true;
    }
    switch (ctype) {
        case 'first':
            p.newp = 1;
            break;
        case 'prev':
            if (p.page > 1) {
                p.newp = parseInt(p.page) - 1;
            }else{// 第一页
                p.newp = 1;
            }
            break;
        case 'next':
            if(typeof(p.noTotal) === "undefined" || typeof(p.noTotal) != "undefined" && p.noTotal == false){
                if (p.page < p.pages) {
                    p.newp = parseInt(p.page) + 1
                }else{// 最后一页
                    p.newp = p.pages;
                }
            }else{
                p.newp = parseInt(p.page) + 1
            }
            break;
        case 'last':
            p.newp = p.pages;
            break;
        case 'input':
            var nv = parseInt(SeeUtils.getElVal(p.id + "_page_number"));
            if (isNaN(nv)) {
                nv = 1;
            }
            if (nv < 1) {
                nv = 1;
            } else if (nv > p.pages) {
                nv = p.pages;
            }
            SeeUtils.setElVal(p.id + "_page_number", nv);
            p.newp = nv;
            break;
    }

    p.rpNew = SeeUtils.getElVal(g.pageInputId);
    if (p.rpNew > p.rpMaxSize) {
        p.rpNew = p.rpMaxSize;
        SeeUtils.setElVal(g.pageInputId, p.rpNew);
    }
    //noTotal:true的时候，可能会翻出空白页，这里不能拦截
    if(typeof(p.noTotal) === "undefined" || typeof(p.noTotal) != "undefined" && p.noTotal == false){
        if ((p.newp == p.page) && (p.rp == p.rpNew) && !fc) {
            return false;
        }
    }else if(p.total == 0 && ctype == "next"){
        return false;
    }
    p.rp = p.rpNew;
    if (p.onChangePage) {
        p.onChangePage(p.newp);
    } else {
        this.populate();
    }
}
MxtSeeGrid.prototype.addRowProp = function () {
    var g = this;
    var p = this.options;
    var _noClickType = true;

    var grid_trClick = "trClick_" + p.id;
    window[grid_trClick] = function (e, trObj) {
        var tObj = $(trObj);
        var obj = (e.target || e.srcElement);
        // 表示点击的checkbox这列
        if(obj.tagName==='DIV'&&obj.children.length===1&&obj.children[0].type==='checkbox'){
            obj=obj.children[0];
            // obj.checked=!obj.checked;
            if(obj.click!=null){
                obj.click();
            }
        }
        if (obj.href || obj.type) {
            if (obj.type == 'checkbox' || obj.type == 'radio') {
                var _checked = obj.checked;
                if (_checked) {
                    SeeUtils.eachBySiblings(trObj,function(elObj){
                        SeeUtils.removeClass(elObj,'trSelected');
                    })
                    SeeUtils.addClass(trObj, "trSelected");
                } else {
                    SeeUtils.removeClass(trObj, "trSelected");
                }
            }
            return true;
        }
        //如果是单选 而不是多选
        if (p.singleSelect && !g.multisel) {
            SeeUtils.eachBySiblings(trObj,function(elObj){
                SeeUtils.removeClass(elObj,'trSelected');
            });

            if ($(obj).find('input[gridrowcheckbox]').size() == 0) { //过滤点击含checkbox的td
                tObj.siblings().find("input[gridrowcheckbox]").prop("checked", false);
            }
            SeeUtils.addClass(trObj, "trSelected");
            if (SeeUtils.hasClass(trObj, "trSelected")) {
                var _ch = tObj.find("input[gridrowcheckbox]");
                if (_ch.prop('disabled') == false) {
                    _ch.prop("checked", true);
                }
            } else {
                tObj.find("input[gridrowcheckbox]").prop("checked", false);
            }
        }

        if (p.vChange) {
            if (_noClickType) {
                if (SeeUtils.getElObj(p.vChangeParam.changeTar) != null && p.vChangeParam.autoResize) {
                    p.UMD = "middle";
                    g.resizeGridUpDown(p.UMD)
                }
                var tar = tObj.find("input[type=checkbox]");
                if (tar.size() > 0) {
                    try {
                        tar.focus();
                    } catch (e) {
                    }
                }
                var tar2 = tObj.find("input[type=radio]");
                if (tar2.size() > 0) {
                    try {
                        tar2.focus();
                    } catch (e) {
                    }
                }
            } else {
                _noClickType = true;
            }
        }

    }

    var grid_trMousedown = "trMousedown_" + p.id;
    window[grid_trMousedown] = function (e, t) {
        if (e.shiftKey) {
            SeeUtils.toggleClass(t, 'trSelected');
            g.multisel = true;
            $(t).focus();
            $(g.gDiv).noSelect();
        }
        if (e.ctrlKey) {
            SeeUtils.toggleClass(tObj, 'trSelected');
            g.multisel = true;
            $(t).focus();
        }

    }

    var grid_trMouseup = "trMouseup_" + p.id;
    window[grid_trMouseup] = function (e) {
        if (g.multisel && !e.ctrlKey) {
            g.multisel = false;
            $(g.gDiv).noSelect(false);
        }

    }

    var grid_trMouseenter = "trMouseenter_" + p.id;
    window[grid_trMouseenter] = function (e, t) {
        if (g.multisel && e.shiftKey) {
            SeeUtils.toggleClass(t, 'trSelected');
        }
    }

    var grid_trMouseleave = "trMouseleave_" + p.id;
    window[grid_trMouseleave] = function (e, t) {
        if (g.multisel && e.shiftKey) {
            SeeUtils.toggleClass(t, 'trSelected');
        }
    }


}
// Add title attribute to div if cell contents is truncated
MxtSeeGrid.prototype.resizeGrid = function (stepArr,resizeType) {
    var g = this;
    var p = this.options;
    switch (resizeType) {
        case "up":
            SeeUtils.setElHeight(g.bDiv,stepArr[0]);
            SeeUtils.setElHeight(p.vChangeParam.changeTar,stepArr[2] + 53);
            break;
        case "middle":
            SeeUtils.setElHeight(g.bDiv,stepArr[1]);
            SeeUtils.setElHeight(p.vChangeParam.changeTar,stepArr[2] - stepArr[1]);
            break;
        case "down":
            SeeUtils.setElHeight(g.bDiv,stepArr[2]);
            SeeUtils.setElHeight(p.vChangeParam.changeTar,0);
            break;
        case "auto"://列表区域最大化
            SeeUtils.setElHeight(g.bDiv,stepArr);
            SeeUtils.setElHeight(p.vChangeParam.changeTar,0);
            break;
        default:
            //原组件  通过resizeGrid(200)来设置区域1的高度
            SeeUtils.setElHeight(g.bDiv,stepArr);

            var userpagerH = 0;
            var resizableH = 0;
            var tableHeadH = 36;
            p.usepager ? userpagerH += 53 : null;
            p.resizable ? resizableH += 11 : null;
            //计算出下面区域2的高度
            var _gridDetailHeight = SeeUtils.getElHeight(p.parentId) - resizableH - userpagerH - tableHeadH - stepArr;
            SeeUtils.setElHeight(p.vChangeParam.changeTar,_gridDetailHeight);
            break;
    }
}
MxtSeeGrid.prototype.resizeGridUpDown = function (upDown) {
    var g = this;
    var p = this.options;
    setTimeout(function () {
        var userpagerH = 0;
        var resizableH = 0;
        var tableHeadH = 36;//表头的高度
        p.usepager ? userpagerH += 53 : null;
        p.resizable ? resizableH += 11 : null;
        var stepArr = [0, (SeeUtils.getElHeight(p.parentId) - userpagerH - resizableH) / 100 * 35, SeeUtils.getElHeight(p.parentId) - resizableH - userpagerH - tableHeadH];
        if (upDown == 'up') {
            if (p.usepager) {
                SeeUtils.hideEl(g.pDiv);
            }
            g.resizeGrid(stepArr,'up');
        } else if (upDown == 'middle') {
            SeeUtils.showEl(g.pDiv);
            g.resizeGrid(stepArr,'middle');
        } else if (upDown == 'down') {
            SeeUtils.showEl(g.pDiv);
            g.resizeGrid(stepArr,'down');
        } else {
            return;
        }
        p.UMD = upDown;
    }, 200);
}
//获取表格头部 第一行的对象
function _getHeaderThTrObj(g) {
    var theads = SeeUtils.getElByTag(g.hDiv, "thead");
    if (theads.length > 0) {
        var trObjs = SeeUtils.getElByTag(theads[0], "tr");
        if (trObjs.length > 0) {
            return trObjs[0];
        }
    }
    return null;
}
function _initColInfoByTheadTh(g, p, widths, aligns, tdAttributes) {
    var cc = 0;
    //获取表头tr对象
    var thTrObj = _getHeaderThTrObj(g);
    if (thTrObj != null) {
        SeeUtils.eachByTag(thTrObj, "th", function (thObj) {
            var tdAttr = '';
            var width = SeeUtils.getElByTagAndIndex(thObj, "div", 0).style.width;
            var align = thObj.align;
            var abbr = SeeUtils.getAttrEl(thObj, "abbr");
            if (p.sortname == abbr && p.sortname) {
                tdAttr += 'class="sorted" ';
            }
            tdAttr += 'align="' + align + '" ';
            tdAttr += 'abbr="' + abbr + '"';
            //如果是隐藏列
            if (thObj.hidden) {
                tdAttr += 'style="display:none"';
            }
            widths.push(width);
            aligns.push(align);
            tdAttributes.push(tdAttr);
            cc++;

        })
    }
    return cc;
}
function _addRowByData(data, p, cc, aligns, widths, tdAttributes, tbodyInnerHtml) {
    for (var i = 0; i < data.rows.length; i++) {
        var row = data.rows[i];
        var tr = {};
        if (row.name) {
            tr.name = row.name.escapeHTML(false);
        }
        if (row.color) {
            tr.style = 'background:' + row.color;
        } else {
            if (i % 2 && p.striped)
                tr['class'] = 'erow';
        }

        if (row.disable)
            tr['class'] = tr['class'] + ' graytr';
        if (row[p.idProperty]) {
            tr.id = 'row' + row[p.idProperty];
        }

        var trAttrs = [];
        //此处含有业务参数 暂不替换jquery
        $.each(tr, function (k, v) {
            trAttrs.push(k);
            trAttrs.push("=");
            trAttrs.push('"' + v + '"')
        });
        var trInnerHTML = [];

        for (var j = 0; j < cc; j++) {

            var divd,
                clm = p.colModel[j];
            // If each row is the object itself (no 'cell' key)
            if (typeof row.cell == 'undefined') {
                divd = row[clm.name];
                if (divd && typeof divd == 'string') {
                    divd = divd.escapeHTML(true, false);
                }
            } else {
                // If the json elements aren't named (which is typical), use
                // numeric order
                if (typeof row.cell[j] != "undefined") {
                    divd = (row.cell[j] != null) ? row.cell[j] : ''; // null-check
                } else {
                    divd = row.cell[clm.name];
                }
            }
            if (divd && clm.cutsize)
                divd = divd.substring(0, clm.cutsize);
            if (clm.type == 'checkbox') {
                divd = "<input type=\"checkbox\" gridRowCheckBox=\""
                    + p.gridClassName + "\" class='noClick' onclick='_noClickType = false;' row=\"" + i + "\" value=\"" + divd + "\"/>";
            } else if (clm.type == 'radio') {
                divd = "<input type=\"radio\" gridRowCheckBox=\""
                    + p.gridClassName + "\" class='noClick' onclick='_noClickType = false;' row=\"" + i + "\" value=\"" + divd + "\" name=\"gridradio\"/>";
            } else if (p.render) {
                var mj = p._modesMap ? p._modesMap[j] : j;
                // divd = p.render(divd, row, i, mj, clm);
                divd = p.render(divd, row, i, Number(mj), clm);//点击排序之后mj返回的是字符串，这里转一下
            }
            // resolve the bug of IE9, that will consider 0 equals ''
            if (divd != 0 && (divd === '' || divd === null || typeof divd === 'undefined')) {
                divd = '&nbsp;';
            }
            //resole null value-------yinr----OA-95010
            if (divd === "") {
                divd = '&nbsp;';
            }
            var codecfg = (p.colModel[j].codecfg);
            var tdiv = '<div class="text_overflow' + (codecfg ? ' codecfg' : '') + '"'
                + (codecfg ? ' codecfg="' + codecfg + '"' : '')
                + ' style="text-align:' + aligns[j]
                + ';width:' + widths[j] + ''
                + ((p.nowrap == false) ? ';white-space:normal' : '')
                + '">'
                + divd + '</div>';

            trInnerHTML.push('<td ' + tdAttributes[j] + '>' + tdiv + '</td>');
        }

        //生成之前匹配的方法名
        var grid_trClick = "trClick_" + p.id;
        var grid_trMousedown = "trMousedown_" + p.id;
        var grid_trMouseup = "trMouseup_" + p.id;
        var grid_trMouseenter = "trMouseenter_" + p.id;
        var grid_trMouseleave = "trMouseleave_" + p.id;

        tbodyInnerHtml.push('<tr onclick="' + grid_trClick + '(event,this)" onmousedown="' + grid_trMousedown + '(event,this)" onmouseup="' + grid_trMouseup + '(event)" onmouseenter="' + grid_trMouseenter + '(event,this)" onmouseleave="' + grid_trMouseleave + '(event,this)" ' + trAttrs.join(" ") + '>' + trInnerHTML.join('') + '</tr>');

    }
}
function _addCellTextTitle(t) {
    SeeUtils.eachByTag(t, "div", function (elObj) {
        var text = SeeUtils.trim(elObj.innerText);
        if (text.length > 0) {
            SeeUtils.attrEl(elObj, 'title', text);
        }
    })
}
function _addRowClickEvent(p, t) {
    if (p.click) {
        var grid_Click = "click_" + p.id;
        window[grid_Click] = function (e) {
            var target = e.target || e.srcElement;
            // 表示点击的checkbox这列
            if(target.tagName==='DIV'&&target.children.length===1&&target.children[0].type==='checkbox'){
                target=target.children[0];
            }
            if (target.className.indexOf("noClick") == -1) {
                var tdObj=SeeUtils.closestByTagName(target,"td");
                if(tdObj==null){
                    return;
                }
                var trObj = tdObj.parentNode;
                if (SeeUtils.hasClass(trObj,"graytr")){
                    return; //如果该行置灰状态，单行事件不可用
                }
                var col = SeeUtils.indexByTag(trObj,"td",tdObj);
                var row = SeeUtils.indexByTag(t,"tr",trObj);
                if (row == -1)
                    row = 0;
                clearTimeout(timer);
                clearTimeout(grayTimer);
                if (SeeUtils.isIE8 || SeeUtils.isIE7) {
                    p.click(p.datas.rows[row], row, col);
                    timer = setTimeout(function () {
                        SeeUtils.addClass(trObj,"graytr");
                    }, 200);
                } else {
                    timer = setTimeout(function () {
                        if (p.datas.rows[row]) {
                            p.click(p.datas.rows[row], row, col);
                            SeeUtils.addClass(trObj,"graytr");
                        }
                    }, 400);
                }
                grayTimer = setTimeout(function () {
                    SeeUtils.removeClass(trObj,"graytr");
                }, 400);
            }
        }
        SeeUtils.attrEl(t, "onclick", grid_Click + '(event)');
    }
}
function _addRowDbClickEvent(p, t) {
    if (p.dblclick) {
        var grid_DbClick = "Dbclick_" + p.id;
        window[grid_DbClick] = function (e) {
            var target = e.target || e.srcElement;
            if (target.className.indexOf("noClick") == -1) {
                var tdObj=SeeUtils.closestByTagName(target,"td");
                if(tdObj==null){
                    return;
                }
                var trObj = tdObj.parentNode;
                if (SeeUtils.hasClass(trObj,"graytr")){
                    return; //如果该行置灰状态，单行事件不可用
                }
                var col = SeeUtils.indexByTag(trObj,"td",tdObj);
                var row = SeeUtils.indexByTag(t,"tr",trObj);
                if (row == -1)
                    row = 0;
                clearTimeout(timer);
                clearTimeout(grayTimer);
                if (p.datas.rows[row]) {
                    p.dblclick(p.datas.rows[row], row, col);
                }
            }
        }
        SeeUtils.attrEl(t, "ondblclick", grid_DbClick + '(event)');
    }
}
function _unSelAllCheckBox(g) {
//全选后翻页 全选checkbox 依然勾选
    SeeUtils.eachByClass(g.hDiv, 'grid_checkbox', function (elObj) {
        SeeUtils.eachElsByTagAndProp(elObj, "input", "type", "checkbox", function (checkEl) {
            checkEl.checked = false;
        })
    });
}
MxtSeeGrid.prototype.addData = function (data) {
    //如果this.bDiv 存在滚动 则滚动到最头部
   try{
       if(this.bDiv.scrollTop>0){
           this.bDiv.scrollTop=0;
       }
   }catch (e) {

   }
    this.bDiv
    var g = this;
    var p = this.options;
    var t = this.tObj;
    // parse data
    //取消全选按钮的 选中状态
    _unSelAllCheckBox(g);

    data = $.extend({
        rows: [],
        page: 0,
        total: 0
    }, data);
    p.datas = data;

    if (p.preProcess) {
        data = p.preProcess(data);
    }

    SeeUtils.eachByClass(this.pDiv, "pReload", function (elObj) {
        SeeUtils.removeClass(elObj, "loading");
    })

    this.loading = false;
    if (!data) {
        if(SeeUtils.getElObj(p.id + "_pPageStat")!=null){
            SeeUtils.getElObj(p.id + "_pPageStat").innerHTML = p.procmsg;
        }
        return false;
    }
    if (!data.total)
        data.total = data.rows.length;
    p.total = data.total;

    //p.total表示记总数
    if (p.total == 0) {
        $('tr, a, td, div', t).unbind();
        $(t).empty();
        p.pages = 1;
        p.page = 1;
        this.buildpager();
        if(SeeUtils.getElObj(p.id + "_pPageStat")!=null){
            SeeUtils.getElObj(p.id + "_pPageStat").innerHTML = p.procmsg;
        }
        if (g.block != null > 0) {
            SeeUtils.removeEl(g.block);
        }

        SeeUtils.appendTo("<div id='total_0_" + p.id + "'style='width:"+SeeUtils.getElWidth(p.id + "_hDivBox")+"px;height:1px'></div>",this.bDiv);
        if (p.onNoDataSuccess) {
            p.onNoDataSuccess(this);
        }
        if (p.callBackTotle) {
            p.callBackTotle(p.total);
        }
        this.rePosDrag();
        return false;
    } else {
        var _totle0 = SeeUtils.getElObj("total_0_" + p.id);
        if (_totle0 != null) {
            SeeUtils.removeEl(_totle0);
        }
    }
    p.pages = Math.ceil(p.total / p.rp);

    p.page = data.page;

    if (data.params)
        p.params = data.params;

    this.buildpager();
    // build new body
    var tbodyInnerHtml = [];
    var widths = [];
    var aligns = [];
    var tdAttributes = [];
    //初始化每列相关的属性 根据表头的th对象
    var cc = _initColInfoByTheadTh(g, p, widths, aligns, tdAttributes);
    //根据数据 组装记录信息
    _addRowByData(data, p, cc, aligns, widths, tdAttributes, tbodyInnerHtml);

    var tbodyHtml = '<tbody id="list" class="hand">' + tbodyInnerHtml.join('') + "</tbody>";
    if ((SeeUtils.isIE && !SeeUtils.isIE10) || (SeeUtils.isIE && document.documentMode == 8) || (SeeUtils.isIE10 && document.documentMode == 9)) {
        SeeUtils.innerHTMl(this.tObj,tbodyHtml)
        try {
            if (document.selection) {
                if (document.selection.createRange()) {
                    var mgr = document.selection.createRange();
                    mgr.collapse(true);
                    mgr.select();
                }
            }
        } catch (ex) {
        }
    } else {
        // safari、firefox、chrome、IE 10最大程度保证性能
        t.innerHTML = tbodyHtml;
    }
    //为每个单元格字符串添加相应的title信息
    _addCellTextTitle(t);
    //为每行添加单击事件
    _addRowClickEvent(p, t);
    //为每行添加双击事件
    _addRowDbClickEvent(p, t);

    this.addRowProp();
    this.rePosDrag();
    tbody = null;
    data = null;
    i = null;
    if (p.onSuccess) {
        p.onSuccess(this);
    }
    if (p.callBackTotle) {
        p.callBackTotle(p.total);
    }
    if (p.hideOnSubmit) {
        SeeUtils.removeEl(g.block);
    }
    this.hDiv.scrollLeft = this.bDiv.scrollLeft;
    if(p.usepager){
        // 预留纵向滚动条的宽度
        SeeUtils.setElWidth(p.id + "_hDivBox", parseFloat(SeeUtils.getElWidth(t)) + 20)
    }else{
        // 不需要预留纵向滚动条的宽度
        SeeUtils.setElWidth(  p.id + "_hDivBox", parseFloat(SeeUtils.getElWidth(t)) )
    }

    if (SeeUtils.isOpera) {
        SeeUtils.css(this.tObj, "visibility", "visible");
    }
    $(t).codetext();
}
//切换排序方式
MxtSeeGrid.prototype.changeSort = function (th) {
    var g = this;
    var p = this.options;
    // change sortorder
    if (this.loading) {
        return true;
    }
    SeeUtils.hideEl(g.nDiv);
    SeeUtils.hideEl(g.nBtn);

    var sortByname;
    p.onCurrentPageSort == true ? sortByname = SeeUtils.getAttrEl(th, "colmode") : sortByname = SeeUtils.getAttrEl(th, "abbr");
    p.sortType = SeeUtils.getAttrEl(th, "sortType");
    if (p.sortname == sortByname) {
        if (p.sortorder == 'asc') {
            p.sortorder = 'desc';
        } else {
            p.sortorder = 'asc';
        }
    } else {
        p.sortorder = 'asc';
    }

    SeeUtils.addClass("sorted");
    SeeUtils.eachBySiblings(th, function (elObj) {
        SeeUtils.removeClass(elObj, 'sorted');
    });

    SeeUtils.eachByClass(this.hDiv, "sdesc", function (elObj) {
        SeeUtils.removeClass(elObj, 'sdesc');
    })

    SeeUtils.eachByClass(this.hDiv, "sasc", function (elObj) {
        SeeUtils.removeClass(elObj, 'sasc');
    })

    SeeUtils.eachByTag(th, "div", function (elObj) {
        SeeUtils.addClass(elObj, 's' + p.sortorder);
    })

    p.sortname = sortByname;
    if (p.onCurrentPageSort) { //只对当前页的数据进行排序
        this.setSort(p.sortname, p.sortorder, p.sortType);
    } else {
        this.populate();
    }
    if (p.onChangeSort) {
        p.onChangeSort(p.sortname, p.sortorder, p.sortType);
    }
}
MxtSeeGrid.prototype.buildpager = function () {
    var g = this;
    var p = this.options;
    // rebuild pager based on new properties
    SeeUtils.setElVal(p.id + "_page_number", p.page);
    if(SeeUtils.getElObj(p.id + "_total_page")!=null && (typeof(p.noTotal) === "undefined" || typeof(p.noTotal) != "undefined" && p.noTotal == false) ){
        SeeUtils.getElObj(p.id + "_total_page").innerHTML = $.i18n('validate.grid.over_page4.js') + p.pages + $.i18n('validate.grid.over_page5.js');
    }

    var r1 = (p.page - 1) * p.rp + 1;
    var r2 = r1 + p.rp - 1;
    if (p.total < r2) {
        r2 = p.total;
    }
    var stat = p.pagestat;
    stat = stat.replace(/{from}/, r1);
    stat = stat.replace(/{to}/, r2);
    stat = stat.replace(/{total}/, p.total);
    if(SeeUtils.getElObj(p.id + "_pPageStat")!=null){
        SeeUtils.getElObj(p.id + "_pPageStat").innerHTML = stat;
    }
    //$('.total', this.pDiv).html("条/共" + p.total + "条记录");
    if(SeeUtils.getElObj(p.id + "_total_number")!=null && (typeof(p.noTotal) === "undefined" || typeof(p.noTotal) != "undefined" && p.noTotal == false) ){
        SeeUtils.getElObj(p.id + "_total_number").innerHTML = $.i18n('validate.grid.over_page2.js') + p.total + $.i18n('validate.grid.over_page3.js');
    }

}
MxtSeeGrid.prototype.setSort = function (name, order, type) {
    var g = this;
    var p = this.options;
    //当前页面数据排序
    if ($.trim(p.datas) == "") { //判断没有数据，直接返回
        return;
    }
    if (!p.datas.rows.sort) {
        return;
    }
    p.datas.rows.sort(function (a, b) {
        var valueA = a[name]; //默认按字符串排序
        var valueB = b[name];
        if (type == "date") { //日期排序
            valueA = Date.parse(valueA);
            valueB = Date.parse(valueB);
        }
        if (type == 'number') { //数字排序
            valueA = Number(valueA);
            valueB = Number(valueB);
        }
        if (type == "string") {
            if (valueA == null) {
                valueA = "";
            } else {
                valueA = "" + valueA;
            }
            if (valueB == null) {
                valueB = "";
            } else {
                valueB = "" + valueB;
            }
            var _f = valueA.localeCompare(valueB);
            if (order == "desc") { //降序
                return _f;
            } else {
                return _f * -1;
            }
        } else {
            if (order == "desc") { //降序
                if (valueA < valueB)
                    return -1;
                if (valueA > valueB)
                    return 1;
                return 0;
            }
            if (order == "asc") { //升序
                if (valueA > valueB)
                    return -1;
                if (valueA < valueB)
                    return 1;
                return 0;
            }
        }

    });
    this.addData(p.datas); //重新显示排序后的列表;
},
    MxtSeeGrid.prototype.getCellDim = function (obj) { // get cell prop for editable event
        var g = this;
        var p = this.options;
        var ht = parseInt(SeeUtils.getElHeight(obj));
        var pht = parseInt(SeeUtils.getElHeight(obj.parentNode));
        var wt = parseInt(obj.style.width);
        var pwt = parseInt(SeeUtils.getElWidth(obj.parentNode));
        var top = obj.offsetParent.offsetTop;
        var left = obj.offsetParent.offsetLeft;
        var pdl = parseInt(SeeUtils.getCss(obj, "paddingLeft"));
        var pdt = parseInt(SeeUtils.getCss(obj, "paddingTop"));
        return {
            ht: ht,
            wt: wt,
            top: top,
            left: left,
            pdl: pdl,
            pdt: pdt,
            pht: pht,
            pwt: pwt
        };
    },
    MxtSeeGrid.prototype.combo_resetIndex = function (selObj) {
        if (this.combo_flag) {
            selObj.selectedIndex = 0;
        }
        this.combo_flag = true;
    },
    MxtSeeGrid.prototype.combo_doSelectAction = function (selObj) {
        var g = this;
        var p = this.options;
        eval(selObj.options[selObj.selectedIndex].value);
        selObj.selectedIndex = 0;
        this.combo_flag = false;
    }
MxtSeeGrid.prototype.getSelectRows = function () {
    var g = this;
    var p = this.options;
    var t = this.tObj;

    //var checkedObjs=[];
    //SeeUtils.eachElsByTagAndProp(this.tObj,"input","gridRowCheckBox",p.gridClassName,function(checkObj){
    //    if(checkObj.checked){
    //        checkedObjs.push(checkObj);
    //    }
    //});
    var inputs = $(t).find('input[gridRowCheckBox=' + p.gridClassName + ']:checked');
    if (inputs.length <= 0) {
        $(t).find('input[gridRowCheckBox=' + p.gridClassName + ']').each(function () {
            var checked = $(this).attr("checked");
            if (checked) {
                inputs.push($(this));
            }
        })
    }
    var rows = [];
    inputs.each(function () {
        var index = SeeUtils.getAttrEl(this, 'row');
        rows.push(p.datas.rows[index]);
    });
    return rows;
};
MxtSeeGrid.prototype.getPageRows = function () {
    var g = this;
    var p = this.options;
    var rows = [];
    //循环每行数据
    SeeUtils.eachElsByTagAndProp(this.tObj,"input","gridRowCheckBox",p.gridClassName,function(checkObj){
        var index = SeeUtils.getAttrEl(checkObj, 'row');
        rows.push(p.datas.rows[index]);
    });
    return rows;
}
MxtSeeGrid.prototype.resizeGridAuto = function () {
    var g = this;
    var p = this.options;
    if (p.parentId != null) {
        var userpagerH = 0;
        var tableHeadH = 36;//表头的高度
        p.usepager ? userpagerH += 53 : null;
        p.resizable ? userpagerH += 11 : null;
        this.resizeGrid(SeeUtils.getElHeight(p.parentId) - userpagerH - tableHeadH,'auto');
        SeeUtils.setElWidth(p.id, SeeUtils.getElWidth(p.parentId));
    } else {
        SeeUtils.setElWidth(p.id, p.width);
        this.resizeGrid(p.height - p.usepager,'auto');
    }
}
//初始化表格容器
MxtSeeGrid.prototype._initGridContainer = function () {
    var p = this.options;
    var g = this;
    //表格容器 鼠标移入事件
    var gDiv_mouseenter = 'gDiv_Mouseenter' + p.id;
    window[gDiv_mouseenter] = function () {
        SeeUtils.hideEl(g.nDiv);
        SeeUtils.hideEl(g.nBtn);
    }
    //根据变量 获取额外需要追究的class信息
    function _getOtherClass() {
        var otherClass = '';
        if (SeeUtils.isIE) {
            otherClass += ' ie';
        }
        if (p.novstripe) {
            otherClass += ' novstripe';
        }
        return otherClass;
    }

    var htmls = "<div id='" + p.id + "' onmouseenter='" + gDiv_mouseenter + "()' class='" + ( p.dataTable ? 'flexigrid dataTable' : 'flexigrid') + " " + _getOtherClass() + "'></div>";
    //插入对象
    SeeUtils.insertBefore(htmls, this.tObj);
    var gridDivObj = document.getElementById(p.id);
    if (p.width != 'auto') {
        if(isNaN(p.width)) {
            gridDivObj.style.width = p.width;
        }else{
            gridDivObj.style.width = p.width + 'px';
        }
    }
    gridDivObj.appendChild(this.tObj);
    this.gDiv = gridDivObj;
    return this.gDiv;
}
//添加表格header
MxtSeeGrid.prototype._addGridHeader = function () {
    var g = this;
    var p = this.options;
    var headerDiv = "<div class='hDiv' id='" + p.id + "_hDiv'><div class='hDivBox' id='" + p.id + "_hDivBox' style='width:100%'><table id='" + p.id + "_h_table' cellPadding='0' cellSpacing='0'></table></div></div>";
    SeeUtils.insertBefore(headerDiv, this.tObj);
    this.hDiv = document.getElementById(p.id + "_hDiv");
    //定义表态对象
    g.hDiv = this.hDiv;
    //设置表格table对象
    g.hTable = document.getElementById(p.id + "_h_table");
    p.holewidth = SeeUtils.getElWidth(g.hDiv);
}
//添加表格的body对象
MxtSeeGrid.prototype._addGridBody = function () {
    var p = this.options;
    var g = this;
    //定义相关事件
    var bDiv_mouseenter = 'nBtn_Mouseenter' + p.id;
    //鼠标进入事件
    window[bDiv_mouseenter] = function () {
        SeeUtils.hideEl(g.nDiv);
        SeeUtils.hideEl(g.nBtn);
        SeeUtils.removeClass(g.nBtn, 'set_col');
    }
    //鼠标移开事件
    var bDiv_mouseleave = 'nBtn_Mouseleave' + p.id;
    window[bDiv_mouseleave] = function () {
        if (g.multisel) {
            g.multisel = false;
        }
    }

    var bodyDiv = "<div class='bDiv' onmouseleave='" + bDiv_mouseleave + "()' onmouseenter='" + bDiv_mouseenter + "()'  id='" + p.gridClassName + "_bDiv'></div>";
    SeeUtils.insertBefore(bodyDiv, this.tObj);
    this.bDiv = document.getElementById(p.gridClassName + "_bDiv");
    return this.bDiv;
}
//初始化表格高度
MxtSeeGrid.prototype._initTableHeight = function () {
    var p = this.options;
    if (p.parentId != null) {
        var userpagerH = 0;
        var resizableH = 0;
        p.usepager ? userpagerH += 52 : null;
        p.resizable ? resizableH += 11 : null;
        p.height = SeeUtils.getElHeight(p.parentId) - userpagerH - resizableH - p.heightSubtract;
        if (p.vChange) {
            var tt = SeeUtils.getElObj(p.vChangeParam.changeTar);
            if (tt != null) {
                SeeUtils.setElHeight(tt, 0);
            }
        }
    }
}
//定义表格头部的事件信息
MxtSeeGrid.prototype._initThEvent = function () {
    var g = this;
    var p = this.options;
    if (!p.colmodel)
        var ci = 0;
    //列头点击事件
    var grid_ThClick = "ThClick" + p.id;
    window[grid_ThClick] = function (e, t) {
        //sortable 参数为false时,abbr就没有，直接返回
        if (SeeUtils.getAttrEl(t,"abbr")==null||typeof(SeeUtils.getAttrEl(t,"abbr")) === "undefined")
            return false;
        var obj = (e.target || e.srcElement);
        if (obj.href || obj.type)
            return true;
        g.changeSort(t);
    }
    //列头鼠标移入事件
    var grid_ThMouseenter = "ThMouseenter" + p.id;
    window[grid_ThMouseenter] = function (t) {
        //鼠标移至下拉小三角
        if (!g.colresize && !SeeUtils.hasClass(t, "thMove") && !g.colCopy) {
            SeeUtils.addClass(t, "thOver")
        }
        //abbr 表示排序字段
        if (SeeUtils.getAttrEl(t, "abbr") != p.sortname && !g.colCopy && !g.colresize && SeeUtils.getAttrEl(t, "abbr")) {
            SeeUtils.eachByTag(t, "div", function (elObj) {
                SeeUtils.addClass(elObj, 's' + p.sortorder);
            })
        } else if (SeeUtils.getAttrEl(t, "abbr") == p.sortname && !g.colCopy && !g.colresize && SeeUtils.getAttrEl(t, "abbr")) {
            var no = (p.sortorder == 'asc') ? 'desc' : 'asc';
            SeeUtils.eachByTag(t, "div", function (elObj) {
                SeeUtils.removeClass(elObj, 's' + p.sortorder);
                SeeUtils.addClass(elObj, 's' + p.no);
            })
        }
        if (g.colCopy) {
            var n = SeeUtils.indexByTag(g.hDiv, "th", t);
            if (n == g.dcoln) {
                return false;
            }
            if (n < g.dcoln) {
                $(t).append(g.cdropleft);
            } else {
                $(t).append(g.cdropright);
            }
            g.dcolt = n;
        } else if (!g.colresize) {
            var nv = _getVisibleThIndex(g, t);
            var onlObj = SeeUtils.getElByTagAndIndex(g.cDrag, "div", nv);
            var onl = 0;
            if (onlObj != null) {
                onl = parseInt(SeeUtils.getCss(onlObj, "left"));
            }
            var nw = jQuery(g.nBtn).outerWidth();
            var nl = onl - nw + Math.floor(p.cgwidth / 2)+nv*1;
            var ie7HasCheckbox = SeeUtils.isIE && SeeUtils.isIE7 && (p.colModel[0].type == 'checkbox');

            if (ie7HasCheckbox) {
                nl += 5 * nv;
            }
            SeeUtils.hideEl(g.nDiv);
            SeeUtils.hideEl(g.nBtn);

            SeeUtils.css(g.nBtn, "left", nl);
            SeeUtils.css(g.nBtn, "top", g.hDiv.offsetTop + 1);
            SeeUtils.showEl(g.nBtn);

            var ndw = parseInt(SeeUtils.getElWidth(g.nDiv));
            SeeUtils.css(g.nDiv, "top", g.bDiv.offsetTop - 1);

            if ((nl + ndw) > SeeUtils.getElWidth(g.gDiv)) {
                var l = onl - ndw + 1;
                SeeUtils.css(g.nDiv, "left", l);
            } else {
                SeeUtils.css(g.nDiv, "left", nl - 5);
            }
            //切换样式
            if (SeeUtils.hasClass(t, 'sorted')) {
                SeeUtils.addClass(g.nBtn, 'srtd');
            } else {
                SeeUtils.removeClass(g.nBtn, 'srtd');
            }
        }
    }


    var grid_ThMouseleave = "ThMouseleave" + p.id;
    window[grid_ThMouseleave] = function (t) {
        //鼠标移出下拉小三角
        SeeUtils.removeClass(t, 'thOver');
        var abbrName = SeeUtils.getAttrEl(t, 'abbr');
        if (abbrName != p.sortname) {
            SeeUtils.eachByTag(t, "div", function (elObj) {
                SeeUtils.removeClass(elObj, 's' + p.sortorder);
            })
        } else if (abbrName == p.sortname) {
            var no = (p.sortorder == 'asc') ? 'desc' : 'asc';
            SeeUtils.eachByTag(t, "div", function (elObj) {
                SeeUtils.addClass(elObj, 's' + p.sortorder);
                SeeUtils.removeClass(elObj, 's' + p.no);
            })
        }

        if (g.colCopy) {
            SeeUtils.removeEl(g.cdropleft);
            SeeUtils.removeEl(g.cdropright);
            g.dcolt = null;
        }
    }
    //将<th>label</th>格式的表头 变成  <th><div>label</div></th>格式
    this._changeThTdObj(ci);
}
//将<th>label</th>格式的表头 变成  <th><div>label</div></th>格式
MxtSeeGrid.prototype._changeThTdObj = function (ci) {
    var g = this;
    var p = this.options;
    var theads = SeeUtils.getElByTag(g.hDiv, "thead");

    //此处不能采用原生js替换jquery的js  替换后会导致部分界面功能不正确 所以沿用了jquery的操作
    $('thead tr:first th', g.hDiv).each(function () {
        var thdiv = document.createElement('div');
        if ($(this).attr('abbr')) {
            if ($(this).attr('abbr') == p.sortname) {
                this.className = 'sorted';
                thdiv.className = 's' + p.sortorder;
            }
        }
        if (this.hidden) {
            $(this).hide();
        }
        if (!p.colmodel) {
            $(this).attr('axis', 'col' + ci++);
        }
        $(thdiv).css({
            textAlign : this.align,
            width : this.width + 'px'
        });
        thdiv.innerHTML = this.innerHTML;
        $(this).empty().append(thdiv).removeAttr('width').mousedown(function (e) {
            g.dragStart('colMove', e, this);
        });

    });
}
//解析保存的item
function _parseOrder(orderItem) {
    var itemObj = {u: orderItem, u_width: -1};
    //showName#120,后面的数字为用户保存的展示长度
    var nameAndWidthArray = orderItem.split("#");
    itemObj["u"] = nameAndWidthArray[0];
    //设置默认值
    if (nameAndWidthArray.length > 1) {
        itemObj["u_width"] = nameAndWidthArray[1];
    }
    return itemObj;
}
//循环每列数据 如果存在保存在数据库中的宽度 则采用数据库中设置的宽度。
MxtSeeGrid.prototype._initColWidth = function (colModel, itemObj, _modes, _modesMap, resetWidth, ugp) {
    for (var j = 0; j < colModel.length; j++) {
        var colItem = colModel[j];
        if (colItem.name == itemObj["u"]) {
            if (itemObj["u_width"] != (-1)) {
                if (!resetWidth) {
                    colItem.width = itemObj["u_width"];
                    //有自定义的宽度，不能是隐藏列（zhiyanqiang,2017/07/25）
                    colItem.hide = false;
                }
            }
            else {
                //非自定义列宽度，在有个性化信息的情况下该列肯定是隐藏列（zhiyanqiang,2017/07/25）
                colItem.hide = true;
            }
            _modesMap[_modes.length] = j;
            if (colItem.hide == undefined) {
                //通过个性化信息已经设置了是否隐藏，不要再覆盖对应的nide值了（zhiyanqiang,2017/07/25）
                if (!(colItem.isToggleHideShow !== undefined && colItem.hide && !colItem.isToggleHideShow))
                    colItem.hide = ((ugp[itemObj["u"]] === 0 || ugp[itemObj["u"]] === '0') && (!resetWidth)) ? true : false;
            }
            _modes.push(colItem);
        }
    }
}
//将新增的列追加到相应数组中
MxtSeeGrid.prototype._initAddNewCol = function (colModel, cs, _modesMap, _modes) {
    //循环所有列 可能存在未保存到数据库的列 故还为进行初始化 则通过该循环将新增的列进行初始化
    for (var fNum = 0; fNum < colModel.length; fNum++) {
        var itemObj = colModel[fNum];
        if (!cs.contains(itemObj.name)) {
            _modesMap[_modes.length] = fNum;
            _modes.push(itemObj);
        }
    }
}
//计算列宽
function _getColWidth(cm, p,g) {
    var thWidth = null;
    if(p.gridType==='autoGrid'){
        var bDivWidth=SeeUtils.getElWidth(g.bDiv);
        if(!g.hasScrollerFlag){
            var _W = ((p.holewidth-20- p.colModel.length*12) * parseInt(cm.width)/ g.summaryWidth);
            if(SeeUtils.isIE8){
                cm.width = _W-4;
            }else{
                cm.width = _W;
            }
            thWidth = cm.width;
        }else{
            //如果出现滚动条 则返回用户定义的宽度即可
            thWidth= cm.width - 10;
        }
    }else{
        if (cm.width) {
            var ddd = cm.width + "";
            if (ddd.indexOf('%') > -1) {
                var _W = (p.holewidth - 10) * parseInt(ddd) / 100;
                cm.width = _W - 10;
                thWidth = cm.width;
            } else {
                thWidth = cm.width - 10;
            }
        }
    }
    return thWidth;
}
//对列的header的label进行处理
MxtSeeGrid.prototype._initHeaderLabel = function (cm) {
    var p = this.options;
    var itemHtml = "";
    if (cm.display != undefined) {
        if (cm.type == 'checkbox') {
            itemHtml = "<input  type='checkbox' onclick=\"getGridSetAllCheckBoxSelect123456(this,'" + p.gridClassName + "')\"/>";
        } else if (cm.type == 'radio') {
            itemHtml = "";
        } else {
            itemHtml = cm.display;
        }
    }
    return itemHtml;
}
var colWidthMapping={smallest:50,small:80,medium:140,big:300};
//如果是autoGrid的，首先需要将所有列的宽度进行一次累加 判断是否累加宽度超过了屏幕的宽度
function _initAutoGridColInfo(p, g) {
    var tBodyWid=SeeUtils.getElWidth(g.bDiv);
    if (p.gridType === 'autoGrid') {
        var widthSummary = 0;var minWidthSummary=0;
        for (var jj = 0; jj < p.colModel.length; jj++) {
            var cm = p.colModel[jj];
            //如果传入的是宽度类型
            if(!AssertUtils.isNumber(cm.width)){
                cm.width=colWidthMapping[cm.width];
            }
            widthSummary = parseFloat(widthSummary) + parseFloat(cm.width) ;
        }
        g.summaryWidth = widthSummary;
        //如果总宽度大于了 table的宽度 则出现滚动条 如果不大于table的宽度 则不出现滚动条
        if (widthSummary > tBodyWid) {
            g.hasScrollerFlag = true;
        } else {
            g.hasScrollerFlag = false;
        }
    }
}
//构建表格列头
MxtSeeGrid.prototype.addGridTh = function (thId) {
    var g = this;
    var p = this.options;
    //按比例展示列宽处理end
    var grid_ThClick = "ThClick" + p.id;
    var grid_ThMouseenter = "ThMouseenter" + p.id;
    var grid_ThMouseleave = "ThMouseleave" + p.id;

    var thHtmls = [];
    //如果是autoGrid的，首先需要将所有列的宽度进行一次累加 判断是否累加宽度超过了屏幕的宽度
    _initAutoGridColInfo(p, g);

    for (var i = 0; i < p.colModel.length; i++) {
        var cm = p.colModel[i];
        var abbrHtml = "";
        if (cm) { // only use cm if its defined
            //对列头中文信息进行处理
            var itemHtml = this._initHeaderLabel(cm);
            cm.sortType = cm.sortType ? cm.sortType : "string";

            var _isToggleHideShow = cm.isToggleHideShow == undefined ? true : cm.isToggleHideShow;
            if (cm.name == 'id' || cm.name == 'name' || cm.name == 'title') {
                _isToggleHideShow = false;
            }

            if (cm.name && cm.sortable) {
                abbrHtml = " abbr='" + (cm.sortname ? cm.sortname : cm.name) + "'";
            }

            if (cm.align == undefined) {
                cm.align = 'left'
            }
            //获取列宽度
            var thWidth = _getColWidth(cm, p,g);
            var hiddenHtml = "";
            if (cm.hide) {
                hiddenHtml = " hide=true ";
            }

            var processHtml = "";
            if (cm.process) {
                processHtml = " process=" + cm.process + "";
            }

            var classStr = "";
            if (cm.type == 'checkbox') {
                classStr = " class='grid_checkbox' ";
            }

            thHtmls.push("<th " +
                "align='" + cm.align + "' " +
                "width='" + thWidth + "' " +
                "isToggleHideShow='" + _isToggleHideShow + "' " +
                "colMode='" + cm.name + "' " +
                "sortType='" + cm.sortType + "' " +
                "axis='" + 'col' + i + "' " +
                " " + classStr + " " +
                " " + hiddenHtml + " " +
                " " + processHtml + " " +
                " " + abbrHtml + " " +
                "onclick='" + grid_ThClick + "(event,this)' " +
                "onmouseenter='" + grid_ThMouseenter + "(this)' " +
                "onmouseleave='" + grid_ThMouseleave + "(this)'" +
                ">"
                + itemHtml
                + "</th>");

        } else {
            //如果传入的列为空
            thHtmls.push("<th width='30' axis='" + 'col' + i + "' onclick='" + grid_ThClick + "(event,this)' onmouseenter='" + grid_ThMouseenter + "(this)' onmouseleave='" + grid_ThMouseleave + "(this)'></th>");
        }
    }
    //try{
    var theadHtmls = "<thead id='" + thId + "'><tr>" + thHtmls.join('') + "</tr></thead>";
    SeeUtils.innerHTMl(this.tObj,theadHtmls);

    //对列数据属性进行设置
    this._initThProp(thId);
}

MxtSeeGrid.prototype._initThProp = function (thId) {
    //循环每列 将列头对象设置相应的值 为后面处理提给数据
    SeeUtils.eachByTag(thId, "th", function (elObj) {
        var hide = SeeUtils.getAttrEl(elObj, "hide");
        if (hide === 'true' || hide === true) {
            elObj.hidden = true;
        }
        var process = SeeUtils.getAttrEl(elObj, "process");
        if (process === 'true' || process === true) {
            elObj.process = true;
        }
        //设置字体的align属性
        var align = SeeUtils.getAttrEl(elObj, "align");
        if (AssertUtils.isNotEmpty(align)) {
            elObj.align = align;
        } else {
            elObj.align = 'left';
        }
    });
}
//从数据库中获取相应的信息 并对当前列数据信息进行加工
MxtSeeGrid.prototype._setColInfoByDsCol = function (ugp, resetWidth) {
    var g = this;
    var p = this.options;
    //如果没用保存过到数据库 则这里为false 则不会去执行下面的逻辑。
    if (p.customId && ugp) {
        ugp = $.parseJSON(ugp);
        ugp = ugp[p.customId];
        if (ugp && !(ugp instanceof Array)) {
            var _modes = [],
                _modesMap = {},
                cs = [];
            var orders = ugp['__ORDER'];
            if (ugp['resetWidth'] != undefined) {
                resetWidth = ugp['resetWidth']; //获取数据库中是否保存的是重置宽度
            }

            if (orders && (!resetWidth)) {
                for (var i = 0; i < orders.length; i++) {
                    var itemObj = _parseOrder(orders[i]);
                    //自定义长度展示处理end:
                    if (itemObj["u"] === "")return;
                    cs.push(itemObj["u"]);
                    //循环所有列 对列的宽度进行初始化
                    this._initColWidth(p.colModel, itemObj, _modes, _modesMap, resetWidth, ugp);
                }
            }
            //循环所有列 可能存在未保存到数据库的列 故还为进行初始化 则通过该循环将新增的列进行初始化
            this._initAddNewCol(p.colModel, cs, _modesMap, _modes);
            //获取字段信息  已经计算了宽度
            p.colModel = _modes;
            //获取排序映射信息
            p._modesMap = _modesMap;
        }
    } else {
        ugp = null;
    }
}
//将当前用户的列表配置信息保存到localstorage中
function __saveToLocalStorage(ck,newGridPrefStr){
    if(window.localStorage){
        var storage=window.localStorage;
        //写入到缓存
        storage.setItem("vPortal_customize_grid_pref",newGridPrefStr);
    }
}
//从localstorage中获取 当前用户的配置信息
function __getGridPrefFromLocalStorage(){
    if(window.localStorage){
        var storage=window.localStorage;
        //读取缓存
        return storage["vPortal_customize_grid_pref"];
    }else{
        return null;
    }
}
//如果在vportal里面读取不到 则到localstorage中读取
MxtSeeGrid.prototype._loadGridPrefFromLocalStorage=function(resetWidth){
    var newGridPrefStr= __getGridPrefFromLocalStorage();
    if(newGridPrefStr!=null){
        this._setColInfoByDsCol(newGridPrefStr, resetWidth);
    }
}
//获取列的配置信息
function __getPrefStr(ugpStr, ck, resetFlag, orders) {
    var ugpRoot = {};//OA-96888,OA-96860防止用户的个性化信息没有保存过，grid_pref中没有值的情况，需要进行初始化处理(支艳强,2016/05/13)
    if (ugpStr) {
        ugpRoot = $.parseJSON(ugpStr);
    }
    var ugp = ugpRoot[ck];
    if (ugp == undefined || ugp == null || ugp == "") {
        //OA-96888,OA-96860customId对应的表格个性化信息没有保存过，需要进行初始化处理(支艳强,2016/05/13)
        ugp = {};
    }
    if (resetFlag) {
        ugp['resetWidth'] = true;
    }
    else {
        ugp['__ORDER'] = orders;
    }
    ugpRoot[ck] = ugp;
//按照文友检查要求，将Json对象转Json字符串的方法改成通用的，避免版本兼容性的问题
    var newGridPrefStr = $.toJSON(ugpRoot);
    return newGridPrefStr;
}
//根据列信息 构建header 以及每列的宽度
MxtSeeGrid.prototype._initGridHeaderLabel = function () {
    var p = this.options;
    var g = this;
    var cpi;
    var thId = SeeUtils.getUUid();
    if ($.ctx) {
        cpi = $.ctx._currentPathId;
    }
    if (cpi && !p.customId)
        p.customId = cpi;
    var resetWidth = false; //默认情况下不是重置
    if (p.colModel) { // create model if any
        if (getCtpTop().vPortal && p.customize && getCtpTop().vPortal.customize) {
            var ugp = getCtpTop().vPortal.customize.grid_pref;
            //从数据库中获取相应的信息 并对当前信息进行处理
            this._setColInfoByDsCol(ugp, resetWidth);
        }else{
        //如果在vportal里面读取不到 则到localstorage中读取试试
            this._loadGridPrefFromLocalStorage(resetWidth);
        }
        //构建表格列头信息
        this.addGridTh(thId);

    } // end if p.colmodel
    this.hTable_thId = thId;
    var thead = SeeUtils.getElObj(thId);
    if (thead) {
        SeeUtils.appendTo(thead, g.hTable);
    }
    thead = null;
}
//添加上下分隔
MxtSeeGrid.prototype.addTopBottomVGrip = function () {
    var g = this;
    var p = this.options;
    //定义拖动 鼠标点下事件
    var downVGripEventId = "downVGrip";
    window[downVGripEventId] = function (e) {
        if(!SeeUtils.isIE8){
            g.dragStart('vresize', e);
        }
    }
    //上下箭头事件
    var slideToggleUpHandleClick = "slideToggleUpHandle" + p.id;
    var slideToggleDownHandleClick = "slideToggleDownHandle" + p.id;

    if (p.resizable && p.height != 'auto') {
        var contentHtml = "";
        if (p.slideToggleBtn) { //判断上下伸缩按钮
            contentHtml = "<div class='vGrip_line'><table align='center' border='0' cellpadding='0' cellspacing='0' height='7'><tr>" +
                "<td align='center'>" +
                "<span onclick='" + slideToggleUpHandleClick + "()' class='slideUpBtn spiretBarHidden4'><em></em></span>" +
                "<span onclick='" + slideToggleDownHandleClick + "()' class='slideDownBtn spiretBarHidden3' style='border-left:0;'><em></em></span></td></tr></table></div>";
        } else {
            contentHtml = "<span id='dragBtn'></span>";
        }
        var vDivHtml = '<div class="vGrip" id="' + p.id + 'vGrip" onmousedown="' + downVGripEventId + '(event)">' + contentHtml + '</div>';
        SeeUtils.insertAfter(vDivHtml, g.bDiv);
        g.vDiv = document.getElementById(p.id + 'vGrip');
        //ie8下才有原生js注入该方法会有问题
        if(SeeUtils.isIE8){
            $(g.vDiv).mousedown(function (e) {
                g.dragStart('vresize', e)
            });
        }
        //判断上下伸缩按钮绑定事件
        if (p.slideToggleBtn) {
            window[slideToggleUpHandleClick] = function () {
                p.slideToggleUpHandle(p, g);
            }
            window[slideToggleDownHandleClick] = function () {
                p.slideToggleDownHandle(p, g);
            }
        } else {
            window[slideToggleUpHandleClick] = function () {
            }
            window[slideToggleDownHandleClick] = function () {
            }
        }
    }
}
//添加左右分隔
MxtSeeGrid.prototype.addLeftRightVGrip = function () {
    var g = this;
    var p = this.options;

    var rDivDown = "rDivDown";
    window[rDivDown] = function (e) {
        if(!SeeUtils.isIE8){
            g.dragStart('vresize', e, true);
        }
    }
    //如果设置了表格宽度的情况 则会出现左右拉动条
    if (p.resizable && p.width != 'auto' && !p.nohresize) {
        var rDivId = SeeUtils.getUUid();
        var rDivHtml = "<div id='" + rDivId + "' style='height: " + SeeUtils.getElHeight("g.gDiv") + "px' class='hGrip' onmousedown='" + rDivDown + "(event)'><span></span></div>";
        SeeUtils.appendTo(rDivHtml, g.gDiv);
        this.rDiv = SeeUtils.getElObj(rDivId);
    }
    if(SeeUtils.isIE8){
        //主要是ie8 存在兼容问题
        $("#"+rDivId).mousedown(function (e) {
            g.dragStart('vresize', e, true);
        });
    }
}
//加载数据
MxtSeeGrid.prototype._loadData = function () {
    var p = this.options;
    var g = this;
    if (p.managerName) {
        //这里需要采用jquery的写法 改成原生的话导致部分界面有异常
        $("head").append(
            "<script src='" + _ctxPath + "/ajax.do?managerName=" + p.managerName
            + CsrfGuard.getUrlSurffix() + "' type='text/javascript'></script>");

    }
    if (p.datas && p.autoload) {
        g.populate();
    }
}
//加载完成
MxtSeeGrid.prototype._endGridInit = function () {
    var g = this;
    var p = this.options;
    this.tObj.p = p;
    this.tObj.grid = g;
    //这里是缓存对象是平台的扩展方法  可能业务会使用该对象 所以没法去掉jquery的依赖
    $(this.tObj).attrObj("_grid", g);
    if ($._autofill) {
        var elObjId = this.tObj.id;
        var $af = $._autofill,
            $afg = $af.filllists;

        if ($afg && $afg[elObjId]) {
            $afg[elObjId].rows = $afg[elObjId].data;
            g.addData($afg[elObjId]);
            $afg[elObjId] = null;
        } else {
            // 无数据，要出现滚动条
            var hTable = _getTableObj(g, g.hDiv);
            var bTable = _getTableObj(g, g.bDiv);
            if (hTable != null && bTable != null) {
                SeeUtils.setElHeight(bTable, SeeUtils.getElHeight(hTable));
                SeeUtils.setElWidth(bTable, SeeUtils.getElWidth(hTable));
            }

        }
    }
}
//获取一个对象里的table对象
function _getTableObj(g, parentObj) {
    var bTbs = SeeUtils.getElByTag(parentObj, 'table');
    if (bTbs.length > 0) {
        return bTbs[0];
    }
}
/**
 * 添加grid表格的编辑层
 * @param g
 * @param p
 * @private
 */
MxtSeeGrid.prototype._addEditorLayer = function () {
    var p = this.options;
    var g = this;
    var idivId = SeeUtils.getUUid();
    var htmls = "<div class='iDiv' id='" + idivId + "' style='display: none'></div>"
    SeeUtils.appendTo(htmls, g.bDiv);
    g.iDiv = SeeUtils.getElObj();
}
//设置表格默认事件
MxtSeeGrid.prototype._initDocumentEvents = function () {
    var g = this;
    //无法替换的原因是 e.pageX和e.pageY兼容性问题 如果这里需要改成原生的 改动比较大
    if(SeeUtils.isIE8||SeeUtils.isIE9||SeeUtils.isIE10){
        $(document).mousemove(function (e) {
            g.dragMove(e)
        })
    }else{
        SeeUtils.addEvent(document, "mousemove", function (e) {
            g.dragMove(e);
        });
    }
    SeeUtils.addEvent(document, "mousemove", function (e) {
        g.dragMove(e);
    });
    SeeUtils.addEvent(document, "mouseup", function (e) {
        g.dragEnd();
    });
    SeeUtils.addEvent(document, "hover", function (e) {
        g.dragEnd();
    });
}
//添加列头 拖动线条
MxtSeeGrid.prototype.addLinDrap = function () {
    var g = this;
    var p = this.options;
    g.cDrag = document.createElement('div'); // 拖动列宽的线容器div
    // set cDrag

    var thTrObj = _getHeaderThTrObj(g);
    var cdcol = null;
    if (thTrObj != null) {
        var thObjs = SeeUtils.getElByTag(thTrObj, "th");
        if (thObjs.length > 0) {
            cdcol = thObjs[0];
        }
    }
    if (cdcol != null) {
        var cdcolDivs = SeeUtils.getElByTag(cdcol, "div");
        var cdColDivObj = null;
        if (cdcolDivs.length > 0) {
            cdColDivObj = cdcolDivs[0];
        }

        if (cdColDivObj != null) {
            var borderLeftWidth = SeeUtils.getCss(cdColDivObj, "borderLeftWidth");
            var borderRightWidth = SeeUtils.getCss(cdColDivObj, "borderRightWidth");
            var paddingLeft = SeeUtils.getCss(cdColDivObj, "paddingLeft");
            var paddingRight = SeeUtils.getCss(cdColDivObj, "paddingRight");

            var cdcolborderLeftWidth = SeeUtils.getCss(cdcol, "borderLeftWidth");
            var cdcolborderRightWidth = SeeUtils.getCss(cdcol, "borderRightWidth");
            var cdcolpaddingLeft = SeeUtils.getCss(cdcol, "paddingLeft");
            var cdcolpaddingRight = SeeUtils.getCss(cdcol, "paddingRight");

            g.cDrag.className = 'cDrag';
            g.cdpad = 0;
            g.cdpad += (isNaN(parseInt(borderLeftWidth)) ? 0 : parseInt(borderLeftWidth));
            g.cdpad += (isNaN(parseInt(borderRightWidth)) ? 0 : parseInt(borderRightWidth));
            g.cdpad += (isNaN(parseInt(paddingLeft)) ? 0 : parseInt(paddingLeft));
            g.cdpad += (isNaN(parseInt(paddingRight)) ? 0 : parseInt(paddingRight));
            g.cdpad += (isNaN(parseInt(cdcolborderLeftWidth)) ? 0 : parseInt(cdcolborderLeftWidth));
            g.cdpad += (isNaN(parseInt(cdcolborderRightWidth)) ? 0 : parseInt(cdcolborderRightWidth));
            g.cdpad += (isNaN(parseInt(cdcolpaddingLeft)) ? 0 : parseInt(cdcolpaddingLeft));
            g.cdpad += (isNaN(parseInt(cdcolpaddingRight)) ? 0 : parseInt(cdcolpaddingRight));
        }


        SeeUtils.insertBefore(g.cDrag, g.bDiv);

        var cdheight = SeeUtils.getElHeight(g.bDiv);
        var hdheight = SeeUtils.getElHeight(g.hDiv);
        //设置拖动线条的高度
        SeeUtils.css(g.cDrag, "top", -hdheight + 'px');

        var cgMouseDownId = "cgMouseDownId_" + p.id;
        window[cgMouseDownId] = function (e, elObj) {
            g.dragStart('colresize', e, elObj);
        }
        var cgDbClickDownId = "cgDbClickDownId_" + p.id;
        window[cgDbClickDownId] = function (e, elObj) {
            g.autoResizeColumn(elObj);
        }

//获取表头tr对象
        var thTrObj = _getHeaderThTrObj(g);
        SeeUtils.eachByTag(thTrObj, "th", function () {
            var cgDivId = SeeUtils.getUUid();
            var cgDivHtml = '<div class="cgDiv" id="' + cgDivId + '" ' +
                'onmousedown="' + cgMouseDownId + '(event,this)" ' +
                'ondblclick="' + cgDbClickDownId + '(event,this)" style="height: ' + (cdheight + hdheight) + 'px"></div>'
            SeeUtils.appendTo(cgDivHtml, g.cDrag);
            if (!p.cgwidth) {
                p.cgwidth = SeeUtils.getElWidth(cgDivId);
            }
        });
    }
}
//添加横向分隔条
MxtSeeGrid.prototype.addVGrip = function () {
    //添加上下分隔
    this.addTopBottomVGrip();
    //添加左右分隔
    this.addLeftRightVGrip();
}
//初始化表格的相关属性
MxtSeeGrid.prototype.initGridBodyProp = function () {
    var g = this;
    var p = this.options;
    if (p.hChange) {
        var pObj = SeeUtils.getElObj(g.gDiv).parentNode;
        SeeUtils.css(pObj, "overflow", "hidden");
        p.height = pObj.height() - p.hChangeParam.subHeight;
    }
    if (p.height < 50)
        p.height = 'auto';

    //初始化数据区域的高度
    SeeUtils.css(g.bDiv, "height", (p.height == 'auto') ? 'auto' : p.height - 37 + "px");
    //注册滚动事件
    SeeUtils.addEvent(g.bDiv, "scroll", function (e) {
        //aoh 2016-8-2 OA-98030ie8无流程表单列表字段较多时出现滚动条，点击左右箭头移动时没啥反应，多点击几下就ie卡掉不能操作，ie9正常
        //如果是ie8
        if (SeeUtils.isIE8) {
            if (g.finished) {
                setTimeout(function () {
                    g.hDiv.scrollLeft = g.bDiv.scrollLeft;
                    g.rePosDrag();
                    g.finished = true;
                }, 200);
                g.finished = false;
            }
        } else {
            g.scroll();
        }
    });

    SeeUtils.appendTo(this.tObj, g.bDiv);

    if (p.height == 'auto') {
        SeeUtils.eachByTag(g.bDiv, "table", function (elObj) {
            SeeUtils.addClass(elObj, "autoht");
        })
    }
}
//变更参数
function __initVChangeParam(p) {
    if (p.vChangeParam.changeTar == undefined) {
        p.vChangeParam.changeTar = 'grid_detail';
    }
    if (p.vChangeParam.overflow == undefined) {
        p.vChangeParam.overflow = 'auto';
    }
    if (p.vChangeParam.subHeight == undefined) {
        p.vChangeParam.subHeight = 0;
    }
    if (p.vChangeParam.autoResize == undefined) {
        p.vChangeParam.autoResize = true;
    }
}
//向上拖动事件
function __slideToggleUpHandle(opts, g) {
    if (opts.UMD == 'down') {
        opts.UMD = 'middle';
    } else if (opts.UMD == 'middle') {
        opts.UMD = 'up';
    } else if (opts.UMD == 'up') {
        g.resizeGridUpDown(opts.UMD)
    }
    g.resizeGridUpDown(opts.UMD)
}
//向下拖动事件
function __slideToggleDownHandle(opts, g) {
    if (opts.UMD == 'down') {
        g.resizeGridUpDown(opts.UMD)
    } else if (opts.UMD == 'middle') {
        opts.UMD = 'down';
    } else if (opts.UMD == 'up') {
        opts.UMD = 'middle';
    }
    g.resizeGridUpDown(opts.UMD);
}
/// <reference path="../scriptes/jquery.js" />
/**
 * @author macj
 */
/*
 * Flexigrid for jQuery - v1.1
 *
 * Copyright (c) 2008 Paulo P. Marinas (code.google.com/p/flexigrid/) Dual
 * licensed under the MIT or GPL Version 2 licenses. http://jquery.org/license
 *
 */
(function ($) {
    $.addFlex = function (t, p) {
        // var startTime = new Date().getTime();
        if (typeof(t) === 'undefined') {
            return;
        }
        if (t.grid)
            return t; // return if already exist
        var initFlag = true;
        var gridObj = new MxtSeeGrid(t);
        //将用户的参数与缺省参数进行合并
        gridObj.extendOptions(p);
        gridObj.initGridCtl();
        return t;
    };
    var docloaded = false;
    $(document).ready(function () {
        docloaded = true
    });
    $.fn.ajaxgrid = function (p) {
        return $.addFlex(this[0], p);
    };
    $.fn.resizeGrid = function (h) {
        return;
    };
    $.fn.getSelectCheckbox = function () {
        var cNstr = this[0].className;
        var cNstrstr = this[0].className + "_bDiv";
        return $('.' + cNstr).find('input[gridRowCheckBox=' + cNstr + ']:checked');
    };
    $.fn.flexReload = function (p) { // function to reload grid
        return this.each(function () {
            if (this.grid && this.p.managerName)
                this.grid.populate();
        });
    }; // end flexReload
    $.fn.flexOptions = function (p) { // function to update general options
        return this.each(function () {
            if (this.grid)
                $.extend(this.p, p);
        });
    }; // end flexOptions
    $.fn.flexToggleCol = function (cid, visible) { // function to reload grid
        return this.each(function () {
            if (this.grid)
                this.grid.toggleCol(cid, visible);
        });
    }; // end flexToggleCol
    $.fn.ajaxgridLoad = function (para) { // function to add data to grid
        return this.each(function () {
            if (this.grid) {
                if(typeof(this.p.noTotal) === "undefined" || typeof(this.p.noTotal) != "undefined" && this.p.noTotal == false){
                    this.grid.populate(para);
                }else{
                    this.p.newp = 1;
                    this.grid.populate(para);
                }
            }
        });
    };
    $.fn.ajaxgridData = function (data) { // function to add data to grid
        return this.each(function () {
            if (this.grid) {
                this.grid.addData(data);
            }
        });
    };
    $.fn.noSelect = function (p) { // no select plugin by me :-)
        var prevent = (p == null) ? true : p;
        if (prevent) {
            return this.each(function () {
                if (SeeUtils.isIE || SeeUtils.isSafari)
                    $(this).bind('selectstart', function () {
                        return false;
                    });
                else if (SeeUtils.isFF) {
                    $(this).css('MozUserSelect', 'none');
                    $('body').trigger('focus');
                } else if (SeeUtils.isOpera)
                    $(this).bind('mousedown', function () {
                        return false;
                    });
                else
                    $(this).attr('unselectable', 'on');
            });
        } else {
            return this.each(function () {
                if (SeeUtils.isIE || SeeUtils.isSafari)
                    $(this).unbind('selectstart');
                else if (SeeUtils.isFF)
                    $(this).css('MozUserSelect', 'inherit');
                else if (SeeUtils.isOpera)
                    $(this).unbind('mousedown');
                else
                    $(this).removeAttr('unselectable', 'on');
            });
        }
    }; // end noSelect
    $.fn.flexSearch = function (p) { // function to search grid
        return this.each(function () {
            if (this.grid && this.p.searchitems)
                this.grid.doSearch();
        });
    }; // end flexSearch
})(jQuery);
function getGridSetAllCheckBoxSelect123456(obj, clName) {
    if ($(obj).prop('checked')) {
        $('.flexigrid').find('input[gridRowCheckBox=' + clName + ']').not("input[type=checkbox][disabled]").prop(
            'checked', true);

    } else {
        $('.flexigrid').find('input[gridRowCheckBox=' + clName + ']').prop(
            'checked', false);
    }
    if (typeof(gridSelectAllPersonalFunction) == 'function') {
        gridSelectAllPersonalFunction($(obj).prop('checked'));
    }
}
