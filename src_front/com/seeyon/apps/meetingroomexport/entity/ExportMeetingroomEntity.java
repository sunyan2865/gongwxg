package com.seeyon.apps.meetingroomexport.entity;

import com.alibaba.excel.annotation.ExcelProperty;

public class ExportMeetingroomEntity {

    @ExcelProperty(index = 0, value = "会议室")
    private String roomname;

    @ExcelProperty(index = 1, value = "上午")
    private String morning;

    @ExcelProperty(index = 2, value = "下午")
    private String afternoon;

    @ExcelProperty(index = 3, value = "备注")
    private String memo;

    public ExportMeetingroomEntity() {
    }

    public ExportMeetingroomEntity(String roomname, String morning, String afternoon) {
        this.roomname = roomname;
        this.morning = morning;
        this.afternoon = afternoon;
    }

    public String getRoomname() {
        return roomname;
    }

    public void setRoomname(String roomname) {
        this.roomname = roomname;
    }

    public String getMorning() {
        return morning;
    }

    public void setMorning(String morning) {
        this.morning = morning;
    }

    public String getAfternoon() {
        return afternoon;
    }

    public void setAfternoon(String afternoon) {
        this.afternoon = afternoon;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }
}
