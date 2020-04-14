
package pickme.com.a.searchJob.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.RecruitDto;
import pickme.com.a.searchJob.service.SearchJobService;

@Controller
@RequestMapping(value = "/searchJob")
public class SearchJobController {
	@Autowired
	SearchJobService serv;
	
	@RequestMapping(value = "recSearch.do")
	public String recSearch(Model model) {
		List<RecruitDto> list = serv.getRecAllList();
		System.out.println("recSearch List Size : "+list.size());
		model.addAttribute("recList",list);
		return "searchJob/recSearch";
	}
	
	
	@RequestMapping(value = "recDetail.do")
	public String recDetail() {
		return "searchJob/recDetail";
	}
	
	
}
