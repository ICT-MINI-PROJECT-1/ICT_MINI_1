package com.sc.main;

import com.sc.main.service.PolicyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/page/policies")
public class PolicyController {

    private final PolicyService policyService;

    @Autowired
    public PolicyController(PolicyService policyService) {
        this.policyService = policyService;
    }

    @GetMapping("/privacy-policy")
    public ModelAndView privacyPolicy() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("policyTitle", "Privacy Policy");
        mav.addObject("policyContent", policyService.getPolicyContent("privacy-policy"));
        mav.setViewName("page/policies/policy");
        return mav;
    }

    @GetMapping("/terms-of-use")
    public ModelAndView termsOfUse() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("policyTitle", "Site Terms of Use");
        mav.addObject("policyContent", policyService.getPolicyContent("terms-of-use"));
        mav.setViewName("page/policies/policy");
        return mav;
    }

    @GetMapping("/cookie-preferences")
    public ModelAndView cookiePreferences() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("policyTitle", "Cookie Preferences");
        mav.addObject("policyContent", policyService.getPolicyContent("cookie-preferences"));
        mav.setViewName("page/policies/policy");
        return mav;
    }
}
