package com.sc.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
@RequestMapping("/page/policies")
public class PolicyController {

    @Autowired
    private ServletContext servletContext;  

    @GetMapping("/privacy-policy")
    public ModelAndView privacyPolicy() {
        return getPolicyView("Privacy Policy", "privacy.txt");
    }

    @GetMapping("/terms-of-use")
    public ModelAndView termsOfUse() {
        return getPolicyView("Site Terms of Use", "terms.txt");
    }

    @GetMapping("/cookie-preferences")
    public ModelAndView cookiePreferences() {
        return getPolicyView("Cookie Preferences", "cookie.txt");
    }

    private ModelAndView getPolicyView(String policyTitle, String fileName) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("policyTitle", policyTitle);
        mav.addObject("policyContent", readPolicyFile(fileName));
        mav.setViewName("page/policies/policy");
        return mav;
    }

    private String readPolicyFile(String fileName) {
        String realPath = servletContext.getRealPath("/resources/" + fileName);
        Path filePath = Paths.get(realPath);

        try {
            if (Files.exists(filePath)) {
                // 파일이 존재하면 UTF-8로 읽어서 반환
                return Files.readString(filePath, StandardCharsets.UTF_8);
            } else {
                return "해당 정책 내용을 찾을 수 없습니다."; // 파일이 없으면 메시지 반환
            }
        } catch (IOException e) {
            e.printStackTrace();
            return "정책 내용을 불러오는 중 오류가 발생했습니다."; // 오류 발생 시 메시지 반환
        }
    }
}
