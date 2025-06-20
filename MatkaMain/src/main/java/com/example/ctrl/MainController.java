package com.example.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.model.Company;
import com.example.model.Result;
import com.example.model.User;
import com.example.service.CompanyService;
import com.example.service.CompanyServiceInterface;


@Controller
public class MainController {
	
	
	private CompanyServiceInterface csi;
	
	
	@Autowired
	public void setCsi(CompanyService csi) {
		this.csi = csi;
	}

	@GetMapping("/")
	public String getString(Model m)
	{
		m.addAttribute("cmd", new User());
		return "index";
	}
	
	@GetMapping("/cal")
	public String getCalendar()
	{
		
		return "calendar";
	}
	
	@GetMapping("/add")
	public String add(Model m)
	{
		
		return "companydetails";
	}
	
	@RequestMapping("/addcompany")
	public String addCompany(@ModelAttribute Company company)
	{
		csi.addCompany(company);
		return "redirect:companies";
	}
	
	@RequestMapping("/login")
	public String getString1(@ModelAttribute User user,Model m)
	{
		if(user.getUsername().equals(user.getPassword()))
		{
			return "redirect:companies";
		}
		else
		{
			m.addAttribute("msg", "invalid username or password");
			return "index";
		}
	}
	
	@RequestMapping("/companies")
	public String getCompanies(Model m)
	{
		List<Company> cms =csi.getAllCompanies();
		m.addAttribute("cms", cms);		
		return "main";
	}
	
	
	
	@RequestMapping("/display")
	public String getCompaniesall(Model m)
	{
		List<Company> cms =csi.getAllCompanies();
		
		m.addAttribute("cms", cms);
		
		return "companies";
	}
	
	@RequestMapping("/delete/{id}")
	public String delCompany(@PathVariable("id") int id)
	{
		Company c = new Company();
		c.setCid(id);
		csi.deleteCompany(c);
		
		return "redirect:../display";
	}
	
	
	

}
