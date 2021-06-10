package com.seeyon.apps.dutyimport.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.fastjson.JSON;
import com.seeyon.apps.dutyimport.entity.DutyInformationEntity;
import com.seeyon.apps.dutyimport.importListener.ImportDutyDataListener;
import com.seeyon.apps.dutyimport.manager.DutyImportManager;
import com.seeyon.ctp.common.AppContext;
import com.seeyon.ctp.common.controller.BaseController;
import com.seeyon.ctp.common.exceptions.BusinessException;
import com.seeyon.ctp.common.log.CtpLogFactory;
import com.seeyon.ctp.util.JDBCAgent;
import org.apache.commons.logging.Log;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DutyImportController extends BaseController {

    private static final Log LOG = CtpLogFactory.getLog(DutyImportController.class);

    private DutyImportManager dutyImportManager;

    /**
     * 跳转到值班导入页面
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ModelAndView toDutyImport(HttpServletRequest request, HttpServletResponse response)throws Exception{
        response.setContentType("text/html;charset=UTF-8");
        ModelAndView view = new ModelAndView("dutyimport/duty_import");
        Map<String,String> query = new HashMap<String,String>();
        List<Map<String, Object>> dutyPlanList = null;
        JDBCAgent jdbcAgent = new JDBCAgent(true, false);
        try {
            Long currentOrg = AppContext.getCurrentUser().getDepartmentId();
            String sql = "select id, name from org_unit where id = " + currentOrg;
            jdbcAgent.execute(sql);
            Map<String, Object> currentDepartment = jdbcAgent.resultSetToMap();
            String currentOrgName = String.valueOf(currentDepartment.get("name"));
            String sql1 = "select t.id, t.field0001 title from formmain_0180 t   where field0013=-898589291194397946  order by start_date desc";
            jdbcAgent.execute(sql1);
            dutyPlanList = jdbcAgent.resultSetToList();
            view.addObject("currentDepartment", currentOrg);
            view.addObject("currentDepartmentName", currentOrgName);
        } catch (BusinessException e) {
            //e.printStackTrace();
            LOG.error(e);
        } catch (SQLException e) {
            //e.printStackTrace();
            LOG.error(e);
        }finally {
            jdbcAgent.close();
        }
        view.addObject("dutyPlanList", dutyPlanList);
        return view;
    }

    public void importDutyData(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("text/html;charset=utf-8");
        Map<String, Object> resultMap = new HashMap<>();
        String resultJson = null;
        try {
            LOG.info("======值班数据导入开始======");
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            MultipartFile file = multipartRequest.getFile("file");
            ImportDutyDataListener importDutyDataListener = new ImportDutyDataListener(request, resultMap);
            EasyExcel.read(file.getInputStream(), DutyInformationEntity.class, importDutyDataListener).sheet().doRead();
            resultJson = JSON.toJSONString(resultMap);
            LOG.info("======值班数据导入结束======");
        } catch (IOException e) {
            //e.printStackTrace();
            LOG.error(e);
            resultMap.put("code", -1);
            resultMap.put("msg", "导入数据失败！");
            resultJson = JSON.toJSONString(resultMap);

        }
        try {
            response.getWriter().print(resultJson);
        } catch (IOException e) {
            //e.printStackTrace();
            LOG.error(e);
        }
    }

    public DutyImportManager getDutyImportManager() {
        return dutyImportManager;
    }

    public void setDutyImportManager(DutyImportManager dutyImportManager) {
        this.dutyImportManager = dutyImportManager;
    }
}