package com.example.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.model.Company;
@Service
public interface CompanyServiceInterface {
	
	public Company addCompany(Company c);
	public void deleteCompany(Company c);	
	public int updateCompany(Company c);	
	public List<Company> getAllCompanies();	
	public Company getCompanyDetails(int id);	

}
