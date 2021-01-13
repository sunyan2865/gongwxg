package com.seeyon.apps.meetingroomexport.controller;

import com.alibaba.excel.EasyExcel;
import com.seeyon.apps.meetingroomexport.entity.ExportMeetingroomEntity;
import com.seeyon.apps.meetingroomexport.exportlistener.CustomCellWriteHandler;
import com.seeyon.apps.meetingroomexport.exportlistener.CustomSheetWriteHandler;
import com.seeyon.ctp.common.controller.BaseController;
import com.seeyon.ctp.common.exceptions.BusinessException;
import com.seeyon.ctp.common.log.CtpLogFactory;
import com.seeyon.ctp.util.JDBCAgent;
import org.apache.commons.logging.Log;
import org.springframework.util.CollectionUtils;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ExportMeetingroomController extends BaseController {
    private static final Log LOG = CtpLogFactory.getLog(ExportMeetingroomController.class);

    /**
     * 跳转会议室导出页面
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ModelAndView toExportMeetingroom(HttpServletRequest request, HttpServletResponse response)throws Exception{
        response.setContentType("text/html;charset=UTF-8");
        ModelAndView view = new ModelAndView("meetingroomexport/meetingroom_export");
        return view;
    }

    public void exportMeetingroom(HttpServletRequest request, HttpServletResponse response){
       // response.setContentType("application/vnd.ms-excel");
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setCharacterEncoding("utf-8");
        List<Map<String, Object>> resultMapList = null;
        List<ExportMeetingroomEntity> meetingRoomList = new ArrayList<>();
        JDBCAgent jdbcAgent = new JDBCAgent(true, false);
        try {
            LOG.info("======会议室数据导出开始======");
            String exportDate = String.valueOf(request.getParameter("exportDate"));
            String sql = "select roomname,IFNULL(GROUP_CONCAT(morning order by morning separator ' &'), '') morning,IFNULL(GROUP_CONCAT(afternoon order by afternoon separator ' &'), '') afternoon from (" +
                    "  select roomname,CONCAT(morning,' ',unitname,' ',username,' ',description) morning,CONCAT(afternoon,' ',unitname,' ',username,' ',description) afternoon from" +
                    "  (select meeting_room.name roomname, m.name username,unit.name unitname, (case when meeting_room_app.DESCRIPTION is null then '' else meeting_room_app.DESCRIPTION end) DESCRIPTION" +
                    "  ,(case when TIME_FORMAT(meeting_room_app.ENDDATETIME, '%H') > 12 then " +
                    "   (case when TIME_FORMAT(meeting_room_app.STARTDATETIME, '%H') < 12 then CONCAT_WS('-',meeting_room_app.STARTDATETIME,'12:00:00')" +
                    "   else NULL end) else CONCAT_WS('-',meeting_room_app.STARTDATETIME,meeting_room_app.ENDDATETIME) end) morning  " +
                    "  ,(case when TIME_FORMAT(meeting_room_app.STARTDATETIME, '%H') < 12 then" +
                    "  (case when TIME_FORMAT(meeting_room_app.ENDDATETIME, '%H') > 12 then CONCAT_WS('-','12:00:00',meeting_room_app.ENDDATETIME)" +
                    "  else NULL end) else CONCAT_WS('-',meeting_room_app.STARTDATETIME,meeting_room_app.ENDDATETIME) end) afternoon " +
                    "  from (select ID,`NAME` from MEETING_ROOM ORDER BY name) meeting_room" +
                    "  left join (select MEETINGROOMID,PERID,DEPARTMENTID,DESCRIPTION,TIME_FORMAT(STARTDATETIME,'%H:%i:%s') STARTDATETIME,TIME_FORMAT(ENDDATETIME,'%H:%i:%s') ENDDATETIME from MEETING_ROOM_APP where status = 1 and STARTDATETIME >= '"+exportDate+" 00:00:00' and STARTDATETIME <= '"+exportDate+" 23:59:59') meeting_room_app " +
                    "  on meeting_room.ID = meeting_room_app.MEETINGROOMID" +
                    "  left join org_member m on meeting_room_app.PERID = m.ID" +
                    "  left join org_unit unit on meeting_room_app.DEPARTMENTID = unit.ID" +
                    "  ORDER BY meeting_room.name, meeting_room_app.STARTDATETIME) meeting_room_imp) room_imp" +
                    "  GROUP BY room_imp.roomname";
            jdbcAgent.execute(sql);
            resultMapList = jdbcAgent.resultSetToList();
            if(!CollectionUtils.isEmpty(resultMapList)){
                resultMapList.forEach(item ->{
                    item.put("morning", String.valueOf(item.get("morning")).replaceAll("&","\n"));
                    item.put("afternoon", String.valueOf(item.get("afternoon")).replaceAll("&","\n"));
                    meetingRoomList.add(new ExportMeetingroomEntity(String.valueOf(item.get("roomname")),String.valueOf(item.get("morning")),String.valueOf(item.get("afternoon"))));
                });
            }
            String fileName = URLEncoder.encode("会议情况（"+ exportDate + "）-" + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")), "UTF-8");

            String headTitle = "会议室每日会议情况（"+ LocalDate.parse(exportDate).format(DateTimeFormatter.ofPattern("yyyy年MM月dd日")) +"）";
            response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");
            EasyExcel.write(response.getOutputStream()).head(getHead(headTitle)).registerWriteHandler(new CustomSheetWriteHandler()).registerWriteHandler(new CustomCellWriteHandler()).sheet("Sheet1").doWrite(meetingRoomList);
            LOG.info("======会议室数据导出结束======");
        } catch (BusinessException e) {
            e.printStackTrace();
            LOG.error(e);
        } catch (SQLException e) {
            e.printStackTrace();
            LOG.error(e);
        } catch (IOException e) {
            e.printStackTrace();
            LOG.error(e);
        }finally {
            jdbcAgent.close();
        }
    }

    private List<List<String>> getHead(String titleName){
        List<List<String>> headList = new ArrayList<>();
        List<String> head0 = new ArrayList<>();
        head0.add(titleName);
        head0.add("会议室");
        List<String> head1 = new ArrayList<>();
        head1.add(titleName);
        head1.add("上午");
        List<String> head2 = new ArrayList<>();
        head2.add(titleName);
        head2.add("下午");
        List<String> head3 = new ArrayList<>();
        head3.add(titleName);
        head3.add("备注");
        headList.add(head0);
        headList.add(head1);
        headList.add(head2);
        headList.add(head3);
        return headList;
    }
}
