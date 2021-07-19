package com.seeyon.apps.gwxg.manager;

import java.sql.SQLException;
import java.util.*;

import com.seeyon.ctp.common.AppContext;
import com.seeyon.ctp.common.exceptions.BusinessException;
import com.seeyon.ctp.organization.manager.OrgManager;
import com.seeyon.ctp.util.*;
import com.seeyon.ctp.util.annotation.AjaxAccess;

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
				" select f.id formid,s.id summaryid,s.case_id,s.process_id,s.form_appid form_app_id,field0001 bt,(select name from org_member where id=f.field0002) djr,(select name from org_unit where id=f.field0003) djbm,field0004 sdr,field0005 sdfs,field0006 lwdw,field0008 lwbh, " +
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
				" select f.id formid,t.id summaryid,t.case_id,t.process_id,t.form_appid form_app_id,field0018 bt,field0017,f.start_date,group_concat(m.name) dqblr " +
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
				" select f.id formid,t.id summaryid,t.case_id,t.process_id,t.form_appid form_app_id,f.field0005 bt,f.start_date,f.field0006 jbsj,f.field0007 jbdd,f.field0008 cjrs,(select name from org_unit t where t.id=f.field0001) sqdw from formmain_0091 f " +
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


	/******************* 首页栏目-回告信息-限制******************************/
	@Override
	@AjaxAccess
	@SuppressWarnings("toSwhgPortalList")
	public FlipInfo toSwhgPortalList(FlipInfo flipInfo, Map<String,String> query,String datatype) throws SQLException, BusinessException {
		flipInfo=getHgxxPoratlList("limit",flipInfo, query,datatype);
		return flipInfo;
	}

	/******************* 首页栏目-回告信息-更多******************************/
	@Override
	@AjaxAccess
	@SuppressWarnings("toSwhgPortalMoreList")
	public FlipInfo toSwhgPortalMoreList(FlipInfo flipInfo, Map<String,String> query,String datatype) throws SQLException, BusinessException {
		flipInfo=getHgxxPoratlList("more",flipInfo, query,datatype);
		return flipInfo;
	}


	private FlipInfo getHgxxPoratlList(String  type,FlipInfo flipInfo, Map<String,String> query,String datatype){
		StringBuffer sql=null;
		if(datatype.equals("0")){//全部未回告信息
			sql=new StringBuffer(" select t.*,e.showvalue hgsfwc,a.id affairid ,a.member_id from ( " +
					"     select t.id summaryid,f.id formid, f.field0006 wjbt,f.field0030 ,f.zrr,f.loginname,f.field0016 blqx ,date_format(now(),'%Y-%m-%d') sysdate,datediff(f.field0016,date_format(now(),'%Y-%m-%d')) tscz,f.field0002 lwbh,f.field0014 swrq,f.start_date,t.form_app_id summary_formid,t.form_id summary_operationId from " +
					"      (select t.*,(select name  from org_member r where r.id=t.field0033) zrr ,(select login_name  from org_principal r where r.member_id=t.field0033) loginname from formmain_0081 t where field0030 is null and  field0011=8466505632522324369 and start_date>='2021-06-10' ) f " +
					"         left join  (SELECT * FROM edoc_summary t WHERE t.EDOC_TYPE = '1') t on  t.FORM_RECORDId=f.id " +
					"            group by t.id,f.id,f.field0006,f.field0016,f.field0014,f.start_date " +
					"  )t " +
					" left join (select id,showvalue from ctp_enum_item i where i.REF_ENUMID=4530837824868468369)  e on t.field0030=e.id "+
					" left join (select id,member_id,r.object_id from ctp_affair r where r.node_policy='部门承办(回告)' and state=3  ) a on a.object_id=t.summaryid "+
					" where 1=1 "
			);
		}else if(datatype.equals("1")){//个人未回告信息
			Long currentId=AppContext.getCurrentUser().getId();
			sql=new StringBuffer(" select t.id affairid,r.id summaryid,f.id formid, " +
					" f.field0006 wjbt,f.field0030 ,f.field0016 blqx ,date_format(now(),'%Y-%m-%d') sysdate,datediff(f.field0016,date_format(now(),'%Y-%m-%d')) tscz,f.field0002 lwbh,f.field0014 swrq,f.start_date " +
					" from ( " +
					"   select id,subject,r.object_id from ctp_affair r where r.node_policy='部门承办(回告)' and state=3  and member_id='"+currentId.toString()+"'" +
					"  )t " +
					" left join edoc_summary r on r.id=t.object_id " +
					" left join formmain_0081 f on f.id=r.form_recordid " +
					" where 1=1 "
			);
		}



		if(null != query.get("wjbt")) {
			sql.append(" and wjbt like  '%"+query.get("wjbt") +"%'");
		}
		if(null != query.get("lwbh")) {
			sql.append(" and lwbh like  '%"+query.get("lwbh") +"%'");
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

			int cnt=swxxlist.size();
			if(type.equals("limit")){
				if(cnt>20){cnt=20;}
			}
			for (int i = 0; i < cnt; i++) {
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
				" )t where summaryId is not null  ");

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
				if(null!=jgdz && (jgdz.equals("-6949237170726026365") || jgdz.equals("3227204207172275053"))){
					if(affairmemberid.indexOf(userid)==-1 && !(userid.equals("-4120520206381135530"))){
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

		StringBuffer sql=new StringBuffer("  select t.*,e.showvalue clxzmc,i.showvalue sfwc from (" +
				"     select t.id summaryid,f.id formid, f.field0006 wjbt,f.field0016 blqx ,f.field0011 as clxz,f.field0002 lwbh,f.field0014 swrq,f.start_date,GROUP_CONCAT(u.name) current_node_name,t.form_app_id summary_formid,t.form_id summary_operationId,f.field0030 from formmain_0081 f " +
				"                 left join  (SELECT * FROM edoc_summary t WHERE t.EDOC_TYPE = '1') t on  t.FORM_RECORDId=f.id " +
				"                 left join ctp_affair r on r.OBJECT_ID=t.id and r.state ='3'" +
				"                 left join ORG_MEMBER u on u.id=r.MEMBER_ID " +
				"                 group by t.id,f.id,f.field0006,f.field0016,f.field0014,f.field0011,f.start_date " +
				" )t  " +
				" left join (select id,showvalue from ctp_enum_item i where i.REF_ENUMID='6534952330511468065') e on e.id=t.clxz "+
				" left join (select id,showvalue from ctp_enum_item i where i.REF_ENUMID=4530837824868468369	) i on i.id=t.field0030"+
				" where summaryid is not null  "
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
		if(null != query.get("sfwc")) {//回告是否完成
			sql.append(" and i.showvalue like  '%"+query.get("sfwc") +"%'");
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
				//" select field0022 from  formson_0216  where id='-8592826804850243209') "+
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


	@Override
	@AjaxAccess
	@SuppressWarnings("unchecked")
	public FlipInfo getMyMeetingListData(FlipInfo flipInfo, String loginname)  throws SQLException, BusinessException {
		StringBuffer sql = new StringBuffer();
		sql.append("select p.login_name loginname ,t.* from ( "+
				" select start_member_id hyjsr,field0001 hymc,field0002 hysj,field0003 hydd, field0009 hynr,field0028 hysfxyhz,now() xtrq from formmain_0205 t where now()<= field0002 order by start_date desc "+
				" )t "+
				" left join org_principal p on p.member_id=t.hyjsr "+
				" where login_name='"+loginname+"'");
		List<Map<String, Object>> list = null;
		try (JDBCAgent jdbcAgent = new JDBCAgent(true, false)) {
			jdbcAgent.execute(sql.toString());
			list = jdbcAgent.resultSetToList();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (BusinessException b) {
			b.printStackTrace();
		}
		List<Map<String, Object>> mapList = new ArrayList<>();
		Map<String, Object> m = null;
		for (int i = 0; i < list.size(); i++) {
			m = new HashMap<>();
			for (Map.Entry entry : list.get(i).entrySet()) {
				m.put((String) entry.getKey(), entry.getValue() + "");
			}
			mapList.add(m);
		}
		int page = flipInfo.getPage();
		int size = flipInfo.getSize();
		flipInfo.setTotal((mapList).size());
		List newList = new ArrayList();
		int currIdx = page > 1 ? (page - 1) * size : 0;
		for (int i = 0; i < size && i < (mapList).size() - currIdx; ++i) {
			newList.add((mapList).get(currIdx + i));
		}
		flipInfo.setData(newList);
		return flipInfo;
	}


	/**
	 * 任务汇总统计
	 * @param flipInfo
	 * @param query
	 * @return
	 * @throws SQLException
	 * @throws BusinessException
	 */
	@Override
	@AjaxAccess
	@SuppressWarnings("unchecked")
	public FlipInfo taskData(FlipInfo flipInfo,Map<String,String> query) throws SQLException, BusinessException {

		StringBuffer sql=new StringBuffer("select id formmain_id,field0052,field0063 from formmain_0321  t where t.field0063 like '2021%' order  by field0063");

		/*if(null != query.get("sex")) {
			sql.append(" and sex like '%"+query.get("sex")+"%'");
		}*/
		/*	sql.append(" order by t.start_time desc ");*/



		List<Map<String, Object>> swlist = null;
		List<Map<String, Object>> revoler = new ArrayList<>();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql.toString());
			swlist = jdbcAgent.resultSetToList();

			String formmain_id0=swlist.get(0).get("formmain_id")+"";
			StringBuffer tasksql=new StringBuffer("select distinct  field0061,field0036,field0037  from formson_0322 where formmain_id='"+formmain_id0+"' order by field0061");//获得所有任务
			Map<String, Object> data = null;
			for(int i=0;i<swlist.size();i++){
				Map<String, Object> m = swlist.get(i);
				String formmain_id= (String) m.get("formmain_id");

				//获得月份
				StringBuffer monthsql=new StringBuffer("select field0063 month from formmain_0321 where id='"+formmain_id+"");//获得月份
				jdbcAgent.execute(monthsql.toString());
				data=jdbcAgent.resultSetToMap();
				String month=data.get("month").toString();
				switch(month){
					case "":break;
				}

				StringBuffer joinsql=new StringBuffer("(select t.*,(select field0063  from formmain_0321 where id=formmain_id) month from formson_0322 t  where formmain_id='"+formmain_id+"') " +
						" on field0063.field0061=t.field0061");



				/*select t.*,six.field0055, six.field0056,six.field0057,six.month,seven.field0055, seven.field0056,seven.field0057,seven.month from (
						select distinct  field0061,field0036,field0037  from formson_0322) t
				left join
				(select t.*,(select field0063 from formmain_0321 where id=formmain_id) month from formson_0322 t  where formmain_id=-8167645827791959223) six
				on six.field0061=t.field0061
				left join
				(select t.*,(select field0063 from formmain_0321 where id=formmain_id) month from formson_0322 t  where formmain_id=-3381705597789910728) seven
				on seven.field0061=t.field0061*/

			/*	if(null!=currentNodeIds && !(currentNodeIds.equals(""))){
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
				}*/
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

}
