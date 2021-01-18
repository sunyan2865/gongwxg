package com.seeyon.apps.gwxg.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.seeyon.apps.gwxg.po.FormMain0081Entity;
import com.seeyon.apps.gwxg.po.*;
import com.seeyon.apps.gwxg.util.CommonUtil;
import com.seeyon.apps.meetingroom.util.MeetingReadConfigTools;
import com.seeyon.ctp.common.AppContext;
import com.seeyon.ctp.services.ServiceResponse;
import com.seeyon.ctp.services.UserToken;
import com.seeyon.ctp.util.JDBCAgent;
import com.seeyon.v3x.services.AuthorityService;
import com.seeyon.v3x.services.impl.AuthorityServiceImpl;
import com.seeyon.v3x.services.message.MessageService;
import com.seeyon.v3x.services.message.impl.MessageServiceImpl;
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
			/*String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.SUB_REFERENCE  ='"+fjmainId+"'";
			List<Map<String, Object>> fjList=null;
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();*/

			List<Map<String, Object>> fjList=null;
			fjList=getfjlist(summaryid,fjmainId);

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

			field0031：文件合规性审核
			*/
			List<OpinionEntity> bmfzrList = new ArrayList<>();
			List<OpinionEntity> dzbList = new ArrayList<>();
			List<OpinionEntity> bmhqList = new ArrayList<>();
			List<OpinionEntity> xdyjList = new ArrayList<>();
			List<OpinionEntity> xldspList = new ArrayList<>();
			List<OpinionEntity> wjhgxList = new ArrayList<>();
			for(int p=0;p<yjlist.size();p++){
				Map<String, Object> m = yjlist.get(p);
				OpinionEntity opinion = new OpinionEntity();
				opinion.setId(String.valueOf(m.get("id")));
				opinion.setContent((String)m.get("content"));
				opinion.setCreateTime(m.get("create_time").toString().substring(0,19));
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
				if ("field0031".equals(policy)) {
					wjhgxList.add(opinion);
				}
			}
			modelAndView.addObject("bmfzrList", bmfzrList);
			modelAndView.addObject("xldspList", xldspList);
			modelAndView.addObject("dzbList", dzbList);
			modelAndView.addObject("bmhqList", bmhqList);
			modelAndView.addObject("xdyjList", xdyjList);
			modelAndView.addObject("wjhgxList", wjhgxList);

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}
		return modelAndView;
	}


	private List<Map<String, Object>> getfjlist(String att_reference,String sub_reference){
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		List<Map<String, Object>> fjList=null;
		try{
			String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.SUB_REFERENCE  ='"+sub_reference+"' and a.att_reference='"+att_reference+"'";
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();
		}catch(Exception e){
			e.printStackTrace();
		}
		return fjList;
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

					String ctpfilesql="INSERT INTO ctp_file(   ID,              CATEGORY,              TYPE,              FILENAME,             MIME_TYPE,             CREATE_DATE,         FILE_SIZE, DESCRIPTION)" +
							     " values ('"+fj.getFileUrl()+ "','"+fj.getCategory()+"','"+fj.getType()+"','"+fj.getFilename()+"','"+fj.getMimeType()+"','"+fj.getCreateDate()+"','"+fj.getSize()+"','"+fj.getDescription()+"')";
					jdbcAgent.execute(ctpfilesql);
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
		}finally {
			jdbcAgent.close();
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
			/*String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.SUB_REFERENCE  ='"+fjmainId+"'";
			List<Map<String, Object>> fjList=null;
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();*/

			List<Map<String, Object>> fjList=null;
			fjList=getfjlist(summaryid,fjmainId);

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
				opinion.setCreateTime(m.get("create_time").toString().substring(0,19));
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
		}finally {
			jdbcAgent.close();
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
			/*String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.SUB_REFERENCE  ='"+fjmainId+"'";
			List<Map<String, Object>> fjList=null;
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();*/

			List<Map<String, Object>> fjList=null;
			fjList=getfjlist(summaryid,fjmainId);

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
				opinion.setCreateTime(m.get("create_time").toString().substring(0,19));
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
		}finally {
			jdbcAgent.close();
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

					String ctpfilesql="INSERT INTO ctp_file(   ID,              CATEGORY,              TYPE,              FILENAME,             MIME_TYPE,             CREATE_DATE,         FILE_SIZE, DESCRIPTION)" +
							" values ('"+fj.getFileUrl()+ "','"+fj.getCategory()+"','"+fj.getType()+"','"+fj.getFilename()+"','"+fj.getMimeType()+"','"+fj.getCreateDate()+"','"+fj.getSize()+"','"+fj.getDescription()+"')";
					jdbcAgent.execute(ctpfilesql);
				}
			}
			jsonMap.put("code", "0");
			jsonMap.put("msg", "成功");
		}catch(Exception e){
			jsonMap.put("code", "1");
			jsonMap.put("msg", "失败");
		}finally {
			jdbcAgent.close();
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
		}finally {
			jdbcAgent.close();
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
		}finally {
			jdbcAgent.close();
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
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		//机构代字
		try {
			String parent_id = request.getParameter("parent_id");
			String ref_enumid = request.getParameter("ref_enumid");
			String jgdzsql = "select id,showvalue from ctp_enum_item  t where ref_enumid='"+ref_enumid+"' and parent_id='" + parent_id + "' and state='1' order by t.sortnumber ";
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
		}finally {
			jdbcAgent.close();
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
		}finally {
			jdbcAgent.close();
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
		}finally {
			jdbcAgent.close();
		}
		return modelAndView;
	}


	/**
	 * 跳转到删除节点界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toNodeDeleteView(HttpServletRequest request,HttpServletResponse response)throws Exception{
		ModelAndView modelAndView = new ModelAndView("gwxg/nodeDelete");
		String summaryid=request.getParameter("summaryid");
		String sql="select distinct member_id,object_id ,(select name from org_member o where o.id=t.member_id) name  from ctp_affair t where  t.state ='3' and t.object_id ='"+summaryid+"'";
		List<Map<String, Object>> memberlist = null;
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql);
			memberlist = jdbcAgent.resultSetToList();

			List<Map<String, Object>> revoler = new ArrayList<>();
			for (int i = 0; i < memberlist.size(); i++) {
				Map<String, Object> m = new HashMap<>();
				for (Map.Entry<String, Object> entry : memberlist.get(i).entrySet()) {
					m.put(entry.getKey(), String.valueOf(entry.getValue()) + "");
				}
				revoler.add(m);
			}

			com.alibaba.fastjson.JSONArray memberlistArray = com.alibaba.fastjson.JSONArray.parseArray(JSON.toJSONString(revoler));
			modelAndView.addObject("memberlist",memberlistArray);
			modelAndView.addObject("summaryid",summaryid);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}
		return modelAndView;
	}


	/**
	 * 删除节点
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 * edoc_summary,ctp_affair,edoc_opinion
	 */
	public ModelAndView toDeleteNode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<>();

		String summaryid = request.getParameter("summaryid");
		String memberid=request.getParameter("memberid");

		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			List batchedSql=new ArrayList();

			batchedSql.add(" update edoc_summary r set r.current_nodes_info=replace(r.current_nodes_info,'"+memberid+";','') where  r.id='"+summaryid+"'");
			batchedSql.add(" delete from   ctp_affair   where object_id='"+summaryid+"' and member_id='"+memberid+"' and state='3'");
			jdbcAgent.executeBatch(batchedSql);
			map.put("code", 0);

		} catch (Exception e) {
			map.put("code", -1);
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}
		com.alibaba.fastjson.JSONObject json = new JSONObject(map);
		render(response, json.toJSONString());
		return null;
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
		}finally {
			jdbcAgent.close();
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
				opinion.setCreateTime(m.get("create_time").toString().substring(0,19));
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
			/*String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.SUB_REFERENCE  ='"+fjmainId+"'";
			List<Map<String, Object>> fjList=null;
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();*/


			List<Map<String, Object>> fjList=null;
			fjList=getfjlist(summaryid,fjmainId);

			com.alibaba.fastjson.JSONArray fjsonArray = com.alibaba.fastjson.JSONArray.parseArray(JSON.toJSONString(fjList));
			modelAndView.addObject("fjsonArray", fjsonArray);
			modelAndView.addObject("fjlist", fjList);

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
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

					String ctpfilesql="INSERT INTO ctp_file(   ID,              CATEGORY,              TYPE,              FILENAME,             MIME_TYPE,             CREATE_DATE,         FILE_SIZE, DESCRIPTION)" +
							" values ('"+fj.getFileUrl()+ "','"+fj.getCategory()+"','"+fj.getType()+"','"+fj.getFilename()+"','"+fj.getMimeType()+"','"+fj.getCreateDate()+"','"+fj.getSize()+"','"+fj.getDescription()+"')";
					jdbcAgent.execute(ctpfilesql);
				}
			}


			jsonMap.put("code", "0");
			jsonMap.put("msg", "成功");
		}catch(Exception e){
			jsonMap.put("code", "1");
			jsonMap.put("msg", "失败");
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
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
			field0008：部门意见  bmList
			field0018：报请单位意见 bqdwList*/
			List<OpinionEntity> dzbList = new ArrayList<>();
			List<OpinionEntity> xldpsList = new ArrayList<>();
			List<OpinionEntity> bmList = new ArrayList<>();
			List<OpinionEntity> bqdwList = new ArrayList<>();
			for(int p=0;p<yjlist.size();p++){
				Map<String, Object> m = yjlist.get(p);
				OpinionEntity opinion = new OpinionEntity();
				opinion.setId(String.valueOf(m.get("id")));
				opinion.setContent((String)m.get("content"));
				opinion.setCreateTime(m.get("create_time").toString().substring(0,19));
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
				if ("field0018".equals(policy)) {
					bqdwList.add(opinion);
				}
			}
			modelAndView.addObject("dzbList", dzbList);
			modelAndView.addObject("xldpsList", xldpsList);
			modelAndView.addObject("bmList", bmList);
			modelAndView.addObject("bqdwList", bqdwList);

			//附件 field0015
			String fjmainId=(String)swxxdata.get("field0015");
			/*String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.SUB_REFERENCE  ='"+fjmainId+"'";
			List<Map<String, Object>> fjList=null;
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();
*/
			List<Map<String, Object>> fjList=null;
			fjList=getfjlist(summaryid,fjmainId);

			com.alibaba.fastjson.JSONArray fjsonArray = com.alibaba.fastjson.JSONArray.parseArray(JSON.toJSONString(fjList));
			modelAndView.addObject("fjsonArray", fjsonArray);
			modelAndView.addObject("fjlist", fjList);

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
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
			field0008：部门意见  bmList
			field0018：报请单位意见 bqdwList*/

			List<OpinionEntity> dzbList = new ArrayList<>();
			List<OpinionEntity> xldpsList = new ArrayList<>();
			List<OpinionEntity> bmList = new ArrayList<>();
			List<OpinionEntity> bqdwList = new ArrayList<>();
			for(int p=0;p<yjlist.size();p++){
				Map<String, Object> m = yjlist.get(p);
				OpinionEntity opinion = new OpinionEntity();
				opinion.setId(String.valueOf(m.get("id")));
				opinion.setContent((String)m.get("content"));
				opinion.setCreateTime(m.get("create_time").toString().substring(0,19));
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
				if ("field0018".equals(policy)) {
					bqdwList.add(opinion);
				}
			}
			modelAndView.addObject("dzbList", dzbList);
			modelAndView.addObject("xldpsList", xldpsList);
			modelAndView.addObject("bmList", bmList);
			modelAndView.addObject("bqdwList", bqdwList);


			//附件 field0015
			String fjmainId=(String)swxxdata.get("field0015");
	/*		String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.SUB_REFERENCE  ='"+fjmainId+"'";
			List<Map<String, Object>> fjList=null;
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();*/

			List<Map<String, Object>> fjList=null;
			fjList=getfjlist(summaryid,fjmainId);

			com.alibaba.fastjson.JSONArray fjsonArray = com.alibaba.fastjson.JSONArray.parseArray(JSON.toJSONString(fjList));
			modelAndView.addObject("fjsonArray", fjsonArray);
			modelAndView.addObject("fjlist", fjList);

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
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

					String ctpfilesql="INSERT INTO ctp_file(   ID,              CATEGORY,              TYPE,              FILENAME,             MIME_TYPE,             CREATE_DATE,         FILE_SIZE, DESCRIPTION)" +
							" values ('"+fj.getFileUrl()+ "','"+fj.getCategory()+"','"+fj.getType()+"','"+fj.getFilename()+"','"+fj.getMimeType()+"','"+fj.getCreateDate()+"','"+fj.getSize()+"','"+fj.getDescription()+"')";
					jdbcAgent.execute(ctpfilesql);
				}
			}
			jsonMap.put("code", "0");
			jsonMap.put("msg", "成功");
		}catch(Exception e){
			jsonMap.put("code", "1");
			jsonMap.put("msg", "失败");
		}finally {
			jdbcAgent.close();
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
			/*String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.SUB_REFERENCE  ='"+fjmainId+"'";
			List<Map<String, Object>> fjList=null;
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();*/

			List<Map<String, Object>> fjList=null;
			fjList=getfjlist(summaryid,fjmainId);

			com.alibaba.fastjson.JSONArray fjsonArray = com.alibaba.fastjson.JSONArray.parseArray(JSON.toJSONString(fjList));
			modelAndView.addObject("fjsonArray", fjsonArray);
			modelAndView.addObject("fjlist", fjList);

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
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
							" values ('"+CommonUtil.generateID()+"','"+att_reference+"','"+formmain.getField0011()+"','66','"+fj.getType()+"','"+fj.getFilename()+"','"+fj.getFileUrl()+"','"+fj.getMimeType()+"','"+fj.getCreateDate()+"','"+fj.getSize()+"','"+fj.getDescription()+"')";
					jdbcAgent.execute(fjsql);


					String ctpfilesql="INSERT INTO ctp_file(   ID,              CATEGORY,              TYPE,              FILENAME,             MIME_TYPE,             CREATE_DATE,         FILE_SIZE, DESCRIPTION)" +
							" values ('"+fj.getFileUrl()+ "','"+fj.getCategory()+"','"+fj.getType()+"','"+fj.getFilename()+"','"+fj.getMimeType()+"','"+fj.getCreateDate()+"','"+fj.getSize()+"','"+fj.getDescription()+"')";
					jdbcAgent.execute(ctpfilesql);
				}
			}
			jsonMap.put("code", "0");
			jsonMap.put("msg", "成功");
		}catch(Exception e){
			jsonMap.put("code", "1");
			jsonMap.put("msg", "失败");
		}finally {
			jdbcAgent.close();
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
			/*String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.SUB_REFERENCE  ='"+fjmainId+"'";
			List<Map<String, Object>> fjList=null;
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();*/

			List<Map<String, Object>> fjList=null;
			fjList=getfjlist(summaryid,fjmainId);

			com.alibaba.fastjson.JSONArray fjsonArray = com.alibaba.fastjson.JSONArray.parseArray(JSON.toJSONString(fjList));
			modelAndView.addObject("fjsonArray", fjsonArray);
			modelAndView.addObject("fjlist", fjList);

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
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
							" values ('"+CommonUtil.generateID()+"','"+att_reference+"','"+formmain.getField0025()+"','66','"+fj.getType()+"','"+fj.getFilename()+"','"+fj.getFileUrl()+"','"+fj.getMimeType()+"','"+fj.getCreateDate()+"','"+fj.getSize()+"','"+fj.getDescription()+"')";
					jdbcAgent.execute(fjsql);

					String ctpfilesql="INSERT INTO ctp_file(   ID,              CATEGORY,              TYPE,              FILENAME,             MIME_TYPE,             CREATE_DATE,         FILE_SIZE, DESCRIPTION)" +
							" values ('"+fj.getFileUrl()+ "','"+fj.getCategory()+"','"+fj.getType()+"','"+fj.getFilename()+"','"+fj.getMimeType()+"','"+fj.getCreateDate()+"','"+fj.getSize()+"','"+fj.getDescription()+"')";
					jdbcAgent.execute(ctpfilesql);
				}
			}
			jsonMap.put("code", "0");
			jsonMap.put("msg", "成功");
		}catch(Exception e){
			jsonMap.put("code", "1");
			jsonMap.put("msg", "失败");
		}finally {
			jdbcAgent.close();
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
	/*		String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.SUB_REFERENCE  ='"+fjmainId+"'";
			List<Map<String, Object>> fjList=null;
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();*/

			List<Map<String, Object>> fjList=null;
			fjList=getfjlist(summaryid,fjmainId);

			com.alibaba.fastjson.JSONArray fjsonArray = com.alibaba.fastjson.JSONArray.parseArray(JSON.toJSONString(fjList));
			modelAndView.addObject("fjsonArray", fjsonArray);
			modelAndView.addObject("fjlist", fjList);

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
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
							" values ('"+CommonUtil.generateID()+"','"+att_reference+"','"+formmain.getField0011()+"','66','"+fj.getType()+"','"+fj.getFilename()+"','"+fj.getFileUrl()+"','"+fj.getMimeType()+"','"+fj.getCreateDate()+"','"+fj.getSize()+"','"+fj.getDescription()+"')";
					jdbcAgent.execute(fjsql);

					String ctpfilesql="INSERT INTO ctp_file(   ID,              CATEGORY,              TYPE,              FILENAME,             MIME_TYPE,             CREATE_DATE,         FILE_SIZE, DESCRIPTION)" +
							" values ('"+fj.getFileUrl()+ "','"+fj.getCategory()+"','"+fj.getType()+"','"+fj.getFilename()+"','"+fj.getMimeType()+"','"+fj.getCreateDate()+"','"+fj.getSize()+"','"+fj.getDescription()+"')";
					jdbcAgent.execute(ctpfilesql);
				}
			}
			jsonMap.put("code", "0");
			jsonMap.put("msg", "成功");
		}catch(Exception e){
			jsonMap.put("code", "1");
			jsonMap.put("msg", "失败");
		}finally {
			jdbcAgent.close();
		}
		com.alibaba.fastjson.JSONObject json = new JSONObject(jsonMap);
		render(response, json.toJSONString());
		return null;
	}


	/**
	 * 首页栏目-学校文件
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toXxwjPortalList(HttpServletRequest request, HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		ModelAndView view =new ModelAndView("portal20201028/xxwj/xxwj_list");
		FlipInfo list =null;
		Map<String, Object> xxwjlist= null;

		Map<String,String> query = new HashMap<String,String>();
		FlipInfo fi = new FlipInfo();
		if(demoManager == null) {
			demoManager = (DemoManager) AppContext.getBean("demoManager");
		}
		list=demoManager.toXxwjPortalList(fi,query);
		view.addObject("xxwjlist", list.getData());
		request.setAttribute("fflistStudent",list);
		return view;
	}


	/**
	 * 首页栏目-学校文件更多
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toXxwjPortalMoreList(HttpServletRequest request, HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		ModelAndView view = new ModelAndView("portal20201028/xxwj/xxwj_list_more");
		FlipInfo swlist =null;

		Map<String,String> query = new HashMap<String,String>();
		FlipInfo fi = new FlipInfo();
		if(demoManager == null) {
			demoManager = (DemoManager) AppContext.getBean("demoManager");
		}
		swlist=demoManager.toXxwjPortalMoreList(fi,query);
		request.setAttribute("fflistStudent",swlist);

		return view;
	}



	public ModelAndView toPortalDownloadFj(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView("portal20201028/xxwj/fj_download");
		String summaryid=request.getParameter("summaryid");
		Map<String, Object> swxxdata = null;
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			String fjsql="select a.*,DATE_FORMAT(createdate,'%Y-%m-%d') as date,RIGHT(filename, INSTR(REVERSE(filename),'.')) filextension,round(a.ATTACHMENT_SIZE/1024,0) filesize from ctp_attachment  a where a.ATT_REFERENCE  ='"+summaryid+"'";
			List<Map<String, Object>> fjList=null;
			jdbcAgent.execute(fjsql);
			fjList=jdbcAgent.resultSetToList();
			modelAndView.addObject("fjlist", fjList);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}
		return modelAndView;
	}


	/**
	 * 获得学校文件管理员
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView getXxwjGlyData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			String glysql="select  group_concat(OBJECTIVE0_ID) gly from org_relationship  t where t.source_id='-8784815977654893165'";
			jdbcAgent.execute(glysql);
			Map<String, Object> glydata=jdbcAgent.resultSetToMap();
			String gly=glydata.get("gly").toString();
			Map<String, Object> map = new HashMap<>();
			map.put("code", 0);
			map.put("data", gly);
			com.alibaba.fastjson.JSONObject json = new JSONObject(map);
			render(response, json.toJSONString());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}
		return null;
	}




	/**
	 * 跳转到发文查询界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toFwQuery(HttpServletRequest request,HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		ModelAndView view = new ModelAndView("gwcx/fwcx_list");
		Map<String,String> query = new HashMap<String,String>();
		FlipInfo fi = new FlipInfo();
		FlipInfo swlist = demoManager.toFwQuery(fi,query);
		request.setAttribute("fflistStudent",swlist);

		return view;
	}

	/**
	 * 跳转到收文查询界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toSwQuery(HttpServletRequest request,HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		ModelAndView view = new ModelAndView("gwcx/swcx_list");
		Map<String,String> query = new HashMap<String,String>();
		FlipInfo fi = new FlipInfo();
		FlipInfo swlist = demoManager.toSwQuery(fi,query);
		request.setAttribute("fflistStudent",swlist);

		return view;
	}

	/**
	 * 跳转到催办-待办人界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toCbryQuery(HttpServletRequest request,HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		String formson0216_id = request.getParameter("formson0216_id");
		ModelAndView view = new ModelAndView("cbxx/bs_cbxx_list");
		Map<String,String> query = new HashMap<String,String>();
		FlipInfo fi = new FlipInfo();
		FlipInfo swlist = demoManager.toCbryQuery(fi,query,formson0216_id);
		request.setAttribute("fflistStudent",swlist);

		return view;
	}


	/**
	 * 发送消息通知
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toSendMessage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			String loginnames=request.getParameter("loginnames");
			String affairids=request.getParameter("affairids");


			MessageService messageService = new MessageServiceImpl();

			//String[] urls = {"/collaboration/collaboration.do?method=summary&openFrom=listPending&affairId=4078006414541604008&contentAnchor=&_isModalDialog=true"};
			//String[] loginNames=loginnames.split(",");
			String[] loginNames=loginnames.split(",");
			String[] affairIds=affairids.split(",");

			String content="系统管理员催办：请尽快处理《材料报送》待办事项！";
			AuthorityService authorityService = new AuthorityServiceImpl();
			String pass = new MeetingReadConfigTools().getString("passwordOfWebservice");
			UserToken userToken = authorityService.authenticate("service-admin", pass);
			String tokenId = userToken.getId();

			for(int i=0;i<loginNames.length;i++){
				String[] url= {"/seeyon/collaboration/collaboration.do?method=summary&openFrom=listPending&affairId="+affairIds[i]+"&contentAnchor=&_isModalDialog=true"};
				String[] loginName=loginNames[i].split(",");
				ServiceResponse serviceResponse = messageService.sendMessageByLoginName(tokenId, loginName, content, url);
				serviceResponse.getResult();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}



	/**
	 * 服务器2附件同步
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView to2FjTb(HttpServletRequest request,HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		ModelAndView view = new ModelAndView("fjxx/2_fjtb");
		return view;
	}


	public ModelAndView toFileTb(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView("other/zsbg/zsbg_modify");
		String tablename = request.getParameter("tablename");
		//String sql="select field0032,field0033 from formson_0135 t where field0033 like '/0%' order by field0033";
		String path=request.getParameter("path");

		String real_field="";//真实文件名
		String server_field="";//服务器文件名
		String sql="";
		String realfile="";
		String serverfile="";
		if(tablename.equals("formson_0135")){
			real_field="field0032";
			server_field="field0033";
			sql="select * from formson_0135 order by field0033";
		}else if(tablename.equals("formson_0132")){
			real_field="field0030";
			server_field="field0031";
			sql="select * from formson_0132 order by field0031";
		}

		List<Map<String, Object>> fjList  = null;
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql);
			fjList=jdbcAgent.resultSetToList();

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			System.out.println("==="+tablename+"("+path+")===start==="+df.format(new Date()));
			//formson_0135收文
			//formson_0132发文
			int cnt=0;
			for(int i=0;i<fjList.size();i++){
				Map<String, Object> m = fjList.get(i);
				realfile=m.get(real_field).toString();//真实文件名
				serverfile=m.get(server_field).toString();//服务器文件名

				String hz = realfile.substring(realfile.lastIndexOf("."));//获取真实文件的后缀名 .jpg
				File file = new File(path+serverfile);
				if(file.exists()){
					cnt++;
					String newpathfile= path+serverfile.substring(0,serverfile.lastIndexOf("."))+hz;
					//重命名
					File dest = new File(newpathfile);
					file.renameTo(dest);
				}
			}
			System.out.println("==="+tablename+"("+path+")===end==="+df.format(new Date()));// new Date()为获取当前系统时间
			System.out.println("==="+tablename+"("+path+")===sql查出数据数==="+fjList.size());
			System.out.println("==="+tablename+"("+path+")===修改文件数==="+cnt);

		} catch (Exception e) {
			System.out.println("==="+tablename+"("+path+")===realfile:("+realfile+")==serverfile:("+serverfile+")");
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}
		return modelAndView;
	}


	/**
	 * 服务器7附件同步
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView to7FjTb(HttpServletRequest request,HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		ModelAndView view = new ModelAndView("fjxx/7_fjtb");
		return view;
	}




	/**
	 * 联动select:根据人员id获得组信息
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView getTeamInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		Map<String, Object> map = new HashMap<>();
		try {
			String userIdstr = request.getParameter("userIdstr");

			//String departcnt_sql = "select count(distinct org_department_id) cnt  from org_member  r where r.id in ("+userIdstr+") and is_deleted=0 and org_department_id!=-6623057140633416986";

			String departcnt_sql="select * from ( select count(distinct org_department_id) cnt  from org_member  r where r.id in ("+userIdstr+") and is_deleted=0 and org_department_id!=-6623057140633416986" +
									" union all " +
									" select count(distinct org_department_id) cnt  from org_member  r where r.id in ("+userIdstr+") and is_deleted=0 and org_department_id=-6623057140633416986  )t";
			jdbcAgent.execute(departcnt_sql);

			List<Map<String, Object>> list = new ArrayList<>();
			list=jdbcAgent.resultSetToList();
			int not_cnt = Integer.parseInt(list.get(0).get("cnt").toString());//不是校领导批示
			int is_cnt = Integer.parseInt(list.get(1).get("cnt").toString());//校领导批示
			if(not_cnt>0 && is_cnt>0 ){
				map.put("code", -1);
			}else{
				map.put("code", 0);
				String depart_sql="select distinct org_department_id  from org_member  r where r.id in ("+userIdstr+") and is_deleted=0 ";
				jdbcAgent.execute(depart_sql);
				String departmentid=String.valueOf(jdbcAgent.resultSetToMap().get("org_department_id"));
				map.put("data", departmentid);
			}

			/*
			int cnt= Integer.parseInt(jdbcAgent.resultSetToMap().get("cnt").toString());
			if(cnt>1){

			}else{

			}*/
			com.alibaba.fastjson.JSONObject json = new JSONObject(map);
			render(response, json.toJSONString());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}
		return null;
	}


	/**
	 * 跳转到内部转阅界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toNbReadView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView("nbzy/nbzy_add");
		String summaryId = request.getParameter("summaryid");
		String affair_id=request.getParameter("affairId");
		String formappid=request.getParameter("formappid");
		String sql="";
		if(formappid.equals("4521264473872221727")){//文件处理笺
			sql="select id,field0006 bt from formmain_0081 t  where t.id =(select form_recordid from edoc_summary s where s.id='"+summaryId+"')";
		}else if(formappid.equals("-7104120039076376646")){//协同办公
			sql="select  id,field0001 bt  from formmain_0188 t   where t.id =(select form_recordid from edoc_summary s where s.id='"+summaryId+"')";
		}
		Map<String, Object> swdata = null;
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql);
			swdata=jdbcAgent.resultSetToMap();
			modelAndView.addObject("swdata", swdata);
			modelAndView.addObject("summaryid",summaryId);
			modelAndView.addObject("formappid",formappid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}

	/**
	 * 根据原单子意见表是否改变插入内部传阅意见edoc_opinion
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toNbcyOpinion(HttpServletRequest request, HttpServletResponse response) throws  Exception{
		Map<String, Object> jsonMap = new HashMap();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			String summaryid =request.getParameter("summaryid");
			String formappid=request.getParameter("formappid");//form_definion单子的id、
			if(formappid.equals("4521264473872221727") || formappid.equals("-7104120039076376646")){
				String judge_nbcy_sql="";

				//判断是不是内部传阅表
				if(formappid.equals("4521264473872221727")){ //收文文件处理笺
					judge_nbcy_sql="select group_concat(s.id) nbcy_summaryids,count(*) cnt from (" +
							"  select * from formmain_0243 t where t.field0031='"+summaryid+"'" +
							")t" +
							" left join edoc_summary s on s.form_recordid=t.id";
				}else if(formappid.equals("-7104120039076376646")){//协同办公处理笺
					judge_nbcy_sql="select group_concat(s.id) nbcy_summaryids,count(*) cnt from (" +
							"  select * from formmain_0248 t where t.field0021='"+summaryid+"'" +
							")t" +
							" left join edoc_summary s on s.form_recordid=t.id";
				}

				jdbcAgent.execute(judge_nbcy_sql);
				Map<String, Object> nbcydata=jdbcAgent.resultSetToMap();

				int cnt= Integer.parseInt(nbcydata.get("cnt").toString());
				if(cnt>=1) {//是内部传阅

					String affairid =request.getParameter("affairid");
					String nodepolicyname =request.getParameter("nodePolicy");
					String nodeId =request.getParameter("nodeId");
					String content=request.getParameter("content");
					String nodepolicy=getPolicyId(formappid,nodepolicyname);

					//获得当前用户单位
					Long currentId=AppContext.getCurrentUser().getId();
					String currentuser_sql=" select t.name,u.name deptname from ( " +
							" select * from org_member r where r.id='" +currentId+"')t " +
							" left join org_unit u on u.id=t.org_department_id";
					jdbcAgent.execute(currentuser_sql);
					Map<String, Object> user=jdbcAgent.resultSetToMap();
					String userdeptname=(String) user.get("deptname");
					String account=AppContext.getCurrentUser().getLoginAccountName();

					//查看传阅文件的summaryid
					String nbcy_summaryids = (String) nbcydata.get("nbcy_summaryids");
					String[] nbcy_sumids = nbcy_summaryids.split(",");
					for (int k = 0; k < nbcy_sumids.length; k++) {
						String edoc_opinion_sql = "INSERT INTO `v5`.`edoc_opinion`(`ID`, `EDOC_ID`, `AFFAIR_ID`, `ATTRIBUTE`, `OPINION_TYPE`,    `CONTENT`, `IS_HIDDEN`, `CREATE_USER_ID`, `CREATE_TIME`,   `POLICY`,   `NODE_ID`,             `STATE`,`DEPARTMENT_NAME`, `ACCOUNT_NAME`, `DEPARTMENT_SORT_ID`)" +
								" values ('"+CommonUtil.generateID()+"','"+nbcy_sumids[k]+"','"+affairid+  "',     -1,              1,'"+content+"',           0,'"+currentId+"',           now(),'"+nodepolicy+"','"+nodeId+"',                  0,'"+userdeptname+"',  '"+account+"',       '1004')";
						jdbcAgent.execute(edoc_opinion_sql);
					}
				}
				jsonMap.put("code", "0");
				jsonMap.put("msg", "成功");
			}

		}catch(Exception e){
			jsonMap.put("code", "1");
			jsonMap.put("msg", "失败");
		}finally {
			jdbcAgent.close();
		}
		com.alibaba.fastjson.JSONObject json = new JSONObject(jsonMap);
		render(response, json.toJSONString());
		return null;
	}

	private String getPolicyId(String formappid,String nodepolicyname){
		String nodepolicy="";
		if(formappid.equals("4521264473872221727")){ //收文-文件处理笺
			switch(nodepolicyname){
				case "党政办拟办":nodepolicy="field0007";break;
				case "校领导批示":nodepolicy="field0008";break;
				case "部门承办":nodepolicy="field0010";break;
				case "内部传阅":nodepolicy="field0030";break;
				default:;break;
			}
		}else if(formappid.equals("-7104120039076376646")){//收文-协同办公处理笺
			switch(nodepolicyname){
				case "党政办拟办":nodepolicy="field0006";break;
				case "校领导批示":nodepolicy="field0007";break;
				case "部门承办":nodepolicy="field0008";break;
				case "报请单位":nodepolicy="field0018";break;
				case "内部传阅":nodepolicy="field0019";break;
				default:;break;
			}
		}
		return nodepolicy;
	}
	/**
	 * 保存转阅信息-真实
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toSaveZyxx(HttpServletRequest request, HttpServletResponse response) throws  Exception{
		Map<String, Object> jsonMap = new HashMap();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			String yformid =request.getParameter("yformid");
			String summaryid =request.getParameter("summaryid");
			String selectzyr =request.getParameter("selectzyr");//转阅人
			String wjbt=request.getParameter("wjbt");
			String zfrcontent=request.getParameter("bz");
			String formappid=request.getParameter("formappid");


			String id=CommonUtil.generateID();

			//formmain_0243
			//String formain0238_sql="INSERT INTO `v5`.`formmain_0243`(`ID`, `state`, `start_member_id`, `start_date`, `approve_member_id`, `approve_date`, `finishedflag`, `ratifyflag`, `ratify_member_id`, `ratify_date`, `sort`, `modify_member_id`, `modify_date`, `field0001`, `field0002`, `field0003`, `field0004`, `field0005`, `field0006`, `field0007`, `field0008`, `field0009`, `field0010`, `field0011`, `field0012`, `field0013`, `field0014`, `field0015`, `field0016`, `field0017`, `field0018`, `field0019`, `field0020`, `field0021`, `field0022`, `field0023`, `field0024`, `field0025`, `field0026`, `field0027`,  `field0029`,    `field0031`) " +
			//		                                      "select '"+id+"',`state`, `start_member_id`,        now(), `approve_member_id`, `approve_date`, `finishedflag`, `ratifyflag`, `ratify_member_id`, `ratify_date`, `sort`, `modify_member_id`,         now(), `field0001`, `field0002`, `field0003`, `field0004`, `field0005`, `field0006`, `field0007`, `field0008`, `field0009`, `field0010`, `field0011`, `field0012`, `field0013`, `field0014`, `field0015`, `field0016`, `field0017`, `field0018`, `field0019`, `field0020`, `field0021`, `field0022`, `field0023`, `field0024`, `field0025`, `field0026`, `field0027`, '"+yformid+"','"+summaryid+"' from formmain_0081 t where t.id='"+yformid+"'";

			String formain_sql="";
			if(formappid.equals("4521264473872221727")){//文件处理笺
				formain_sql="INSERT INTO `v5`.`formmain_0243`(`ID`, `state`, `start_member_id`, `start_date`, `approve_member_id`, `approve_date`, `finishedflag`, `ratifyflag`, `ratify_member_id`, `ratify_date`, `sort`, `modify_member_id`, `modify_date`, `field0001`, `field0002`, `field0003`, `field0004`, `field0005`, `field0006`, `field0007`, `field0008`, `field0009`, `field0010`, `field0011`, `field0012`, `field0013`, `field0014`, `field0015`, `field0016`, `field0017`, `field0018`, `field0019`, `field0020`, `field0021`, `field0022`, `field0023`, `field0024`, `field0025`, `field0026`, `field0027`,  `field0029`,    `field0031`,`field0030`) " +
						"select '"+id+"',`state`, `start_member_id`,        now(), `approve_member_id`, `approve_date`, `finishedflag`, `ratifyflag`, `ratify_member_id`, `ratify_date`, `sort`, `modify_member_id`,         now(), `field0001`, `field0002`, `field0003`, `field0004`, `field0005`, `field0006`, `field0007`, `field0008`, `field0009`, `field0010`, `field0011`, `field0012`, `field0013`, `field0014`, `field0015`, `field0016`, `field0017`, `field0018`, `field0019`, `field0020`, `field0021`, `field0022`, `field0023`, `field0024`, `field0025`, `field0026`, `field0027`, '"+yformid+"','"+summaryid+"','"+zfrcontent+"' from formmain_0081 t where t.id='"+yformid+"'";
			}else if(formappid.equals("-7104120039076376646")){//协同办公
				formain_sql="INSERT INTO `v5`.`formmain_0248`(`ID`, `state`,   `start_member_id`,   `start_date`, `approve_member_id`, `approve_date`, `finishedflag`, `ratifyflag`, `ratify_member_id`, `ratify_date`, `sort`, `modify_member_id`, `modify_date`, `field0001`, `field0002`, `field0003`, `field0004`, `field0005`, `field0006`, `field0007`, `field0008`, `field0009`, `field0010`, `field0011`, `field0012`, `field0013`, `field0014`, `field0015`, `field0016`, `field0017`, `field0018`,`field0019`, `field0020`, `field0021`) " +
						"select '"+id+"', `state`,  `start_member_id`,          now(), `approve_member_id`, `approve_date`, `finishedflag`, `ratifyflag`, `ratify_member_id`, `ratify_date`, `sort`, `modify_member_id`, `modify_date`, `field0001`, `field0002`, `field0003`, `field0004`, `field0005`, `field0006`, `field0007`, `field0008`, `field0009`, `field0010`, `field0011`, `field0012`, `field0013`, `field0014`, `field0015`, `field0016`, `field0017`, `field0018`,'"+zfrcontent+"', '"+yformid+"','"+summaryid+"' from formmain_0188 t where t.id='"+yformid+"'";
			}
            String processid="",caseid="",templateid="",node_id="",form_app_id="",sub_object_id="",policy="",content_template_id="";
			String expropx="",activity_id="",match_department_id="",match_post_id="",match_account_id="";
			String fjfieldsql="";
			if(formappid.equals("4521264473872221727")){//文件处理笺
				processid="-8616086381970240538";
				caseid="-7394047394254012073";
				templateid="7664658925479545300";

				node_id="6338382634892019116";
				form_app_id="-2222614464458768261";
				sub_object_id="-8432180377161349162";

				policy="field0030";
				content_template_id="中国矿业大学文件处理笺(内部传阅单)";

				expropx="<map>\\r\\n<entry><string>edoc_lastOperateState</string><string><![CDATA[]]></string></entry>\\r\\n<entry><string>edoc_edocMark</string><string><![CDATA[]]></string></entry>\\r\\n<entry><string>edoc_sendUnit</string><string><![CDATA[]]></string></entry>\\r\\n</map>";
				activity_id="6338382634892019116";
				match_department_id=AppContext.getCurrentUser().getDepartmentId().toString();
				//match_department_id="7697236995411887744";
				match_post_id="5907544896615956503";
				match_account_id="670869647114347";

				fjfieldsql=" select  field0019  from  formmain_0243  t";
			}else if(formappid.equals("-7104120039076376646")){//协同办公
				processid="5155419376792979079";
				caseid="-4811003073510619989";
				templateid="-2911085481197681260";

				node_id="6338382634892019116";
				form_app_id="1085524643678604938";
				sub_object_id="3849964209468818942";

				policy="field0019";
				content_template_id="中国矿业大学协同办公文件处理笺(内部传阅单)";

				expropx="<map>\\r\\n<entry><string>edoc_lastOperateState</string><string><![CDATA[]]></string></entry>\\r\\n<entry><string>edoc_edocMark</string><string><![CDATA[]]></string></entry>\\r\\n<entry><string>edoc_sendUnit</string><string><![CDATA[]]></string></entry>\\r\\n</map>";
				activity_id="160265946571313";
				match_department_id=AppContext.getCurrentUser().getDepartmentId().toString();
				match_post_id="5907544896615956503";
				match_account_id="670869647114347";

				fjfieldsql="  select  field0015  from  formmain_0248  t ";
			}


			//edoc_summary
			String edocsummary_sql=" INSERT INTO `v5`.`edoc_summary`(`ID`, `IDENTIFIER`, `HAS_ARCHIVE`, `EDOC_TYPE`, `DEADLINE`, `CAN_TRACK`, `COMMENTS`,          `PROCESS_ID`,              `CASE_ID`, `FORM_ID`, `CREATE_TIME`, `START_USER_ID`, `START_TIME`, `CREATE_PERSON`, `COMPLETE_TIME`, `STATE`, `SUBJECT`, `DOC_TYPE`, `SEND_TYPE`, `DOC_MARK`, `SERIAL_NO`, `SECRET_LEVEL`, `URGENT_LEVEL`, `SEND_UNIT`, `SEND_UNIT_ID`, `ISSUER`, `SIGNING_DATE`, `SEND_TO`, `SEND_TO_ID`, `COPY_TO`, `COPY_TO_ID`, `REPORT_TO`, `REPORT_TO_ID`, `KEYWORDS`, `PRINT_UNIT`, `COPIES`, `PRINTER`, `ADVANCE_REMIND`,       `TEMPLETE_ID`, `WORKFLOW_RULE`, `PACK_DATE`, `ISUNIT`, `DOC_MARK2`, `SEND_UNIT2`, `SEND_UNIT_ID2`, `SEND_TO2`, `SEND_TO_ID2`, `COPY_TO2`, `COPY_TO_ID2`, `REPORT_TO2`, `REPORT_TO_ID2`, `COPIES2`, `ORG_DEPARTMENT_ID`, `ORG_ACCOUNT_ID`, `UPDATE_TIME`, `ARCHIVE_ID`, `SUB_EDOC_TYPE`, `FILESM`, `FILEFZ`, `PARTY`, `ADMINISTRATIVE`, `SEND_DEPARTMENT`, `SEND_DEPARTMENT2`, `SEND_DEPARTMENT_ID`, `SEND_DEPARTMENT_ID2`, `ATTACHMENTS`, `OVER_WORKTIME`, `RUN_WORKTIME`, `OVER_TIME`, `RUN_TIME`, `KEEP_PERIOD`, `IS_COVER_TIME`, `RECEIPT_DATE`, `REGISTRATION_DATE`, `AUDITOR`, `REVIEW`, `UNDERTAKER`, `PHONE`, `DEADLINE_DATETIME`, `IS_QUICK_SEND`, `CURRENT_NODES_INFO`, `UNDERTAKENOFFICE`, `UNDERTAKENOFFICE_ID`, `UNIT_LEVEL`, `TRANSFER_STATUS`, `GOVDOC_TYPE`, `SIGN_PERSON`, `SIGN_ACCOUNT_ID`, `EDOC_SECRET_LEVEL`, `JIANBAN_TYPE`, `GOVCODE`, `TO_EDOC_LIB_FLAG`, `TO_EDOC_LIB_TYPE`, `SEND_DATE`, `PRINT_UNIT_ID`, `RECEIVE_UNIT`, `RECEIVE_UNIT_ID`, `CHECK_PERSON`, `PROXY_DATE`, `PISHI_NO`, `PISHI_NAME`, `PISHI_YEAR`, `PISHI_LEADER_NAME`, `PUBLIC_INFO`,     `FORM_APP_ID`, `NEWFLOW_TYPE`, `ATTACHMENT_ARCHIVE_ID`, `CAN_MODIFY`, `FORM_RECORDID`, `IS_AUDITED`, `VOUCH`, `BODY_TYPE`, `EXCHANGE_TYPE`, `CAN_ARCHIVE`, `EXCHANGE_SEND_AFFAIRID`, `CAN_EDIT_ATTACHMENT`, `CAN_MERGE_DEAL`, `CAN_ANY_MERGE`, `CAN_EDIT`, `PROCESS_TYPE`, `SECRET_RELATED_LEVEL`, `FROM_TYPE`, `PROCESS_TERM_TYPE`, `REMIND_INTERVAL`, `DEAL_SUGGESTION`, `MERGE_DEAL_TYPE`, `AUTO_RUN`, `CAN_DELETE_NODE`) " +
					                                     "select '"+id+"', `IDENTIFIER`, `HAS_ARCHIVE`, `EDOC_TYPE`, `DEADLINE`, `CAN_TRACK`, `COMMENTS`,       '"+processid+"','"+           caseid+"', `FORM_ID`, `CREATE_TIME`, `START_USER_ID`, `START_TIME`, `CREATE_PERSON`, `COMPLETE_TIME`, `STATE`, `SUBJECT`, `DOC_TYPE`, `SEND_TYPE`, `DOC_MARK`, `SERIAL_NO`, `SECRET_LEVEL`, `URGENT_LEVEL`, `SEND_UNIT`, `SEND_UNIT_ID`, `ISSUER`, `SIGNING_DATE`, `SEND_TO`, `SEND_TO_ID`, `COPY_TO`, `COPY_TO_ID`, `REPORT_TO`, `REPORT_TO_ID`, `KEYWORDS`, `PRINT_UNIT`, `COPIES`, `PRINTER`, `ADVANCE_REMIND`,    '"+templateid+"', `WORKFLOW_RULE`, `PACK_DATE`, `ISUNIT`, `DOC_MARK2`, `SEND_UNIT2`, `SEND_UNIT_ID2`, `SEND_TO2`, `SEND_TO_ID2`, `COPY_TO2`, `COPY_TO_ID2`, `REPORT_TO2`, `REPORT_TO_ID2`, `COPIES2`, `ORG_DEPARTMENT_ID`, `ORG_ACCOUNT_ID`, `UPDATE_TIME`, `ARCHIVE_ID`, `SUB_EDOC_TYPE`, `FILESM`, `FILEFZ`, `PARTY`, `ADMINISTRATIVE`, `SEND_DEPARTMENT`, `SEND_DEPARTMENT2`, `SEND_DEPARTMENT_ID`, `SEND_DEPARTMENT_ID2`, `ATTACHMENTS`, `OVER_WORKTIME`, `RUN_WORKTIME`, `OVER_TIME`, `RUN_TIME`, `KEEP_PERIOD`, `IS_COVER_TIME`, `RECEIPT_DATE`, `REGISTRATION_DATE`, `AUDITOR`, `REVIEW`, `UNDERTAKER`, `PHONE`, `DEADLINE_DATETIME`, `IS_QUICK_SEND`, `CURRENT_NODES_INFO`, `UNDERTAKENOFFICE`, `UNDERTAKENOFFICE_ID`, `UNIT_LEVEL`, `TRANSFER_STATUS`, `GOVDOC_TYPE`, `SIGN_PERSON`, `SIGN_ACCOUNT_ID`, `EDOC_SECRET_LEVEL`, `JIANBAN_TYPE`, `GOVCODE`, `TO_EDOC_LIB_FLAG`, `TO_EDOC_LIB_TYPE`, `SEND_DATE`, `PRINT_UNIT_ID`, `RECEIVE_UNIT`, `RECEIVE_UNIT_ID`, `CHECK_PERSON`, `PROXY_DATE`, `PISHI_NO`, `PISHI_NAME`, `PISHI_YEAR`, `PISHI_LEADER_NAME`, `PUBLIC_INFO`, '"+form_app_id+"', `NEWFLOW_TYPE`, `ATTACHMENT_ARCHIVE_ID`, `CAN_MODIFY`,        '"+id+"', `IS_AUDITED`, `VOUCH`, `BODY_TYPE`, `EXCHANGE_TYPE`, `CAN_ARCHIVE`, `EXCHANGE_SEND_AFFAIRID`, `CAN_EDIT_ATTACHMENT`, `CAN_MERGE_DEAL`, `CAN_ANY_MERGE`, `CAN_EDIT`, `PROCESS_TYPE`, `SECRET_RELATED_LEVEL`, `FROM_TYPE`, `PROCESS_TERM_TYPE`, `REMIND_INTERVAL`, `DEAL_SUGGESTION`, `MERGE_DEAL_TYPE`, `AUTO_RUN`, `CAN_DELETE_NODE` from edoc_summary r where r.id='"+summaryid+"'";

			//获得当前用户单位
			Long currentId=AppContext.getCurrentUser().getId();
			String currentuser_sql=" select t.name,u.name deptname from ( " +
					" select * from org_member r where r.id='" +currentId+"')t " +
					" left join org_unit u on u.id=t.org_department_id";
			jdbcAgent.execute(currentuser_sql);
			Map<String, Object> user=jdbcAgent.resultSetToMap();
			String userdeptname=(String) user.get("deptname");
			String account=AppContext.getCurrentUser().getLoginAccountName();


           //ctp_affair 添加已发人  state=2
			String ctpaffair_sender_sql="INSERT INTO `v5`.`ctp_affair`(`ID`, `IS_COVER_TIME`,     `MEMBER_ID`,     `SENDER_ID`, `SUBJECT`, `APP`,   `OBJECT_ID`, `SUB_OBJECT_ID`, `STATE`, `SUB_STATE`, `HASTEN_TIMES`, `REMIND_DATE`, `DEADLINE_DATE`, `CAN_DUE_REMIND`, `CREATE_DATE`, `RECEIVE_TIME`, `COMPLETE_TIME`, `REMIND_INTERVAL`, `IS_DELETE`, `TRACK`, `ARCHIVE_ID`, `ADDITION`,   `EXT_PROPS`, `UPDATE_DATE`, `IS_FINISH`, `BODY_TYPE`, `IMPORTANT_LEVEL`, `RESENT_TIME`, `FORWARD_MEMBER`,           `IDENTIFIER`, `TRANSACTOR_ID`, `NODE_POLICY`,    `ACTIVITY_ID`,      `FORM_APP_ID`, `FORM_ID`, `FORM_OPERATION_ID`,        `TEMPLETE_ID`, `FROM_ID`, `OVER_WORKTIME`, `RUN_WORKTIME`, `OVER_TIME`, `RUN_TIME`, `DEAL_TERM_TYPE`, `DEAL_TERM_USERID`, `SUB_APP`, `EXPECTED_PROCESS_TIME`,        `ORG_ACCOUNT_ID`,          `PROCESS_ID`,  `IS_PROCESS_OVER_TIME`, `FORM_MULTI_OPERATION_ID`, `BACK_FROM_ID`, `FORM_RELATIVE_STATIC_IDS`, `FORM_RELATIVE_QUERY_IDS`, `HAS_FAVORITE`, `FROM_TYPE`,     `FORM_RECORDID`,            `CASE_ID`, `RELATION_DATA_ID`, `FIRSTVIEW_PERIOD`, `FIRSTVIEW_DATE`, `FIRSTRESPONSE_PERIOD`, `SIGNLEVIEW_PERIOD`,       `PRE_APPROVER`, `AUTO_RUN`,          `SUMMARY_STATE`,          `TOP_TIME`, `SORT_WEIGHT`, `AI_PROCESSING`, `PROCESS_DEADLINE_TIME`,   `PROXY_MEMBER_ID`, `MATCH_DEPARTMENT_ID`,     `MATCH_POST_ID`, `NODE_NAME`,    `MATCH_ACCOUNT_ID`, `PRINT_NM`, `MESSAGE_RULE_ID`, `MATCH_ROLE_ID`)" +
					                " VALUES ('"+CommonUtil.generateID()+"',               0, '"+currentId+"', '"+currentId+"','"+wjbt+"',     4,      '"+id+"',             null,       2,          0,           NULL,          null,            null,                0,         now(),          now(),            NULL,              NULL,           0,        1,        NULL,       NULL, '"+expropx+"',         now(),           0,        '10',              null,          NULL,             NULL, '00000000000000000000',            NULL,     '内部传阅',             null,  '"+form_app_id+"',     NULL,                  NULL,     '"+templateid+"',       NULL,          NULL,            NULL,        NULL,      NULL,             null,                null,         2,                   NULL, '"+match_account_id+"',   '"+processid+"',                       0,                      NULL,           NULL,                     null,                        null,              0,        NULL,            '"+id+"',         '"+caseid+"',               NULL,           15432977,            now(),                   NULL,                NULL,                 null,          0,                        0,              '1970-01-01 00:00:00',          -1,               0,                     NULL,                 NULL, null, null,        NULL,        null,        NULL,            NULL,        NULL)";

		   //ctp_content_all
			String ctpcontentall_sql_1= "INSERT INTO `v5`.`ctp_content_all`(`ID`, `CREATE_ID`, `CREATE_DATE`, `MODIFY_ID`, `MODIFY_DATE`, `MODULE_TYPE`, `MODULE_ID`, `MODULE_TEMPLATE_ID`, `CONTENT_TYPE`, `CONTENT`, `CONTENT_DATA_ID`, `CONTENT_TEMPLATE_ID`, `TITLE`, `SORT`) " +
					"VALUES ('"+CommonUtil.generateID()+"', '"+currentId+"', now(), '"+currentId+"', now(),   4, '"+id+"', 0, 10, '', NULL, 0, NULL, 1)" ;
			String ctpcontentall_sql_2="INSERT INTO `v5`.`ctp_content_all`(`ID`,    `CREATE_ID`, `CREATE_DATE`, `MODIFY_ID`,  `MODIFY_DATE`, `MODULE_TYPE`, `MODULE_ID`,  `MODULE_TEMPLATE_ID`, `CONTENT_TYPE`, `CONTENT`,             `CONTENT_DATA_ID`, `CONTENT_TEMPLATE_ID`, `TITLE`, `SORT`) " +
					                     "VALUES ('"+CommonUtil.generateID()+"','"+currentId+"',         now(), '"+currentId+"',      now(),             4,    '"+id+"',      '"+templateid+"',             20,        '', '"+id+"',   '"+form_app_id+"', '"+content_template_id+"', 0)";

		   //发起人意见插入
			String fqropinion_sql="INSERT INTO `v5`.`edoc_opinion`(             `ID`, `EDOC_ID`,    `AFFAIR_ID`, `ATTRIBUTE`, `OPINION_TYPE`,       `CONTENT`, `IS_HIDDEN`, `CREATE_USER_ID`, `CREATE_TIME`,    `POLICY`, `PROXY_NAME`,    `NODE_ID`,      `STATE`, `SUB_EDOC_ID`, `UPDATE_TIME`, `SUB_OPINION_ID`, `DEPARTMENT_NAME`, `ACCOUNT_NAME`, `DEPARTMENT_SORT_ID`, `SOURCE_SUMMARY_ID`) " +
					                           "values('"+CommonUtil.generateID()+"',  '"+id+"','"+currentId+"',          -1,              1,'"+zfrcontent+"',           0,  '"+currentId+"',         now(),'"+policy+"',         null,'"+node_id+"',             0,          null,          null,             null,'"+userdeptname+"',  '"+account+"',               '1004',             null)";


			List batchedSql=new ArrayList();

			batchedSql.add(formain_sql);
			batchedSql.add(edocsummary_sql);
			batchedSql.add(ctpaffair_sender_sql);
			batchedSql.add(ctpcontentall_sql_1);
			batchedSql.add(ctpcontentall_sql_2);
			batchedSql.add(fqropinion_sql);

			jdbcAgent.executeBatch(batchedSql);


            String[] zyr=selectzyr.split(",");
            for(int i=0;i<zyr.length;i++){
				String ctpaffair_reciver_sql="INSERT INTO `v5`.`ctp_affair`(         `ID`, `IS_COVER_TIME`,  `MEMBER_ID`,      `SENDER_ID`, `SUBJECT`, `APP`, `OBJECT_ID`,      `SUB_OBJECT_ID`,     `STATE`,  `SUB_STATE`, `HASTEN_TIMES`, `REMIND_DATE`, `DEADLINE_DATE`, `CAN_DUE_REMIND`, `CREATE_DATE`, `RECEIVE_TIME`, `COMPLETE_TIME`, `REMIND_INTERVAL`, `IS_DELETE`, `TRACK`, `ARCHIVE_ID`, `ADDITION`, `EXT_PROPS`,   `UPDATE_DATE`, `IS_FINISH`, `BODY_TYPE`, `IMPORTANT_LEVEL`, `RESENT_TIME`, `FORWARD_MEMBER`,          `IDENTIFIER`, `TRANSACTOR_ID`, `NODE_POLICY`,     `ACTIVITY_ID`,        `FORM_APP_ID`, `FORM_ID`, `FORM_OPERATION_ID`,  `TEMPLETE_ID`,       `FROM_ID`, `OVER_WORKTIME`, `RUN_WORKTIME`, `OVER_TIME`, `RUN_TIME`, `DEAL_TERM_TYPE`, `DEAL_TERM_USERID`, `SUB_APP`, `EXPECTED_PROCESS_TIME`, `ORG_ACCOUNT_ID`,    `PROCESS_ID`, `IS_PROCESS_OVER_TIME`, `FORM_MULTI_OPERATION_ID`, `BACK_FROM_ID`, `FORM_RELATIVE_STATIC_IDS`, `FORM_RELATIVE_QUERY_IDS`, `HAS_FAVORITE`, `FROM_TYPE`, `FORM_RECORDID`,    `CASE_ID`, `RELATION_DATA_ID`, `FIRSTVIEW_PERIOD`, `FIRSTVIEW_DATE`, `FIRSTRESPONSE_PERIOD`, `SIGNLEVIEW_PERIOD`,       `PRE_APPROVER`,`AUTO_RUN`, `SUMMARY_STATE`,            `TOP_TIME`, `SORT_WEIGHT`, `AI_PROCESSING`, `PROCESS_DEADLINE_TIME`, `PROXY_MEMBER_ID`,     `MATCH_DEPARTMENT_ID`,    `MATCH_POST_ID`, `NODE_NAME`,  `MATCH_ACCOUNT_ID`, `PRINT_NM`, `MESSAGE_RULE_ID`, `MATCH_ROLE_ID`)" +
						                           " VALUES ('"+CommonUtil.generateID()+"',              0, '"+zyr[i]+"',  '"+currentId+"','"+wjbt+"',     4,    '"+id+"',  '"+sub_object_id+"',           3,          11,          NULL,               0,              0,               0 ,          now(),          now(),            NULL,              NULL,           0,       0,         NULL,      NULL, '"+expropx+"',          now(),           0,        '10',              null,           NULL,            NULL, '00000000000000000000',           NULL,     '内部传阅', '"+activity_id+"',    '"+form_app_id+"',      NULL,               NULL,'"+templateid+"', '"+currentId+"',            NULL,           NULL,        NULL,       NULL,               0,                  -1,         2,                    NULL,  '"+match_account_id+"', '"+processid+"',                    0,                      NULL,           NULL,                         '',                        '',              0,         NULL,        '"+id+"',  '"+caseid+"',               NULL,           15432977,            now(),                   NULL,                NULL,      '"+currentId+"',         0,               0, '1970-01-01 00:00:00',            -1,               0,                    NULL,              NULL, '"+match_department_id+"','"+match_post_id+"',      NULL,'"+match_account_id+"',       NULL,              NULL, NULL)";
				jdbcAgent.execute(ctpaffair_reciver_sql);
            }

			//原单子中所有意见插入edoc_opinion
			String yj_sql="select * from edoc_opinion o where o.edoc_id='"+summaryid+"'";
			List<Map<String, Object>> yjlist = null;
			jdbcAgent.execute(yj_sql);
			yjlist=jdbcAgent.resultSetToList();
			for(int p=0;p<yjlist.size();p++) {
				Map<String, Object> m = yjlist.get(p);
				String opinion_id = String.valueOf(m.get("id"));
				String opinion_sql = "INSERT INTO `v5`.`edoc_opinion`(`ID`, `EDOC_ID`, `AFFAIR_ID`, `ATTRIBUTE`, `OPINION_TYPE`, `CONTENT`, `IS_HIDDEN`, `CREATE_USER_ID`, `CREATE_TIME`, `POLICY`, `PROXY_NAME`, `NODE_ID`, `STATE`, `SUB_EDOC_ID`, `UPDATE_TIME`, `SUB_OPINION_ID`, `DEPARTMENT_NAME`, `ACCOUNT_NAME`, `DEPARTMENT_SORT_ID`, `SOURCE_SUMMARY_ID`) " +
						"select '" + CommonUtil.generateID() + "', '" + id + "', `AFFAIR_ID`, `ATTRIBUTE`, `OPINION_TYPE`, `CONTENT`, `IS_HIDDEN`, `CREATE_USER_ID`, `CREATE_TIME`, `POLICY`, `PROXY_NAME`, `NODE_ID`, `STATE`, `SUB_EDOC_ID`, `UPDATE_TIME`, `SUB_OPINION_ID`, `DEPARTMENT_NAME`, `ACCOUNT_NAME`, `DEPARTMENT_SORT_ID`, `SOURCE_SUMMARY_ID` from  edoc_opinion o where o.id='" + opinion_id + "'";
				jdbcAgent.execute(opinion_sql);
			}
			//ctp_attachment 附件表
			String fj_sql="select * from ctp_attachment t  where t.att_reference='"+summaryid+"'";
			List<Map<String, Object>> fjlist = null;
			jdbcAgent.execute(fj_sql);
			fjlist=jdbcAgent.resultSetToList();
			for(int p=0;p<fjlist.size();p++) {
				Map<String, Object> m = fjlist.get(p);
				String fj_id = String.valueOf(m.get("id"));
				String insert_fj_sql = "INSERT INTO `v5`.`ctp_attachment`(`ID`, `ATT_REFERENCE`, `SUB_REFERENCE`, `CATEGORY`, `TYPE`, `FILENAME`, `FILE_URL`, `MIME_TYPE`, `CREATEDATE`, `ATTACHMENT_SIZE`, `DESCRIPTION`, `GENESIS_ID`, `SORT`)" +
						"select '"+CommonUtil.generateID()+"','"+        id+"',("+fjfieldsql+"  where t.id='"+id+"'), `CATEGORY`, `TYPE`, `FILENAME`, `FILE_URL`, `MIME_TYPE`, `CREATEDATE`, `ATTACHMENT_SIZE`, `DESCRIPTION`, `GENESIS_ID`, `SORT` from ctp_attachment t where t.id='"+fj_id+"'";
				jdbcAgent.execute(insert_fj_sql);
			}


			jsonMap.put("code", "0");
			jsonMap.put("msg", "成功");
		}catch(Exception e){
			e.printStackTrace();
			jsonMap.put("code", "1");
			jsonMap.put("msg", "失败");
		}finally {
			jdbcAgent.close();
		}
		com.alibaba.fastjson.JSONObject json = new JSONObject(jsonMap);
		render(response, json.toJSONString());
		return null;
	}
	/**
	 * 测试环境转阅保存
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	/*public ModelAndView toSaveZyxx(HttpServletRequest request, HttpServletResponse response) throws  Exception{
		Map<String, Object> jsonMap = new HashMap();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			String yformid =request.getParameter("yformid");
			String summaryid =request.getParameter("summaryid");
			String selectzyr =request.getParameter("selectzyr");//转阅人
			String wjbt=request.getParameter("wjbt");
			String zfrcontent=request.getParameter("bz");
			String formappid=request.getParameter("formappid");

			String id=CommonUtil.generateID();


			//formmain_0243内部传阅单
			*//*String formain_sql="INSERT INTO `v5`.`formmain_0243`(`ID`, `state`, `start_member_id`, `start_date`, `approve_member_id`, `approve_date`, `finishedflag`, `ratifyflag`, `ratify_member_id`, `ratify_date`, `sort`, `modify_member_id`, `modify_date`, `field0001`, `field0002`, `field0003`, `field0004`, `field0005`, `field0006`, `field0007`, `field0008`, `field0009`, `field0010`, `field0011`, `field0012`, `field0013`, `field0014`, `field0015`, `field0016`, `field0017`, `field0018`, `field0019`, `field0020`, `field0021`, `field0022`, `field0023`, `field0024`, `field0025`, `field0026`, `field0027`,  `field0029`,    `field0031`) " +
					"select '"+id+"',`state`, `start_member_id`,        now(), `approve_member_id`, `approve_date`, `finishedflag`, `ratifyflag`, `ratify_member_id`, `ratify_date`, `sort`, `modify_member_id`,         now(), `field0001`, `field0002`, `field0003`, `field0004`, `field0005`, `field0006`, `field0007`, `field0008`, `field0009`, `field0010`, `field0011`, `field0012`, `field0013`, `field0014`, `field0015`, `field0016`, `field0017`, `field0018`, `field0019`, `field0020`, `field0021`, `field0022`, `field0023`, `field0024`, `field0025`, `field0026`, `field0027`, '"+yformid+"','"+summaryid+"' from formmain_0081 t where t.id='"+yformid+"'";
*//*
			String formain_sql="";
			if(formappid.equals("4521264473872221727")){//文件处理笺
				formain_sql="INSERT INTO `v5`.`formmain_0243`(`ID`, `state`, `start_member_id`, `start_date`, `approve_member_id`, `approve_date`, `finishedflag`, `ratifyflag`, `ratify_member_id`, `ratify_date`, `sort`, `modify_member_id`, `modify_date`, `field0001`, `field0002`, `field0003`, `field0004`, `field0005`, `field0006`, `field0007`, `field0008`, `field0009`, `field0010`, `field0011`, `field0012`, `field0013`, `field0014`, `field0015`, `field0016`, `field0017`, `field0018`, `field0019`, `field0020`, `field0021`, `field0022`, `field0023`, `field0024`, `field0025`, `field0026`, `field0027`,  `field0029`,    `field0031`,`field0030`) " +
						"select '"+id+"',`state`, `start_member_id`,        now(), `approve_member_id`, `approve_date`, `finishedflag`, `ratifyflag`, `ratify_member_id`, `ratify_date`, `sort`, `modify_member_id`,         now(), `field0001`, `field0002`, `field0003`, `field0004`, `field0005`, `field0006`, `field0007`, `field0008`, `field0009`, `field0010`, `field0011`, `field0012`, `field0013`, `field0014`, `field0015`, `field0016`, `field0017`, `field0018`, `field0019`, `field0020`, `field0021`, `field0022`, `field0023`, `field0024`, `field0025`, `field0026`, `field0027`, '"+yformid+"','"+summaryid+"','"+zfrcontent+"' from formmain_0081 t where t.id='"+yformid+"'";
			}else if(formappid.equals("-7104120039076376646")){//协同办公
				formain_sql="INSERT INTO `v5`.`formmain_0248`(`ID`, `state`,   `start_member_id`,   `start_date`, `approve_member_id`, `approve_date`, `finishedflag`, `ratifyflag`, `ratify_member_id`, `ratify_date`, `sort`, `modify_member_id`, `modify_date`, `field0001`, `field0002`, `field0003`, `field0004`, `field0005`, `field0006`, `field0007`, `field0008`, `field0009`, `field0010`, `field0011`, `field0012`, `field0013`, `field0014`, `field0015`, `field0016`, `field0017`, `field0018`,`field0019`, `field0020`, `field0021`) " +
						                           "select '"+id+"', `state`,  `start_member_id`,          now(), `approve_member_id`, `approve_date`, `finishedflag`, `ratifyflag`, `ratify_member_id`, `ratify_date`, `sort`, `modify_member_id`, `modify_date`, `field0001`, `field0002`, `field0003`, `field0004`, `field0005`, `field0006`, `field0007`, `field0008`, `field0009`, `field0010`, `field0011`, `field0012`, `field0013`, `field0014`, `field0015`, `field0016`, `field0017`, `field0018`,'"+zfrcontent+"', '"+yformid+"','"+summaryid+"' from formmain_0188 t where t.id='"+yformid+"'";
			}
			//edoc_summary
			String edocsummary_sql=" INSERT INTO `v5`.`edoc_summary`(`ID`, `IDENTIFIER`, `HAS_ARCHIVE`, `EDOC_TYPE`, `DEADLINE`, `CAN_TRACK`, `COMMENTS`,          `PROCESS_ID`,              `CASE_ID`, `FORM_ID`, `CREATE_TIME`, `START_USER_ID`, `START_TIME`, `CREATE_PERSON`, `COMPLETE_TIME`, `STATE`, `SUBJECT`, `DOC_TYPE`, `SEND_TYPE`, `DOC_MARK`, `SERIAL_NO`, `SECRET_LEVEL`, `URGENT_LEVEL`, `SEND_UNIT`, `SEND_UNIT_ID`, `ISSUER`, `SIGNING_DATE`, `SEND_TO`, `SEND_TO_ID`, `COPY_TO`, `COPY_TO_ID`, `REPORT_TO`, `REPORT_TO_ID`, `KEYWORDS`, `PRINT_UNIT`, `COPIES`, `PRINTER`, `ADVANCE_REMIND`,       `TEMPLETE_ID`, `WORKFLOW_RULE`, `PACK_DATE`, `ISUNIT`, `DOC_MARK2`, `SEND_UNIT2`, `SEND_UNIT_ID2`, `SEND_TO2`, `SEND_TO_ID2`, `COPY_TO2`, `COPY_TO_ID2`, `REPORT_TO2`, `REPORT_TO_ID2`, `COPIES2`, `ORG_DEPARTMENT_ID`, `ORG_ACCOUNT_ID`, `UPDATE_TIME`, `ARCHIVE_ID`, `SUB_EDOC_TYPE`, `FILESM`, `FILEFZ`, `PARTY`, `ADMINISTRATIVE`, `SEND_DEPARTMENT`, `SEND_DEPARTMENT2`, `SEND_DEPARTMENT_ID`, `SEND_DEPARTMENT_ID2`, `ATTACHMENTS`, `OVER_WORKTIME`, `RUN_WORKTIME`, `OVER_TIME`, `RUN_TIME`, `KEEP_PERIOD`, `IS_COVER_TIME`, `RECEIPT_DATE`, `REGISTRATION_DATE`, `AUDITOR`, `REVIEW`, `UNDERTAKER`, `PHONE`, `DEADLINE_DATETIME`, `IS_QUICK_SEND`, `CURRENT_NODES_INFO`, `UNDERTAKENOFFICE`, `UNDERTAKENOFFICE_ID`, `UNIT_LEVEL`, `TRANSFER_STATUS`, `GOVDOC_TYPE`, `SIGN_PERSON`, `SIGN_ACCOUNT_ID`, `EDOC_SECRET_LEVEL`, `JIANBAN_TYPE`, `GOVCODE`, `TO_EDOC_LIB_FLAG`, `TO_EDOC_LIB_TYPE`, `SEND_DATE`, `PRINT_UNIT_ID`, `RECEIVE_UNIT`, `RECEIVE_UNIT_ID`, `CHECK_PERSON`, `PROXY_DATE`, `PISHI_NO`, `PISHI_NAME`, `PISHI_YEAR`, `PISHI_LEADER_NAME`, `PUBLIC_INFO`, `FORM_APP_ID`, `NEWFLOW_TYPE`, `ATTACHMENT_ARCHIVE_ID`, `CAN_MODIFY`, `FORM_RECORDID`, `IS_AUDITED`, `VOUCH`, `BODY_TYPE`, `EXCHANGE_TYPE`, `CAN_ARCHIVE`, `EXCHANGE_SEND_AFFAIRID`, `CAN_EDIT_ATTACHMENT`, `CAN_MERGE_DEAL`, `CAN_ANY_MERGE`, `CAN_EDIT`, `PROCESS_TYPE`, `SECRET_RELATED_LEVEL`, `FROM_TYPE`, `PROCESS_TERM_TYPE`, `REMIND_INTERVAL`, `DEAL_SUGGESTION`, `MERGE_DEAL_TYPE`, `AUTO_RUN`, `CAN_DELETE_NODE`) " +
					"select '"+id+"', `IDENTIFIER`, `HAS_ARCHIVE`, `EDOC_TYPE`, `DEADLINE`, `CAN_TRACK`, `COMMENTS`, -5709615003221930261, 5696870082158086801, `FORM_ID`, `CREATE_TIME`, `START_USER_ID`, `START_TIME`, `CREATE_PERSON`, `COMPLETE_TIME`, `STATE`, `SUBJECT`, `DOC_TYPE`, `SEND_TYPE`, `DOC_MARK`, `SERIAL_NO`, `SECRET_LEVEL`, `URGENT_LEVEL`, `SEND_UNIT`, `SEND_UNIT_ID`, `ISSUER`, `SIGNING_DATE`, `SEND_TO`, `SEND_TO_ID`, `COPY_TO`, `COPY_TO_ID`, `REPORT_TO`, `REPORT_TO_ID`, `KEYWORDS`, `PRINT_UNIT`, `COPIES`, `PRINTER`, `ADVANCE_REMIND`, 7664658925479545300, `WORKFLOW_RULE`, `PACK_DATE`, `ISUNIT`, `DOC_MARK2`, `SEND_UNIT2`, `SEND_UNIT_ID2`, `SEND_TO2`, `SEND_TO_ID2`, `COPY_TO2`, `COPY_TO_ID2`, `REPORT_TO2`, `REPORT_TO_ID2`, `COPIES2`, `ORG_DEPARTMENT_ID`, `ORG_ACCOUNT_ID`, `UPDATE_TIME`, `ARCHIVE_ID`, `SUB_EDOC_TYPE`, `FILESM`, `FILEFZ`, `PARTY`, `ADMINISTRATIVE`, `SEND_DEPARTMENT`, `SEND_DEPARTMENT2`, `SEND_DEPARTMENT_ID`, `SEND_DEPARTMENT_ID2`, `ATTACHMENTS`, `OVER_WORKTIME`, `RUN_WORKTIME`, `OVER_TIME`, `RUN_TIME`, `KEEP_PERIOD`, `IS_COVER_TIME`, `RECEIPT_DATE`, `REGISTRATION_DATE`, `AUDITOR`, `REVIEW`, `UNDERTAKER`, `PHONE`, `DEADLINE_DATETIME`, `IS_QUICK_SEND`, `CURRENT_NODES_INFO`, `UNDERTAKENOFFICE`, `UNDERTAKENOFFICE_ID`, `UNIT_LEVEL`, `TRANSFER_STATUS`, `GOVDOC_TYPE`, `SIGN_PERSON`, `SIGN_ACCOUNT_ID`, `EDOC_SECRET_LEVEL`, `JIANBAN_TYPE`, `GOVCODE`, `TO_EDOC_LIB_FLAG`, `TO_EDOC_LIB_TYPE`, `SEND_DATE`, `PRINT_UNIT_ID`, `RECEIVE_UNIT`, `RECEIVE_UNIT_ID`, `CHECK_PERSON`, `PROXY_DATE`, `PISHI_NO`, `PISHI_NAME`, `PISHI_YEAR`, `PISHI_LEADER_NAME`, `PUBLIC_INFO`, '-2222614464458768261', `NEWFLOW_TYPE`, `ATTACHMENT_ARCHIVE_ID`, `CAN_MODIFY`, '"+id+"', `IS_AUDITED`, `VOUCH`, `BODY_TYPE`, `EXCHANGE_TYPE`, `CAN_ARCHIVE`, `EXCHANGE_SEND_AFFAIRID`, `CAN_EDIT_ATTACHMENT`, `CAN_MERGE_DEAL`, `CAN_ANY_MERGE`, `CAN_EDIT`, `PROCESS_TYPE`, `SECRET_RELATED_LEVEL`, `FROM_TYPE`, `PROCESS_TERM_TYPE`, `REMIND_INTERVAL`, `DEAL_SUGGESTION`, `MERGE_DEAL_TYPE`, `AUTO_RUN`, `CAN_DELETE_NODE` from edoc_summary r where r.id='"+summaryid+"'";

			//获得当前用户单位
			Long currentId=AppContext.getCurrentUser().getId();
			String currentuser_sql=" select t.name,u.name deptname from ( " +
					" select * from org_member r where r.id='" +currentId+"')t " +
					" left join org_unit u on u.id=t.org_department_id";
			jdbcAgent.execute(currentuser_sql);
			Map<String, Object> user=jdbcAgent.resultSetToMap();
			String userdeptname=(String) user.get("deptname");
			String account=AppContext.getCurrentUser().getLoginAccountName();


			//ctp_affair 添加已发人  state=2
			String ctpaffair_sender_sql="INSERT INTO `v5`.`ctp_affair`(`ID`, `IS_COVER_TIME`,     `MEMBER_ID`,     `SENDER_ID`, `SUBJECT`, `APP`,   `OBJECT_ID`, `SUB_OBJECT_ID`, `STATE`, `SUB_STATE`, `HASTEN_TIMES`, `REMIND_DATE`, `DEADLINE_DATE`, `CAN_DUE_REMIND`, `CREATE_DATE`, `RECEIVE_TIME`, `COMPLETE_TIME`, `REMIND_INTERVAL`, `IS_DELETE`, `TRACK`, `ARCHIVE_ID`, `ADDITION`,                                                                                                                                                                                                                                      `EXT_PROPS`,                    `UPDATE_DATE`, `IS_FINISH`, `BODY_TYPE`, `IMPORTANT_LEVEL`, `RESENT_TIME`, `FORWARD_MEMBER`,           `IDENTIFIER`, `TRANSACTOR_ID`, `NODE_POLICY`,    `ACTIVITY_ID`,      `FORM_APP_ID`, `FORM_ID`, `FORM_OPERATION_ID`,        `TEMPLETE_ID`, `FROM_ID`, `OVER_WORKTIME`, `RUN_WORKTIME`, `OVER_TIME`, `RUN_TIME`, `DEAL_TERM_TYPE`, `DEAL_TERM_USERID`, `SUB_APP`, `EXPECTED_PROCESS_TIME`, `ORG_ACCOUNT_ID`,          `PROCESS_ID`,  `IS_PROCESS_OVER_TIME`, `FORM_MULTI_OPERATION_ID`, `BACK_FROM_ID`, `FORM_RELATIVE_STATIC_IDS`, `FORM_RELATIVE_QUERY_IDS`, `HAS_FAVORITE`, `FROM_TYPE`,     `FORM_RECORDID`,            `CASE_ID`, `RELATION_DATA_ID`, `FIRSTVIEW_PERIOD`, `FIRSTVIEW_DATE`, `FIRSTRESPONSE_PERIOD`, `SIGNLEVIEW_PERIOD`,       `PRE_APPROVER`, `AUTO_RUN`,          `SUMMARY_STATE`,          `TOP_TIME`, `SORT_WEIGHT`, `AI_PROCESSING`, `PROCESS_DEADLINE_TIME`,   `PROXY_MEMBER_ID`, `MATCH_DEPARTMENT_ID`,     `MATCH_POST_ID`, `NODE_NAME`,    `MATCH_ACCOUNT_ID`, `PRINT_NM`, `MESSAGE_RULE_ID`, `MATCH_ROLE_ID`)" +
					" VALUES ('"+CommonUtil.generateID()+"',               0, '"+currentId+"', '"+currentId+"','"+wjbt+"',     4,      '"+id+"',             null,       2,          0,           NULL,          null,            null,                0,         now(),          now(),            NULL,              NULL,           0,        1,        NULL,       NULL, '<map>\\r\\n<entry><string>edoc_lastOperateState</string><string><![CDATA[]]></string></entry>\\r\\n<entry><string>edoc_edocMark</string><string><![CDATA[]]></string></entry>\\r\\n<entry><string>edoc_sendUnit</string><string><![CDATA[]]></string></entry>\\r\\n</map>', now(),           0,        '10',              null,          NULL,             NULL, '00000000000000000000',            NULL,     '内部传阅',             null, -2222614464458768261,     NULL,                NULL, 7664658925479545300,       NULL,          NULL,            NULL,        NULL,      NULL,             null,                null,         2,                   NULL,   670869647114347,   -5709615003221930261,                       0,                      NULL,           NULL,                     null,                        null,              0,        NULL,            '"+id+"', 5696870082158086801,               NULL,           15432977,            now(),                   NULL,                NULL,                 null,          0,                        0,              '1970-01-01 00:00:00',          -1,               0,                     NULL,                 NULL, null, null,        NULL,        null,        NULL,            NULL,        NULL)";


			//ctp_content_all 正文
			String ctpcontentall_sql_1= "INSERT INTO `v5`.`ctp_content_all`(`ID`, `CREATE_ID`, `CREATE_DATE`, `MODIFY_ID`, `MODIFY_DATE`, `MODULE_TYPE`, `MODULE_ID`, `MODULE_TEMPLATE_ID`, `CONTENT_TYPE`, `CONTENT`, `CONTENT_DATA_ID`, `CONTENT_TEMPLATE_ID`, `TITLE`, `SORT`) " +
					"VALUES ('"+CommonUtil.generateID()+"', '"+currentId+"', now(), '"+currentId+"', now(),   4, '"+id+"', 0, 10, '', NULL, 0, NULL, 1)" ;
			String ctpcontentall_sql_2="INSERT INTO `v5`.`ctp_content_all`(`ID`,    `CREATE_ID`, `CREATE_DATE`, `MODIFY_ID`,  `MODIFY_DATE`, `MODULE_TYPE`, `MODULE_ID`,  `MODULE_TEMPLATE_ID`, `CONTENT_TYPE`, `CONTENT`,   `CONTENT_DATA_ID`, `CONTENT_TEMPLATE_ID`, `TITLE`, `SORT`) " +
					"VALUES ('"+CommonUtil.generateID()+"','"+currentId+"',         now(), '"+currentId+"',      now(),             4,    '"+id+"',  7664658925479545300,             20,        '', '"+id+"', -2222614464458768261, '中国矿业大学文件处理笺(内部传阅单)', 0)";

			//发起人意见插入
			String fqropinion_sql="INSERT INTO `v5`.`edoc_opinion`(             `ID`, `EDOC_ID`,    `AFFAIR_ID`, `ATTRIBUTE`, `OPINION_TYPE`,       `CONTENT`, `IS_HIDDEN`, `CREATE_USER_ID`, `CREATE_TIME`, `POLICY`, `PROXY_NAME`, `NODE_ID`,      `STATE`, `SUB_EDOC_ID`, `UPDATE_TIME`, `SUB_OPINION_ID`, `DEPARTMENT_NAME`, `ACCOUNT_NAME`, `DEPARTMENT_SORT_ID`, `SOURCE_SUMMARY_ID`) " +
					"values('"+CommonUtil.generateID()+"',  '"+id+"','"+currentId+"',          -1,              1,'"+zfrcontent+"',           0,  '"+currentId+"',         now(),'field0030',       null,6338382634892019116,   0,          null,          null,             null,'"+userdeptname+"',  '"+account+"',               '1004',             null)";


			List batchedSql=new ArrayList();

			batchedSql.add(formain_sql);
			batchedSql.add(edocsummary_sql);
			batchedSql.add(ctpaffair_sender_sql);
			batchedSql.add(ctpcontentall_sql_1);
			batchedSql.add(ctpcontentall_sql_2);
			batchedSql.add(fqropinion_sql);

			jdbcAgent.executeBatch(batchedSql);


			String[] zyr=selectzyr.split(",");
			for(int i=0;i<zyr.length;i++){
				String ctpaffair_reciver_sql="INSERT INTO `v5`.`ctp_affair`(`ID`, `IS_COVER_TIME`, `MEMBER_ID`,      `SENDER_ID`, `SUBJECT`, `APP`, `OBJECT_ID`,    `SUB_OBJECT_ID`,     `STATE`,  `SUB_STATE`, `HASTEN_TIMES`, `REMIND_DATE`, `DEADLINE_DATE`, `CAN_DUE_REMIND`, `CREATE_DATE`, `RECEIVE_TIME`, `COMPLETE_TIME`, `REMIND_INTERVAL`, `IS_DELETE`, `TRACK`, `ARCHIVE_ID`, `ADDITION`,                                                                                                                                                                                                                                                      `EXT_PROPS`,   `UPDATE_DATE`, `IS_FINISH`, `BODY_TYPE`, `IMPORTANT_LEVEL`, `RESENT_TIME`, `FORWARD_MEMBER`,          `IDENTIFIER`, `TRANSACTOR_ID`, `NODE_POLICY`,       `ACTIVITY_ID`,       `FORM_APP_ID`, `FORM_ID`, `FORM_OPERATION_ID`,        `TEMPLETE_ID`,       `FROM_ID`, `OVER_WORKTIME`, `RUN_WORKTIME`, `OVER_TIME`, `RUN_TIME`, `DEAL_TERM_TYPE`, `DEAL_TERM_USERID`, `SUB_APP`, `EXPECTED_PROCESS_TIME`, `ORG_ACCOUNT_ID`,        `PROCESS_ID`, `IS_PROCESS_OVER_TIME`, `FORM_MULTI_OPERATION_ID`, `BACK_FROM_ID`, `FORM_RELATIVE_STATIC_IDS`, `FORM_RELATIVE_QUERY_IDS`, `HAS_FAVORITE`, `FROM_TYPE`, `FORM_RECORDID`,      `CASE_ID`, `RELATION_DATA_ID`, `FIRSTVIEW_PERIOD`, `FIRSTVIEW_DATE`, `FIRSTRESPONSE_PERIOD`, `SIGNLEVIEW_PERIOD`,       `PRE_APPROVER`,`AUTO_RUN`, `SUMMARY_STATE`,            `TOP_TIME`, `SORT_WEIGHT`, `AI_PROCESSING`, `PROCESS_DEADLINE_TIME`, `PROXY_MEMBER_ID`, `MATCH_DEPARTMENT_ID`, `MATCH_POST_ID`, `NODE_NAME`, `MATCH_ACCOUNT_ID`, `PRINT_NM`, `MESSAGE_RULE_ID`, `MATCH_ROLE_ID`)" +
						" VALUES ('"+CommonUtil.generateID()+"',     0, '"+zyr[i]+"', '"+currentId+"','"+wjbt+"',      4,   '"+id+"', -6592426574091302916,           3,          11,          NULL,               0,              0,               0 ,        now(),           now(),            NULL,              NULL,           0,       0,         NULL,      NULL, '<map>\\r\\n<entry><string>edoc_lastOperateState</string><string><![CDATA[]]></string></entry>\\r\\n<entry><string>edoc_edocMark</string><string><![CDATA[]]></string></entry>\\r\\n<entry><string>edoc_sendUnit</string><string><![CDATA[]]></string></entry>\\r\\n</map>', now(),           0,        '10',              null,           NULL,            NULL, '00000000000000000000',           NULL,     '内部传阅', 6338382634892019116, -2222614464458768261,      NULL,               NULL,  7664658925479545300, '"+currentId+"',            NULL,           NULL,        NULL,       NULL,               0,                  -1,         2,                    NULL,  670869647114347, -5709615003221930261,                      0,                      NULL,           NULL,                         '',                        '',              0,        NULL, '"+id+"',  5696870082158086801,               NULL,           15432977,            now(),                   NULL,                                          NULL, -4120520206381135530,         0,               0, '1970-01-01 00:00:00',            -1,               0,                    NULL,              NULL, 7697236995411887744, 5907544896615956503,      NULL,    670869647114347,       NULL,              NULL, NULL)";
				jdbcAgent.execute(ctpaffair_reciver_sql);
			}

			//原单子中所有意见插入edoc_opinion
			String yj_sql="select * from edoc_opinion o where o.edoc_id='"+summaryid+"'";
			List<Map<String, Object>> yjlist = null;
			jdbcAgent.execute(yj_sql);
			yjlist=jdbcAgent.resultSetToList();
			for(int p=0;p<yjlist.size();p++) {
				Map<String, Object> m = yjlist.get(p);
				String opinion_id = String.valueOf(m.get("id"));
				String opinion_sql = "INSERT INTO `v5`.`edoc_opinion`(`ID`, `EDOC_ID`, `AFFAIR_ID`, `ATTRIBUTE`, `OPINION_TYPE`, `CONTENT`, `IS_HIDDEN`, `CREATE_USER_ID`, `CREATE_TIME`, `POLICY`, `PROXY_NAME`, `NODE_ID`, `STATE`, `SUB_EDOC_ID`, `UPDATE_TIME`, `SUB_OPINION_ID`, `DEPARTMENT_NAME`, `ACCOUNT_NAME`, `DEPARTMENT_SORT_ID`, `SOURCE_SUMMARY_ID`) " +
						"select '" + CommonUtil.generateID() + "', '" + id + "', `AFFAIR_ID`, `ATTRIBUTE`, `OPINION_TYPE`, `CONTENT`, `IS_HIDDEN`, `CREATE_USER_ID`, `CREATE_TIME`, `POLICY`, `PROXY_NAME`, `NODE_ID`, `STATE`, `SUB_EDOC_ID`, `UPDATE_TIME`, `SUB_OPINION_ID`, `DEPARTMENT_NAME`, `ACCOUNT_NAME`, `DEPARTMENT_SORT_ID`, `SOURCE_SUMMARY_ID` from  edoc_opinion o where o.id='" + opinion_id + "'";
				jdbcAgent.execute(opinion_sql);
			}

			//ctp_attachment 附件表
			String fj_sql="select * from ctp_attachment t  where t.att_reference='"+summaryid+"'";
			List<Map<String, Object>> fjlist = null;
			jdbcAgent.execute(fj_sql);
			fjlist=jdbcAgent.resultSetToList();
			for(int p=0;p<fjlist.size();p++) {
				Map<String, Object> m = fjlist.get(p);
				String fj_id = String.valueOf(m.get("id"));
				String insert_fj_sql = "INSERT INTO `v5`.`ctp_attachment`(`ID`, `ATT_REFERENCE`, `SUB_REFERENCE`, `CATEGORY`, `TYPE`, `FILENAME`, `FILE_URL`, `MIME_TYPE`, `CREATEDATE`, `ATTACHMENT_SIZE`, `DESCRIPTION`, `GENESIS_ID`, `SORT`)" +
						               "select '"+CommonUtil.generateID()+"','"+        id+"',(select field0019 from formmain_0243 t where t.id='"+id+"'), `CATEGORY`, `TYPE`, `FILENAME`, `FILE_URL`, `MIME_TYPE`, `CREATEDATE`, `ATTACHMENT_SIZE`, `DESCRIPTION`, `GENESIS_ID`, `SORT` from ctp_attachment t where t.id='"+fj_id+"'";
				jdbcAgent.execute(insert_fj_sql);
			}



			jsonMap.put("code", "0");
			jsonMap.put("msg", "成功");
		}catch(Exception e){
			e.printStackTrace();
			jsonMap.put("code", "1");
			jsonMap.put("msg", "失败");
		}finally {
			jdbcAgent.close();
		}
		com.alibaba.fastjson.JSONObject json = new JSONObject(jsonMap);
		render(response, json.toJSONString());
		return null;
	}
*/

	/**
	 * 内部传阅选择人员
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView toSelectPeopleView(HttpServletRequest request,HttpServletResponse response)throws Exception{
		ModelAndView modelAndView = new ModelAndView("nbzy/nbzy_selectzyr");
		String department=request.getParameter("department");
		//String sql="select * from org_member  where org_department_id='"+department+"' order by sort_id asc";

        String sql=" select r.id,r.name,r.sort_id from (" +
						" select distinct a.id from (" +
						"    select r.id from org_member r  where org_department_id='"+department +"'"+
						"     union all " +
						"   select source_id id from org_relationship    where  objective0_id='" +department +"'"+
						")a" +
					" )t" +
					"  join org_member r on r.id=t.id " +
					" where r.org_department_id!=-6623057140633416986  and r.is_enable=1 and r.is_deleted=0 " +
					" order by r.sort_id asc";
		List<Map<String, Object>> memberlist = null;
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			jdbcAgent.execute(sql);
			memberlist = jdbcAgent.resultSetToList();

			List<Map<String, Object>> revoler = new ArrayList<>();
			for (int i = 0; i < memberlist.size(); i++) {
				Map<String, Object> m = new HashMap<>();
				for (Map.Entry<String, Object> entry : memberlist.get(i).entrySet()) {
					m.put(entry.getKey(), String.valueOf(entry.getValue()) + "");
				}
				revoler.add(m);
			}

			com.alibaba.fastjson.JSONArray memberlistArray = com.alibaba.fastjson.JSONArray.parseArray(JSON.toJSONString(revoler));
			modelAndView.addObject("memberlist",memberlistArray);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			jdbcAgent.close();
		}
		return modelAndView;
	}
}




