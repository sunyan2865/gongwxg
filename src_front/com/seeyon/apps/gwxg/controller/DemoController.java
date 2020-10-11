package com.seeyon.apps.gwxg.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.seeyon.apps.gwxg.po.*;
import com.seeyon.apps.gwxg.util.CommonUtil;
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


	
	public ModelAndView demoRight(HttpServletRequest request,HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		ModelAndView view = new ModelAndView("gwxg/demoRight");
		Map<String,String> query = new HashMap<String,String>();
		FlipInfo fi = new FlipInfo();
		FlipInfo swlist = demoManager.demoRight(fi,query);
		request.setAttribute("fflistStudent",swlist);

		return view;
	}



	public ModelAndView toEditDemoView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView("gwxg/demoDetail");
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
	 * 更新表单值form
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
	 *
	 */
	@ResponseBody
	public Map<String,Object> toDeleteZw(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> jsonMap = new HashMap();
		JDBCAgent jdbcAgent = new JDBCAgent(true, false);
		try {
			String file_url = request.getParameter("file_url");//file_url
			String sql="";
			sql="update  ctp_content_all set content=''  where id='"+file_url+"'";
			jdbcAgent.execute(sql);
			jsonMap.put("code", "0");
			jsonMap.put("msg", "成功");
		}catch(Exception e){
			jsonMap.put("code", "1");
			jsonMap.put("msg", "失败");
		}
		return jsonMap;
	}

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
			String jgdzsql = "select id,showvalue from ctp_enum_item  t where ref_enumid='-7394917914078590178' and parent_id='" + parent_id + "' and state='1' order by t.sortnumber ";
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

				batchedSql.add(" delete from formmain_0086 t  where t.id in (select FORM_RECORDID from edoc_summary r where r.id in ("+delidstr+"))");
				batchedSql.add(" delete from edoc_summary r where r.id in ("+delidstr+")");
				batchedSql.add(" delete from ctp_affair   t where t.object_id in ("+delidstr+")");
				batchedSql.add(" delete from edoc_opinion   t where t.edoc_id in ("+delidstr+")");

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
}
