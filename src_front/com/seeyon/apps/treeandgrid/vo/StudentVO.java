package com.seeyon.apps.treeandgrid.vo;

import com.seeyon.ctp.common.po.BasePO;

public class StudentVO extends BasePO{
	
	private static final long serialVersionUID = -6891312830074111316L;

	private Long id;
	
	private String subject;
	
	private Long  grades;
	
	private Integer  sex;
	
	private String  age;

	private String nj;

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



	public String getNj() {
		return nj;
	}

	public void setNj(String nj) {
		this.nj = nj;
	}




	
	public StudentVO() {
		
	}

	public StudentVO(Long id,String subject,Long grade, Integer sex,String age,String nj) {
		
		this.id = id;
		this.subject = subject;
		this.grades = grade;
		this.sex = sex;
		this.age = age;
		this.nj=nj;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Long getGrades() {
		return grades;
	}

	public void setGrades(Long grades) {
		this.grades = grades;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}
	
	
	
}
