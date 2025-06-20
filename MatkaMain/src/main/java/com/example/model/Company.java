package com.example.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Company {
	
	@Id
	private int cid;
	
	@Column(name="cname",unique = true)
	private String cname;
	
	
	
	public Company(int cid, String cname) {
		
		this.cid = cid;
		this.cname = cname;
	
	}
	
	
	
	public Company() {
		
	}



	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	
	
	
	

}
