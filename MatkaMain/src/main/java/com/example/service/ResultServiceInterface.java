package com.example.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.model.Result;

@Service
public interface ResultServiceInterface {
	public Result addResult(Result r);
	public List<Result> findByCompanyname(String cname);
	
	public boolean assignFirstResult(LocalDate date,int fn);
	public boolean assignSecondResult(LocalDate date,int sn);
	public String assignDateRange(LocalDate date);
	public List<Result> findByDateBetween(LocalDate start, LocalDate end);
	public void delete(Result res);
	
	public Result findById(int id);

}
