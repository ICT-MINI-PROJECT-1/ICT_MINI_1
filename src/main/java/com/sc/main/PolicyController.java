package com.sc.main;

public class PolicyController {

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

@Controller
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
