package com.seeyon.apps.gwxg.manager;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.seeyon.ctp.common.exceptions.BusinessException;
import com.seeyon.ctp.util.FlipInfo;
import com.seeyon.ctp.common.template.vo.TemplateTreeVo;
import org.springframework.web.servlet.ModelAndView;

public interface DemoManager {

	FlipInfo demoRight(FlipInfo fi, Map<String, String> query) throws BusinessException, SQLException;
	FlipInfo toSwxxList(FlipInfo fi, Map<String, String> query) throws BusinessException, SQLException;
	FlipInfo toXnqsList(FlipInfo fi, Map<String, String> query) throws BusinessException, SQLException;
	FlipInfo toXtbgList(FlipInfo fi, Map<String, String> query) throws BusinessException, SQLException;
	FlipInfo toFlswList(FlipInfo fi, Map<String, String> query) throws BusinessException, SQLException;
	FlipInfo toXfList(FlipInfo fi, Map<String, String> query) throws BusinessException, SQLException;
	FlipInfo toZsbgList(FlipInfo fi, Map<String, String> query) throws BusinessException, SQLException;
	FlipInfo toXxwjPortalList(FlipInfo fi, Map<String, String> query) throws BusinessException, SQLException;
	FlipInfo toXxwjPortalMoreList(FlipInfo fi, Map<String, String> query) throws BusinessException, SQLException;
	FlipInfo toFwQuery(FlipInfo fi, Map<String, String> query) throws BusinessException, SQLException;
	FlipInfo toSwQuery(FlipInfo fi, Map<String, String> query) throws BusinessException, SQLException;
	FlipInfo toCbryQuery(FlipInfo fi, Map<String, String> query,String formson0216_id) throws BusinessException, SQLException;
	FlipInfo toZbtjqkList(FlipInfo fi, Map<String, String> query) throws BusinessException, SQLException;
	FlipInfo toTjQkDetail(FlipInfo fi, Map<String, String> query,String zbjh,String type) throws BusinessException, SQLException;
}
