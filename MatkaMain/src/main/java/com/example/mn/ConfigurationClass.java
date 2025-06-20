package com.example.mn;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.example.service.CompanyService;
import com.example.service.CompanyServiceInterface;
import com.example.service.ResultService;
import com.example.service.ResultServiceInterface;

@Configuration
public class ConfigurationClass {

	@Bean
	public CompanyServiceInterface getCompanyBean()
	{
		return new CompanyService();
	}
	
	@Bean
	public ResultServiceInterface getResultBean()
	{
		return new ResultService();
	}

	
}
