package com.example.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.model.Company;
import com.example.repos.CompanyRepository;

@Service
public class CompanyService implements CompanyServiceInterface{
	
	
	@Autowired
	private CompanyRepository companyrepository;	


	@Override
	public Company addCompany(Company c) {
	
		return companyrepository.save(c);
	}

	@Override
	public void deleteCompany(Company c) {
		// TODO Auto-generated method stub
		companyrepository.delete(c);
	}

	@Override
	public int updateCompany(Company c) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Company> getAllCompanies() {
		
		return companyrepository.findAll();
	}

	@Override
	public Company getCompanyDetails(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

	
	
}
