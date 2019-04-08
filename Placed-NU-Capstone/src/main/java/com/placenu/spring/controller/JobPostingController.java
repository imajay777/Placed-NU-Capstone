package com.placenu.spring.controller;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.placenu.spring.dao.CompanyDao;
import com.placenu.spring.dao.JobPostingDao;
import com.placenu.spring.entity.Company;
import com.placenu.spring.entity.JobPosting;

@Controller
@RequestMapping("/JobPosting")
public class JobPostingController {
	@Autowired
	JobPostingDao jobDao;

	@Autowired
	CompanyDao companyDao;

	/**
	 * @param cid
	 * @param model
	 * @return homepage view
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String showHomePage(@RequestParam("cid") String cid, Model model) {
		System.out.println(cid);
		
		Company company = companyDao.getCompany(Integer.parseInt(cid));
		model.addAttribute("cid", cid);
		model.addAttribute("company", company);
		return "postjob";
	}

	/**
	 * @param title
	 * @param description
	 * @param responsibilities
	 * @param location
	 * @param salary
	 * @param cid
	 * @param model
	 * @return JobPosting
	 */
	@RequestMapping(method = RequestMethod.POST)
	public String createJobPosting(@RequestParam("title") String title, @RequestParam("description") String description,
			@RequestParam("responsibilities") String responsibilities, @RequestParam("location") String location,
			@RequestParam("salary") String salary, @RequestParam("cid") String cid, Model model) {
		JobPosting j = new JobPosting();
		j.setTitle(title);
		j.setDescription(description);
		j.setResponsibilities(responsibilities);
		j.setLocation(location);
		j.setSalary(salary);
		j.setKeywords(title + " " + description + " " + responsibilities + " " + location);

		try {
			

			JobPosting p1 = jobDao.createJobPosting(j, Integer.parseInt(cid));
			System.out.println("ashay");

			model.addAttribute("job", p1);
			Company company = companyDao.getCompany(Integer.parseInt(cid));
			model.addAttribute("company", company);
			return "jobprofile";

		} catch (Exception e) {
			
			return "error";
		}

	}

	
}
