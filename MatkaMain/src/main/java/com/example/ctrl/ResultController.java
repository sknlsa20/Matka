package com.example.ctrl;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.example.model.Result;
import com.example.service.ResultService;
import com.example.service.ResultServiceInterface;

@Controller
public class ResultController {
	
private ResultServiceInterface rsi;
	
	
	@Autowired
	public void setRsi(ResultService rsi) {
		this.rsi = rsi;
	}
	
	

	@RequestMapping("/selectcompany/{cname}")
	public String getResults(@PathVariable String cname,Model m, @RequestParam(required=false) Integer month,
		    @RequestParam(required=false) Integer year)
	{
		List<Result> res = rsi.findByCompanyname(cname);
		m.addAttribute("cname",cname);
		if(!res.isEmpty())
		{
			m.addAttribute("res", res);
			
		}
		 // default to current month/year if missing
	    YearMonth ym = YearMonth.of(
	       Optional.ofNullable(year).orElse(YearMonth.now().getYear()),
	       Optional.ofNullable(month).map(mo->mo+1).orElse(YearMonth.now().getMonthValue())
	    );
	    LocalDate start = ym.atDay(1);
	    LocalDate end   = ym.atEndOfMonth();
	    var results = rsi.findByDateBetween(start, end);
	    m.addAttribute("results", results);
	    m.addAttribute("year", ym.getYear());
	    m.addAttribute("month", ym.getMonthValue()-1);
		return "main";
		
		
	}
	
	
	
	@RequestMapping("/deleteresult/{id}")
	public String deleteResult(@PathVariable int id )
	{
		String cname=rsi.findById(id).getCompanyname();
		rsi.delete(new Result(id));		
		return "redirect:/selectcompany/"+cname;		
	}
	
	@RequestMapping("/addresults")
	public String addresult(@RequestParam("selectedDate")String sdate,@RequestParam("cname") String cname,@RequestParam("fn") int fn,@RequestParam("sn") int sn)
	{
		LocalDate date;
		if(LocalDate.parse(sdate).getDayOfWeek().getValue()!=7)
		{
		date = LocalDate.parse(sdate).minusDays(1);
		}
		else
		{
			date = LocalDate.parse(sdate).minusDays(2);
		}
			
		
		
		
		boolean fr=rsi.assignFirstResult(date, fn);
		boolean sr=rsi.assignSecondResult(date, sn);
		
		Result res = new Result(LocalDate.parse(sdate),cname,fn,sn,fr,sr);		
		Result rs=rsi.addResult(res);
		
		return "redirect:/selectcompany/"+rs.getCompanyname();
	}
	
}
