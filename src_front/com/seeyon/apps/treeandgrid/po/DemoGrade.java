package com.seeyon.apps.treeandgrid.po;

import com.seeyon.ctp.common.po.BasePO;

public class DemoGrade extends BasePO{

	private static final long serialVersionUID = -3920564327945657492L;
	
	private Long _id;
	
	private String _subject;
	
	private String _stype;
	
	private Long _parentId;
	
	public DemoGrade() {
		
	}
	
	public DemoGrade(String subject,String type,Long pid) {
		this._subject = subject;
		this._stype = type;
		this._parentId = pid;
	}

	public DemoGrade(Long id,String subject,String type,Long pid) {
		this._id = id;
		this._subject = subject;
		this._stype = type;
		this._parentId = pid;
	}
	
	public Long getId() {
		return _id;
	}

	public void setId(Long _id) {
		this._id = _id;
	}

	public String getSubject() {
		return _subject;
	}

	public void setSubject(String _subject) {
		this._subject = _subject;
	}

	public String getStype() {
		return _stype;
	}

	public void setStype(String _type) {
		this._stype = _type;
	}

	public Long getParentId() {
		return _parentId;
	}

	public void setParentId(Long _pId) {
		this._parentId = _pId;
	}


	
}
