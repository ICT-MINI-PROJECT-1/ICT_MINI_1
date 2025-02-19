package com.sc.main;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
@RequestMapping("/page/policies")
public class PolicyController {

    @Value("${policy.files.location:/src/main/webapp/resources}")
    private String policyFilesLocation;

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
        try {
            // 1. ���� ��θ� ����Ͽ� ������ ã�� (�׽�Ʈ��)
            Path absolutePath = Paths.get(policyFilesLocation, fileName);
            if (Files.exists(absolutePath)) {
                return Files.readString(absolutePath);
            }

            // 2. classpath �������� ���� ã��
            ClassPathResource resource = new ClassPathResource("resources/" + fileName);
            if (resource.exists()) {
                Path filePath = Paths.get(resource.getURI());
                return Files.readString(filePath);
            }
        } catch (IOException e) {
            return "��å ������ �ҷ����� �� ������ �߻��߽��ϴ�.";
        }

        // ������ �������� ���� ��� ��ȯ
        return "�ش� ��å ������ ã�� �� �����ϴ�.";
    }
}
