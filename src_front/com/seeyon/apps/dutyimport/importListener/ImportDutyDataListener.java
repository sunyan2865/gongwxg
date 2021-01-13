package com.seeyon.apps.dutyimport.importListener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.seeyon.apps.dutyimport.entity.DutyInformationEntity;
import com.seeyon.apps.gwxg.util.CommonUtil;
import com.seeyon.ctp.common.AppContext;
import com.seeyon.ctp.common.log.CtpLogFactory;
import com.seeyon.ctp.util.JDBCAgent;
import org.apache.commons.logging.Log;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ImportDutyDataListener extends AnalysisEventListener<DutyInformationEntity> {
    private static final Log LOG = CtpLogFactory.getLog(ImportDutyDataListener.class);
    List<DutyInformationEntity> list = new ArrayList<>();
    private HttpServletRequest request;
    private Map<String, Object> resultMap;

    public ImportDutyDataListener() {
    }

    public ImportDutyDataListener(HttpServletRequest request) {
        this.request = request;
    }

    public ImportDutyDataListener(HttpServletRequest request, Map resultMap) {
        this.request = request;
        this.resultMap = resultMap;
    }

    @Override
    public void invokeHeadMap(Map<Integer, String> headMap, AnalysisContext context) {

    }

    @Override
    public void invoke(DutyInformationEntity dutyInformationEntity, AnalysisContext analysisContext) {
        list.add(dutyInformationEntity);
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {
        List<DutyInformationEntity> list = getList();
        Long templateId = Long.valueOf("-3567804903812477605");
        JDBCAgent jdbcAgent = new JDBCAgent(true, false);
        try {
            Long currentUserId = AppContext.getCurrentUser().getId();
            String departmentId = String.valueOf(request.getParameter("field0002"));
            departmentId = departmentId.replace("Department|", "");
            String dutyPlanId = String.valueOf(request.getParameter("dutyplan"));
            String sql = "select * from formmain_0180 where id = " + dutyPlanId;
            jdbcAgent.execute(sql);
            Map<String, Object> dutyPlan = jdbcAgent.resultSetToMap();
            jdbcAgent.execute(sql);
            for (int i = 0,len = list.size(); i < len; ++i) {
                if (null != list.get(i)) {
                    //保存表单数据
                    StringBuffer sqlBuffer = new StringBuffer();
                    String custumId = CommonUtil.generateID();
                    sqlBuffer.append("insert into formmain_0129(ID,state,start_member_id,start_date,approve_member_id,finishedflag,ratifyflag,ratify_member_id,sort,modify_member_id,modify_date,field0011,field0012,field0013,field0001,field0002,field0003,field0004,field0005,field0006,field0007,field0008) values");
                    sqlBuffer.append("(");
                    sqlBuffer.append(custumId);
                    sqlBuffer.append(",");
                    sqlBuffer.append("1");
                    sqlBuffer.append(",");
                    sqlBuffer.append(currentUserId);
                    sqlBuffer.append(",");
                    sqlBuffer.append("now()");
                    sqlBuffer.append(",");
                    sqlBuffer.append("0");
                    sqlBuffer.append(",");
                    sqlBuffer.append("0");
                    sqlBuffer.append(",");
                    sqlBuffer.append("0");
                    sqlBuffer.append(",");
                    sqlBuffer.append("0");
                    sqlBuffer.append(",");
                    sqlBuffer.append("0");
                    sqlBuffer.append(",");
                    sqlBuffer.append(currentUserId);
                    sqlBuffer.append(",");
                    sqlBuffer.append("now()");
                    sqlBuffer.append(",");
                    sqlBuffer.append("'" + dutyPlan.get("field0001") +"'");
                    sqlBuffer.append(",");
                    sqlBuffer.append("'" + dutyPlan.get("field0002") +"'");
                    sqlBuffer.append(",");
                    sqlBuffer.append("'" + dutyPlan.get("field0003") +"'");
                    sqlBuffer.append(",");
                    sqlBuffer.append(departmentId);
                    sqlBuffer.append(",");
                    sqlBuffer.append("'" + list.get(i).getField0002() +"'");
                    sqlBuffer.append(",");
                    sqlBuffer.append("'" + list.get(i).getField0003() +"'");
                    sqlBuffer.append(",");
                    sqlBuffer.append("'" + list.get(i).getField0004() +"'");
                    sqlBuffer.append(",");
                    sqlBuffer.append("'" + list.get(i).getField0005() +"'");
                    sqlBuffer.append(",");
                    sqlBuffer.append("'" + list.get(i).getField0006() +"'");
                    sqlBuffer.append(",");
                    sqlBuffer.append("'" + list.get(i).getField0007() +"'");
                    sqlBuffer.append(",");
                    sqlBuffer.append("'" + list.get(i).getField0008() +"'");
                    sqlBuffer.append(")");
                    String insertSql = sqlBuffer.toString();
                    jdbcAgent.execute(insertSql);
                    //保存正文数据
                    StringBuffer contentSqlBuffer = new StringBuffer();
                    contentSqlBuffer.append("insert into ctp_content_all(ID,CREATE_ID,CREATE_DATE,MODIFY_ID,MODIFY_DATE,MODULE_TYPE,MODULE_ID,MODULE_TEMPLATE_ID,CONTENT_TYPE,CONTENT_DATA_ID,CONTENT_TEMPLATE_ID) values");
                    contentSqlBuffer.append("(");
                    contentSqlBuffer.append(CommonUtil.generateID());
                    contentSqlBuffer.append(",");
                    contentSqlBuffer.append(currentUserId);
                    contentSqlBuffer.append(",");
                    contentSqlBuffer.append("now()");
                    contentSqlBuffer.append(",");
                    contentSqlBuffer.append(currentUserId);
                    contentSqlBuffer.append(",");
                    contentSqlBuffer.append("now()");
                    contentSqlBuffer.append(",");
                    contentSqlBuffer.append("42");
                    contentSqlBuffer.append(",");
                    contentSqlBuffer.append(custumId);
                    contentSqlBuffer.append(",");
                    contentSqlBuffer.append(CommonUtil.generateID());
                    contentSqlBuffer.append(",");
                    contentSqlBuffer.append("20");
                    contentSqlBuffer.append(",");
                    contentSqlBuffer.append(custumId);
                    contentSqlBuffer.append(",");
                    contentSqlBuffer.append(templateId);
                    contentSqlBuffer.append(")");
                    jdbcAgent.execute(contentSqlBuffer.toString());
                }
            }
            resultMap.put("code", 0);
            resultMap.put("msg", "导入数据成功！");
        } catch (Exception e) {
            //e.printStackTrace();
            LOG.error(e);
            resultMap.put("code", -1);
            resultMap.put("msg", "导入数据失败！");
        } finally {
            jdbcAgent.close();
        }
    }

    public List<DutyInformationEntity> getList() {
        return list;
    }

    public void setList(List<DutyInformationEntity> list) {
        this.list = list;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public Map<String, Object> getResultMap() {
        return resultMap;
    }

    public void setResultMap(Map<String, Object> resultMap) {
        this.resultMap = resultMap;
    }
}
