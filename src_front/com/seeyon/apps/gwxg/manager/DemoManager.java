package com.seeyon.apps.gwxg.manager;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.seeyon.ctp.common.exceptions.BusinessException;
import com.seeyon.ctp.util.FlipInfo;
import com.seeyon.ctp.common.template.vo.TemplateTreeVo;

public interface DemoManager {

	FlipInfo demoRight(FlipInfo fi, Map<String, String> query) throws BusinessException, SQLException;


}
