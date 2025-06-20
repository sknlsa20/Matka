package com.example.model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Result {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private LocalDate date;	
	
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private String companyname;
	private int firstnumber;
	private int secondnumber;
	private boolean firstresult;
	private boolean secondresult;
	
	
	
	public Result(int id) {
		
		this.id = id;
	}




	public Result(int id, LocalDate date, String companyname, int firstnumber, int secondnumber, boolean firstresult,
			boolean secondresult) {
		
		this.id = id;
		this.date = date;
		this.companyname = companyname;
		this.firstnumber = firstnumber;
		this.secondnumber = secondnumber;
		this.firstresult = firstresult;
		this.secondresult = secondresult;
	}
	
	
	

	public Result(LocalDate date, String companyname, int firstnumber, int secondnumber,
			boolean firstresult, boolean secondresult) {
		
		this.date = date;		
		this.companyname = companyname;
		this.firstnumber = firstnumber;
		this.secondnumber = secondnumber;
		this.firstresult = firstresult;
		this.secondresult = secondresult;
	}
	
	
	
	public Result(int firstnumber, int secondnumber, boolean firstresult, boolean secondresult,String companyname) {
		
		this.firstnumber = firstnumber;
		this.secondnumber = secondnumber;
		this.firstresult = firstresult;
		this.secondresult = secondresult;
		this.companyname = companyname;
	}



	public Result() {
		
	}


	public int getId() {
		return id;
	}




	public void setId(int id) {
		this.id = id;
	}




	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public int getFirstnumber() {
		return firstnumber;
	}
	public void setFirstnumber(int firstnumber) {
		this.firstnumber = firstnumber;
	}
	public int getSecondnumber() {
		return secondnumber;
	}
	public void setSecondnumber(int secondnumber) {
		this.secondnumber = secondnumber;
	}
	public boolean isFirstresult() {
		return firstresult;
	}
	public void setFirstresult(boolean firstresult) {
		this.firstresult = firstresult;
	}
	public boolean isSecondresult() {
		return secondresult;
	}
	public void setSecondresult(boolean secondresult) {
		this.secondresult = secondresult;
	}
	
	
	
	
	
	
}
