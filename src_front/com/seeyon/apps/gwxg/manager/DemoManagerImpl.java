package com.seeyon.apps.gwxg.manager;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;

import com.seeyon.ctp.common.AppContext;
import com.seeyon.ctp.common.authenticate.domain.User;
import com.seeyon.ctp.common.exceptions.BusinessException;
import com.seeyon.ctp.organization.manager.OrgManager;
import com.seeyon.ctp.util.*;
import com.seeyon.ctp.util.annotation.AjaxAccess;
import java.sql.SQLException;
import com.seeyon.apps.gwxg.util.CommonUtil;
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

		StringBuffer sql=new StringBuffer("select * from (  select t.id summaryId,t.FORM_RECORDID,t.case_id,t.process_id,t.org_department_id,t.form_app_id,f.field0005 as sex ,DATE_FORMAT(f.field0016 ,'%Y-%m-%d')  as age,f.field0026 as subject,f.start_date, t.start_time ,t.edoc_type,GROUP_CONCAT(u.name) name" +
				"  from formmain_0086 f " +
				"     left join  (SELECT * FROM edoc_summary t WHERE t.EDOC_TYPE = '0') t on  t.FORM_RECORDId=f.id" +
				"   left join (select * from ctp_affair r where r.state='3' ) r on r.OBJECT_ID=t.id" +
				"  left join ORG_MEMBER u on u.id=r.MEMBER_ID" +
				"  group by t.id,t.FORM_RECORDID,t.case_id,t.process_id,t.org_department_id,t.form_app_id,f.field0005,DATE_FORMAT(f.field0016 ,'%Y-%m-%d'),f.field0026,f.start_date, t.start_time ,t.edoc_type" +
				" )t where 1=1  ");

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
		List<Map<String, Object>> revoler = new ArrayList<>();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql.toString());
			swlist = jdbcAgent.resultSetToList();


			for(int i=0;i<revoler.size();i++){
				Map<String, Object> m = revoler.get(i);
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

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}

		int page = flipInfo.getPage();
		int size = 200;
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


	/*******************发文-校内请示 start*******************************/
	@Override
	@AjaxAccess
	@SuppressWarnings("unchecked")
	public FlipInfo toXnqsList(FlipInfo flipInfo,Map<String,String> query) throws SQLException, BusinessException {
		StringBuffer sql=new StringBuffer(" select t.*,(select name from org_member r where r.id=t.qcr) qcrxm from ( " +
				" select t.id summaryid,f.id formid, f.field0003 qsbt,f.field0002 qcr,replace(f.field0001,'Department|','')  qsbm,f.start_date from formmain_0195 f " +
				" left join  (select * from edoc_summary t where t.edoc_type = '0') t on  t.form_recordid=f.id  " +
				" )t where 1=1 " );

		if(null != query.get("qsbt")) {
			sql.append(" and qsbt like  '%"+query.get("qsbt") +"%'");
		}
		if(null != query.get("qcr")) {
			sql.append(" and qcr like '%"+query.get("qcr")+"%'");
		}
		sql.append(" order by start_date desc");
		List<Map<String, Object>> swlist = null;
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql.toString());
			swlist = jdbcAgent.resultSetToList();

			for(int i=0;i<swlist.size();i++){
				Map<String, Object> m = swlist.get(i);
				String qsbm= (String) m.get("qsbm");

				if(null!=qsbm && !(qsbm.equals(""))){
					String[] qsbmstrArr=qsbm.split(",");
					String idstr="";
					for(int j=0;j<qsbmstrArr.length;j++){
						idstr+="'"+qsbmstrArr[j]+"',";
					}
					String str = "select group_concat(name) name from org_unit where id in(" + idstr.substring(0,idstr.length()-1) + ")";
					jdbcAgent.execute(str);
					List<Map<String, Object>> l =jdbcAgent.resultSetToList();
					for (Map.Entry<String, Object> entry : l.get(0).entrySet()) {
						m.put(entry.getKey(), entry.getValue());
					}
				}
			}

		} catch (BusinessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}

		int page = flipInfo.getPage();
		int size = 200;
		flipInfo.setTotal(swlist.size());
		List newList = new ArrayList();
		int currIdx = page > 1 ? (page - 1) * size : 0;
		for (int i = 0; i < size && i < (swlist).size() - currIdx; ++i) {
			newList.add((swlist).get(currIdx + i));
		}

		flipInfo.setData(newList);
		return flipInfo;
	}


	/*******************收文-学校文件笺 *******************************/
	@Override
	@AjaxAccess
	@SuppressWarnings("toSwxxList")
	public FlipInfo toSwxxList(FlipInfo flipInfo, Map<String,String> query) throws SQLException, BusinessException {

		StringBuffer sql=new StringBuffer("  select t.*,e.showvalue clxzmc from (" +
				"     select t.id summaryid,f.id formid, t.case_id,t.process_id,t.org_department_id,t.form_app_id,f.field0006 wjbt,f.field0016 blqx ,f.field0011 as clxz,f.field0014 swrq,f.start_date,GROUP_CONCAT(u.name) current_node_name from formmain_0081 f " +
				"                 left join  (SELECT * FROM edoc_summary t WHERE t.EDOC_TYPE = '1') t on  t.FORM_RECORDId=f.id " +
				"                 left join ctp_affair r on r.OBJECT_ID=t.id and r.state ='3'" +
				"                 left join ORG_MEMBER u on u.id=r.MEMBER_ID " +
				"                 group by t.id,f.id,t.case_id,t.process_id,t.org_department_id,t.form_app_id,f.field0006,f.field0016,f.field0014,f.field0011,f.start_date " +
				" )t  " +
				" left join (select id,showvalue from ctp_enum_item i where i.REF_ENUMID='6534952330511468065') e on e.id=t.clxz "+
				" where 1=1  "
		);

		if(null != query.get("wjbt")) {
			sql.append(" and wjbt like  '%"+query.get("wjbt") +"%'");
		}

		if(null != query.get("startime")) {
			sql.append(" and blqx >= '"+query.get("startime")+"'");
		}

		if(null != query.get("endtime")) {
			sql.append(" and blqx <= '"+query.get("endtime")+"'");
		}

		sql.append(" order by start_date desc  ");
		List<Map<String, Object>> swxxlist = null;
		List<Map<String, Object>> revoler = new ArrayList<>();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql.toString());
			swxxlist = jdbcAgent.resultSetToList();

			for (int i = 0; i < swxxlist.size(); i++) {
				Map<String, Object> m = new HashMap<>();
				for (Map.Entry<String, Object> entry : swxxlist.get(i).entrySet()) {
					m.put(entry.getKey(), String.valueOf(entry.getValue()) + "");
				}
				revoler.add(m);
			}

		} catch (BusinessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}

	/*	flipInfo.setTotal(swxxlist.size());
		flipInfo.setData(revoler);*/

		int page = flipInfo.getPage();
		int size = 200;
		flipInfo.setTotal(revoler.size());
		List newList = new ArrayList();
		int currIdx = page > 1 ? (page - 1) * size : 0;
		for (int i = 0; i < size && i < (revoler).size() - currIdx; ++i) {
			newList.add((revoler).get(currIdx + i));
		}
		flipInfo.setData(newList);

		return flipInfo;
	}


	/******************* 收文-协同办公******************************/
	@Override
	@AjaxAccess
	@SuppressWarnings("toXtbgList")
	public FlipInfo toXtbgList(FlipInfo flipInfo, Map<String,String> query) throws SQLException, BusinessException {

		StringBuffer sql=new StringBuffer("  select * from (" +
				" select t.id summaryid,t.state,f.id formid,t.case_id,t.process_id,t.org_department_id,t.form_app_id,f.field0001 bt, f.field0002 bqdw,f.field0013 blqx,f.start_date," +
				" (select u.name from org_unit u where u.id=f.field0002) bqdwmc" +
				" from formmain_0188 f" +
				" left join  (SELECT * FROM edoc_summary t WHERE t.EDOC_TYPE = '1') t on  t.FORM_RECORDId=f.id " +
				" )t where 1=1" );

		if(null != query.get("bt")) {
			sql.append(" and bt like  '%"+query.get("bt") +"%'");
		}

		if(null != query.get("startime")) {
			sql.append(" and blqx >= '"+query.get("startime")+"'");
		}

		if(null != query.get("endtime")) {
			sql.append(" and blqx <= '"+query.get("endtime")+"'");
		}

		sql.append("  order by start_date desc   ");
		List<Map<String, Object>> swxxlist = null;
		List<Map<String, Object>> revoler = new ArrayList<>();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql.toString());
			swxxlist = jdbcAgent.resultSetToList();

			for (int i = 0; i < swxxlist.size(); i++) {
				Map<String, Object> m = new HashMap<>();
				for (Map.Entry<String, Object> entry : swxxlist.get(i).entrySet()) {
					m.put(entry.getKey(), String.valueOf(entry.getValue()) + "");
				}
				revoler.add(m);
			}

		} catch (BusinessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}

		/*flipInfo.setTotal(swxxlist.size());
		flipInfo.setData(revoler);*/
		int page = flipInfo.getPage();
		int size = 200;
		flipInfo.setTotal(revoler.size());
		List newList = new ArrayList();
		int currIdx = page > 1 ? (page - 1) * size : 0;
		for (int i = 0; i < size && i < (revoler).size() - currIdx; ++i) {
			newList.add((revoler).get(currIdx + i));
		}
		flipInfo.setData(newList);
		return flipInfo;
	}




	/******************* 法律事务******************************/
	@Override
	@AjaxAccess
	@SuppressWarnings("toFlswList")
	public FlipInfo toFlswList(FlipInfo flipInfo, Map<String,String> query) throws SQLException, BusinessException {

		StringBuffer sql=new StringBuffer("  select * from ( " +
				" select f.id formid,s.id summaryid,field0001 bt,(select name from org_member where id=f.field0002) djr,(select name from org_unit where id=f.field0003) djbm,field0004 sdr,field0005 sdfs,field0006 lwdw,field0008 lwbh, " +
				" field0009,DATE_FORMAT(f.field0009 ,'%Y-%m-%d') djsj,f.field0011,f.start_date from formmain_0084 f " +
				" left join col_summary s on s.form_recordid=f.id" +
				" )t where 1=1 " );

		if(null != query.get("bt")) {
			sql.append(" and bt like  '%"+query.get("bt") +"%'");
		}
		if(null != query.get("djr")) {
			sql.append(" and djr like  '%"+query.get("djr") +"%'");
		}
		if(null != query.get("startime")) {
			sql.append(" and djsj >= '"+query.get("startime")+"'");
		}

		if(null != query.get("endtime")) {
			sql.append(" and djsj <= '"+query.get("endtime")+"'");
		}

		sql.append("   order by start_date desc    ");
		List<Map<String, Object>> swxxlist = null;
		List<Map<String, Object>> revoler = new ArrayList<>();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql.toString());
			swxxlist = jdbcAgent.resultSetToList();

			for (int i = 0; i < swxxlist.size(); i++) {
				Map<String, Object> m = new HashMap<>();
				for (Map.Entry<String, Object> entry : swxxlist.get(i).entrySet()) {
					m.put(entry.getKey(), String.valueOf(entry.getValue()) + "");
				}
				revoler.add(m);
			}

		} catch (BusinessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}

		/*flipInfo.setTotal(swxxlist.size());
		flipInfo.setData(revoler);*/
		int page = flipInfo.getPage();
		int size = 200;
		flipInfo.setTotal(revoler.size());
		List newList = new ArrayList();
		int currIdx = page > 1 ? (page - 1) * size : 0;
		for (int i = 0; i < size && i < (revoler).size() - currIdx; ++i) {
			newList.add((revoler).get(currIdx + i));
		}
		flipInfo.setData(newList);
		return flipInfo;
	}



	/******************* 信访******************************/
	@Override
	@AjaxAccess
	@SuppressWarnings("toXfList")
	public FlipInfo toXfList(FlipInfo flipInfo, Map<String,String> query) throws SQLException, BusinessException {

		StringBuffer sql=new StringBuffer("  select t.*,(select name from org_member where id=t.field0017) djr from ( " +
				" select f.id formid,t.id summaryid,field0018 bt,field0017,f.start_date,group_concat(m.name) dqblr " +
				" from formmain_0085 f " +
				" left join  col_summary t on  t.FORM_RECORDId=f.id " +
				" left join ctp_affair r on r.OBJECT_ID=t.id and r.state='3' " +
				" left join org_member m on m.id=r.member_id " +
				" group by f.id,t.id,field0018,field0017,f.start_date " +
				" )t where 1=1 " );

		if(null != query.get("bt")) {
			sql.append(" and bt like  '%"+query.get("bt") +"%'");
		}
		if(null != query.get("djr")) {
			sql.append(" and djr like  '%"+query.get("djr") +"%'");
		}

		sql.append("   order by start_date desc    ");
		List<Map<String, Object>> swxxlist = null;
		List<Map<String, Object>> revoler = new ArrayList<>();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql.toString());
			swxxlist = jdbcAgent.resultSetToList();

			for (int i = 0; i < swxxlist.size(); i++) {
				Map<String, Object> m = new HashMap<>();
				for (Map.Entry<String, Object> entry : swxxlist.get(i).entrySet()) {
					m.put(entry.getKey(), String.valueOf(entry.getValue()) + "");
				}
				revoler.add(m);
			}

		} catch (BusinessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}

		/*flipInfo.setTotal(swxxlist.size());
		flipInfo.setData(revoler);*/
		int page = flipInfo.getPage();
		int size = 200;
		flipInfo.setTotal(revoler.size());
		List newList = new ArrayList();
		int currIdx = page > 1 ? (page - 1) * size : 0;
		for (int i = 0; i < size && i < (revoler).size() - currIdx; ++i) {
			newList.add((revoler).get(currIdx + i));
		}
		flipInfo.setData(newList);
		return flipInfo;
	}



	/******************* 哲社报告******************************/
	@Override
	@AjaxAccess
	@SuppressWarnings("toZsbgList")
	public FlipInfo toZsbgList(FlipInfo flipInfo, Map<String,String> query) throws SQLException, BusinessException {

		StringBuffer sql=new StringBuffer("  select * from (" +
				" select f.id formid,t.id summaryid,f.field0005 bt,f.start_date,f.field0006 jbsj,f.field0007 jbdd,f.field0008 cjrs,(select name from org_unit t where t.id=f.field0001) sqdw from formmain_0091 f " +
				" left join  col_summary t on  t.FORM_RECORDId=f.id " +
				" )t  where 1=1 " );

		if(null != query.get("bt")) {
			sql.append(" and bt like  '%"+query.get("bt") +"%'");
		}
		if(null != query.get("jbdd")) {
			sql.append(" and jbdd like  '%"+query.get("jbdd") +"%'");
		}
		if(null != query.get("startime")) {
			sql.append(" and jbsj >= '"+query.get("startime")+"'");
		}

		if(null != query.get("endtime")) {
			sql.append(" and jbsj <= '"+query.get("endtime")+"'");
		}

		sql.append("   order by start_date desc    ");
		List<Map<String, Object>> swxxlist = null;
		List<Map<String, Object>> revoler = new ArrayList<>();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql.toString());
			swxxlist = jdbcAgent.resultSetToList();

			for (int i = 0; i < swxxlist.size(); i++) {
				Map<String, Object> m = new HashMap<>();
				for (Map.Entry<String, Object> entry : swxxlist.get(i).entrySet()) {
					m.put(entry.getKey(), String.valueOf(entry.getValue()) + "");
				}
				revoler.add(m);
			}

		} catch (BusinessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}

	/*	flipInfo.setTotal(swxxlist.size());
		flipInfo.setData(revoler);*/
		int page = flipInfo.getPage();
		int size = 200;
		flipInfo.setTotal(revoler.size());
		List newList = new ArrayList();
		int currIdx = page > 1 ? (page - 1) * size : 0;
		for (int i = 0; i < size && i < (revoler).size() - currIdx; ++i) {
			newList.add((revoler).get(currIdx + i));
		}
		flipInfo.setData(newList);

		return flipInfo;
	}




   /******************* 首页栏目-学校文件-限制******************************/
	@Override
	@AjaxAccess
	@SuppressWarnings("toXxwjPortalList")
	public FlipInfo toXxwjPortalList(FlipInfo flipInfo, Map<String,String> query) throws SQLException, BusinessException {
		flipInfo=getPoratlList("limit",flipInfo, query);
		return flipInfo;
	}


	/******************* 首页栏目-学校文件-更多******************************/
	@Override
	@AjaxAccess
	@SuppressWarnings("toXxwjPortalMoreList")
	public FlipInfo toXxwjPortalMoreList(FlipInfo flipInfo, Map<String,String> query) throws SQLException, BusinessException {
		flipInfo=getPoratlList("more",flipInfo, query);
		return flipInfo;
	}



	private FlipInfo getPoratlList(String  type,FlipInfo flipInfo, Map<String,String> query){
		String currentUserId = AppContext.getCurrentUser().getId().toString();
		List<Map<String, Object>> xxwjlist = null;
		List<Map<String, Object>> resultlist =  new ArrayList<>();
		List<Map<String, Object>> revoler = new ArrayList<>();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);

		/*StringBuffer alldatasql=new StringBuffer("select * from( select distinct  t.id summaryid,f.id formid,f.field0001 wjbt,f.field0005 wh,field0008 wjfbrq,f.field0006 gkfs,f.start_date,f.field0011 gly,f.field0012 ysqgkr,i.showvalue gksfmc,(select count(c.id) from ctp_attachment c where c.att_reference=t.id) fjcnt,c.content, date_format(a.create_date,'%Y-%m-%d') date from formmain_0170 f " +
				" left join edoc_summary t on t.form_recordid=f.id " +
				" left join ctp_content_all c on c.content is not null and c.module_id=t.id "+
				" left join ctp_content_all a on a.content  is null and a.module_id=t.id "+
		" left join (select id,showvalue from ctp_enum_item t where t.REF_ENUMID='-6716972179926924238'  and state='1') i on i.id=f.field0006 " +
				"  ) t where 1=1 ");*/
		StringBuffer alldatasql=new StringBuffer(" select * from( select distinct  t.id summaryid,f.id formid,f.field0005 wjbt,f.field0026 wh,t.complete_time wjfbrq,f.field0014 gkfs,f.start_date,f.field0030 gly,f.field0029 ysqgkr,i.showvalue gksfmc,(select count(c.id) from ctp_attachment c where c.att_reference=t.id) fjcnt,c.content,t.state,t.complete_time,date_format(c.modify_date,'%Y-%m-%d') date from formmain_0086 f " +
				" left join edoc_summary t on t.form_recordid=f.id " +
				" left join ctp_content_all c on (c.content is not null and c.content!='') and c.module_id=t.id "+
				" left join (select id,showvalue from ctp_enum_item t where t.REF_ENUMID='-6716972179926924238'  and state='1') i on i.id=f.field0014 " +
				"  ) t where t.complete_time is not null  ");
		if(type.equals("more")){
			if(null != query.get("wjbt")) {
				alldatasql.append(" and wjbt like  '%"+query.get("wjbt") +"%'");
			}
			if(null != query.get("wh")) {
				alldatasql.append(" and wh like  '%"+query.get("wh") +"%'");
			}
			if(null != query.get("gksfmc")) {
				alldatasql.append(" and gksfmc like  '%"+query.get("gksfmc") +"%'");
			}
			if(null != query.get("startime")) {
				alldatasql.append(" and wjfbrq >= '"+query.get("startime")+"'");
			}

			if(null != query.get("endtime")) {
				alldatasql.append(" and wjfbrq <= '"+query.get("endtime")+"'");
			}
		}

		alldatasql.append("  order by complete_time desc ");
		try{
			jdbcAgent.execute(alldatasql.toString());
			xxwjlist=jdbcAgent.resultSetToList();

			String glysql="select  group_concat(OBJECTIVE0_ID) gly from org_relationship  t where t.source_id='-8784815977654893165'";
			jdbcAgent.execute(glysql);
			Map<String, Object> glydata=jdbcAgent.resultSetToMap();
			String gly="";
			if(null!=glydata.get("gly")){
				gly=glydata.get("gly").toString();
			}
			if(!(gly.equals(""))){
				if(gly.indexOf(currentUserId)!=-1){//当前用户在“学校文件管理员”组里面
					resultlist=xxwjlist;
				}else{
					resultlist=getXxwjList(currentUserId,xxwjlist);
				}
			}else{
				resultlist=getXxwjList(currentUserId,xxwjlist);
			}

			int cnt=resultlist.size();
			if(type.equals("limit")){
				if(cnt>20){cnt=20;}
			}
			for (int i = 0; i < cnt; i++) {
				Map<String, Object> m = new HashMap<>();
				for (Map.Entry<String, Object> entry : resultlist.get(i).entrySet()) {
					m.put(entry.getKey(), String.valueOf(entry.getValue()) + "");
				}
				revoler.add(m);
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}

		/*flipInfo.setTotal(revoler.size());
		flipInfo.setSize(10);
		flipInfo.setData(revoler);*/


		int page = flipInfo.getPage();
		int size = 200;
		flipInfo.setTotal(revoler.size());
		List newList = new ArrayList();
		int currIdx = page > 1 ? (page - 1) * size : 0;
		for (int i = 0; i < size && i < (revoler).size() - currIdx; ++i) {
			newList.add((revoler).get(currIdx + i));
		}
		flipInfo.setData(newList);

		return flipInfo;
	}

	private  List<Map<String, Object>>  getXxwjList(String currentUserId,List<Map<String, Object>> xxwjlist) throws Exception {
		List<Map<String, Object>> resultlist =  new ArrayList<>();
		for (int p = 0; p < xxwjlist.size(); p++) {
			Map<String, Object> m = xxwjlist.get(p);
			String gkfs=com.seeyon.apps.gwxg.util.CommonUtil.isJudgeNull((String)m.get("gkfs"));
			//String gly=(String)m.get("gly");//学校文件管理员
			String ysqgk=com.seeyon.apps.gwxg.util.CommonUtil.isJudgeNull((String)m.get("ysqgkr"));//依申请公开人
			if(gkfs.equals("-7932555032561041306")){//公开
				resultlist.add(m);
			}else if(gkfs.equals("-6555425946729429389")){//依申请公开
				if(ysqgk.indexOf(currentUserId)!=-1){
					resultlist.add(m);
				}
			}
		}
		return resultlist;
	}






	/**
	 * 发文查询
	 */
	@Override
	@AjaxAccess
	@SuppressWarnings("toFwQuery")
	public FlipInfo toFwQuery(FlipInfo flipInfo,Map<String,String> query) throws SQLException, BusinessException {
		StringBuffer sql=new StringBuffer("select * from ( " +
				" select f.field0005 as sex ,field0024,e.showvalue jgdz,DATE_FORMAT(f.field0016 ,'%Y-%m-%d')  as age,f.field0026 as subject,f.start_date, t.id summaryId,t.FORM_RECORDID,t.start_time ,t.edoc_type,r.name,t.form_app_id summary_formid,t.form_id summary_operationId " +
				"  from formmain_0086 f " +
				"  left join  (SELECT * FROM edoc_summary t WHERE t.EDOC_TYPE = '0') t on  t.FORM_RECORDId=f.id " +
				"  left join (select object_id ,group_concat(distinct name) name from (" +
				"     select object_id,(select name from org_member m where m.id=r.member_id) name from ctp_affair r where state='3' " +
				"     ) r group by object_id " +
				"   ) r on r.OBJECT_ID=t.id " +
				"  left join (select id,showvalue from ctp_enum_item i where i.REF_ENUMID='-7394917914078590178'  and state='1') e on e.id=f.field0024  "+
				" )t where 1=1 ");

		if(null != query.get("subject")) {
			sql.append(" and subject like  '%"+query.get("subject") +"%'");
		}
		if(null != query.get("startime")) {
			sql.append(" and age >= '"+query.get("startime")+"'");
		}

		if(null != query.get("endtime")) {
			sql.append(" and age <= '"+query.get("endtime")+"'");
		}

		if(null != query.get("sex")) {
			sql.append(" and sex like '%"+query.get("sex")+"%'");
		}
		sql.append(" order by start_date desc");
		List<Map<String, Object>> swlist = null;
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql.toString());
			swlist = jdbcAgent.resultSetToList();


			String userid=AppContext.getCurrentUser().getId().toString();

			//-3873478983634171192	中矿大校字
			//3227204207172275053	中矿组字


			//使用迭代删除
			Iterator<Map<String, Object>> dataIterator = swlist.iterator();
			while (dataIterator.hasNext()) {
				//删除特定元素
				Map<String, Object> m = dataIterator.next();
				String jgdz= (String) m.get("field0024");//机构代字
				String summaryid=m.get("summaryid").toString();//summaryid
				String affair_sql="select group_concat(distinct member_id) memberid from ctp_affair r where r.object_id='"+summaryid+"'";
				Map<String, Object> affairdata = null;
				jdbcAgent.execute(affair_sql);
				affairdata=jdbcAgent.resultSetToMap();
				String affairmemberid=(String)affairdata.get("memberid");//待办用户id
				if(null!=jgdz && (jgdz.equals("-3873478983634171192") || jgdz.equals("3227204207172275053"))){
					if(affairmemberid.indexOf(userid)==-1){
						dataIterator.remove();
					}
				}
			}

			/*for(int i=0;i<swlist.size();i++){
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
					for (Map.Entry<String, Object> entry : l.get(0).entrySet()) {
						m.put(entry.getKey(), entry.getValue());
					}
				}
			}*/

		} catch (BusinessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}
		/*int page = flipInfo.getPage();
		int size = flipInfo.getSize();
		flipInfo.setTotal(swlist.size());
		List newList = new ArrayList();
		int currIdx = page > 1 ? (page - 1) * size : 0;
		for (int i = 0; i < size && i < (swlist).size() - currIdx; ++i) {
			newList.add((swlist).get(currIdx + i));
		}

		flipInfo.setData(newList);*/
		int page = flipInfo.getPage();
		int size = 200;
		flipInfo.setTotal(swlist.size());
		List newList = new ArrayList();
		int currIdx = page > 1 ? (page - 1) * size : 0;
		for (int i = 0; i < size && i < (swlist).size() - currIdx; ++i) {
			newList.add((swlist).get(currIdx + i));
		}
		flipInfo.setData(newList);
		return flipInfo;
	}


	/**
	 * 收文查询
	 * @param flipInfo
	 * @param query
	 * @return
	 * @throws SQLException
	 * @throws BusinessException
	 */
	@Override
	@AjaxAccess
	@SuppressWarnings("toSwQuery")
	public FlipInfo toSwQuery(FlipInfo flipInfo, Map<String,String> query) throws SQLException, BusinessException {

		StringBuffer sql=new StringBuffer("  select t.*,e.showvalue clxzmc from (" +
				"     select t.id summaryid,f.id formid, f.field0006 wjbt,f.field0016 blqx ,f.field0011 as clxz,f.field0002 lwbh,f.field0014 swrq,f.start_date,GROUP_CONCAT(u.name) current_node_name,t.form_app_id summary_formid,t.form_id summary_operationId from formmain_0081 f " +
				"                 left join  (SELECT * FROM edoc_summary t WHERE t.EDOC_TYPE = '1') t on  t.FORM_RECORDId=f.id " +
				"                 left join ctp_affair r on r.OBJECT_ID=t.id and r.state ='3'" +
				"                 left join ORG_MEMBER u on u.id=r.MEMBER_ID " +
				"                 group by t.id,f.id,f.field0006,f.field0016,f.field0014,f.field0011,f.start_date " +
				" )t  " +
				" left join (select id,showvalue from ctp_enum_item i where i.REF_ENUMID='6534952330511468065') e on e.id=t.clxz "+
				" where 1=1  "
		);

		if(null != query.get("wjbt")) {
			sql.append(" and wjbt like  '%"+query.get("wjbt") +"%'");
		}
		if(null != query.get("lwbh")) {
			sql.append(" and lwbh like  '%"+query.get("lwbh") +"%'");
		}
		if(null != query.get("clxzmc")) {
			sql.append(" and e.showvalue like  '%"+query.get("clxzmc") +"%'");
		}

		if(null != query.get("startime")) {
			sql.append(" and blqx >= '"+query.get("startime")+"'");
		}

		if(null != query.get("endtime")) {
			sql.append(" and blqx <= '"+query.get("endtime")+"'");
		}

		sql.append(" order by start_date desc  ");
		List<Map<String, Object>> swxxlist = null;
		List<Map<String, Object>> revoler = new ArrayList<>();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql.toString());
			swxxlist = jdbcAgent.resultSetToList();

			for (int i = 0; i < swxxlist.size(); i++) {
				Map<String, Object> m = new HashMap<>();
				for (Map.Entry<String, Object> entry : swxxlist.get(i).entrySet()) {
					m.put(entry.getKey(), String.valueOf(entry.getValue()) + "");
				}
				revoler.add(m);
			}

		} catch (BusinessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}

		/*flipInfo.setTotal(swxxlist.size());
		flipInfo.setData(revoler);*/

		int page = flipInfo.getPage();
		int size = 200;
		flipInfo.setTotal(revoler.size());
		List newList = new ArrayList();
		int currIdx = page > 1 ? (page - 1) * size : 0;
		for (int i = 0; i < size && i < (revoler).size() - currIdx; ++i) {
			newList.add((revoler).get(currIdx + i));
		}
		flipInfo.setData(newList);
		return flipInfo;
	}




	@Override
	@AjaxAccess
	@SuppressWarnings("toCbryQuery")
	public FlipInfo toCbryQuery(FlipInfo flipInfo, Map<String,String> query,String formson0216_id) throws SQLException, BusinessException {

		StringBuffer sql=new StringBuffer("  select * from ( "+
				" select t.id formmain0217_id,a.id affairid,p.login_name id,a.MEMBER_ID,m.name xm,m.EXT_attr_1 lxdh,a.create_date,a.subject,a.OBJECT_ID from ( "+
				" select * from formmain_0217  f "+
				" where f.field0023=( "+
						" select field0022 from  formson_0216  where id='"+formson0216_id+"') "+
				" )t "+
				"  join col_summary s on s.form_recordid=t.id "+
				"  join ctp_affair a on a.OBJECT_ID=s.id and a.state='3' "+
				" left join org_member m on m.id=a.member_id "+
				" left join org_principal p on p.MEMBER_ID=a.MEMBER_ID "+
				" )t where 1=1 "
		);
		if(null != query.get("xm")) {
			sql.append(" and xm like  '%"+query.get("xm") +"%'");
		}
		sql.append(" order by create_date desc  ");
		List<Map<String, Object>> swxxlist = null;
		List<Map<String, Object>> revoler = new ArrayList<>();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql.toString());
			swxxlist = jdbcAgent.resultSetToList();

			for (int i = 0; i < swxxlist.size(); i++) {
				Map<String, Object> m = new HashMap<>();
				for (Map.Entry<String, Object> entry : swxxlist.get(i).entrySet()) {
					m.put(entry.getKey(), String.valueOf(entry.getValue()) + "");
				}
				revoler.add(m);
			}

		} catch (BusinessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}

		flipInfo.setTotal(swxxlist.size());
		flipInfo.setData(revoler);
		return flipInfo;
	}




	/******************* 值班计划提交情况******************************/
	@Override
	@AjaxAccess
	@SuppressWarnings("toZbtjqkList")
	public FlipInfo toZbtjqkList(FlipInfo flipInfo, Map<String,String> query) throws SQLException, BusinessException {

		StringBuffer sql=new StringBuffer("  select * from (" +
					" select zbjh,t.zscnt, ifnull(f1.ydcnt,0) ydcnt, (t.zscnt-ifnull(f1.ydcnt,0)) wdcnt,f.start_date from ( select field0001 zbjh,1 cnt,start_date from formmain_0180 )   f " +
					" left join (" +
					"     select count(name) zscnt,1 cnt from org_unit  t  where name!='空缺' and is_enable=1 and is_deleted=0 and length(path)>12  " +
					"   )t on f.cnt=t.cnt" +
					" left join " +
					" (select field0011,count(distinct field0001) ydcnt from formmain_0129 group by field0011) f1 on f1.field0011=f.zbjh " +
					" ) t  where 1=1 " );

		if(null != query.get("zbjh")) {
			sql.append(" and zbjh like  '%"+query.get("zbjh") +"%'");
		}

		sql.append(" order by start_date desc  ");
		List<Map<String, Object>> swxxlist = null;
		List<Map<String, Object>> revoler = new ArrayList<>();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql.toString());
			swxxlist = jdbcAgent.resultSetToList();

			for (int i = 0; i < swxxlist.size(); i++) {
				Map<String, Object> m = new HashMap<>();
				for (Map.Entry<String, Object> entry : swxxlist.get(i).entrySet()) {
					m.put(entry.getKey(), String.valueOf(entry.getValue()) + "");
				}
				revoler.add(m);
			}

		} catch (BusinessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}

		flipInfo.setTotal(swxxlist.size());
		flipInfo.setData(revoler);
		return flipInfo;
	}



	@Override
	@AjaxAccess
	@SuppressWarnings("toTjQkDetail")
	public FlipInfo toTjQkDetail(FlipInfo flipInfo, Map<String,String> query,String zbjh,String type) throws SQLException, BusinessException {
		StringBuffer sql=new StringBuffer("");
		if(type.equals("1")){
			sql=new StringBuffer("  select u.name from (" +
					" select distinct field0001 from formmain_0129 f where f.field0011='"+zbjh+"') t" +
					" left join org_unit u on name!='空缺' and is_enable=1 and is_deleted=0 and  length(path)>12 and u.id=t.field0001 " +
					" order by sort_id " );
		}else if(type.equals("2")){
			sql=new StringBuffer("  select u.name from org_unit u  where name!='空缺' and is_enable=1 and is_deleted=0 and  length(path)>12 and u.id not in (select distinct field0001 from formmain_0129 f where f.field0011='"+zbjh+"') order by sort_id" );
		}

		List<Map<String, Object>> swxxlist = null;
		List<Map<String, Object>> revoler = new ArrayList<>();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql.toString());
			swxxlist = jdbcAgent.resultSetToList();

			for (int i = 0; i < swxxlist.size(); i++) {
				Map<String, Object> m = new HashMap<>();
				for (Map.Entry<String, Object> entry : swxxlist.get(i).entrySet()) {
					m.put(entry.getKey(), String.valueOf(entry.getValue()) + "");
				}
				revoler.add(m);
			}

		} catch (BusinessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}

		flipInfo.setTotal(swxxlist.size());
		flipInfo.setData(revoler);
		return flipInfo;
	}




	/*******************收文-校内信息 *******************************/
	@Override
	@AjaxAccess
	@SuppressWarnings("toXnxxList")
	public FlipInfo toXnxxList(FlipInfo flipInfo, Map<String,String> query) throws SQLException, BusinessException {

		StringBuffer sql=new StringBuffer("  select t.*,e.showvalue clxzmc from (" +
				"     select t.id summaryid,f.id formid, t.case_id,t.process_id,t.org_department_id,t.form_app_id,f.field0001 wjbt,f.field0005 blqx ,f.field0002 as clxz,f.field0003 swrq,f.start_date,GROUP_CONCAT(u.name) current_node_name from formmain_0301 f " +
				"                 left join  (SELECT * FROM edoc_summary t WHERE t.EDOC_TYPE = '1') t on  t.FORM_RECORDId=f.id " +
				"                 left join ctp_affair r on r.OBJECT_ID=t.id and r.state ='3'" +
				"                 left join ORG_MEMBER u on u.id=r.MEMBER_ID " +
				"                 group by t.id,f.id,t.case_id,t.process_id,t.org_department_id,t.form_app_id,f.field0001,f.field0005,f.field0002,f.field0003,f.start_date " +
				" )t  " +
				" left join (select id,showvalue from ctp_enum_item i where i.REF_ENUMID='6534952330511468065') e on e.id=t.clxz "+
				" where 1=1  "
		);

		if(null != query.get("wjbt")) {
			sql.append(" and wjbt like  '%"+query.get("wjbt") +"%'");
		}

		if(null != query.get("startime")) {
			sql.append(" and blqx >= '"+query.get("startime")+"'");
		}

		if(null != query.get("endtime")) {
			sql.append(" and blqx <= '"+query.get("endtime")+"'");
		}

		sql.append(" order by start_date desc  ");
		List<Map<String, Object>> swxxlist = null;
		List<Map<String, Object>> revoler = new ArrayList<>();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql.toString());
			swxxlist = jdbcAgent.resultSetToList();

			for (int i = 0; i < swxxlist.size(); i++) {
				Map<String, Object> m = new HashMap<>();
				for (Map.Entry<String, Object> entry : swxxlist.get(i).entrySet()) {
					m.put(entry.getKey(), String.valueOf(entry.getValue()) + "");
				}
				revoler.add(m);
			}

		} catch (BusinessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}

	/*	flipInfo.setTotal(swxxlist.size());
		flipInfo.setData(revoler);*/

		int page = flipInfo.getPage();
		int size = 200;
		flipInfo.setTotal(revoler.size());
		List newList = new ArrayList();
		int currIdx = page > 1 ? (page - 1) * size : 0;
		for (int i = 0; i < size && i < (revoler).size() - currIdx; ++i) {
			newList.add((revoler).get(currIdx + i));
		}
		flipInfo.setData(newList);

		return flipInfo;
	}




	/******************* 党委常委会议题申报******************************/
	@Override
	@AjaxAccess
	@SuppressWarnings("toDwcwSbxx")
	public FlipInfo toDwcwSbxx(FlipInfo flipInfo, Map<String,String> query) throws SQLException, BusinessException {

		StringBuffer sql=new StringBuffer("  select t.*,(select name from org_member where id=t.field0028) djr,(select name from org_unit where id=t.field0027) djdw  from ( " +
				" select f.id formid,t.id summaryid,t.case_id,t.process_id,t.form_appid form_app_id,f.start_member_id currentuserid,field0001 bt,field0027,f.field0032 sbsj,f.start_date,f.field0028,group_concat(m.name) dqblr " +
				" from formmain_0264 f " +
				" left join  col_summary t on  t.FORM_RECORDId=f.id " +
				" left join ctp_affair r on r.OBJECT_ID=t.id and r.state='3' " +
				" left join org_member m on m.id=r.member_id " +
				" group by f.id,t.id,field0001,field0027,f.field0032,f.start_date ,f.field0028 " +
				" )t where 1=1 " );

		if(null != query.get("bt")) {
			sql.append(" and bt like  '%"+query.get("bt") +"%'");
		}
		if(null != query.get("djr")) {
			sql.append(" and djr like  '%"+query.get("djr") +"%'");
		}

		sql.append("   order by start_date desc    ");
		List<Map<String, Object>> swxxlist = null;
		List<Map<String, Object>> revoler = new ArrayList<>();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql.toString());
			swxxlist = jdbcAgent.resultSetToList();

			for (int i = 0; i < swxxlist.size(); i++) {
				Map<String, Object> m = new HashMap<>();
				for (Map.Entry<String, Object> entry : swxxlist.get(i).entrySet()) {
					m.put(entry.getKey(), String.valueOf(entry.getValue()) + "");
				}
				revoler.add(m);
			}

		} catch (BusinessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}

		/*flipInfo.setTotal(swxxlist.size());
		flipInfo.setData(revoler);*/
		int page = flipInfo.getPage();
		int size = 200;
		flipInfo.setTotal(revoler.size());
		List newList = new ArrayList();
		int currIdx = page > 1 ? (page - 1) * size : 0;
		for (int i = 0; i < size && i < (revoler).size() - currIdx; ++i) {
			newList.add((revoler).get(currIdx + i));
		}
		flipInfo.setData(newList);
		return flipInfo;
	}



	/******************* 校长办公会议题申报*****************************/
	@Override
	@AjaxAccess
	@SuppressWarnings("toXzbgSbxx")
	public FlipInfo toXzbgSbxx(FlipInfo flipInfo, Map<String,String> query) throws SQLException, BusinessException {

		StringBuffer sql=new StringBuffer("  select t.*,(select name from org_member where id=t.field0028) djr,(select name from org_unit where id=t.field0027) djdw  from ( " +
				" select f.id formid,t.id summaryid,t.case_id,t.process_id,t.form_appid form_app_id,field0001 bt,field0027,f.field0032 sbsj,f.start_date,f.field0028,group_concat(m.name) dqblr " +
				" from formmain_0285 f " +
				" left join  col_summary t on  t.FORM_RECORDId=f.id " +
				" left join ctp_affair r on r.OBJECT_ID=t.id and r.state='3' " +
				" left join org_member m on m.id=r.member_id " +
				" group by f.id,t.id,field0001,field0027,f.field0032,f.start_date ,f.field0028 " +
				" )t where 1=1 " );

		if(null != query.get("bt")) {
			sql.append(" and bt like  '%"+query.get("bt") +"%'");
		}
		if(null != query.get("djr")) {
			sql.append(" and djr like  '%"+query.get("djr") +"%'");
		}

		sql.append("   order by start_date desc    ");
		List<Map<String, Object>> swxxlist = null;
		List<Map<String, Object>> revoler = new ArrayList<>();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql.toString());
			swxxlist = jdbcAgent.resultSetToList();

			for (int i = 0; i < swxxlist.size(); i++) {
				Map<String, Object> m = new HashMap<>();
				for (Map.Entry<String, Object> entry : swxxlist.get(i).entrySet()) {
					m.put(entry.getKey(), String.valueOf(entry.getValue()) + "");
				}
				revoler.add(m);
			}

		} catch (BusinessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}

		/*flipInfo.setTotal(swxxlist.size());
		flipInfo.setData(revoler);*/
		int page = flipInfo.getPage();
		int size = 200;
		flipInfo.setTotal(revoler.size());
		List newList = new ArrayList();
		int currIdx = page > 1 ? (page - 1) * size : 0;
		for (int i = 0; i < size && i < (revoler).size() - currIdx; ++i) {
			newList.add((revoler).get(currIdx + i));
		}
		flipInfo.setData(newList);
		return flipInfo;
	}


}
