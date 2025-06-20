package com.example.repos;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.model.Result;

@Repository
public interface ResultRepository extends JpaRepository<Result, Integer> {
	
	List<Result> findByCompanyname(String companyname);	
	Result findByDate(LocalDate date);	 
	List<Result> findByDateBetween(LocalDate start, LocalDate end);	
	Result findById(int id);
}
