package com.example.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.model.Company;

@Repository
public interface CompanyRepository extends JpaRepository<Company, Integer> {
	
	 

}
