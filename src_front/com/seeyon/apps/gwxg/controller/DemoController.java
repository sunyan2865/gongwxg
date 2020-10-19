package com.seeyon.apps.gwxg.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.seeyon.apps.gwxg.po.FormMain0081Entity;
import com.seeyon.apps.gwxg.po.*;
import com.seeyon.apps.gwxg.util.CommonUtil;
import com.seeyon.ctp.common.AppContext;
import com.seeyon.ctp.util.JDBCAgent;
import org.apache.commons.logging.Log;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seeyon.apps.gwxg.manager.DemoManager;
import com.seeyon.ctp.common.controller.BaseController;
import com.seeyon.ctp.common.log.CtpLogFactory;
import com.seeyon.ctp.util.FlipInfo;


public class DemoController extends BaseController {
	
	private static final Log LOG = CtpLogFactory.getLog(DemoController.class);


	private DemoManager demoManager;

	public DemoManager getDemoManager() {
		return demoManager;
	}

	public void setDemoManager(DemoManager demoManager) {
		this.demoManager = demoManager;
	}


	/**
	 * 跳转到发文-学校发文界面
 	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView demoRight(HttpServletRequest request,HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		ModelAndView view = new ModelAndView("gwxg/fwxg/xxfw/demoRight");
		Map<String,String> query = new HashMap<String,String>();
		FlipInfo fi = new FlipInfo();
		FlipInfo swlist = demoManager.demoRight(fi,query);
		request.setAttribute("fflistStudent",swlist);

		return view;
	}


	/**
	 * 跳转到发文-学校发文编辑界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toEditDemoView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView("gwxg/fwxg/xxfw/demoDetail");
		String formid = request.getParameter("formid");
		String summaryid=request.getParameter("summaryid");
		String sql="select t.*," +
				" (select name from ORG_UNIT  d where d.id=t.field0011)  as ngbm, " +
				" (select name from org_member r where r.id=t.field0003) as ngr " +
				" from formmain_0086 t  where id='" + formid + "'";
		Map<String, Object> swdata = null;
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql);
			swdata=jdbcAgent.resultSetToMap();

			/*field0006：主报（送）
			field0007：抄报（送）
			field0018：下发*/
			swdata.put("zbname",getDepartmentName(swdata.get("field0006"),jdbcAgent));	//主报（送）
			swdata.put("cbname",getDepartmentName(swdata.get("field0007"),jdbcAgent));//抄报（送）
			swdata.put("xfname",getDepartmentName(swdata.get("field0018"),jdbcAgent));//下发
            swdata.put("summaryid",summaryid);
			modelAndView.addObject("entity", swdata);


			//附件 field0010
			String fjmainId=(String)swdata.get("field0010");
			String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.SUB_REFERENCE  ='"+fjmainId+"'";
			List<Map<String, Object>> fjList=null;
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();
			com.alibaba.fastjson.JSONArray fjsonArray = com.alibaba.fastjson.JSONArray.parseArray(JSON.toJSONString(fjList));
			modelAndView.addObject("fjsonArray", fjsonArray);
			modelAndView.addObject("fjlist", fjList);

			//正文
			String zwsql="select t.*,DATE_FORMAT(modify_date,'%Y-%m-%d') as date from ctp_content_all  t   where  content_type in ('41','42','43','44','45') and t.MODULE_ID='"+summaryid+"'" ;
			Map<String, Object> zwxx=null;
			jdbcAgent.execute(zwsql);
			zwxx=jdbcAgent.resultSetToMap();
			modelAndView.addObject("zwdata", zwxx);
			//zwcontent=(String)zwxx.get("content");

			/*获得字典项*/
			//文件类型
			String wjlxsql="select id,showvalue from ctp_enum_item  t where REF_ENUMID='-7394917914078590178' and PARENT_ID='0' and state='1' order by t.sortnumber ";
			modelAndView.addObject("wjlxoption",getOptionData(wjlxsql,jdbcAgent));


			//公开方式
			String gkfsql="select id,showvalue from ctp_enum_item t where t.REF_ENUMID='-6716972179926924238' and PARENT_ID='0' and state='1' order by t.sortnumber ";
			modelAndView.addObject("gkfsoption",getOptionData(gkfsql,jdbcAgent));


			//拟办、批示、办理意见
			List<Map<String, Object>> yjlist = null;
			String ideaSql = " select id,content,create_time,(select name from ORG_MEMBER where id=CREATE_USER_ID) username,policy , " +
					" ( select group_concat(FILENAME) from CTP_ATTACHMENT where sub_REFERENCE=o.id) filename from  EDOC_OPINION o where   edoc_id ='" + summaryid + "'  order by create_time asc";
			jdbcAgent.execute(ideaSql);
			yjlist=jdbcAgent.resultSetToList();

			/*field0004：拟稿部门负责人意见
			field0019：校领导审批意见
			field0021：党政办意见
			field0020：部门会签意见
			field0022：校队意见
			*/
			List<OpinionEntity> bmfzrList = new ArrayList<>();
			List<OpinionEntity> dzbList = new ArrayList<>();
			List<OpinionEntity> bmhqList = new ArrayList<>();
			List<OpinionEntity> xdyjList = new ArrayList<>();
			List<OpinionEntity> xldspList = new ArrayList<>();
			for(int p=0;p<yjlist.size();p++){
				Map<String, Object> m = yjlist.get(p);
				OpinionEntity opinion = new OpinionEntity();
				opinion.setId(String.valueOf(m.get("id")));
				opinion.setContent((String)m.get("content"));
				opinion.setCreateTime(m.get("create_time").toString().substring(0,10));
				opinion.setUsername((String)m.get("username"));
				opinion.setPolicy((String)m.get("policy"));
				opinion.setFilename((String)m.get("filename"));
				String policy = (String)m.get("policy");
				if ("field0004".equals(policy)) {
					bmfzrList.add(opinion);
				}
				if ("field0019".equals(policy)) {
					xldspList.add(opinion);
				}
				if ("field0021".equals(policy)) {
					dzbList.add(opinion);
				}
				if ("field0020".equals(policy)) {
					bmhqList.add(opinion);
				}
				if ("field0022".equals(policy)) {
					xdyjList.add(opinion);
				}
			}
			modelAndView.addObject("bmfzrList", bmfzrList);
			modelAndView.addObject("xldspList", xldspList);
			modelAndView.addObject("dzbList", dzbList);
			modelAndView.addObject("bmhqList", bmhqList);
			modelAndView.addObject("xdyjList", xdyjList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}


	/**
	 * 更新表单值formmain_0086-发文单-学校发文
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	public ModelAndView toUpdateFormmain(HttpServletRequest request, HttpServletResponse response) throws  Exception{
		Map<String, Object> jsonMap = new HashMap();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			String data =request.getParameter("params");
			FormMainEntity formmain = (FormMainEntity) JSONArray.parseObject(data, FormMainEntity.class);
			String sql="update formmain_0086 set " ;
			if(null!=formmain.getField0005() && !"".equals(formmain.getField0005())){
				sql+=" field0005='" + formmain.getField0005()+"',";
			}
			if(null!=formmain.getField0015() && !"".equals(formmain.getField0015())){
				sql+=" field0015='" + formmain.getField0015()+"',";
			}
			if(null!=formmain.getField0023() && !"".equals(formmain.getField0023())){
				sql+=" field0023='" + formmain.getField0023()+"',";
			}
			if(null!=formmain.getField0024() && !"".equals(formmain.getField0024())){
				sql+=" field0024='" + formmain.getField0024()+"',";
			}
			if(null!=formmain.getField0026() && !"".equals(formmain.getField0026())){
				sql+=" field0026='" + formmain.getField0026()+"',";
			}
			if(null!=formmain.getField0008() && !"".equals(formmain.getField0008())){
				sql+=" field0008='" + formmain.getField0008()+"',";
			}
			if(null!=formmain.getField0016() && !"".equals(formmain.getField0016())){
				sql+=" field0016='" + formmain.getField0016()+"',";
			}
			if(null!=formmain.getField0011() && !"".equals(formmain.getField0011())){
				sql+=" field0011='" + formmain.getField0011()+"',";
			}
			if(null!=formmain.getField0017() && !"".equals(formmain.getField0017())){
				sql+=" field0017='" + formmain.getField0017()+"',";
			}
			if(null!=formmain.getField0003() && !"".equals(formmain.getField0003())){
				sql+=" field0003='" + formmain.getField0003()+"',";
			}
			if(null!=formmain.getField0006() && !"".equals(formmain.getField0006())){
				sql+=" field0006='" + formmain.getField0006()+"',";
			}
			if(null!=formmain.getField0007() && !"".equals(formmain.getField0007())){
				sql+=" field0007='" + formmain.getField0007()+"',";
			}
			if(null!=formmain.getField0018() && !"".equals(formmain.getField0018())){
				sql+=" field0018='" + formmain.getField0018()+"',";
			}
			if(null!=formmain.getField0012() && !"".equals(formmain.getField0012())){
				sql+=" field0012='" + formmain.getField0012()+"',";
			}
			if(null!=formmain.getField0014() && !"".equals(formmain.getField0014())){
				sql+=" field0014='" + formmain.getField0014()+"',";
			}
			if(null!=formmain.getField0025() && !"".equals(formmain.getField0025())){
				sql+=" field0025='" + formmain.getField0025()+"',";
			}
			if(null!=formmain.getField0013() && !"".equals(formmain.getField0013())){
				sql+=" field0013='" + formmain.getField0013()+"',";
			}

			String executesql=sql.substring(0,sql.length()-1)+"  where id='"+formmain.getID()+"'";
			jdbcAgent.execute(executesql);

			//附件保存
			String fjdata =request.getParameter("fjparams");
			String att_reference=request.getParameter("att_reference");
			if(null!=fjdata && !(fjdata.equals(""))){
				List<FjEntity> fjlist= (List<FjEntity>)JSON.parseArray(fjdata,FjEntity.class);
				if(null==formmain.getField0010() || "".equals(formmain.getField0010())){//本来没有附件，添加附件要更新formmain中的附件field0010字段，否则查不到
					formmain.setField0010(CommonUtil.generateID());
					jdbcAgent.execute("update formmain_0086 set field0010='"+formmain.getField0010()+"' where id='"+formmain.getID()+"'");
				}

				for(int k=0;k<fjlist.size();k++){
					FjEntity fj=fjlist.get(k);
					String fjsql="insert into ctp_attachment(                   id,             att_reference,                sub_reference,              category,              type,              filename,             file_url,             mime_type,              createdate,   attachment_size,        description)" +
								" values ('"+CommonUtil.generateID()+"','"+att_reference+"','"+formmain.getField0010()+"','"+fj.getCategory()+"','"+fj.getType()+"','"+fj.getFilename()+"','"+fj.getFileUrl()+"','"+fj.getMimeType()+"','"+fj.getCreateDate()+"','"+fj.getSize()+"','"+fj.getDescription()+"')";
					jdbcAgent.execute(fjsql);
				}
			}


			//正文保存 实质是更新content值，即服务器中保存的附件名
			/*String  zwparams=request.getParameter("zwparams");
			if(null!=zwparams && !(zwparams.equals(""))) {
				String id = request.getParameter("zwid");
				List<FjEntity> zwlist= (List<FjEntity>)JSON.parseArray(zwparams,FjEntity.class);
				for(int k=0;k<zwlist.size();k++) {
					FjEntity fjEntity = zwlist.get(k);
					String zwsql = "update  ctp_content_all set content='" + fjEntity.getFileUrl() + "',modify_date=str_to_date(sysdate(),'%Y-%m-%d %h:%i:%s')  where id='" + id + "'";
					jdbcAgent.execute(zwsql);
				}
			}*/

			jsonMap.put("code", "0");
			jsonMap.put("msg", "成功");
		}catch(Exception e){
			jsonMap.put("code", "1");
			jsonMap.put("msg", "失败");
		}
		com.alibaba.fastjson.JSONObject json = new JSONObject(jsonMap);
		render(response, json.toJSONString());
		return null;
	}




	/**
	 * 跳转到发文-校内请示列表界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toXnqsList(HttpServletRequest request,HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		ModelAndView view = new ModelAndView("gwxg/fwxg/xnqs/xnqs_list");
		Map<String,String> query = new HashMap<String,String>();
		FlipInfo fi = new FlipInfo();
		FlipInfo swlist = demoManager.toXnqsList(fi,query);
		request.setAttribute("fflistStudent",swlist);

		return view;
	}

	/**
	 * 跳转到发文-校内请示修改界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toXnqsMod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView("gwxg/fwxg/xnqs/xnqs_modify");
		String formid = request.getParameter("formid");
		String summaryid=request.getParameter("summaryid");
		String sql="  select f.*, (select name from org_member r where r.id=f.field0002) as qcr," +
				" (select org_department_id from org_member r where r.id=f.field0002)  as qcrdepartment " +
				"  from formmain_0195 f where f.id='" + formid + "' ";

		Map<String, Object> swdata = null;
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql);
			swdata=jdbcAgent.resultSetToMap();
			swdata.put("qsbmname",getDepartmentName(swdata.get("field0001"),jdbcAgent));	//请示部门

			swdata.put("summaryid",summaryid);
			modelAndView.addObject("entity", swdata);


			//附件 field0010
			String fjmainId=(String)swdata.get("field0005");
			String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.SUB_REFERENCE  ='"+fjmainId+"'";
			List<Map<String, Object>> fjList=null;
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();
			com.alibaba.fastjson.JSONArray fjsonArray = com.alibaba.fastjson.JSONArray.parseArray(JSON.toJSONString(fjList));
			modelAndView.addObject("fjsonArray", fjsonArray);
			modelAndView.addObject("fjlist", fjList);


			//拟办、批示、办理意见
			List<Map<String, Object>> yjlist = null;
			String ideaSql = " select id,content,create_time,(select name from ORG_MEMBER where id=CREATE_USER_ID) username,policy , " +
					" ( select group_concat(FILENAME) from CTP_ATTACHMENT where sub_REFERENCE=o.id) filename from  EDOC_OPINION o where   edoc_id ='" + summaryid + "'  order by create_time asc";
			jdbcAgent.execute(ideaSql);
			yjlist=jdbcAgent.resultSetToList();

			/*field0006：请示部门意见
			field0007：党政办意见
			field0008：校领导意见
			field0009：主办单位意见*/
			List<OpinionEntity> qsbmList = new ArrayList<>();
			List<OpinionEntity> dzbList = new ArrayList<>();
			List<OpinionEntity> xldList = new ArrayList<>();
			List<OpinionEntity> zbbmList = new ArrayList<>();
			for(int p=0;p<yjlist.size();p++){
				Map<String, Object> m = yjlist.get(p);
				OpinionEntity opinion = new OpinionEntity();
				opinion.setId(String.valueOf(m.get("id")));
				opinion.setContent((String)m.get("content"));
				opinion.setCreateTime(m.get("create_time").toString().substring(0,10));
				opinion.setUsername((String)m.get("username"));
				opinion.setPolicy((String)m.get("policy"));
				opinion.setFilename((String)m.get("filename"));
				String policy = (String)m.get("policy");
				if ("field0006".equals(policy)) {
					qsbmList.add(opinion);
				}
				if ("field0007".equals(policy)) {
					dzbList.add(opinion);
				}
				if ("field0008".equals(policy)) {
					xldList.add(opinion);
				}
				if ("field0009".equals(policy)) {
					zbbmList.add(opinion);
				}
			}
			modelAndView.addObject("qsbmList", qsbmList);
			modelAndView.addObject("dzbList", dzbList);
			modelAndView.addObject("xldList", xldList);
			modelAndView.addObject("zbbmList", zbbmList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}

	/**
	 * 跳转到发文-校内请示详情界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toXnqsDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView("gwxg/fwxg/xnqs/xnqs_detail");
		String formid = request.getParameter("formid");
		String summaryid=request.getParameter("summaryid");
		String sql="  select f.*, (select name from org_member r where r.id=f.field0002) as qcr," +
				" (select org_department_id from org_member r where r.id=f.field0002)  as qcrdepartment " +
				"  from formmain_0195 f where f.id='" + formid + "' ";

		Map<String, Object> swdata = null;
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql);
			swdata=jdbcAgent.resultSetToMap();
			swdata.put("qsbmname",getDepartmentName(swdata.get("field0001"),jdbcAgent));	//请示部门

			swdata.put("summaryid",summaryid);
			modelAndView.addObject("entity", swdata);


			//附件 field0010
			String fjmainId=(String)swdata.get("field0005");
			String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.SUB_REFERENCE  ='"+fjmainId+"'";
			List<Map<String, Object>> fjList=null;
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();
			com.alibaba.fastjson.JSONArray fjsonArray = com.alibaba.fastjson.JSONArray.parseArray(JSON.toJSONString(fjList));
			modelAndView.addObject("fjsonArray", fjsonArray);
			modelAndView.addObject("fjlist", fjList);


			//拟办、批示、办理意见
			List<Map<String, Object>> yjlist = null;
			String ideaSql = " select id,content,create_time,(select name from ORG_MEMBER where id=CREATE_USER_ID) username,policy , " +
					" ( select group_concat(FILENAME) from CTP_ATTACHMENT where sub_REFERENCE=o.id) filename from  EDOC_OPINION o where   edoc_id ='" + summaryid + "'  order by create_time asc";
			jdbcAgent.execute(ideaSql);
			yjlist=jdbcAgent.resultSetToList();

			/*field0006：请示部门意见
			field0007：党政办意见
			field0008：校领导意见
			field0009：主办单位意见*/
			List<OpinionEntity> qsbmList = new ArrayList<>();
			List<OpinionEntity> dzbList = new ArrayList<>();
			List<OpinionEntity> xldList = new ArrayList<>();
			List<OpinionEntity> zbbmList = new ArrayList<>();
			for(int p=0;p<yjlist.size();p++){
				Map<String, Object> m = yjlist.get(p);
				OpinionEntity opinion = new OpinionEntity();
				opinion.setId(String.valueOf(m.get("id")));
				opinion.setContent((String)m.get("content"));
				opinion.setCreateTime(m.get("create_time").toString().substring(0,10));
				opinion.setUsername((String)m.get("username"));
				opinion.setPolicy((String)m.get("policy"));
				opinion.setFilename((String)m.get("filename"));
				String policy = (String)m.get("policy");
				if ("field0006".equals(policy)) {
					qsbmList.add(opinion);
				}
				if ("field0007".equals(policy)) {
					dzbList.add(opinion);
				}
				if ("field0008".equals(policy)) {
					xldList.add(opinion);
				}
				if ("field0009".equals(policy)) {
					zbbmList.add(opinion);
				}
			}
			modelAndView.addObject("qsbmList", qsbmList);
			modelAndView.addObject("dzbList", dzbList);
			modelAndView.addObject("xldList", xldList);
			modelAndView.addObject("zbbmList", zbbmList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}

	@ResponseBody
	public ModelAndView toUpdateFormmain0195(HttpServletRequest request, HttpServletResponse response) throws  Exception{
		Map<String, Object> jsonMap = new HashMap();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			String data =request.getParameter("params");
			FormMain0195Entity formmain = (FormMain0195Entity) JSONArray.parseObject(data, FormMain0195Entity.class);
			String sql="update formmain_0195 set " ;
			if(null!=formmain.getField0001() && !"".equals(formmain.getField0001())){
				sql+=" field0001='" + formmain.getField0001()+"',";
			}
			if(null!=formmain.getField0002() && !"".equals(formmain.getField0002())){
				sql+=" field0002='" + formmain.getField0002()+"',";
			}
			if(null!=formmain.getField0003() && !"".equals(formmain.getField0003())){
				sql+=" field0003='" + formmain.getField0003()+"',";
			}
			if(null!=formmain.getField0004() && !"".equals(formmain.getField0004())){
				sql+=" field0004='" + formmain.getField0004()+"',";
			}

			String executesql=sql.substring(0,sql.length()-1)+"  where id='"+formmain.getID()+"'";
			jdbcAgent.execute(executesql);

			//附件保存
			String fjdata =request.getParameter("fjparams");
			String att_reference=request.getParameter("att_reference");
			if(null!=fjdata && !(fjdata.equals(""))){
				List<FjEntity> fjlist= (List<FjEntity>)JSON.parseArray(fjdata,FjEntity.class);
				if(null==formmain.getField0005() || "".equals(formmain.getField0005())){//本来没有附件，添加附件要更新formmain中的附件field0010字段，否则查不到
					formmain.setField0005(CommonUtil.generateID());
					jdbcAgent.execute("update formmain_0195 set field0005='"+formmain.getField0005()+"' where id='"+formmain.getID()+"'");
				}

				for(int k=0;k<fjlist.size();k++){
					FjEntity fj=fjlist.get(k);
					String fjsql="insert into ctp_attachment(                   id,             att_reference,                sub_reference,              category,              type,              filename,             file_url,             mime_type,              createdate,   attachment_size,        description)" +
							" values ('"+CommonUtil.generateID()+"','"+att_reference+"','"+formmain.getField0005()+"','"+fj.getCategory()+"','"+fj.getType()+"','"+fj.getFilename()+"','"+fj.getFileUrl()+"','"+fj.getMimeType()+"','"+fj.getCreateDate()+"','"+fj.getSize()+"','"+fj.getDescription()+"')";
					jdbcAgent.execute(fjsql);
				}
			}
			jsonMap.put("code", "0");
			jsonMap.put("msg", "成功");
		}catch(Exception e){
			jsonMap.put("code", "1");
			jsonMap.put("msg", "失败");
		}
		com.alibaba.fastjson.JSONObject json = new JSONObject(jsonMap);
		render(response, json.toJSONString());
		return null;
	}




	/***
	 * 删除附件
	 */
	@ResponseBody
	public ModelAndView toDeleteFj(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> jsonMap = new HashMap();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			String file_url = request.getParameter("file_url");//file_url
			String sql="";
			sql="delete from CTP_ATTACHMENT  where file_url='"+file_url+"'";
			jdbcAgent.execute(sql);
			jsonMap.put("code", "0");
			jsonMap.put("msg", "成功");
		}catch(Exception e){
			jsonMap.put("code", "1");
			jsonMap.put("msg", "失败");

		}
		com.alibaba.fastjson.JSONObject json = new JSONObject(jsonMap);
		render(response, json.toJSONString());
		return null;
	}

	/**
	 * 删除正文
	 */
//	@ResponseBody
//	public Map<String,Object> toDeleteZw(HttpServletRequest request, HttpServletResponse response){
//		Map<String, Object> jsonMap = new HashMap();
//		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
//		try {
//			String file_url = request.getParameter("file_url");//file_url
//			String sql="";
//			sql="update  ctp_content_all set content=''  where id='"+file_url+"'";
//			jdbcAgent.execute(sql);
//			jsonMap.put("code", "0");
//			jsonMap.put("msg", "成功");
//		}catch(Exception e){
//			jsonMap.put("code", "1");
//			jsonMap.put("msg", "失败");
//		}
//		return jsonMap;
//	}

	/***
	 * 更新或删除意见
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	public ModelAndView toUpdateOpinion(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> jsonMap = new HashMap();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			String id = request.getParameter("id");//id
			String zd = request.getParameter("zd");//更新的列名
			String operType = request.getParameter("operType");//操作类型：修改或删除
			String content=request.getParameter("content");//修改意见
			String sql="";
			if(operType.equals("mod")){
				sql="update EDOC_OPINION set content='"+content+"'  where id='"+id+"'";
			}else if(operType.equals("del")){
				sql="delete from EDOC_OPINION  where id='"+id+"'";
			}
			jdbcAgent.execute(sql);
			jsonMap.put("code", "0");
			jsonMap.put("msg", "成功");
		}catch(Exception e){
			jsonMap.put("code", "1");
			jsonMap.put("msg", "失败");
		}
		com.alibaba.fastjson.JSONObject json = new JSONObject(jsonMap);
		render(response, json.toJSONString());
		return null;
	}


	private  String getDepartmentName(Object obj,JDBCAgent jdbcAgent){
		String result="";
		if(null==obj || obj.equals("")){
			return result;
		}else{
			String[] arr=obj.toString().split(",");
			String idstr="";

			for(int m=0;m<arr.length;m++){
				idstr+="'"+arr[m].replace("Department|","")+"',";
			}
			String zbsql = "select group_concat(name) zbname from org_unit  where id  in(" + idstr.substring(0,idstr.length()-1) + ")";
			try {
				jdbcAgent.execute(zbsql);
				result=(String)jdbcAgent.resultSetToMap().get("zbname");
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	private List<Map<String, Object>> getOptionData(String sql,JDBCAgent jdbcAgent){
		List<Map<String, Object>> wjlxoption = null;
		try{
			jdbcAgent.execute(sql);
			wjlxoption=jdbcAgent.resultSetToList();
		}catch (Exception e){
			e.printStackTrace();
		}
		return wjlxoption;
	}

	/**
	 * 联动select:根据选择的“文件类型”获得机构代字字典option
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView getJgdzData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//机构代字
		try {
			String parent_id = request.getParameter("parent_id");
			String ref_enumid = request.getParameter("ref_enumid");
			String jgdzsql = "select id,showvalue from ctp_enum_item  t where ref_enumid='"+ref_enumid+"' and parent_id='" + parent_id + "' and state='1' order by t.sortnumber ";
			JDBCAgent jdbcAgent = new JDBCAgent(true, false);
			List<Map<String, Object>> jgdzOption = getOptionData(jgdzsql, jdbcAgent);
			List<Map<String, Object>> revoler = new ArrayList<>();
			for (int i = 0; i < jgdzOption.size(); i++) {
				Map<String, Object> m = new HashMap<>();
				for (Map.Entry<String, Object> entry : jgdzOption.get(i).entrySet()) {
					m.put(entry.getKey(), String.valueOf(entry.getValue()) + "");
				}
				revoler.add(m);
			}

			Map<String, Object> map = new HashMap<>();
			map.put("code", 0);
			map.put("data", revoler);
			com.alibaba.fastjson.JSONObject json = new JSONObject(map);
			render(response, json.toJSONString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 给前台渲染json数据
	 *
	 * @param response
	 * @param text
	 */
	private void render(HttpServletResponse response, String text) {
		response.setContentType("application/json;charset=UTF-8");
		try {
			response.setContentLength(text.getBytes("UTF-8").length);
			response.getWriter().write(text);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	/**
	 * 删除发文信息（关联四个表）
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 * edoc_summary,ctp_affair,formmain_0081,edoc_opinion
	 */
	public ModelAndView toDelGwfw(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<>();

		String params = request.getParameter("params");
		String tablename = request.getParameter("tablename");
		String summarytable = request.getParameter("summarytable");
		String delid="";

		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			if(null!=params && !(params.equals("")) && !(params.equals("null"))){
				String[] delidsArr=params.split(",");
				for(int i=0;i<delidsArr.length;i++){
					delid+="'"+delidsArr[i]+"',";
				}

				String delidstr=delid.substring(0,delid.length()-1);
				List batchedSql=new ArrayList();

				batchedSql.add(" delete from "+tablename+" t  where t.id in (select FORM_RECORDID from "+summarytable+" r where r.id in ("+delidstr+"))");
				batchedSql.add(" delete from "+summarytable+" r where r.id in ("+delidstr+")");
				batchedSql.add(" delete from ctp_affair   t where t.object_id in ("+delidstr+")");
				if(summarytable.equals("edoc_summary")){
					batchedSql.add(" delete from edoc_opinion   t where t.edoc_id in ("+delidstr+")");
				}
				batchedSql.add(" delete from ctp_attachment t where t.att_reference in ("+delidstr+")");

				jdbcAgent.executeBatch(batchedSql);
				map.put("code", 0);
			}
		} catch (Exception e) {
			map.put("code", -1);
			e.printStackTrace();
		}
		com.alibaba.fastjson.JSONObject json = new JSONObject(map);
		render(response, json.toJSONString());
		return null;
	}

	/**
	 * 跳转到节点替换界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toNodeReplaceView(HttpServletRequest request,HttpServletResponse response)throws Exception{
		ModelAndView modelAndView = new ModelAndView("gwxg/nodeReplace");
		String summaryid=request.getParameter("summaryid");
		String sql="select distinct member_id,object_id ,(select name from org_member o where o.id=t.member_id) name  from ctp_affair t where  t.state ='3' and t.object_id ='"+summaryid+"'";
		List<Map<String, Object>> memberlist = null;
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql);
			memberlist = jdbcAgent.resultSetToList();
			modelAndView.addObject("memberlist",memberlist);
			modelAndView.addObject("summaryid",summaryid);
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelAndView;
	}

	/**
	 * 节点替换操作(关联三个表)
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 * edoc_summary,ctp_affair,edoc_opinion
	 */
	public ModelAndView toUpdateNodeReplace(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<>();

		String summaryid = request.getParameter("summaryid");
		String oldmemberid=request.getParameter("oldmemberid");
		String newmemberid= request.getParameter("newmemberid");

		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
				List batchedSql=new ArrayList();

				batchedSql.add(" update edoc_summary r set r.current_nodes_info=replace(r.current_nodes_info,'"+oldmemberid+"','"+newmemberid+"') where  r.id='"+summaryid+"'");
				batchedSql.add(" update  ctp_affair set  member_id='"+newmemberid+"'  where object_id='"+summaryid+"' and member_id='"+oldmemberid+"' and state='3'");
//				batchedSql.add(" delete from edoc_opinion   t where t.edoc_id = '"+summaryid+"' and affair_id='"+affairid+"'");

				jdbcAgent.executeBatch(batchedSql);
				map.put("code", 0);

		} catch (Exception e) {
			map.put("code", -1);
			e.printStackTrace();
		}
		com.alibaba.fastjson.JSONObject json = new JSONObject(map);
		render(response, json.toJSONString());
		return null;
	}




	/*************************收文修改-文件处理笺 start***************************************/
	/**
	 * 跳转到收文-文件处理笺信息列表页面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toSwxxList(HttpServletRequest request, HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		ModelAndView view = new ModelAndView("gwxg/swxg/xxwjj/swxx_list");
		Map<String,String> query = new HashMap<String,String>();
		FlipInfo fi = new FlipInfo();
		if(demoManager == null) {
			demoManager = (DemoManager) AppContext.getBean("demoManager");
		}
		FlipInfo swlist = demoManager.toSwxxList(fi,query);
		request.setAttribute("fflistStudent",swlist);

		return view;
	}


	/**
	 * 跳转到收文-文件处理笺修改界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toSwDjMod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView("gwxg/swxg/xxwjj/swxx_modify");
		String formid = request.getParameter("id");
		String summaryid = request.getParameter("summaryid");
		String sql=" select e.showvalue lwdw,concat(e1.showvalue,e2.showvalue) jgdz,e3.showvalue clxz,e4.showvalue hj,u.name,u.org_department_id,t.*  from formmain_0081 t " +
				" left join (select id,showvalue from ctp_enum_item where ref_enumid='-82570973940398271' and state='1') e on e.id=t.field0001 " +
				" left join (select id,showvalue from ctp_enum_item where ref_enumid='5765437337868452209' and parent_id='0' and state='1') e1 on e1.id=t.field0021 " +
				" left join (select id,showvalue from ctp_enum_item where ref_enumid='5765437337868452209' and parent_id!='0' and state='1') e2 on e2.id=t.field0022 " +
				" left join (select id,showvalue from ctp_enum_item where ref_enumid='6534952330511468065' and state='1') e3 on e3.id=t.field0011 " +
				" left join (select id,showvalue from ctp_enum_item where ref_enumid='404' and state='1') e4 on e4.id=t.field0012 " +
				" left join org_member u on u.id=t.field0015  where  t.id='"+formid+"'";
		Map<String, Object> swxxdata = null;
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql);
			swxxdata=jdbcAgent.resultSetToMap();
			swxxdata.put("zrdwmc",getDepartmentName(swxxdata.get("field0018"),jdbcAgent));
			swxxdata.put("summaryid",summaryid);
			modelAndView.addObject("entity", swxxdata);

			//来文单位字典
			String lwdwsql="select id,showvalue from ctp_enum_item  t where REF_ENUMID='-82570973940398271'   and state='1' order by t.sortnumber ";
			modelAndView.addObject("lwdwoption",getOptionData(lwdwsql,jdbcAgent));
			//收文机构代字
			String swjgdzsql="select id,showvalue from ctp_enum_item  t where REF_ENUMID='5765437337868452209' and parent_id='0' and state='1' order by t.sortnumber ";
			modelAndView.addObject("swjgdzoption",getOptionData(swjgdzsql,jdbcAgent));
			//处理性质
			String clxzsql="select id,showvalue from ctp_enum_item  t where REF_ENUMID='6534952330511468065' and state='1' order by t.sortnumber ";
			modelAndView.addObject("clxzoption",getOptionData(clxzsql,jdbcAgent));



			//拟办、批示、办理意见
			List<Map<String, Object>> yjlist = null;
			String ideaSql = " select id,content,create_time,(select name from ORG_MEMBER where id=CREATE_USER_ID) username,policy , " +
					" ( select group_concat(FILENAME) from CTP_ATTACHMENT where sub_REFERENCE=o.id) filename from  EDOC_OPINION o where   edoc_id ='" + summaryid + "'  order by create_time asc ";
			jdbcAgent.execute(ideaSql);
			yjlist=jdbcAgent.resultSetToList();
             /* field0007：党政办拟办意见
            field0008：校领导批示意见
            field0010：部门承办意见*/
			List<OpinionEntity> dzbList = new ArrayList<>();
			List<OpinionEntity> xldpsList = new ArrayList<>();
			List<OpinionEntity> bmList = new ArrayList<>();
			for(int p=0;p<yjlist.size();p++){
				Map<String, Object> m = yjlist.get(p);
				OpinionEntity opinion = new OpinionEntity();
				opinion.setId(String.valueOf(m.get("id")));
				opinion.setContent((String)m.get("content"));
				opinion.setCreateTime(m.get("create_time").toString().substring(0,10));
				opinion.setUsername((String)m.get("username"));
				opinion.setPolicy((String)m.get("policy"));
				opinion.setFilename((String)m.get("filename"));
				String policy = (String)m.get("policy");
				if ("field0007".equals(policy)) {
					dzbList.add(opinion);
				}
				if ("field0008".equals(policy)) {
					xldpsList.add(opinion);
				}
				if ("field0010".equals(policy)) {
					bmList.add(opinion);
				}
			}
			modelAndView.addObject("dzbList", dzbList);
			modelAndView.addObject("xldpsList", xldpsList);
			modelAndView.addObject("bmList", bmList);


			//附件 field0019
			String fjmainId=(String)swxxdata.get("field0019");
			String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.SUB_REFERENCE  ='"+fjmainId+"'";
			List<Map<String, Object>> fjList=null;
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();
			com.alibaba.fastjson.JSONArray fjsonArray = com.alibaba.fastjson.JSONArray.parseArray(JSON.toJSONString(fjList));
			modelAndView.addObject("fjsonArray", fjsonArray);
			modelAndView.addObject("fjlist", fjList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}



	/**
	 * 更新表单值formmain_0081-收文单-文件处理笺
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	public ModelAndView toUpdateFormmain0081(HttpServletRequest request, HttpServletResponse response) throws  Exception{
		Map<String, Object> jsonMap = new HashMap();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			String data =request.getParameter("params");
			FormMain0081Entity formmain = (FormMain0081Entity) JSONArray.parseObject(data, FormMain0081Entity.class);
			String sql="update formmain_0081 set " ;
			if(null!=formmain.getField0006() && !"".equals(formmain.getField0006())){
				sql+=" field0006='" + formmain.getField0006()+"',";
			}
			if(null!=formmain.getField0001() && !"".equals(formmain.getField0001())){
				sql+=" field0001='" + formmain.getField0001()+"',";
			}
			if(null!=formmain.getField0002() && !"".equals(formmain.getField0002())){
				sql+=" field0002='" + formmain.getField0002()+"',";
			}
			if(null!=formmain.getField0013() && !"".equals(formmain.getField0013())){
				sql+=" field0013='" + formmain.getField0013()+"',";
			}
			if(null!=formmain.getField0014() && !"".equals(formmain.getField0014())){
				sql+=" field0014='" + formmain.getField0014()+"',";
			}
			if(null!=formmain.getField0021() && !"".equals(formmain.getField0021())){
				sql+=" field0021='" + formmain.getField0021()+"',";
			}
			if(null!=formmain.getField0022() && !"".equals(formmain.getField0022())){
				sql+=" field0022='" + formmain.getField0022()+"',";
			}
			if(null!=formmain.getField0024() && !"".equals(formmain.getField0024())){
				sql+=" field0024='" + formmain.getField0024()+"',";
			}
			if(null!=formmain.getField0011() && !"".equals(formmain.getField0011())){
				sql+=" field0011='" + formmain.getField0011()+"',";
			}
			if(null!=formmain.getField0003() && !"".equals(formmain.getField0003())){
				sql+=" field0003='" + formmain.getField0003()+"',";
			}
			if(null!=formmain.getField0015() && !"".equals(formmain.getField0015())){
				sql+=" field0015='" + formmain.getField0015()+"',";
			}
			if(null!=formmain.getField0016() && !"".equals(formmain.getField0016())){
				sql+=" field0016='" + formmain.getField0016()+"',";
			}
			if(null!=formmain.getField0005() && !"".equals(formmain.getField0005())){
				sql+=" field0005='" + formmain.getField0005()+"',";
			}
			if(null!=formmain.getField0017() && !"".equals(formmain.getField0017())){
				sql+=" field0017='" + formmain.getField0017()+"',";
			}
			if(null!=formmain.getField0012() && !"".equals(formmain.getField0012())){
				sql+=" field0012='" + formmain.getField0012()+"',";
			}
			if(null!=formmain.getField0018() && !"".equals(formmain.getField0018())){
				sql+=" field0018='" + formmain.getField0018()+"',";
			}
			if(null!=formmain.getField0020() && !"".equals(formmain.getField0020())){
				sql+=" field0020='" + formmain.getField0020()+"',";
			}

			String executesql=sql.substring(0,sql.length()-1)+"  where id='"+formmain.getID()+"'";
			jdbcAgent.execute(executesql);

			//附件保存
			String fjdata =request.getParameter("fjparams");
			String att_reference=request.getParameter("att_reference");
			if(null!=fjdata && !(fjdata.equals(""))){
				List<FjEntity> fjlist= (List<FjEntity>)JSON.parseArray(fjdata,FjEntity.class);
				if(null==formmain.getField0019() || "".equals(formmain.getField0019())){//本来没有附件，添加附件要更新formmain中的附件field0010字段，否则查不到
					formmain.setField0019(CommonUtil.generateID());
					jdbcAgent.execute("update formmain_0081 set field0019='"+formmain.getField0019()+"' where id='"+formmain.getID()+"'");
				}

				for(int k=0;k<fjlist.size();k++){
					FjEntity fj=fjlist.get(k);
					String fjsql="insert into ctp_attachment(                   id,             att_reference,                sub_reference,              category,              type,              filename,             file_url,             mime_type,              createdate,   attachment_size,        description)" +
							" values ('"+CommonUtil.generateID()+"','"+att_reference+"','"+formmain.getField0019()+"','"+fj.getCategory()+"','"+fj.getType()+"','"+fj.getFilename()+"','"+fj.getFileUrl()+"','"+fj.getMimeType()+"','"+fj.getCreateDate()+"','"+fj.getSize()+"','"+fj.getDescription()+"')";
					jdbcAgent.execute(fjsql);
				}
			}


			jsonMap.put("code", "0");
			jsonMap.put("msg", "成功");
		}catch(Exception e){
			jsonMap.put("code", "1");
			jsonMap.put("msg", "失败");
			e.printStackTrace();
		}
		com.alibaba.fastjson.JSONObject json = new JSONObject(jsonMap);
		render(response, json.toJSONString());
		return null;
	}

     /*************************收文修改-协同办公start***************************************/
	/**
	 * 跳转到收文-协同办公信息列表页面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toXtbgList(HttpServletRequest request, HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		ModelAndView view = new ModelAndView("gwxg/swxg/xtbg/xtbg_list");
		Map<String,String> query = new HashMap<String,String>();
		FlipInfo fi = new FlipInfo();
		if(demoManager == null) {
			demoManager = (DemoManager) AppContext.getBean("demoManager");
		}
		FlipInfo swlist = demoManager.toXtbgList(fi,query);
		request.setAttribute("fflistStudent",swlist);

		return view;
	}


	/**
	 * 跳转到收文-协同办公信息修改页面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toXtbgMod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView("gwxg/swxg/xtbg/xtbg_modify");
		String formid = request.getParameter("formid");
		String summaryid=request.getParameter("summaryid");
		String sql="   select f.*, (select name from org_member r where r.id=f.field0012) as djr," +
				" (select org_department_id from org_member r where r.id=f.field0012)  as djrdepartment " +
				"  from formmain_0188 f where f.id='"+formid+"' ";
		Map<String, Object> swxxdata = null;
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql);
			swxxdata=jdbcAgent.resultSetToMap();
			swxxdata.put("bqdwmc",getDepartmentName(swxxdata.get("field0002"),jdbcAgent));
			swxxdata.put("summaryid",summaryid);
			modelAndView.addObject("entity", swxxdata);

			//处理性质
			String clxzsql="select id,showvalue from ctp_enum_item  t where REF_ENUMID='6534952330511468065' and state='1' order by t.sortnumber ";
			modelAndView.addObject("clxzoption",getOptionData(clxzsql,jdbcAgent));


			//拟办、批示、办理意见
			List<Map<String, Object>> yjlist = null;
			String ideaSql = " select id,content,create_time,(select name from ORG_MEMBER where id=CREATE_USER_ID) username,policy , " +
					" ( select group_concat(FILENAME) from CTP_ATTACHMENT where sub_REFERENCE=o.id) filename from  EDOC_OPINION o where   edoc_id ='" + summaryid + "'  order by create_time asc ";
			jdbcAgent.execute(ideaSql);
			yjlist=jdbcAgent.resultSetToList();
		/*	field0006：党政办拟办意见  dzbList
			field0007：校领导批示意见   xldList
			field0008：部门意见  bmList*/
			List<OpinionEntity> dzbList = new ArrayList<>();
			List<OpinionEntity> xldpsList = new ArrayList<>();
			List<OpinionEntity> bmList = new ArrayList<>();
			for(int p=0;p<yjlist.size();p++){
				Map<String, Object> m = yjlist.get(p);
				OpinionEntity opinion = new OpinionEntity();
				opinion.setId(String.valueOf(m.get("id")));
				opinion.setContent((String)m.get("content"));
				opinion.setCreateTime(m.get("create_time").toString().substring(0,10));
				opinion.setUsername((String)m.get("username"));
				opinion.setPolicy((String)m.get("policy"));
				opinion.setFilename((String)m.get("filename"));
				String policy = (String)m.get("policy");
				if ("field0006".equals(policy)) {
					dzbList.add(opinion);
				}
				if ("field0007".equals(policy)) {
					xldpsList.add(opinion);
				}
				if ("field0008".equals(policy)) {
					bmList.add(opinion);
				}
			}
			modelAndView.addObject("dzbList", dzbList);
			modelAndView.addObject("xldpsList", xldpsList);
			modelAndView.addObject("bmList", bmList);


			//附件 field0015
			String fjmainId=(String)swxxdata.get("field0015");
			String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.SUB_REFERENCE  ='"+fjmainId+"'";
			List<Map<String, Object>> fjList=null;
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();
			com.alibaba.fastjson.JSONArray fjsonArray = com.alibaba.fastjson.JSONArray.parseArray(JSON.toJSONString(fjList));
			modelAndView.addObject("fjsonArray", fjsonArray);
			modelAndView.addObject("fjlist", fjList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}

	/**
	 * 跳转到收文-协同办公详情界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toXtbgDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView("gwxg/swxg/xtbg/xtbg_detail");
		String formid = request.getParameter("formid");
		String summaryid=request.getParameter("summaryid");
		String sql="   select f.*, (select name from org_member r where r.id=f.field0012) as djr," +
				" (select org_department_id from org_member r where r.id=f.field0012)  as djrdepartment " +
				"  from formmain_0188 f where f.id='"+formid+"' ";
		Map<String, Object> swxxdata = null;
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql);
			swxxdata=jdbcAgent.resultSetToMap();
			swxxdata.put("bqdwmc",getDepartmentName(swxxdata.get("field0002"),jdbcAgent));
			swxxdata.put("summaryid",summaryid);
			modelAndView.addObject("entity", swxxdata);

			//处理性质
			String clxzsql="select id,showvalue from ctp_enum_item  t where REF_ENUMID='6534952330511468065' and state='1' order by t.sortnumber ";
			modelAndView.addObject("clxzoption",getOptionData(clxzsql,jdbcAgent));


			//拟办、批示、办理意见
			List<Map<String, Object>> yjlist = null;
			String ideaSql = " select id,content,create_time,(select name from ORG_MEMBER where id=CREATE_USER_ID) username,policy , " +
					" ( select group_concat(FILENAME) from CTP_ATTACHMENT where sub_REFERENCE=o.id) filename from  EDOC_OPINION o where   edoc_id ='" + summaryid + "'  order by create_time asc ";
			jdbcAgent.execute(ideaSql);
			yjlist=jdbcAgent.resultSetToList();
		/*	field0006：党政办拟办意见  dzbList
			field0007：校领导批示意见   xldList
			field0008：部门意见  bmList*/
			List<OpinionEntity> dzbList = new ArrayList<>();
			List<OpinionEntity> xldpsList = new ArrayList<>();
			List<OpinionEntity> bmList = new ArrayList<>();
			for(int p=0;p<yjlist.size();p++){
				Map<String, Object> m = yjlist.get(p);
				OpinionEntity opinion = new OpinionEntity();
				opinion.setId(String.valueOf(m.get("id")));
				opinion.setContent((String)m.get("content"));
				opinion.setCreateTime(m.get("create_time").toString().substring(0,10));
				opinion.setUsername((String)m.get("username"));
				opinion.setPolicy((String)m.get("policy"));
				opinion.setFilename((String)m.get("filename"));
				String policy = (String)m.get("policy");
				if ("field0006".equals(policy)) {
					dzbList.add(opinion);
				}
				if ("field0007".equals(policy)) {
					xldpsList.add(opinion);
				}
				if ("field0008".equals(policy)) {
					bmList.add(opinion);
				}
			}
			modelAndView.addObject("dzbList", dzbList);
			modelAndView.addObject("xldpsList", xldpsList);
			modelAndView.addObject("bmList", bmList);


			//附件 field0015
			String fjmainId=(String)swxxdata.get("field0015");
			String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.SUB_REFERENCE  ='"+fjmainId+"'";
			List<Map<String, Object>> fjList=null;
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();
			com.alibaba.fastjson.JSONArray fjsonArray = com.alibaba.fastjson.JSONArray.parseArray(JSON.toJSONString(fjList));
			modelAndView.addObject("fjsonArray", fjsonArray);
			modelAndView.addObject("fjlist", fjList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}


	/**
	 *收文-协同办公信息修改功能
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	public ModelAndView toUpdateFormmain0188(HttpServletRequest request, HttpServletResponse response) throws  Exception{
		Map<String, Object> jsonMap = new HashMap();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			String data =request.getParameter("params");
			FormMain0188Entity formmain = (FormMain0188Entity) JSONArray.parseObject(data, FormMain0188Entity.class);
			String sql="update formmain_0188 set " ;
			if(null!=formmain.getField0001() && !"".equals(formmain.getField0001())){
				sql+=" field0001='" + formmain.getField0001()+"',";
			}
			if(null!=formmain.getField0002() && !"".equals(formmain.getField0002())){
				sql+=" field0002='" + formmain.getField0002()+"',";
			}
			if(null!=formmain.getField0011() && !"".equals(formmain.getField0011())){
				sql+=" field0011='" + formmain.getField0011()+"',";
			}
			if(null!=formmain.getField0012() && !"".equals(formmain.getField0012())){
				sql+=" field0012='" + formmain.getField0012()+"',";
			}
			if(null!=formmain.getField0003() && !"".equals(formmain.getField0003())){
				sql+=" field0003='" + formmain.getField0003()+"',";
			}
			if(null!=formmain.getField0013() && !"".equals(formmain.getField0013())){
				sql+=" field0013='" + formmain.getField0013()+"',";
			}
			if(null!=formmain.getField0009() && !"".equals(formmain.getField0009())){
				sql+=" field0009='" + formmain.getField0009()+"',";
			}
			if(null!=formmain.getField0017() && !"".equals(formmain.getField0017())){
				sql+=" field0017='" + formmain.getField0017()+"',";
			}
			if(null!=formmain.getField0005() && !"".equals(formmain.getField0005())){
				sql+=" field0005='" + formmain.getField0005()+"',";
			}
			if(null!=formmain.getField0014() && !"".equals(formmain.getField0014())){
				sql+=" field0014='" + formmain.getField0014()+"',";
			}
			if(null!=formmain.getField0010() && !"".equals(formmain.getField0010())){
				sql+=" field0010='" + formmain.getField0010()+"',";
			}
			if(null!=formmain.getField0016() && !"".equals(formmain.getField0016())){
				sql+=" field0016='" + formmain.getField0016()+"',";
			}

			String executesql=sql.substring(0,sql.length()-1)+"  where id='"+formmain.getID()+"'";
			jdbcAgent.execute(executesql);

			//附件保存
			String fjdata =request.getParameter("fjparams");
			String att_reference=request.getParameter("att_reference");
			if(null!=fjdata && !(fjdata.equals(""))){
				List<FjEntity> fjlist= (List<FjEntity>)JSON.parseArray(fjdata,FjEntity.class);
				if(null==formmain.getField0015() || "".equals(formmain.getField0015())){//本来没有附件，添加附件要更新formmain中的附件field0010字段，否则查不到
					formmain.setField0015(CommonUtil.generateID());
					jdbcAgent.execute("update formmain_0188 set field0015='"+formmain.getField0015()+"' where id='"+formmain.getID()+"'");
				}

				for(int k=0;k<fjlist.size();k++){
					FjEntity fj=fjlist.get(k);
					String fjsql="insert into ctp_attachment(                   id,             att_reference,                sub_reference,              category,              type,              filename,             file_url,             mime_type,              createdate,   attachment_size,        description)" +
							" values ('"+CommonUtil.generateID()+"','"+att_reference+"','"+formmain.getField0015()+"','"+fj.getCategory()+"','"+fj.getType()+"','"+fj.getFilename()+"','"+fj.getFileUrl()+"','"+fj.getMimeType()+"','"+fj.getCreateDate()+"','"+fj.getSize()+"','"+fj.getDescription()+"')";
					jdbcAgent.execute(fjsql);
				}
			}
			jsonMap.put("code", "0");
			jsonMap.put("msg", "成功");
		}catch(Exception e){
			jsonMap.put("code", "1");
			jsonMap.put("msg", "失败");
		}
		com.alibaba.fastjson.JSONObject json = new JSONObject(jsonMap);
		render(response, json.toJSONString());
		return null;
	}



	/*************************法律事务start***************************************/
	/**
	 * 跳转到法律事务信息列表页面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toFlswList(HttpServletRequest request, HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		ModelAndView view = new ModelAndView("other/flsw/flswxx_list");
		Map<String,String> query = new HashMap<String,String>();
		FlipInfo fi = new FlipInfo();
		if(demoManager == null) {
			demoManager = (DemoManager) AppContext.getBean("demoManager");
		}
		FlipInfo swlist = demoManager.toFlswList(fi,query);
		request.setAttribute("fflistStudent",swlist);

		return view;
	}

	/**
	 * 跳转到法律事务修改界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toFlswMod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView("other/flsw/flswxx_modify");
		String formid = request.getParameter("formid");
		String summaryid=request.getParameter("summaryid");
		String sql="  select f.*, (select name from org_member r where r.id=f.field0002) as djr," +
				" (select name from org_unit r where r.id=f.field0003)  as djbm, " +
		" DATE_FORMAT(f.field0009 ,'%Y-%m-%d') djsj "+
		" from formmain_0084 f  where f.id='"+formid+"' ";
		Map<String, Object> swxxdata = null;
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql);
			swxxdata=jdbcAgent.resultSetToMap();
			swxxdata.put("summaryid",summaryid);
			modelAndView.addObject("entity", swxxdata);

			//附件 field0011
			String fjmainId=(String)swxxdata.get("field0011");
			String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.SUB_REFERENCE  ='"+fjmainId+"'";
			List<Map<String, Object>> fjList=null;
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();
			com.alibaba.fastjson.JSONArray fjsonArray = com.alibaba.fastjson.JSONArray.parseArray(JSON.toJSONString(fjList));
			modelAndView.addObject("fjsonArray", fjsonArray);
			modelAndView.addObject("fjlist", fjList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}

	/**
	 * 更新法律事务信息
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toUpdateFormmain0084(HttpServletRequest request, HttpServletResponse response) throws  Exception{
		Map<String, Object> jsonMap = new HashMap();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			String data =request.getParameter("params");
			FormMainOtherEntity formmain = (FormMainOtherEntity) JSONArray.parseObject(data, FormMainOtherEntity.class);
			String sql="update formmain_0084 set " ;
			if(null!=formmain.getField0001() && !"".equals(formmain.getField0001())){
				sql+=" field0001='" + formmain.getField0001()+"',";
			}
			if(null!=formmain.getField0002() && !"".equals(formmain.getField0002())){
				sql+=" field0002='" + formmain.getField0002()+"',";
			}
			if(null!=formmain.getField0003() && !"".equals(formmain.getField0003())){
				sql+=" field0003='" + formmain.getField0003()+"',";
			}
			if(null!=formmain.getField0004() && !"".equals(formmain.getField0004())){
				sql+=" field0004='" + formmain.getField0004()+"',";
			}
			if(null!=formmain.getField0005() && !"".equals(formmain.getField0005())){
				sql+=" field0005='" + formmain.getField0005()+"',";
			}
			if(null!=formmain.getField0006() && !"".equals(formmain.getField0006())){
				sql+=" field0006='" + formmain.getField0006()+"',";
			}
			if(null!=formmain.getField0007() && !"".equals(formmain.getField0007())){
				sql+=" field0007='" + formmain.getField0007()+"',";
			}
			if(null!=formmain.getField0008() && !"".equals(formmain.getField0008())){
				sql+=" field0008='" + formmain.getField0008()+"',";
			}
			if(null!=formmain.getField0009() && !"".equals(formmain.getField0009())){
				sql+=" field0009='" + formmain.getField0009()+"',";
			}
			if(null!=formmain.getField0010() && !"".equals(formmain.getField0010())){
				sql+=" field0010='" + formmain.getField0010()+"',";
			}
			if(null!=formmain.getField0011() && !"".equals(formmain.getField0011())){
				sql+=" field0011='" + formmain.getField0011()+"',";
			}
			if(null!=formmain.getField0012() && !"".equals(formmain.getField0012())){
				sql+=" field0012='" + formmain.getField0012()+"',";
			}
			if(null!=formmain.getField0013() && !"".equals(formmain.getField0013())){
				sql+=" field0013='" + formmain.getField0013()+"',";
			}
			if(null!=formmain.getField0015() && !"".equals(formmain.getField0015())){
				sql+=" field0015='" + formmain.getField0015()+"',";
			}
			if(null!=formmain.getField0017() && !"".equals(formmain.getField0017())){
				sql+=" field0017='" + formmain.getField0017()+"',";
			}

			String executesql=sql.substring(0,sql.length()-1)+"  where id='"+formmain.getID()+"'";
			jdbcAgent.execute(executesql);

			//附件保存
			String fjdata =request.getParameter("fjparams");
			String att_reference=request.getParameter("att_reference");
			if(null!=fjdata && !(fjdata.equals(""))){
				List<FjEntity> fjlist= (List<FjEntity>)JSON.parseArray(fjdata,FjEntity.class);
				if(null==formmain.getField0011() || "".equals(formmain.getField0011())){//本来没有附件，添加附件要更新formmain中的附件field0011字段，否则查不到
					formmain.setField0011(CommonUtil.generateID());
					jdbcAgent.execute("update formmain_0084 set field0011='"+formmain.getField0011()+"' where id='"+formmain.getID()+"'");
				}

				for(int k=0;k<fjlist.size();k++){
					FjEntity fj=fjlist.get(k);
					String fjsql="insert into ctp_attachment(                   id,             att_reference,                sub_reference,              category,              type,              filename,             file_url,             mime_type,              createdate,   attachment_size,        description)" +
							" values ('"+CommonUtil.generateID()+"','"+att_reference+"','"+formmain.getField0011()+"','"+fj.getCategory()+"','"+fj.getType()+"','"+fj.getFilename()+"','"+fj.getFileUrl()+"','"+fj.getMimeType()+"','"+fj.getCreateDate()+"','"+fj.getSize()+"','"+fj.getDescription()+"')";
					jdbcAgent.execute(fjsql);
				}
			}
			jsonMap.put("code", "0");
			jsonMap.put("msg", "成功");
		}catch(Exception e){
			jsonMap.put("code", "1");
			jsonMap.put("msg", "失败");
		}
		com.alibaba.fastjson.JSONObject json = new JSONObject(jsonMap);
		render(response, json.toJSONString());
		return null;
	}


	/*************************信访start***************************************/
	/**
	 * 跳转到信访信息列表页面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toXfList(HttpServletRequest request, HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		ModelAndView view = new ModelAndView("other/xfxg/xfxx_list");
		Map<String,String> query = new HashMap<String,String>();
		FlipInfo fi = new FlipInfo();
		if(demoManager == null) {
			demoManager = (DemoManager) AppContext.getBean("demoManager");
		}
		FlipInfo swlist = demoManager.toXfList(fi,query);
		request.setAttribute("fflistStudent",swlist);

		return view;
	}

	/**
	 * 跳转到信访修改界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toXfMod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView("other/xfxg/xfxx_modify");
		String formid = request.getParameter("formid");
		String summaryid=request.getParameter("summaryid");
		String sql="  select f.*, (select name from org_member r where r.id=f.field0017) as djr," +
				" (select name from org_unit r where r.id=f.field0016)  as djbm ,"+
		         "  DATE_FORMAT(f.field0012 ,'%Y-%m-%d') jfsj "+
				" from formmain_0085 f  where f.id='"+formid+"' ";
		Map<String, Object> swxxdata = null;
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql);
			swxxdata=jdbcAgent.resultSetToMap();
			swxxdata.put("summaryid",summaryid);
			modelAndView.addObject("entity", swxxdata);

			//信访渠道
			String xfqdsql="select id,showvalue from ctp_enum_item  t where REF_ENUMID='-8585790764919865105' and state='1' order by t.sortnumber ";
			modelAndView.addObject("xfqdoption",getOptionData(xfqdsql,jdbcAgent));
			//信访类型
			String xflxsql="select id,showvalue from ctp_enum_item  t where REF_ENUMID='-283407544673746591' and state='1' order by t.sortnumber ";
			modelAndView.addObject("xflxdoption",getOptionData(xflxsql,jdbcAgent));

			//附件 field0025
			String fjmainId=(String)swxxdata.get("field0025");
			String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.SUB_REFERENCE  ='"+fjmainId+"'";
			List<Map<String, Object>> fjList=null;
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();
			com.alibaba.fastjson.JSONArray fjsonArray = com.alibaba.fastjson.JSONArray.parseArray(JSON.toJSONString(fjList));
			modelAndView.addObject("fjsonArray", fjsonArray);
			modelAndView.addObject("fjlist", fjList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}

	/**
	 * 修改信访信息
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toUpdateFormmain0085(HttpServletRequest request, HttpServletResponse response) throws  Exception{
		Map<String, Object> jsonMap = new HashMap();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			String data =request.getParameter("params");
			FormMainOtherEntity formmain = (FormMainOtherEntity) JSONArray.parseObject(data, FormMainOtherEntity.class);
			String sql="update formmain_0085 set " ;
			if(null!=formmain.getField0018() && !"".equals(formmain.getField0018())){
				sql+=" field0018='" + formmain.getField0018()+"',";
			}
			if(null!=formmain.getField0017() && !"".equals(formmain.getField0017())){
				sql+=" field0017='" + formmain.getField0017()+"',";
			}
			if(null!=formmain.getField0016() && !"".equals(formmain.getField0016())){
				sql+=" field0016='" + formmain.getField0016()+"',";
			}
			if(null!=formmain.getField0015() && !"".equals(formmain.getField0015())){
				sql+=" field0015='" + formmain.getField0015()+"',";
			}
			if(null!=formmain.getField0014() && !"".equals(formmain.getField0014())){
				sql+=" field0014='" + formmain.getField0014()+"',";
			}
			if(null!=formmain.getField0013() && !"".equals(formmain.getField0013())){
				sql+=" field0013='" + formmain.getField0013()+"',";
			}
			if(null!=formmain.getField0012() && !"".equals(formmain.getField0012())){
				sql+=" field0012='" + formmain.getField0012()+"',";
			}
			if(null!=formmain.getField0011() && !"".equals(formmain.getField0011())){
				sql+=" field0011='" + formmain.getField0011()+"',";
			}
			if(null!=formmain.getField0022() && !"".equals(formmain.getField0022())){
				sql+=" field0022='" + formmain.getField0022()+"',";
			}
			if(null!=formmain.getField0023() && !"".equals(formmain.getField0023())){
				sql+=" field0023='" + formmain.getField0023()+"',";
			}
			if(null!=formmain.getField0007() && !"".equals(formmain.getField0007())){
				sql+=" field0007='" + formmain.getField0007()+"',";
			}
			if(null!=formmain.getField0008() && !"".equals(formmain.getField0008())){
				sql+=" field0008='" + formmain.getField0008()+"',";
			}
			if(null!=formmain.getField0025() && !"".equals(formmain.getField0025())){
				sql+=" field0025='" + formmain.getField0025()+"',";
			}
			if(null!=formmain.getField0005() && !"".equals(formmain.getField0005())){
				sql+=" field0005='" + formmain.getField0005()+"',";
			}
			if(null!=formmain.getField0004() && !"".equals(formmain.getField0004())){
				sql+=" field0004='" + formmain.getField0004()+"',";
			}
			if(null!=formmain.getField0002() && !"".equals(formmain.getField0002())){
				sql+=" field0002='" + formmain.getField0002()+"',";
			}
			if(null!=formmain.getField0001() && !"".equals(formmain.getField0001())){
				sql+=" field0001='" + formmain.getField0001()+"',";
			}

			String executesql=sql.substring(0,sql.length()-1)+"  where id='"+formmain.getID()+"'";
			jdbcAgent.execute(executesql);

			//附件保存
			String fjdata =request.getParameter("fjparams");
			String att_reference=request.getParameter("att_reference");
			if(null!=fjdata && !(fjdata.equals(""))){
				List<FjEntity> fjlist= (List<FjEntity>)JSON.parseArray(fjdata,FjEntity.class);
				if(null==formmain.getField0025() || "".equals(formmain.getField0025())){//本来没有附件，添加附件要更新formmain中的附件field0025字段，否则查不到
					formmain.setField0025(CommonUtil.generateID());
					jdbcAgent.execute("update formmain_0085 set field0025='"+formmain.getField0025()+"' where id='"+formmain.getID()+"'");
				}

				for(int k=0;k<fjlist.size();k++){
					FjEntity fj=fjlist.get(k);
					String fjsql="insert into ctp_attachment(                   id,             att_reference,                sub_reference,              category,              type,              filename,             file_url,             mime_type,              createdate,   attachment_size,        description)" +
							" values ('"+CommonUtil.generateID()+"','"+att_reference+"','"+formmain.getField0025()+"','"+fj.getCategory()+"','"+fj.getType()+"','"+fj.getFilename()+"','"+fj.getFileUrl()+"','"+fj.getMimeType()+"','"+fj.getCreateDate()+"','"+fj.getSize()+"','"+fj.getDescription()+"')";
					jdbcAgent.execute(fjsql);
				}
			}
			jsonMap.put("code", "0");
			jsonMap.put("msg", "成功");
		}catch(Exception e){
			jsonMap.put("code", "1");
			jsonMap.put("msg", "失败");
		}
		com.alibaba.fastjson.JSONObject json = new JSONObject(jsonMap);
		render(response, json.toJSONString());
		return null;
	}

	/*************************哲社报告start***************************************/
	/**
	 * 跳转到哲社报告列表页面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toZsbgList(HttpServletRequest request, HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		ModelAndView view = new ModelAndView("other/zsbg/zsbg_list");
		Map<String,String> query = new HashMap<String,String>();
		FlipInfo fi = new FlipInfo();
		if(demoManager == null) {
			demoManager = (DemoManager) AppContext.getBean("demoManager");
		}
		FlipInfo swlist = demoManager.toZsbgList(fi,query);
		request.setAttribute("fflistStudent",swlist);

		return view;
	}

	/**
	 * 跳转到哲社报告修改界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toZsbgMod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView("other/zsbg/zsbg_modify");
		String formid = request.getParameter("formid");
		String summaryid=request.getParameter("summaryid");
		String sql="  select f.*, (select name from org_member r where r.id=f.field0002) as djr, " +
				" (select name from org_unit r where r.id=f.field0001)  as djbm , " +
				" (select name from org_member r where r.id=f.field0003) xcbgzrr, " +
				" (select org_department_id from org_member where id=f.field0003) xcbgzrrdw,"+
				" DATE_FORMAT(f.field0006 ,'%Y-%m-%d') jbsj "+
				" from formmain_0091 f  where f.id='"+formid+"' ";
		Map<String, Object> swxxdata = null;
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql);
			swxxdata=jdbcAgent.resultSetToMap();
			swxxdata.put("summaryid",summaryid);
			modelAndView.addObject("entity", swxxdata);

			//附件 field0011
			String fjmainId=(String)swxxdata.get("field0011");
			String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.SUB_REFERENCE  ='"+fjmainId+"'";
			List<Map<String, Object>> fjList=null;
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();
			com.alibaba.fastjson.JSONArray fjsonArray = com.alibaba.fastjson.JSONArray.parseArray(JSON.toJSONString(fjList));
			modelAndView.addObject("fjsonArray", fjsonArray);
			modelAndView.addObject("fjlist", fjList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}



	/**
	 * 更新哲社报告信息
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toUpdateFormmain0091(HttpServletRequest request, HttpServletResponse response) throws  Exception{
		Map<String, Object> jsonMap = new HashMap();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			String data =request.getParameter("params");
			FormMainOtherEntity formmain = (FormMainOtherEntity) JSONArray.parseObject(data, FormMainOtherEntity.class);
			String sql="update formmain_0091 set " ;
			if(null!=formmain.getField0001() && !"".equals(formmain.getField0001())){
				sql+=" field0001='" + formmain.getField0001()+"',";
			}
			if(null!=formmain.getField0002() && !"".equals(formmain.getField0002())){
				sql+=" field0002='" + formmain.getField0002()+"',";
			}
			if(null!=formmain.getField0003() && !"".equals(formmain.getField0003())){
				sql+=" field0003='" + formmain.getField0003()+"',";
			}
			if(null!=formmain.getField0004() && !"".equals(formmain.getField0004())){
				sql+=" field0004='" + formmain.getField0004()+"',";
			}
			if(null!=formmain.getField0005() && !"".equals(formmain.getField0005())){
				sql+=" field0005='" + formmain.getField0005()+"',";
			}
			if(null!=formmain.getField0006() && !"".equals(formmain.getField0006())){
				sql+=" field0006='" + formmain.getField0006()+"',";
			}
			if(null!=formmain.getField0007() && !"".equals(formmain.getField0007())){
				sql+=" field0007='" + formmain.getField0007()+"',";
			}
			if(null!=formmain.getField0008() && !"".equals(formmain.getField0008())){
				sql+=" field0008='" + formmain.getField0008()+"',";
			}
			if(null!=formmain.getField0009() && !"".equals(formmain.getField0009())){
				sql+=" field0009='" + formmain.getField0009()+"',";
			}
			if(null!=formmain.getField0010() && !"".equals(formmain.getField0010())){
				sql+=" field0010='" + formmain.getField0010()+"',";
			}
			if(null!=formmain.getField0012() && !"".equals(formmain.getField0012())){
				sql+=" field0012='" + formmain.getField0012()+"',";
			}
			if(null!=formmain.getField0013() && !"".equals(formmain.getField0013())){
				sql+=" field0013='" + formmain.getField0013()+"',";
			}
			if(null!=formmain.getField0014() && !"".equals(formmain.getField0014())){
				sql+=" field0014='" + formmain.getField0014()+"',";
			}
			if(null!=formmain.getField0015() && !"".equals(formmain.getField0015())){
				sql+=" field0015='" + formmain.getField0015()+"',";
			}
			if(null!=formmain.getField0016() && !"".equals(formmain.getField0016())){
				sql+=" field0016='" + formmain.getField0016()+"',";
			}

			String executesql=sql.substring(0,sql.length()-1)+"  where id='"+formmain.getID()+"'";
			jdbcAgent.execute(executesql);

			//附件保存
			String fjdata =request.getParameter("fjparams");
			String att_reference=request.getParameter("att_reference");
			if(null!=fjdata && !(fjdata.equals(""))){
				List<FjEntity> fjlist= (List<FjEntity>)JSON.parseArray(fjdata,FjEntity.class);
				if(null==formmain.getField0011() || "".equals(formmain.getField0011())){//本来没有附件，添加附件要更新formmain中的附件field0011字段，否则查不到
					formmain.setField0011(CommonUtil.generateID());
					jdbcAgent.execute("update formmain_0091 set field0011='"+formmain.getField0011()+"' where id='"+formmain.getID()+"'");
				}

				for(int k=0;k<fjlist.size();k++){
					FjEntity fj=fjlist.get(k);
					String fjsql="insert into ctp_attachment(                   id,             att_reference,                sub_reference,              category,              type,              filename,             file_url,             mime_type,              createdate,   attachment_size,        description)" +
							" values ('"+CommonUtil.generateID()+"','"+att_reference+"','"+formmain.getField0011()+"','"+fj.getCategory()+"','"+fj.getType()+"','"+fj.getFilename()+"','"+fj.getFileUrl()+"','"+fj.getMimeType()+"','"+fj.getCreateDate()+"','"+fj.getSize()+"','"+fj.getDescription()+"')";
					jdbcAgent.execute(fjsql);
				}
			}
			jsonMap.put("code", "0");
			jsonMap.put("msg", "成功");
		}catch(Exception e){
			jsonMap.put("code", "1");
			jsonMap.put("msg", "失败");
		}
		com.alibaba.fastjson.JSONObject json = new JSONObject(jsonMap);
		render(response, json.toJSONString());
		return null;
	}

}
