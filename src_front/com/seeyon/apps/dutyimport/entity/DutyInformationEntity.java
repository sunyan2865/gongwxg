package com.seeyon.apps.dutyimport.entity;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.format.DateTimeFormat;

public class DutyInformationEntity {
    @ExcelProperty(index = 0)
    @DateTimeFormat("yyyy-MM-dd")
    private String field0002; //开始时间
    @ExcelProperty(index = 1)
    @DateTimeFormat("yyyy-MM-dd")
    private String field0003; // 结束时间
    @ExcelProperty(index = 2)
    private String field0004; // 值班地点
    @ExcelProperty(index = 3)
    private String field0005; // 带班领导
    @ExcelProperty(index = 4)
    private String field0006; // 带班领导电话
    @ExcelProperty(index = 5)
    private String field0007; // 值班人员
    @ExcelProperty(index = 6)
    private String field0008; // 值班人员电话

    public String getField0002() {
        return field0002;
    }

    public void setField0002(String field0002) {
        this.field0002 = field0002;
    }

    public String getField0003() {
        return field0003;
    }

    public void setField0003(String field0003) {
        this.field0003 = field0003;
    }

    public String getField0004() {
        return field0004;
    }

    public void setField0004(String field0004) {
        this.field0004 = field0004;
    }

    public String getField0005() {
        return field0005;
    }

    public void setField0005(String field0005) {
        this.field0005 = field0005;
    }

    public String getField0006() {
        return field0006;
    }

    public void setField0006(String field0006) {
        this.field0006 = field0006;
    }

    public String getField0007() {
        return field0007;
    }

    public void setField0007(String field0007) {
        this.field0007 = field0007;
    }

    public String getField0008() {
        return field0008;
    }

    public void setField0008(String field0008) {
        this.field0008 = field0008;
    }

}
