
package pickme.com.a.searchJob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/searchJob")
public class SearchJobController {
	
	@RequestMapping(value = "recSearch.do")
	public String recSearch() {
		return "searchJob/recSearch";
	}
}
