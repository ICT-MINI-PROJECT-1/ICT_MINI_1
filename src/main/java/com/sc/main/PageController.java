package com.sc.main;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/page")
public class PageController {
	@GetMapping("/about")
	public ModelAndView about(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","about");
		mav.setViewName("page/about");
		return mav;
	}
	@GetMapping("/room")
	public ModelAndView room(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","room");
		mav.setViewName("page/room/room_main");
		return mav;
	}
	
	@GetMapping("/reservation")
	public ModelAndView reservation(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","reservation");
		mav.setViewName("page/reservation/reserv_main");
		return mav;
	}
	
	@GetMapping("/dining")
	public ModelAndView dining(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","dining");
		mav.setViewName("page/dining/dining_main");
		return mav;
	}
	
	@GetMapping("/facility")
	public ModelAndView facility(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","facility");
		mav.setViewName("page/facility/facil_main");
		return mav;
	}
	
	@GetMapping("/review")
	public ModelAndView review(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","review");
		mav.setViewName("page/review/review_main");
		return mav;
	}
	
	/* @GetMapping("/privacy-policy")
	public ModelAndView privacyPolicy() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","privacy-policy");
		mav.setViewName("page/privacy-policy/privacy-policy");
		return mav;
	}

	@GetMapping("/terms-of-use")
	public ModelAndView termsOfUse() {
	ModelAndView mav = new ModelAndView();
		mav.addObject("page","terms-of-use");
		mav.setViewName("page/terms-of-use/terms-of-use");
		return mav;
	}

    @GetMapping("/cookie")
    public ModelAndView cookie() {
	   	ModelAndView mav = new ModelAndView();
		mav.addObject("page","cookie");
		mav.setViewName("page/cookie/cookie");
		return mav;
    }
    */
	
    @RequestMapping("/polocies")
    public class PolicyController {

        private String readPolicyFile(String filename) {
            try {
                return Files.lines(Paths.get("src/main/webapp/resources/" + filename))
                            .collect(Collectors.joining("\n"));
            } catch (IOException e) {
                return "오류 발생.";
            }
        }

        @GetMapping("/polocies")
        public String privacyPolicy(Model model) {
            model.addAttribute("policyContent", readPolicyFile("privacy.txt"));
            return "policy";
        }

        @GetMapping("/polocies")
        public String termsOfUse(Model model) {
            model.addAttribute("policyContent", readPolicyFile("terms.txt"));
            return "policy";
        }

        @GetMapping("/polocies")
        public String cookiePreferences(Model model) {
            model.addAttribute("policyContent", readPolicyFile("cookie.txt"));
            return "policy";
        }
    }
}

