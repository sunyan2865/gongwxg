package com.seeyon.apps.treeandgrid.manager;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.seeyon.apps.treeandgrid.po.DemoGrade;
import com.seeyon.apps.treeandgrid.po.DemoStudent;
import com.seeyon.apps.treeandgrid.vo.StudentVO;
import com.seeyon.ctp.common.exceptions.BusinessException;
import com.seeyon.ctp.common.template.vo.TemplateTreeVo;
import com.seeyon.ctp.organization.manager.OrgManager;
import com.seeyon.ctp.util.*;
import com.seeyon.ctp.util.annotation.AjaxAccess;
import com.seeyon.apps.treeandgrid.util.JDBCUtil;
import java.sql.SQLException;
public class DemoManagerImpl implements DemoManager {

	private OrgManager orgManager;
	public static final String ROOTID = "0";

	public OrgManager getOrgManager() {
		return orgManager;
	}

	public void setOrgManager(OrgManager orgManager) {
		this.orgManager = orgManager;
	}

	//--------------------demo----------------------

	@SuppressWarnings("unchecked")
	@Override
	@AjaxAccess
	public List<TemplateTreeVo> demoLeft() {
		
		List<TemplateTreeVo> voList = new ArrayList<TemplateTreeVo>();
		
		TemplateTreeVo root = new TemplateTreeVo(0l,"根目录","1",null,"");
		voList.add(root);
		TemplateTreeVo vo = null;
		String hql = " from DemoGrade";
		List<DemoGrade> find = DBAgent.find(hql);
		for(int a =0 ; a < find.size(); a ++) {
			DemoGrade demo = find.get(a);
			vo = new TemplateTreeVo(demo.getId(),demo.getSubject(),demo.getStype(),demo.getParentId(),"");
			voList.add(vo);
		}
		return voList;
	}
	
	
	@Override
	@AjaxAccess
	@SuppressWarnings("unchecked")
	public FlipInfo demoRight(FlipInfo flipInfo,Map<String,String> query) throws SQLException, BusinessException {
		/*StringBuffer sql = new StringBuffer(
				"select * from (SELECT t.id summaryId,t.FORM_RECORDID,r.id AFFAIRID,t.start_time ,edoc_type,t.CURRENT_NODES_INFO as currentId,f.field0005 as sex ,DATE_FORMAT(f.field0016 ,'%Y-%m-%d')  as age,f.field0026 as subject FROM " +
				"( SELECT * FROM edoc_summary t WHERE t.EDOC_TYPE = '0' ) t " +
				"  JOIN formmain_0086 f ON f.id = t.FORM_RECORDID" +
				"  left join ctp_affair r on r.OBJECT_ID=t.id and r.state in ('1','2')) t   where 1=1 " );
		*/

		StringBuffer sql=new StringBuffer("select * from ( " +
				                                " select f.field0005 as sex ,DATE_FORMAT(f.field0016 ,'%Y-%m-%d')  as age,f.field0026 as subject,f.start_date, t.id summaryId,t.FORM_RECORDID,t.start_time ,t.edoc_type,r.CURRENT_NODES_INFO as currentId " +
												"  from formmain_0086 f " +
											    "  left join  (SELECT * FROM edoc_summary t WHERE t.EDOC_TYPE = '0') t on  t.FORM_RECORDId=f.id " +
											    "  left join (select object_id,group_concat(distinct member_id) as CURRENT_NODES_INFO from ctp_affair r where    state!='2'  group by object_id) r on r.OBJECT_ID=t.id " +
											    " )t where 1=1 ");

		if(null != query.get("subject")) {
			sql.append(" and subject like  '%"+query.get("subject") +"%'");
		}
		/*if(null != query.get("name")) {
			sql.append(" and name like  '%"+query.get("name")+"%'");
		}*/
		if(null != query.get("startime")) {
			sql.append(" and age >= '"+query.get("startime")+"'");
		}

		if(null != query.get("endtime")) {
			sql.append(" and age <= '"+query.get("endtime")+"'");
		}

		if(null != query.get("sex")) {
			sql.append(" and sex like '%"+query.get("sex")+"%'");
		}
	/*	sql.append(" order by t.start_time desc ");*/
		sql.append(" order by start_date desc");
		List<Map<String, Object>> swlist = null;
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql.toString());
			swlist = jdbcAgent.resultSetToList();

			for(int i=0;i<swlist.size();i++){
				Map<String, Object> m = swlist.get(i);
				String currentNodeIds= (String) m.get("currentid");

				if(null!=currentNodeIds && !(currentNodeIds.equals(""))){
					String[] currentNodeIdsArr=currentNodeIds.split(",");
					String idstr="";
					for(int j=0;j<currentNodeIdsArr.length;j++){
						idstr+="'"+currentNodeIdsArr[j]+"',";
					}
					String str = "select group_concat(name) name from ORG_MEMBER where id in(" + idstr.substring(0,idstr.length()-1) + ")";
					jdbcAgent.execute(str);
					List<Map<String, Object>> l =jdbcAgent.resultSetToList();
					//List<Map<String, Object>> l =JDBCUtil.doQuery(str);
					for (Map.Entry<String, Object> entry : l.get(0).entrySet()) {
						m.put(entry.getKey(), entry.getValue());
					}
				}
			}

		} catch (BusinessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		int page = flipInfo.getPage();
		int size = flipInfo.getSize();
		flipInfo.setTotal(swlist.size());
		List newList = new ArrayList();
		int currIdx = page > 1 ? (page - 1) * size : 0;
		for (int i = 0; i < size && i < (swlist).size() - currIdx; ++i) {
			newList.add((swlist).get(currIdx + i));
		}

		flipInfo.setData(newList);
		/*DBAgent.find(hql.toString(), pMap, fi);
		convertVO1(fi);*/
		return flipInfo;
	}

	@SuppressWarnings("unchecked")
	private void convertVO1(FlipInfo info) {
		if (info != null) {
            List<DemoStudent> list = info.getData();
            if (Strings.isNotEmpty(list)) {
                List<StudentVO> voList = new ArrayList<StudentVO>();
                for (DemoStudent c : list) {
                /*	StudentVO vo = new StudentVO(c.getId(),c.getSubject(),c.getGrades(),c.getSex(),c.getAge(),c.get_nj());
                	voList.add(vo);*/
                }
                info.setData(voList);
            }
			
        }
	}
}
