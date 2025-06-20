package com.example.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.model.Result;
import com.example.repos.ResultRepository;

@Service
public class ResultService implements ResultServiceInterface {
	
	@Autowired
	private ResultRepository repo;

	@Override
	public Result addResult(Result r) {
		
		return repo.save(r);
	}

	@Override
	public List<Result> findByCompanyname(String cname) {
		
		return repo.findByCompanyname(cname);
	}

	@Override
	public boolean assignFirstResult(LocalDate date,int fn) {
		Result res = repo.findByDate(date);
		
		if(res!=null)
		{
		String sumvalue=res.getFirstnumber() + "" +res.getSecondnumber();
		int sum = Integer.parseInt(sumvalue);
		System.out.println(sum);
		int formsum = sum + 42;
		System.out.println(formsum);
		
		while(formsum!=0)
		{
			int rem = formsum%10;
			System.out.println(rem);
			
			if(rem<5)
			{
				if(rem==fn | rem+5==fn)
				{
				return true;
				
				}
			}
			else
			{
				if(rem==fn | rem-5==fn)
				{
				return true;
				}
			}		
			formsum=formsum/10;		
		}
		}
		return false;
	}
	
	

	@Override
	public boolean assignSecondResult(LocalDate date,int sn) {
			Result res = repo.findByDate(date);

			if(res!=null)
			{
		
		String sumvalue=res.getFirstnumber() + "" +res.getSecondnumber();
		int sum = Integer.parseInt(sumvalue);
		System.out.println(sum);
		int formsum = sum + 42;
		System.out.println(formsum);
		int i=0;
		while(i<2)
		{
			int rem = formsum%10;
			System.out.println(rem);
			
			if(rem<5)
			{
				if(rem==sn | rem+5==sn)
				{
				return true;
				
				}
			}
			else
			{
				if(rem==sn | rem-5==sn)
				{
				return true;
				}
			}		
			formsum=formsum/10;		
			i++;
		}
			}
		return false;
	}

	@Override
	public String assignDateRange(LocalDate date) {
		
		
		return date+" to "+date.plusDays(6);
	}

	@Override
	public List<Result> findByDateBetween(LocalDate start, LocalDate end) {
		
		return repo.findByDateBetween(start, end);
	}

	@Override
	public void delete(Result res) {
		repo.delete(res);
		
	}

	@Override
	public Result findById(int id) {
		
		return repo.findById(id);
	}
	}

