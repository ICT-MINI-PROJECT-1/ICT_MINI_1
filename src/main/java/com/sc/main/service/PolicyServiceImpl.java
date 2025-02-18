package com.sc.main.service;

import com.sc.main.dao.PolicyDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PolicyServiceImpl implements PolicyService {

    private final PolicyDAO policyDAO;

    @Autowired
    public PolicyServiceImpl(PolicyDAO policyDAO) {
        this.policyDAO = policyDAO;
    }

    @Override
    public String getPolicyContent(String policyName) {
        String content = policyDAO.getPolicyContent(policyName);
        return (content != null) ? content : "�ش� ��å ������ ã�� �� �����ϴ�.";
    }
}
