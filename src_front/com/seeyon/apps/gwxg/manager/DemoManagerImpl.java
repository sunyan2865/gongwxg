package com.seeyon.apps.gwxg.manager;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.seeyon.ctp.common.AppContext;
import com.seeyon.ctp.common.authenticate.domain.User;
import com.seeyon.ctp.common.exceptions.BusinessException;
import com.seeyon.ctp.organization.manager.OrgManager;
import com.seeyon.ctp.util.*;
import com.seeyon.ctp.util.annotation.AjaxAccess;
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
		return flipInfo;
	}


	/*******************收文-学校文件笺 *******************************/
	@Override
	@AjaxAccess
	@SuppressWarnings("toSwxxList")
	public FlipInfo toSwxxList(FlipInfo flipInfo, Map<String,String> query) throws SQLException, BusinessException {

		StringBuffer sql=new StringBuffer("  select t.*,e.showvalue clxzmc from (" +
				"     select t.id summaryid,f.id formid, f.field0006 wjbt,f.field0016 blqx ,f.field0011 as clxz,f.field0014 swrq,f.start_date,GROUP_CONCAT(u.name) current_node_name from formmain_0081 f " +
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

		flipInfo.setTotal(swxxlist.size());
		flipInfo.setData(revoler);
		return flipInfo;
	}


	/******************* 收文-协同办公******************************/
	@Override
	@AjaxAccess
	@SuppressWarnings("toXtbgList")
	public FlipInfo toXtbgList(FlipInfo flipInfo, Map<String,String> query) throws SQLException, BusinessException {

		StringBuffer sql=new StringBuffer("  select * from (" +
				" select t.id summaryid,f.id formid,f.field0001 bt, f.field0002 bqdw,f.field0013 blqx,f.start_date," +
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

		flipInfo.setTotal(swxxlist.size());
		flipInfo.setData(revoler);
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

		flipInfo.setTotal(swxxlist.size());
		flipInfo.setData(revoler);
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

		flipInfo.setTotal(swxxlist.size());
		flipInfo.setData(revoler);
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

		flipInfo.setTotal(swxxlist.size());
		flipInfo.setData(revoler);
		return flipInfo;
	}




   /******************* 首页栏目-学校文件-限制******************************/
	@Override
	@AjaxAccess
	@SuppressWarnings("toXxwjPortalList")
	public FlipInfo toXxwjPortalList(FlipInfo flipInfo, Map<String,String> query) throws SQLException, BusinessException {
		String currentUserId = AppContext.getCurrentUser().getId().toString();
		List<Map<String, Object>> xxwjlist = null;
		List<Map<String, Object>> resultlist =  new ArrayList<>();
		List<Map<String, Object>> revoler = new ArrayList<>();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);


		StringBuffer alldatasql=new StringBuffer("select * from( select  t.id summaryid,f.id formid,f.field0001 wjbt,f.field0005 wh,field0008 wjfbrq,f.field0006 gkfs,f.start_date,f.field0011 gly,f.field0012 ysqgkr,i.showvalue gksfmc,(select count(c.id) from ctp_attachment c where c.att_reference=t.id) fjcnt,c.content, date_format(c.create_date,'%Y-%m-%d') date from formmain_0170 f " +
				" left join edoc_summary t on t.form_recordid=f.id " +
				" left join ctp_content_all c on c.content is not null and c.module_id=t.id " +
				" left join (select id,showvalue from ctp_enum_item t where t.REF_ENUMID='-6716972179926924238'  and state='1') i on i.id=f.field0006 " +
				"  ) t where 1=1  order by start_date desc");
		try{
			jdbcAgent.execute(alldatasql.toString());
			xxwjlist=jdbcAgent.resultSetToList();

			String glysql="select  group_concat(OBJECTIVE0_ID) gly from org_relationship  t where t.source_id='-8784815977654893165'";
            jdbcAgent.execute(glysql);
			Map<String, Object> glydata=jdbcAgent.resultSetToMap();
			String gly=glydata.get("gly").toString();
			if(null!=gly &&  !(gly.equals(""))){
				if(gly.indexOf(currentUserId)!=-1){//当前用户在“学校文件管理员”组里面
					resultlist=xxwjlist;
				}else{
					for (int p = 0; p < xxwjlist.size(); p++) {
						Map<String, Object> m = xxwjlist.get(p);
						String gkfs=(String)m.get("gkfs");
						//String gly=(String)m.get("gly");//学校文件管理员
						String ysqgk=(String)m.get("ysqgkr");//依申请公开人
						if(gkfs.equals("-7932555032561041306")){//公开
							resultlist.add(m);
						}else if(gkfs.equals("-6555425946729429389")){//依申请公开
							if(ysqgk.indexOf(currentUserId)!=-1){
								resultlist.add(m);
							}
						}
					}
				}
				for (int i = 0; i < resultlist.size(); i++) {
					Map<String, Object> m = new HashMap<>();
					for (Map.Entry<String, Object> entry : resultlist.get(i).entrySet()) {
						m.put(entry.getKey(), String.valueOf(entry.getValue()) + "");
					}
					revoler.add(m);
				}
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}

		flipInfo.setTotal(revoler.size());
		flipInfo.setData(revoler);
		return flipInfo;
	}


	/******************* 首页栏目-学校文件-更多******************************/
	@Override
	@AjaxAccess
	@SuppressWarnings("toXxwjPortalMoreList")
	public FlipInfo toXxwjPortalMoreList(FlipInfo flipInfo, Map<String,String> query) throws SQLException, BusinessException {
		String currentUserId = AppContext.getCurrentUser().getId().toString();
		List<Map<String, Object>> xxwjlist = null;
		List<Map<String, Object>> resultlist =  new ArrayList<>();
		List<Map<String, Object>> revoler = new ArrayList<>();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);


		StringBuffer alldatasql=new StringBuffer("select * from( select  t.id summaryid,f.id formid,f.field0001 wjbt,f.field0005 wh,field0008 wjfbrq,f.field0006 gkfs,f.start_date,f.field0011 gly,f.field0012 ysqgkr,i.showvalue gksfmc,(select count(c.id) from ctp_attachment c where c.att_reference=t.id) fjcnt,c.content, date_format(c.create_date,'%Y-%m-%d') date from formmain_0170 f " +
				" left join edoc_summary t on t.form_recordid=f.id " +
				" left join ctp_content_all c on c.content is not null and c.module_id=t.id " +
				" left join (select id,showvalue from ctp_enum_item t where t.REF_ENUMID='-6716972179926924238'  and state='1') i on i.id=f.field0006 " +
				"  ) t where 1=1  ");
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

		alldatasql.append("  order by start_date desc ");
		try{
			jdbcAgent.execute(alldatasql.toString());
			xxwjlist=jdbcAgent.resultSetToList();

			String glysql="select  group_concat(OBJECTIVE0_ID) gly from org_relationship  t where t.source_id='-8784815977654893165'";
			jdbcAgent.execute(glysql);
			Map<String, Object> glydata=jdbcAgent.resultSetToMap();
			String gly=glydata.get("gly").toString();
			if(null!=gly &&  !(gly.equals(""))){
				if(gly.indexOf(currentUserId)!=-1){//当前用户在“学校文件管理员”组里面
					resultlist=xxwjlist;
				}else{
					for (int p = 0; p < xxwjlist.size(); p++) {
						Map<String, Object> m = xxwjlist.get(p);
						String gkfs=(String)m.get("gkfs");
						//String gly=(String)m.get("gly");//学校文件管理员
						String ysqgk=(String)m.get("ysqgkr");//依申请公开人
						if(gkfs.equals("-7932555032561041306")){//公开
							resultlist.add(m);
						}else if(gkfs.equals("-6555425946729429389")){//依申请公开
							if(ysqgk.indexOf(currentUserId)!=-1){
								resultlist.add(m);
							}
						}
					}
				}
				for (int i = 0; i < resultlist.size(); i++) {
					Map<String, Object> m = new HashMap<>();
					for (Map.Entry<String, Object> entry : resultlist.get(i).entrySet()) {
						m.put(entry.getKey(), String.valueOf(entry.getValue()) + "");
					}
					revoler.add(m);
				}
			}




		}catch (Exception e){
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}

		flipInfo.setTotal(revoler.size());
		flipInfo.setData(revoler);
		return flipInfo;
	}


}
