package com.sc.main.service;

import org.springframework.stereotype.Service;

@Service
public class PolicyServiceImpl implements PolicyService {
    
    @Override
    public String getPolicyContent(String policyName) {
        return policyName; // 더 이상 파일을 읽지 않고, 단순히 정책 이름만 반환
    }
}
