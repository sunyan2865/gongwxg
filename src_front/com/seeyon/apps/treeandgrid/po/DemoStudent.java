package com.seeyon.apps.treeandgrid.po;

import com.seeyon.ctp.common.po.BasePO;

public class DemoStudent extends BasePO{
	private static final long serialVersionUID = -3920565687445657492L;
	
	private Long _id;
	
	private String _subject;
	
	private String  _grades;
	
	private String  _sex;
	
	private String _age;

	private String _nj;

	private String currentId;

	private String name;

	private String summaryId;
	private String affairId;

	public String getSummaryId() {
		return summaryId;
	}

	public void setSummaryId(String summaryId) {
		this.summaryId = summaryId;
	}

	public String getAffairId() {
		return affairId;
	}

	public void setAffairId(String affairId) {
		this.affairId = affairId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getCurrentId() {
		return currentId;
	}

	public void setCurrentId(String currentId) {
		this.currentId = currentId;
	}



	public String get_nj() {
		return _nj;
	}

	public void set_nj(String _nj) {
		this._nj = _nj;
	}





	
	public DemoStudent() {
		
	}

	public DemoStudent(String subject,String grade, String sex,String age,String nj) {
		
		this._subject = subject;
		this._grades = grade;
		this._sex = sex;
		this._age = age;
		this._nj=nj;
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

	public String getGrades() {
		return _grades;
	}

	public void setGrades(String _grades) {
		this._grades = _grades;
	}

	public String getSex() {
		return _sex;
	}

	public void setSex(String _sex) {
		this._sex = _sex;
	}

	public String getAge() {
		return _age;
	}

	public void setAge(String _age) {
		this._age = _age;
	}

	
}
